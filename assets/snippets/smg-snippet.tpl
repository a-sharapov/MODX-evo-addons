<?php
/* [[smg]]
 *
 * Simple image Matrix Generator - MODx Evo Snippet
 *
 * @description: <b>1.00</b> Простой сниппет генерации матрицы изображений из папки
 *
 * @category    snippet
 * @version     1.00
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @author      Alex Sharapov
 *
 * Example: [[smg? 	&src=`assets/images/gallery/`
 *					&show=`number||all`
 *					&size=`200x200`
 *					&nopreview=`1`
 *					&innerlinks=`ID` || &outerlinks=`http://sitename.com/`
 *					&description=`desc1;desc2;desc3;...;descN`
 *					&wrapperclass=`classname`
 *					&innerclass=`classname`
 * 			]]
 */

// Parameters
$src = (isset($src)) ? $src : "assets/images/";							// Sorce of files
$show = (isset($show)) ? $show : ""; 										// Show-items counter
$size = (isset($size)) ? $size : "200xauto";								// Size of images
$nopreview = (isset($nopreview)) ? $nopreview : null;						// Add "nopreview" class

$wrapperclass = (isset($wrapperclass)) ? $wrapperclass : "gallery";			// Wrapper class
$innerclass = (isset($innerclass)) ? $innerclass : "gallery-item";			// Inner list class

$description = (isset($description)) ? $description : null;					// Decription for images

$innerlinks = (isset($innerlinks)) ? $innerlinks : null;					// IDs to generate inner links
$outerlinks = (isset($outerlinks)) ? $outerlinks : null;					// Links to wrapp

// type of out files
$types = array('gif', 'jpg', 'jpeg', 'png', 'GIF', 'JPG', 'JPEG', 'PNG');

// Inner parameters
$size = explode("x", $size);
if ( $description ) { $description = explode(";", $description); }
if ( $innerlinks ) { $innerlinks = explode(";", $innerlinks); }
if ( $outerlinks ) { $outerlinks = explode(";", $outerlinks); }

// Gallery out
if (is_dir($src)) {
	$files = scandir($src);array_shift($files);array_shift($files);
	// Get count of showing images
	if ( $show == '' or $show == 'all' or $show > sizeof($files) ) {
		$imgcount = sizeof($files);
	} else {
		$imgcount = $show;
	}
	// Get classes
	if ( $nopreview ) { $imgclass = ' class="nopreview"'; }
	$ulclass = ' class="'.$wrapperclass.'"';
	$liclass = ' class="'.$innerclass.'"';

	if(!empty($files)) {
		$output .= '<div'.$ulclass.'>';
		for($i=0; $i<$imgcount; $i++) {
			$fileamp = explode(".", $files[$i]);
			if ( in_array(end($fileamp), $types) && $fileamp[0] != '' ) {
			$output .= '<figure'.$liclass.'>';
			if ($innerlinks) { $output .= '<a href="'.$modx->makeUrl($innerlinks[$i]).'">'; }
			if ($outerlinks) { $output .= '<a target="_blank" rel="external nofollow" href="'.$outerlinks[$i].'">'; }

			if ($description) {
				$output .= '<figcaption>'.$description[$i].'</figcaption>';
				$dscrptn = $description[$i];
			} else {
				$dscrptn = $wrapperclass.'-image-'.$i;
			}

			$output .= '<img '.$imgclass.' width="'.$size[0].'"';
			if ( $size[1] != 'auto' ) {
 				$output .= ' height="'.$size[1].'"';
 			}

			$output .= ' src="'.$src.$files[$i].'" alt="'.$dscrptn.'" />';

			if ($innerlinks or $outerlinks) { $output .= '</a>'; }
			$output .= '</figure>';
			}
		}
		$output .= '</div>';

	} else $output = '<p>К сожалению в указанной папке изображения не найдены...</p>';
} else $output = '<p>Указанный каталог не найден...</p>';

return $output;
?>