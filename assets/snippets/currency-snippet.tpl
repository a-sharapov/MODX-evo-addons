<?php
/* [!currency!]
 *
 * Currency - MODx Evo Snippet
 *
 * @description: <b>1.00</b> Генерация переключения валюты / Обработчик переключателя / Выполнение пересчета
 *
 * @category    snippet
 * @version     1.01
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @author      Alex Sharapov
 *
 * Example: [!currency? &list=`usd,eur,rur`
 *						&mode=`links(default)|price`
 *						&rates=`chunk-name|1,1.3,0.03125|xml`
 *						&price=`tv|chunk-name|string`
 *						&tpl=`inner(default)|chunk|clear`
 * 			!]
 *
 *			[!currency? &list=`usd,eur` &mode=`price` rates=`xml` &price=`50` &tpl=`clear`!]
 */

// Parameters:
$list = (isset($list)) ? $list : "usd,eur,rur";
$mode = (isset($mode)) ? $mode : "links";
$rates = (isset($rates)) ? $rates : null;
$price = (isset($price)) ? $price : null;

$xmllink = (isset($xmllink)) ? $xmllink : "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml";

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
			} else if ($rates == 'xml') {
				// Cashing 12 hours
				$filename = MODX_BASE_PATH.'assets/cache/cy.xml';
				if (!file_exists($filename) || (file_exists($filename) && time() > filemtime($filename) + 60*60*12)) {
						$file = file_get_contents($xmllink);
						if ($file) {
							file_put_contents($filename, $file);
							@chmod($filename, 0666);
						}
				}
				$xml = simplexml_load_file($filename); 
				if ($xml != false) {
					$rates = '1';
					foreach ($listarr as $value) {
						$value = strtoupper($value);
						foreach($xml->Cube->Cube->Cube as $inxmlrate) {
							if ( $inxmlrate['currency'] == $value ) {
								$rates .= ','.$inxmlrate['rate'];
							}
						}
					}
				}
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