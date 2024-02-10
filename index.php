<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
?>

<?php include 'include/headTag.php'; ?>

<body>
	<!--********* Preloader start ******-->
	<?php include 'include/loader.php'; ?>
	<!--********* Preloader End ******-->

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
					<div class="col-xl-3 col-sm-6">
						<div class="card overflow-hidden">
							<div class="card-header align-items-start border-0 pb-0">
								<div class="me-auto">
									<p class="mb-2 fs-13">
										<i class="fa fa-caret-up scale5 me-2 text-success ms-1" aria-hidden="true"></i>
										34
									</p>
									<h3 class="text-black mb-0 font-w600">المستخدمين</h3>
								</div>
								<div class="btn btn-rounded btn-primary shadow btn-sm sharp ms-1">
									<i class="fas fa-trash"></i>
								</div>
							</div>
							<div class="card-body p-0">
								<canvas id="widgetChart" class="max-h80 mt-auto"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6">
						<div class="card overflow-hidden">
							<div class="card-header align-items-start border-0 pb-0">
								<div class="me-auto">
									<p class="mb-2 fs-13">
										<i class="fa fa-caret-down scale5 me-2 text-danger ms-1" aria-hidden="true"></i>
										34
									</p>
									<h3 class="text-black mb-0 font-w600">الإعلانات</h3>
								</div>

								<div class="btn btn-rounded btn-primary shadow btn-sm sharp ms-1">
									<i class="fas fa-trash"></i>
								</div>
							</div>
							<div class="card-body p-0">
								<canvas id="widgetChart2" class="max-h80 mt-auto"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6">
						<div class="card overflow-hidden">
							<div class="card-header align-items-start border-0 pb-0">
								<div class="me-auto">
									<p class="mb-2 fs-13">
										<i class="fa fa-caret-down scale5 me-2 text-danger ms-1" aria-hidden="true"></i>
										34
									</p>
									<h3 class="text-black mb-0 font-w600">المزادات</h3>
								</div>
								<div class="btn btn-rounded btn-primary shadow btn-sm sharp ms-1">
									<i class="fas fa-trash"></i>
								</div>
							</div>
							<div class="card-body p-0">
								<canvas id="widgetChart3" class="max-h80 mt-auto"></canvas>
							</div>
						</div>
					</div>


					<div class="col-xl-3 col-sm-6">
						<div class="card overflow-hidden">
							<div class="card-header align-items-start border-0 pb-0">
								<div class="me-auto">
									<p class="mb-2 fs-13">
										<i class="fa fa-caret-up scale5 me-2 text-success ms-1" aria-hidden="true"></i>
										34
									</p>
									<h3 class="text-black mb-0 font-w600">الطلبات</h3>
								</div>
								<div class="btn btn-rounded btn-primary shadow btn-sm sharp ms-1">
									<i class="fas fa-trash"></i>
								</div>
							</div>
							<div class="card-body p-0">
								<canvas id="widgetChart4" class="max-h80 mt-auto"></canvas>
							</div>
						</div>
					</div>

					<div class="col-xl-6 col-xxl-12">
						<div class="card">
							<div class="card-header d-sm-flex d-block pb-0 border-0">
								<div>
									<h4 class="fs-20 text-black">إحصائيات عامة</h4>
									<p class="mb-0 fs-12">
										Lorem ipsum dolor sit amet, consectetur
									</p>
								</div>
								<div class="d-flex mt-sm-0 mt-3">
									<div class="form-check form-switch text-start ms-4 mb-2">
										<input type="checkbox" class="form-check-input" id="customSwitch11">
										<label class="form-check-label fs-14 text-black ps-2" for="customSwitch11">Date</label>
									</div>
									<div class="form-check form-switch text-start ms-4 mb-2">
										<input type="checkbox" class="form-check-input" id="customSwitch12">
										<label class="form-check-label fs-14 text-black ps-2" for="customSwitch12">Value</label>
									</div>
								</div>
							</div>
							<div class="card-body pb-0">
								<div class="d-flex flex-wrap crypto">
									<div class="form-check custom-checkbox mb-2 me-3">
										<input type="checkbox" class="form-check-input" id="customCheck9">
										<label class="form-check-label" for="customCheck9">
											<span class="d-block text-black font-w500">
												الإعلانات
											</span>
										</label>
									</div>
									<div class="form-check custom-checkbox mb-2 me-3">
										<input type="checkbox" class="form-check-input" id="customCheck91">
										<label class="form-check-label" for="customCheck91">
											<span class="d-block text-black font-w500">
												المزادات
											</span>
										</label>
									</div>

								</div>
								<div id="lineChart"></div>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>
		<!--*******
            Content body end
        ***-->

		<!--*******
            Footer start
        ***-->
		<?php include 'include/footer.php' ?>
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
	<script>
		function carouselReview() {
			jQuery('.testimonial-one').owlCarousel({
				loop: true,
				autoplay: true,
				margin: 20,
				nav: false,
				rtl: true,
				dots: false,
				navText: ['', ''],
				responsive: {
					0: {
						items: 3
					},
					450: {
						items: 4
					},
					600: {
						items: 5
					},
					991: {
						items: 5
					},

					1200: {
						items: 7
					},
					1601: {
						items: 5
					}
				}
			})
		}
		jQuery(window).on('load', function() {
			setTimeout(function() {
				carouselReview();
			}, 1000);
		});
	</script>
</body>

</html>