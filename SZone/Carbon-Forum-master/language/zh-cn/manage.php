<?php
if (!defined('InternalAccess')) exit('error: 403 Access Denied');
if (empty($Lang) || !is_array($Lang))
	$Lang = array();

$Lang = array_merge($Lang, array(
	'Deleted' => '成功将主题移动至回收站',
	'Recovered' => '成功还原主题',
	'Failure_Recovery' => '恢复失败，请确认帖子在回收站',

	'Permanently_Deleted' => '成功永久删除',
	'Failure_Permanent_Deletion' => '请确认帖子在回收站',

	'Sunk' => '下沉成功',
	'Risen' => '上浮成功',

	'Lock' => '锁定',
	'Unlock' => '解锁',

	'Block_User' => '封禁用户',
	'Unblock_User' => '解禁用户',

	'Follow' => '关注',
	'Unfollow' => '取消关注',

	'Unsubscribe' => '取消收藏',
	'Collect' => '收藏',

	'Do_Not_Modify' => '未修改',
	'Edited' => '编辑成功',
	'Failure_Edit' => '编辑失败',

	'Reset_Avatar_Successfully' => '重置头像成功，请刷新页面！'
	));