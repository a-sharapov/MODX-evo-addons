<?php
/* [[smg]]
 *
 * Simple image Matrix Generator - MODx Evo Snippet
 *
 * @description: Простой сниппет генерации матрицы изображений из папки
 *
 * @category    snippet
 * @version     0.78
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @author      Alex Sharapov
 *
 * Example: [[smg? &dir=`images/` &show=`6` &description=`image1;image2;image3;image4;image5;image6` &class=`images` &size=`200xauto` &wrapp=`id_1;id_2;id_3` &wrappout=`site_1.ru,site_2.ru,site_3.ru` &slider=`1`]]
 */

$show = (isset($show)) ? $show : "";
$size = (isset($size)) ? $size : "400x170";
$class = (isset($class)) ? $class : "images-matrix";
$nopreview = (isset($nopreview)) ? $nopreview : null;
$description = (isset($description)) ? $description : null;
$sizearr = explode("x", $size);
$descriptionarr = explode(";", $description);
$dire = $modx->config['rb_base_url'].$dir;
$wrapp = (isset($wrapp)) ? $wrapp : null;
$wrapparr = explode(";", $wrapp);
$wrappout = (isset($wrappout)) ? $wrappout : null;
$slider = (isset($slider)) ? $slider : null;
$wrappoutarr = explode(";", $wrappout);

	if (is_dir($dire)) {
	$files = scandir($dire);
	array_shift($files);
	array_shift($files);
	if ( $show == '' or $show == 'all' or $show > sizeof($files) ) { $imgcount = sizeof($files); } else { $imgcount = $show; }
	if ( $nopreview ) { $addclass = 'class="nopreview"'; }
	if(!empty($files)) {
	if ( $slider ) { $output = '<div class="slider-wrapper">'; }
		$output .= '<ul class="'.$class.'">';
		for($i=0; $i<$imgcount; $i++) {
			$output .= '<li>';
			if ($wrapp) { $output .= '<a href="'.$modx->makeUrl($wrapparr[$i]).'">'; }
			if ($wrappout) { $output .= '<a target="_blank" rel="external nofollow" href="http://'.$wrappoutarr[$i].'/">'; }
			if ($description) {
				$output .= '<span class="description-wrapper">'.$descriptionarr[$i].'</span>';
				$dscrptn = $descriptionarr[$i];
			} else {
				$dscrptn = 'Изображение '.$i;
			}
			if ( $slider ) { $toitems .= '<span class="to-item'.$i.'" id="item'.$i.'">'.$i.'</span>'; }
			$output .= '<img '.$addclass.' width="'.$sizearr[0].'"';
			if ( $sizearr[1] != 'auto' ) {
 				$output .= ' height="'.$sizearr[1].'"';
 			}
			$output .= ' src="'.$modx->config['site_url'].$dire.$files[$i].'" alt="'.$dscrptn.'" />';
			if ($wrapp or $wrappout) { $output .= '</a>'; }
			$output .= '</li>';
		}
		$output .= '</ul>';
		if ( $slider ) {
			$output .= '	<div class="c-btns">
					<span class="left-arrow" id="main-prev">&laquo;</span>
					<span class="navi-all">'.$toitems.'</span>
					<span class="right-arrow" id="main-next">&raquo;</span>
				</div>
			</div>';
		}
		} else $output = '<p>К сожалению в указанной папке изображения не найдены...</p>';
	} else $output = '<p>Указанный каталог не найден...</p>';
return $output;
?>