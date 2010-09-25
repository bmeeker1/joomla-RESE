<?php
/**
* @package   yoo_symphony Template
* @version   1.5.2 2009-11-05 11:26:17
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2009 YOOtheme GmbH
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

JHTML::_('behavior.mootools');

// include config
include_once(dirname(__FILE__).'/config.php');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" >
<head>
<jdoc:include type="head" />
<link rel="apple-touch-icon" href="<?php echo $template->url ?>/apple_touch_icon.png" />
</head>

<body id="page" class="yoopage <?php echo $this->params->get('columns'); ?> <?php echo $this->params->get('itemcolor'); ?> <?php echo $this->params->get('toolscolor'); ?>">

	<?php if($this->countModules('absolute')) : ?>
	<div id="absolute">
		<jdoc:include type="yoomodules" name="absolute" />
	</div>
	<?php endif; ?>

	<div id="page-header">
		<div class="page-header-1">
			<div class="page-header-2">
				<div class="page-header-3">
					<div class="wrapper">

						<div id="header">

							<div id="toolbar">

								<?php if($this->params->get('date')) : ?>
								<div id="date">
									<?php echo JHTML::_('date', 'now', JText::_('DATE_FORMAT_LC')) ?>
								</div>
								<?php endif; ?>

								<?php if($this->countModules('toolbarleft')) : ?>
								<div class="left">
									<jdoc:include type="yoomodules" name="toolbarleft" style="yoo" />
								</div>
								<?php endif; ?>



							</div>

							<div id="headerbar">

								<?php if($this->countModules('headerleft')) : ?>
								<div class="left">
									<jdoc:include type="yoomodules" name="headerleft" style="yoo" />
								</div>
								<?php endif; ?>

								<?php if($this->countModules('headerright')) : ?>
								<div class="right">
									<jdoc:include type="yoomodules" name="headerright" style="yoo" />
								</div>
								<?php endif; ?>

							</div>

							<?php if($this->countModules('logo')) : ?>
							<div id="logo">
								<jdoc:include type="yoomodules" name="logo" />
							</div>
							<?php endif; ?>

							<?php if($this->countModules('menu')) : ?>
							<div id="menu">
								<jdoc:include type="yoomodules" name="menu" style="yoo" />
							</div>
							<?php endif; ?>

							<?php if($this->countModules('search')) : ?>
							<div id="search">
								<jdoc:include type="yoomodules" name="search" />
							</div>
							<?php endif; ?>

							<?php if ($this->countModules('banner')) : ?>
							<div id="banner">
								<jdoc:include type="yoomodules" name="banner" />
							</div>
							<?php endif; ?>

						</div>
						<!-- header end -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<?php if ($this->countModules('top + topblock')) : ?>
	<div id="page-top">
		<div class="page-top-1">
			<div class="wrapper">

				<div id="top">

					<?php if($this->countModules('topblock')) : ?>
					<div class="topblock width100 float-left">
						<jdoc:include type="yoomodules" name="topblock" style="yoo" />
					</div>
					<?php endif; ?>

					<?php if ($this->countModules('top')) : ?>
						<jdoc:include type="yoomodules" name="top" wrapper="topbox float-left" layout="<?php echo $this->params->get('top'); ?>" style="yoo" />
					<?php endif; ?>

				</div>
				<!-- top end -->

			</div>
		</div>
	</div>
	<?php endif; ?>

	<div id="page-middle">
		<div class="page-middle-1">
			<div class="page-middle-2">
				<div class="wrapper">

					<div id="middle">
						<div id="middle-expand">

							<div id="main">
								<div id="main-shift">

									<div class="main-wrapper-t1">
										<div class="main-wrapper-t2">
											<div class="main-wrapper-t3"></div>
										</div>
									</div>

									<div class="main-wrapper-1 <?php if ($this->countModules('breadcrumbs')) echo 'with-breadcrumbs'; ?>">

										<?php if ($this->countModules('breadcrumbs')) : ?>
										<div id="breadcrumbs">
											<jdoc:include type="yoomodules" name="breadcrumbs" />
										</div>
										<?php endif; ?>


										<div id="mainmiddle">
											<div id="mainmiddle-expand">

												<div id="content">
													<div id="content-shift">



														<div class="floatbox">
															<jdoc:include type="message" />
															<jdoc:include type="component" />
														</div>

													</div>
												</div>
												<!-- content end -->

												<?php if($this->countModules('contentleft')) : ?>
												<div id="contentleft">
													<jdoc:include type="yoomodules" name="contentleft" style="yoo" />
												</div>
												<?php endif; ?>

												<?php if($this->countModules('contentright')) : ?>
												<div id="contentright">
													<jdoc:include type="yoomodules" name="contentright" style="yoo" />
												</div>
												<?php endif; ?>

											</div>
										</div>
										<!-- mainmiddle end -->



									</div>

									<div class="main-wrapper-b1">
										<div class="main-wrapper-b2">
											<div class="main-wrapper-b3"></div>
										</div>
									</div>

								</div>
							</div>

							<?php if($this->countModules('left')) : ?>
							<div id="left">
								<jdoc:include type="yoomodules" name="left" style="yoo" />
							</div>
							<?php endif; ?>

							<?php if($this->countModules('right')) : ?>
							<div id="right">
								<jdoc:include type="yoomodules" name="right" style="yoo" />
							</div>
							<?php endif; ?>

						</div>
					</div>

					<?php if ($this->countModules('bottom + bottomblock')) : ?>
					<div id="bottom">

						<?php if ($this->countModules('bottom')) : ?>
							<jdoc:include type="yoomodules" name="bottom" wrapper="bottombox float-left" layout="<?php echo $this->params->get('bottom'); ?>" style="yoo" />
						<?php endif; ?>

						<?php if($this->countModules('bottomblock')) : ?>
						<div class="bottomblock width100 float-left">
							<jdoc:include type="yoomodules" name="bottomblock" style="yoo" />
						</div>
						<?php endif; ?>

					</div>
					<!-- bottom end -->
					<?php endif; ?>

				</div>
			</div>
		</div>
	</div>

	<div id="page-footer">
		<div class="wrapper">

			<div id="footer">
				<a class="anchor" href="#page"></a>
				<jdoc:include type="yoomodules" name="footer" />
				<jdoc:include type="yoomodules" name="debug" />
			</div>
			<!-- footer end -->

		</div>
	</div>

</body>
</html>