<?php
/**
 * sRadio
 *
 * Dysplay socialmedia icons
 *
 * vk = Vkontakte
 * od = Odnoklassniki
 * gp = Google+
 * gg = Google bookmarks
 * fb = Faceook
 * tw = Twitter
 * usage: [[sRadio? &layout=`fb, vk, od` &lng=`en`]] Display only Facebook, Vkontakte and Odnoklassniki logos with English titles
 *
 * @category	snippet
 * @version 	1.01a
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal	@properties
 * @internal	@modx_category
 * @author		Alexander Sharapov | a-sharapov.com
 *
 */

$modx->regClientStartupHTMLBlock('<link rel="stylesheet" href="/assets/snippets/sradio/assets/sradio.css" type="text/css" />');

$lng = (isset($lng)) ? $lng : "ru";
$tpl = (isset($tpl)) ? $tpl : null;

$langfile = 'assets/snippets/sradio/lang/'.$lng.'.lang.php';

$layout = (isset($layout)) ? $layout : "fb, gp, gg, od, tw, vk";
$layoutarray = explode(", ",  $layout);

$pagettle = urlencode($modx->documentObject['pagetitle']);
$pageuri = $modx->makeUrl($modx->documentIdentifier, '', '', 'full');

// Errors handler
if (file_exists($langfile)) {
	include_once($modx->config['base_dir'].$langfile);
} else {
	$message .= '<div class="error-msg">Указанный в вызове сниппета <b>sRadio</b> языковой файл не найден.</div>';
}
if ($tpl) {
	if ($modx->getChunk($tpl)) {
		$template = $modx->getChunk($tpl);
	} else {
		$message .= '<div class="error-msg">Указанный в вызове сниппета <b>sRadio</b> чанк не найден.</div>';
	}
}

$smedia = Array(
	"fb"=>Array(
				"$FACEBOOK_TITLE",
				"http://www.facebook.com/sharer.php?u=$pageuri&amp;t=$pagettle"
				),
	"gp"=>Array(
				"$GOOGLE_PLUS_TITLE",
				"https://plusone.google.com/_/+1/confirm?hl=ru&amp;url=$pageuri"
				),
	"gg"=>Array(
				"$GOOGLE_LINKS_TITLE",
				"http://www.google.com/bookmarks/mark?op=edit&amp;output=popup&amp;bkmk=$pageuri&amp;title=$pagettle"
				),
	"od"=>Array(
				"$ODNOKLASSNIKI_TITLE",
				"http://www.odnoklassniki.ru/dk?st.cmd=addShare&amp;st._surl=$pageuri&amp;title=$pagettle"
				),
	"tw"=>Array(
				"$TWITTER_TITLE",
				"http://twitter.com/share?text=$pagettle&amp;url=$pageuri"
				),
	"vk"=>Array(
				"$VKONTAKTE_TITLE",
				"http://vkontakte.ru/share.php?url=$pageuri"
				),
);

$output .= '<div class="smicons">';
foreach ($smedia as $key => $value) {
	if (in_array($key, $layoutarray)) {
		if (!$tpl) {
			$output .= '<a rel="external nofollow" target="_blank" href="'.$value[1].'" class="'.$key.'" title="'.$value[0].'">'.$value[0].'</a>';
		} else {
			$fststep = str_replace("[+srclass+]", $key, $template);
			$sndstep = str_replace("[+srtitle+]", $value[0], $fststep);
			$output .= str_replace("[+srurl+]", $value[1], $sndstep);
		}
	}
}
$output .= '</div>';
if (!$message) {
	return $output;
} else {
	return $message;
}
?>