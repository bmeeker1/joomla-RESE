<?php
/**
* @package   yoo_symphony Template
* @version   1.5.2 2009-11-05 11:26:17
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2009 YOOtheme GmbH
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// example: polaroid module

?>
<div class="module <?php echo $style; ?> <?php echo $color; ?> <?php echo $yootools; ?> <?php echo $first; ?> <?php echo $last; ?>">

	<?php echo $badge; ?>
	
	<div class="box-1">
	
		<div class="box-2 deepest">
			<div class="box-3">
				<?php echo $content; ?>
			</div>
		</div>
		
		<?php if ($showtitle) : ?>
		<h3 class="header"><span class="header-2"><span class="header-3"><?php echo $title; ?></span></span></h3>
		<?php endif; ?>
		
	</div>
		
	<div class="box-b1">
		<div class="box-b2">
			<div class="box-b3"></div>
		</div>
	</div>
		
</div>