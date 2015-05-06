<?php
require(dirname(__FILE__) . '/common.php');
require(dirname(__FILE__) . '/language/' . ForumLanguage . '/manage.php');
SetStyle('api', 'API');

$ID     = intval(Request('POST', 'ID', 0));
$Type   = intval(Request('POST', 'Type', 0)); //1:Topic,2:Post,3:User
$Action = Request('POST', 'Action', false);

switch ($Type) {
	//Topic
	case 1:
		$TopicInfo = $DB->row("SELECT * FROM " . $Prefix . "topics force index(PRI) Where ID=:ID", array(
			"ID" => $ID
		));
		if (!$TopicInfo) {
			AlertMsg('Topic Not Found', 'Topic Not Found');
		}
		switch ($Action) {
			//将主题移动至回收站
			case 'Delete':
				Auth(4);
				if ($TopicInfo['IsDel'] == 0) {
					$DB->query("UPDATE " . $Prefix . "topics SET IsDel = 1 Where ID=:ID", array(
						"ID" => $ID
					));
					//更新全站统计数据
					$NewConfig = array(
						"NumTopics" => $Config["NumTopics"] - 1
					);
					UpdateConfig($NewConfig);
					//更新用户自身统计数据
					$DB->query("UPDATE `" . $Prefix . "users` SET Topics=Topics-1 WHERE `ID`=?", array(
						$TopicInfo['UserID']
					));
					//更新标签统计
					if ($TopicInfo['Tags']) {
						$DB->query("UPDATE `" . $Prefix . "tags` SET TotalPosts=TotalPosts-1 WHERE `Name` in (?)", explode('|', $TopicInfo['Tags']));
					}
					$Message = $Lang['Deleted'];
				} else {
					AlertMsg('Bad Request', $Lang['Deleted']);
				}
				break;
			//从回收站恢复主题
			case 'Recover':
				Auth(4);
				if ($TopicInfo['IsDel'] == 1) {
					$DB->query("UPDATE " . $Prefix . "topics SET IsDel = 0 Where ID=:ID", array(
						"ID" => $ID
					));
					//更新全站统计数据
					$NewConfig = array(
						"NumTopics" => $Config["NumTopics"] + 1
					);
					UpdateConfig($NewConfig);
					//更新用户自身统计数据
					$DB->query("UPDATE `" . $Prefix . "users` SET Topics=Topics+1 WHERE `ID`=?", array(
						$TopicInfo['UserID']
					));
					//更新标签统计
					if ($TopicInfo['Tags']) {
						$DB->query("UPDATE `" . $Prefix . "tags` SET TotalPosts=TotalPosts+1 WHERE `Name` in (?)", explode('|', $TopicInfo['Tags']));
					}
					$Message = $Lang['Recovered'];
				} else {
					AlertMsg('Bad Request', $Lang['Failure_Recovery']);
				}
				break;
			//永久删除主题（需要先将主题移动至回收站）
			case 'PermanentlyDelete':
				Auth(4);
				if ($TopicInfo['IsDel'] == 1) {
					$DB->query('DELETE FROM `' . $Prefix . 'posttags` WHERE TopicID=?', array(
						$ID
					));
					$DB->query('DELETE FROM `' . $Prefix . 'posts` WHERE TopicID=?', array(
						$ID
					));
					$DB->query('DELETE FROM `' . $Prefix . 'topics` WHERE ID=?', array(
						$ID
					));
					$DB->query('DELETE FROM `' . $Prefix . 'notifications` WHERE TopicID=?', array(
						$ID
					));
					$Message = $Lang['Permanently_Deleted'];
				} else {
					AlertMsg('Bad Request', $Lang['Failure_Permanent_Deletion']);
				}
				break;
			//主题下沉（LastTime-7*86400）
			case 'Sink':
				Auth(4);
				$DB->query("UPDATE " . $Prefix . "topics SET LastTime = LastTime-604800 Where ID=:ID", array(
					"ID" => $ID
				));
				$Message = $Lang['Sunk'];
				break;
			//主题上浮（LastTime+7*86400）
			case 'Rise':
				Auth(4);
				$DB->query("UPDATE " . $Prefix . "topics SET LastTime = LastTime+604800 Where ID=:ID", array(
					"ID" => $ID
				));
				$Message = $Lang['Risen'];
				break;
			//主题锁定
			case 'Lock':
				Auth(4);
				$DB->query("UPDATE " . $Prefix . "topics SET IsLocked = :IsLocked Where ID=:ID", array(
					"ID" => $ID,
					"IsLocked" => $TopicInfo['IsLocked'] ? 0 : 1
				));
				$Message = $TopicInfo['IsLocked'] ? $Lang['Lock'] : $Lang['Unlock'];
				break;
			default:
				AlertMsg('Bad Request', 'Bad Request');
				break;
		}
		//清理首页内存缓存
		if ($MCache) {
			$MCache->delete(MemCachePrefix . 'Homepage');
		}
		break;

	//Post
	case 2:
		$PostInfo = $DB->row("SELECT * FROM " . $Prefix . "posts force index(PRI) Where ID=:ID", array(
			"ID" => $ID
		));
		if (!$PostInfo) {
			AlertMsg('Post Not Found', 'Post Not Found');
		}
		switch ($Action) {
			case 'Delete':
				Auth(4);
				$DB->query('DELETE FROM `' . $Prefix . 'posts` WHERE ID=?', array(
					$ID
				));
				$DB->query('DELETE FROM `' . $Prefix . 'notifications` WHERE PostID=?', array(
					$ID
				));
				//更新全站统计数据
				$NewConfig = array(
					"NumPosts" => $Config["NumPosts"] - 1
				);
				UpdateConfig($NewConfig);
				//更新主题统计数据
				$DB->query("UPDATE `" . $Prefix . "topics` SET Replies=Replies-1 WHERE `ID`=?", array(
					$PostInfo['TopicID']
				));
				//更新用户自身统计数据
				$DB->query("UPDATE `" . $Prefix . "users` SET Replies=Replies-1 WHERE `ID`=?", array(
					$PostInfo['UserID']
				));
				$Message = $Lang['Permanently_Deleted'];
				break;
			//编辑帖子
			case 'Edit':
				Auth(4, $PostInfo['UserID'], true);
				$Content = XssEscape(Request('POST', 'Content', $PostInfo['Content']));
				if ($Content == $PostInfo['Content'])
					AlertMsg($Lang['Do_Not_Modify'], $Lang['Do_Not_Modify']);
				if ($DB->query("UPDATE " . $Prefix . "posts SET Content = :Content Where ID=:ID", array(
					'ID' => $ID,
					'Content' => $Content
				))) {
					//标记附件所对应的帖子标签
					$DB->query("UPDATE `" . $Prefix . "upload` SET PostID=? WHERE `PostID`=0 and `UserName`=?", array(
						$ID,
						$CurUserName
					));
					$Message = $Lang['Edited'];
				} else {
					AlertMsg($Lang['Failure_Edit'], $Lang['Failure_Edit']);
				}
				break;
			default:
				AlertMsg('Bad Request', 'Bad Request');
				break;
		}
		break;

	//User
	case 3:
		$UserInfo = $DB->row("SELECT * FROM " . $Prefix . "users force index(PRI) Where ID=:ID", array(
			"ID" => $ID
		));
		switch ($Action) {
			case 'Delete':
				Auth(4);
				# code...
				break;
			//屏蔽用户
			case 'Block':
				Auth(4);
				$NewUserAccountStatus = $UserInfo['UserAccountStatus'] ? 0 : 1;
				if(UpdateUserInfo(array('UserAccountStatus' => $NewUserAccountStatus), $ID)){
					$Message = $NewUserAccountStatus ? $Lang['Block_User'] : $Lang['Unblock_User'];
				}
				break;
			//重置头像
			case 'ResetAvatar':
				Auth(4, $ID);
				if(extension_loaded('gd')){
					require(dirname(__FILE__) . "/includes/MaterialDesign.Avatars.class.php");
					$Avatar = new MDAvtars(mb_substr($UserInfo['UserName'], 0, 1, "UTF-8"), 256);
					$Avatar->Save('upload/avatar/large/' . $ID . '.png', 256);
					$Avatar->Save('upload/avatar/middle/' . $ID . '.png', 48);
					$Avatar->Save('upload/avatar/small/' . $ID . '.png', 24);
					$Avatar->Free();
					$Message = $Lang['Reset_Avatar_Successfully'];
				}else{
					$Message = $Lang['Reset_Avatar_Successfully'];//Failure
				}
				
				break;
			default:
				AlertMsg('Bad Request', 'Bad Request');
				break;
		}
		break;
	//Follow or Favorite
	case 4:
		Auth(1);
		$Action      = intval($Action);
		//检查主题/标签/用户/帖子是否存在
		$IsFavorite  = $DB->single("SELECT ID FROM " . $Prefix . "favorites Where UserID=:UserID and Type=:Type and FavoriteID=:FavoriteID", array(
			'UserID' => $CurUserID,
			'Type' => $Action,
			'FavoriteID' => $ID
		)); //添加索引
		$MessageType = false; //false表示收藏，true表示关注
		$SQLAction   = intval($IsFavorite) ? '-1' : '+1';
		switch ($Action) {
			//1:Topic 2:Tag 3:User 4:Post 5:Blog
			case 1: //Topic
				$Title = $DB->single("SELECT Topic FROM " . $Prefix . "topics Where ID=:FavoriteID", array(
					'FavoriteID' => $ID
				));
				break;
			case 2: //Tag
				$Title       = $DB->single("SELECT Name FROM " . $Prefix . "tags Where ID=:FavoriteID", array(
					'FavoriteID' => $ID
				));
				$MessageType = true;
				break;
			case 3: //User
				$Title       = $DB->single("SELECT UserName FROM " . $Prefix . "users Where ID=:FavoriteID", array(
					'FavoriteID' => $ID
				));
				$MessageType = true;
				break;
			case 4: //Post
				$Title = $DB->single("SELECT Subject FROM " . $Prefix . "posts Where ID=:FavoriteID", array(
					'FavoriteID' => $ID
				));
				break;
			case 5: //Blog
				$Title = $DB->single("SELECT Subject FROM " . $Prefix . "blogs Where ID=:FavoriteID and ParentID=0", array(
					'FavoriteID' => $ID
				));
				break;
			default:
				AlertMsg('Bad Request', 'Bad Request');
				break;
		}
		if ($Title) {
			if (!$IsFavorite) {
				if (!$DB->query('INSERT INTO `' . $Prefix . 'favorites`(`ID`, `UserID`, `Category`, `Title`, `Type`, `FavoriteID`, `DateCreated`, `Description`) VALUES (?,?,?,?,?,?,?,?)', array(
					null,
					$CurUserID,
					'',
					$Title,
					$Action,
					$ID,
					$TimeStamp,
					''
				)))
					AlertMsg('Unknown Error', 'Unknown Error');
			} else {
				$DB->query('DELETE FROM `' . $Prefix . 'favorites` WHERE `UserID`=? and `Type`=? and `FavoriteID`=?', array(
					$CurUserID,
					$Action,
					$ID
				));
			}
			switch ($Action) {
				//1:Topic 2:Tag 3:User 4:Post 5:Blog
				case 1: //Topic
					$DB->query('UPDATE ' . $Prefix . 'topics SET Favorites = Favorites' . $SQLAction . ' Where ID=:FavoriteID', array(
						'FavoriteID' => $ID
					));
					$DB->query('UPDATE `' . $Prefix . 'users` SET NumFavTopics=NumFavTopics' . $SQLAction . ' WHERE `ID`=?', array(
						$CurUserID
					));
					break;
				case 2: //Tag
					$DB->query('UPDATE ' . $Prefix . 'tags SET Followers = Followers' . $SQLAction . ' Where ID=:FavoriteID', array(
						'FavoriteID' => $ID
					));
					$DB->query('UPDATE `' . $Prefix . 'users` SET NumFavTags=NumFavTags' . $SQLAction . ' WHERE `ID`=?', array(
						$CurUserID
					));
					break;
				case 3: //User
					$DB->query('UPDATE ' . $Prefix . 'users SET Followers = Followers' . $SQLAction . ' Where ID=:FavoriteID', array(
						'FavoriteID' => $ID
					));
					$DB->query('UPDATE `' . $Prefix . 'users` SET NumFavUsers=NumFavUsers' . $SQLAction . ' WHERE `ID`=?', array(
						$CurUserID
					));
					break;
				case 4: //Post
					break;
				case 5: //Blog
					break;
				default:
					AlertMsg('Bad Request', 'Bad Request');
					break;
			}
			//清理内存缓存
			if ($MCache) {
				$MCache->delete(MemCachePrefix . 'UserInfo_' . $CurUserID);
			}
			$Message = $IsFavorite ? ($MessageType ? $Lang['Follow'] : $Lang['Collect']) : ($MessageType ? $Lang['Unfollow'] : $Lang['Unsubscribe']);
			//$FavoriteID = $DB->lastInsertId();
		} else {
			AlertMsg('404 Not Found', '404 Not Found');
		}
		break;

	//Error
	default:
		AlertMsg('Bad Request', 'Bad Request');
		break;
}
$PageTitle   = 'Manage';
$ContentFile = $TemplatePath . 'manage.php';
include($TemplatePath . 'layout.php');