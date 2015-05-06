<?php
if (!defined('InternalAccess')) exit('error: 403 Access Denied');
if (empty($Lang) || !is_array($Lang))
	$Lang = array();

$Lang = array_merge($Lang, array(
	'Tag' => '標籤',
	'Last_Reply_From' => '最後回覆來自',
	'Followers' => '人收藏',
	'Topics' => '個討論串',
	'Created_In' => '標籤創建於',
	'Last_Updated_In' => '最後更新於',
	'Follow' => '關注本標籤',
	'Unfollow' => '取消關注本標籤',
	'Website_Statistics' => '站內統計',
	'Topics_Number' => '討論串數量',
	'Posts_Number' => '回覆數量',
	'Tags_Number' => '標籤數量',
	'Users_Number' => '使用者數量'
	
	));