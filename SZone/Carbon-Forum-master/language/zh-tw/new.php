<?php
if (!defined('InternalAccess')) exit('error: 403 Access Denied');
if (empty($Lang) || !is_array($Lang))
	$Lang = array();

$Lang = array_merge($Lang, array(
	'Title' => '標題',
	'Add_Tags' => '添加標籤(按Enter添加)',
	'Submit' => ' 發 布 ',
	'Posting_Too_Often' => '您的發言次數過於頻繁，請稍後再嘗試',
	'Tags_Empty' => '標籤不能為空',
	'Too_Long' => '標題長度不能超過{{MaxTitleChars}}個位元組，內容長度不能超過{{MaxPostChars}}個位元組',
	'Title_Empty' => '標題不能為空',

	'Tags' => '標籤',
	'Content' => '內容'
	));