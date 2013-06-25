<?php
/**
 * 4Manager
 *
 * <b>0.1</b> Show info only for manager
 *
 * Usage: [!4Manager? &out=`chunk||string`!] // Only uncahced
 *
 * @category	snippet
 * @version 	0.1
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal	@properties
 * @internal	@modx_category
 * @author	Alexander Sharapov | a-sharapov.com
 *
 */

$out = (isset($out)) ? $out : null;

if ($out && $_SESSION['mgrValidated'] && isset($_SESSION['mgrValidated'])) {
	if ($modx->getChunk($out)) {
		$out = $modx->getChunk($out);
	}
	return $out;
}
?>