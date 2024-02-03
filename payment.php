<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="admin, dashboard" />
	<meta name="author" content="DexignZone" />
	<meta name="robots" content="index, follow" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Kripton : Crypto Admin Dashboard  Bootstrap 5 Template" />
	<meta property="og:title" content="Kripton : Crypto Admin Dashboard  Bootstrap 5 Template" />
	<meta property="og:description" content="Kripton : Crypto Admin Dashboard  Bootstrap 5 Template" />
	<meta property="og:image" content="../xhtml/social-image.png"/>
	<meta name="format-detection" content="telephone=no">
    <title>Admo </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
	<link rel="stylesheet" href="vendor/chartist/css/chartist.min.css">
    <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
	<link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--********* Preloader End ******-->

    <!--*** Main wrapper start ***-->
       <div id="main-wrapper">

        <!--*** Nav header start ***-->
		<?php include 'include/nav_header.php'; ?>
        <!--*** Nav header end ****-->
		
		<!--***  Chat box start ***-->
		<?php include 'include/chatbox.php'; ?>
		<!--*** Chat box End ***-->
		
		<!--****  Header start ****-->
		<?php include 'include/header.php'; ?>
        <!--**** Header end ****-->

        <!--*** Sidebar start ***-->
          <?php include 'include/sidebar.php'; ?>
        <!--*** Sidebar end ***-->
		
		<!--**** Content body start ***-->
        <div class="content-body">
            <!-- row -->
			<div class="container-fluid">
				<div class="row">

				</div>
            </div>
        </div>
        <!--*******
            Content body end
        ***-->

        <!--*******
            Footer start
        ***-->
       <?php include 'include/footer.php'?>
        <!--*******
            Footer end
        ***-->


	</div>
    <!--*******
        Main wrapper end
    ***-->

    <!--*******
        Scripts
    ***-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
	<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="vendor/chart.js/Chart.bundle.min.js"></script>
	
	<!-- Chart piety plugin files -->
    <script src="vendor/peity/jquery.peity.min.js"></script>
	
	<!-- Apex Chart -->
	<script src="vendor/apexchart/apexchart.js"></script>
	
	<!-- Dashboard 1 -->
	<script src="js/dashboard/dashboard-1.js"></script>
	
	<script src="vendor/owl-carousel/owl.carousel.js"></script>
    <script src="js/custom.min.js"></script>
	<script src="js/deznav-init.js"></script>
	<script src="js/demo.js"></script>
    <script src="js/styleSwitcher.js"></script>
	
</body>

</html>