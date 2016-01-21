<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Error 503 | DNSC Human Resource Information System</title>


	<!--STYLESHEET-->
	<!--=================================================-->

	<!-- Favicon -->
    <link rel="icon" href="/assets/img/logo.png">
    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ] -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">
    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="/dist/css/style.css" rel="stylesheet">

    <link href="/dist/css/theme.css" rel="stylesheet">

    <!--Font Awesome [ OPTIONAL ]-->
    <link href="/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
	<div id="container" class="cls-container">

		<!-- HEADER -->
		<!--===================================================-->
		<div class="cls-header">
			<div class="cls-brand">
				<a class="box-inline">
					<span class="brand-title">Davao del Norte State College <span class="text-thin">Human Resource Information System</span></span>
				</a>
			</div>
		</div>

		<!-- CONTENT -->
		<!--===================================================-->
		<div class="cls-content">
			<h1 class="error-code text-danger">503</h1>
			<p class="h4 text-thin pad-btm mar-btm">
				<i class="fa fa-cog fa-fw"></i>
				{{ trans('http-errors.503') }}
			</p>
			<div class="row mar-btm">
				<form class="col-xs-12 col-sm-10 col-sm-offset-1" method="POST" action="">
					<input type="text" placeholder="Search.." class="form-control input-lg error-search">
				</form>
			</div>
		</div>


	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->

	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
    <script src="/bower_components/jquery/jquery.min.js"></script>

    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <script src="/dist/js/all.js"></script>

</body>

</html>
