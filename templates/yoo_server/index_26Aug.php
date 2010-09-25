<?php
/**
* @package   ERA Template
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
	<link rel="stylesheet" href="<?php echo $template->url ?>/css/main.css" type="text/css" />
<!--	<style type="text/css">
		body{font:12px/1.2 Verdana, Arial, san-serrif; padding:0 10px;}
		a:link, a:visited{text-decoration:none; color:#416CE5; border-bottom:1px solid #416CE5;}
		h2{font-size:13px; margin:15px 0 0 0;}
	</style>-->
	<link media="screen" rel="stylesheet" href="<?php echo $template->url ?>/css/colorbox.css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<!-- <script src="<?php echo $template->url ?>/js/jquery-1.4.2.js" type="text/javascript"></script> -->
	<script src="<?php echo $template->url ?>/js/jquery.colorbox.js" type="text/javascript"></script>
	<script type="text/javascript">
		$j=jQuery.noConflict();
		$j(document).ready(function(){
			$j(".loginERA").colorbox({width:"80%", height:"80%", iframe:true});
		});
	</script>
</head>
<body>
<div id="mainouter">
	<div id="mainpage">
		<div id="page" class="yoopage <?php echo $this->params->get('columns'); ?>">
  			<!-- header container starts here-->
			<div id="header">
				<div id="mylogo">
					<a href="#"><img src="<?php echo $this->baseurl ?>/templates/yoo_symphony/images/logo.png" alt="image" /></a>
				</div>
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

					<div class="headertop">
						<div class="alws fl">
							<img src="<?php echo $this->baseurl ?>/templates/yoo_symphony/images/alwimg.png" alt="img" />
						</div>
						<div class="logorght fr">
							<span>Language:</span>
							<select>
								<option>English</option>
							</select>
							<div class="login">
								<a class="loginERA" href="index.php?option=com_user&view=login">Login</a><br/>
								<a href="javascript:void(0)" alt="Register" title="Or Register for an account">Register</a>
							</div>
						</div>
					</div>

				</div>

				<?php if($this->countModules('menu')) : ?>
					<div id="menu">
					<jdoc:include type="yoomodules" name="menu" style="yoo" />
					</div>
				<?php endif; ?>
			</div> <!-- / header ends here-->

			<!-- main container with changing content -->
			<div id="maincont">
				<div class="banner">
					<?php if ($this->countModules( 'propsearch' )) : ?>
					<div class="bannerlft">
						<jdoc:include type="modules" name="propsearch" style="xhtml" />
					</div>
					<?php endif; ?>
					<?php if ($this->countModules('flashbanner')) : ?>
						<jdoc:include type="modules" name="flashbanner" style="xhtml" />
					<?php endif; ?>
				</div>
			</div>
		</div><!--page ends here-->
	<?php if ($this->countModules('top + topblock')) : ?>
		<div id="page-top">
			<div class="page-top-1">
				<?php if($this->countModules('topblock')) : ?>
					<div class="topblock width100 float-left">
						<jdoc:include type="modules" name="topblock" style="xhtml" />
					</div>
				<?php endif; ?>
				<div class="wrapper_top">

					<div id="top" >

						<?php if ($this->countModules('top')) : ?>
							<jdoc:include type="yoomodules" name="top" wrapper="topbox float-left" layout="<?php echo $this->params->get('top'); ?>" style="yoo" />
						<?php endif; ?>

					</div>
					<!-- top end -->

				</div>
			</div>
		</div><!--page-top ends here-->
	<?php endif; ?>
		<div id="page-middle">
			<div class="page-middle-1">
				<div class="page-middle-2">
					<div class="wrapper_mid">

						<div id="middle">
							<div id="middle-expand">

								<div id="main">
								<?php if ($this->countModules('left') === 0) $xtra=Left;
									else if ($this->countModules('right') === 0) $xtra=Right;
										if ( ( $this->countModules('left') + $this->countModules('right') ) === 0 ) $xtra=Both;
								?>
									<div id="main-shift" class='<?php echo "mainMargin{$xtra}" ?>' >
										<div class="main-wrapper-t1">
											<div class="main-wrapper-t2">
												<div class="main-wrapper-t3">&nbsp;</div>
											</div>
										</div>
										<div class="main-wrapper-1 <?php if($this->countModules('breadcrumbs')){?> with-breadcrumbs <?php } ?>" >
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
															<?php if($_GET['view'] !="article" ) : ?>
																<jdoc:include type="message" />
																<jdoc:include type="component" />
															<?php endif; ?>
															</div>
														</div>
													</div><!-- content end -->

													<div id="wrapper1">
														<div class="mid1div">
															<div class="middivlft">
															<?php if ($this->countModules('maptab')) : ?>
																<jdoc:include type="modules" name="maptab" style="xhtml" />
															<?php endif;?>
															<?php if ($this->countModules( 'openhouse' )) : ?>
																<div class="module_area_lft">
																<jdoc:include type="modules" name="openhouse" style="xhtml"/>
																</div>
															<?php endif;?>
															<?php if ($this->countModules( 'customdata' )) : ?>
																<div class="module_area_lft">
																<jdoc:include type="modules" name="customdata" style="xhtml"/>
																</div>
															<?php endif;?>
															<?php if ($this->countModules( 'sharebox' )) : ?>
																<div class="module_area_lft">
																<jdoc:include type="modules" name="sharebox" style="xhtml" />
																</div>
															<?php endif; ?>
															</div>
															<div class="middivrght">
															<?php if ($this->countModules( 'advertise' )) : ?>
																<div class="module_area">
																<jdoc:include type="modules" name="advertise" style="xhtml" />
																</div>
															<?php endif;?>
															<?php if ($this->countModules( 'partner' )) : ?>
																<div class="module_area">
																<jdoc:include type="modules" name="partner" style="xhtml" />
																</div>
															<?php endif;?>
															<?php if ($this->countModules( 'latestprop' )) : ?>
																<div class="module_area">
																<jdoc:include type="modules" name="latestprop" style="xhtml" />
																</div>
															<?php endif; ?>
															<?php if ($this->countModules( 'news' )) : ?>
																<div class="module_area">
																<jdoc:include type="modules" name="news" style="xhtml" />
																</div>
															<?php endif; ?>
															</div><!--middivrght ends -->
														</div><!-- end of middiv -->
													</div><!-- end of wrapper1 -->
												</div><!-- mainmiddle-expand end -->
											</div><!-- mainmiddle end -->
										</div><!-- main-wrapper1 end -->
										<div class="main-wrapper-b1">
											<div class="main-wrapper-b2">
												<div class="main-wrapper-b3">&nbsp;</div>
											</div>
										</div>
									</div><!--main-shift ends -->
								</div><!--main ends-->

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

							</div><!--middle-expand ends -->
						</div> <!--middle ends-->
						<div class="btm1div">&nbsp;</div>
					<?php if ($this->countModules('bottom + bottomblock')) : ?>
						<div id="bottom">

						<?php if ($this->countModules('bottom')) : ?>
							<jdoc:include type="yoomodules" name="bottom" wrapper="bottombox float-left" layout="<?php echo $this->params->get('bottom'); ?>" style="yoo" />
						<?php endif; ?>

						<?php// if($this->countModules('bottomblock')) : ?>
							<div class="bottomblock width100 float-left"></div>
						<?php //endif; ?>

						</div><!-- bottom ends -->
					<?php endif; ?>
					</div> <!-- wrapper-mid ends -->
				</div><!-- page-middle-2 ends-->
			</div><!-- page-middle-1 ends-->
		</div><!--page middle ends -->
	<!--close of yoo theme-->

		<div id="page-footer" >
		<?php if ($this->countModules( 'footerlinks' )) : ?>
			<div id="footer" >
			<jdoc:include type="modules" name="footerlinks" style="xhtml" />
			</div>
		<?php endif; ?>

		</div><!--page-footer ends here-->
		<div class="footerdwn">
			<strong> 2010 &copy; ERA Hellas/Cyprus Franchise Systems LTD.</strong>
			<p> The ERA name, logo and identity are registered trademarks of ERA Franchise Systems LLC and are protected by international copyright law.<br/>
			Each ERA office is independantly owned and operated. For franchise enquiries or information please
			<a href="javascript:void(0)">click here.</a></p>
		</div><!--footerdwn ends-->
	</div><!--mainpage ends here-->
</div><!-- mainouter ends here -->
</body>
</html>
