<?php
/* [!currency!]
 *
 * Currency - MODx Evo Snippet
 *
 * @description: <b>1.00</b> Генерация переключения валюты / Обработчик переключателя / Выполнение пересчета
 *
 * @category    snippet
 * @version     1.00
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @author      Alex Sharapov
 *
 * Example: [!currency? &list=`usd,eur,rur`
 *						&mode=`links(default)|price`
 *						&rates=`chunk-name|1,1.3,0.03125`
 *						&price=`tv|chunk-name|string`
 *						&tpl=`inner(default)|chunk|clear`
 * 			!]
 */

// Parameters:
$list = (isset($list)) ? $list : "usd,eur,rur";
$mode = (isset($mode)) ? $mode : "links";
$rates = (isset($rates)) ? $rates : null;
$price = (isset($price)) ? $price : null;

$listarr = explode(",", $list);

$cy = array(
	'usd' => '&#36;',
	'eur' => '&euro;',
	'pnd' => '&pound;',
	'rur' => 'руб.',
	'uah' => 'грн.',
	'byr' => 'бел.руб.',
);

if ( !isset($_SESSION['currency']) ) {
	$_SESSION['currency'] = $listarr[1];
}
if ( isset($_GET['cy']) ) {
	$_SESSION['currency'] = $_GET['cy'];
}

switch ($mode) {
	case "links":
		$output = '<ul class="currency-switcher">';
		foreach ($listarr as $value) {
			$listr = str_replace(',', '|', $list);
			$output .= '<li class="'.$value;
			if ( $_SESSION['currency'] == $value ) $output .= ' active';
			$output .= '"><a href="'.preg_replace("/\?cy=(".$listr.")/", "", $_SERVER['REQUEST_URI']).'?cy='.$value.'">'.$cy[$value].'&nbsp;'.$value.'</a></li>';
		}
		$output .= '</ul>';
	break;
	case "price":
		if ($rates) {
			if ($modx->getChunk($rates)) {
				$rates = $modx->getChunk($rates);
			}
			$ratesarr = explode(",", $rates);
			$pracecur = array_combine($listarr, $ratesarr);
			if ($price && $pracecur) {
				if ($modx->getChunk($price)) {
					$price = $modx->getChunk($price);
				}
				if ($_SESSION['currency']) {
					$outprice = $price / $pracecur[$_SESSION['currency']];
				} else {
					$outprice = $price / $ratesarr[0];
				}
				if ( $tpl == 'clear' ) {
					$output = round($outprice, 2);
				} else if ($modx->getChunk($tpl)) {
					$tpl = $modx->getChunk($tpl);
					$tpl = str_replace('[+price+]', round($outprice, 2), $tpl);
					$tpl = str_replace('[+currency+]', $cy[$_SESSION['currency']], $tpl);
					$output = $tpl;
				} else {
					$output = '<div class="price-wrapper">'.round($outprice, 2).'&nbsp;'.$cy[$_SESSION['currency']].'</div>';
				}
			} else {
				$output = 'Возможно недостаточно входных данных';
			}
		}
	break;
}

return $output;
?>