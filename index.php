<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
list($adsMonths, $adsPerMonth) = getAdsPerMonth("ads");
list($auctionMonths, $auctionsPerMonth) = getAdsPerMonth("auctions");
$users = getRowCount('users');
$adds = getRowCount('ads');
$auctions = getRowCount('auctions');
$item_offers = getRowCount('item_offers');

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
										<?php echo $users  ?>
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
										<?php echo $adds; ?>
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
										<?php echo $auctions; ?>
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
										<?php echo $item_offers; ?>
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
		<!--******* Content body end ***-->

		<!--******* Footer start ***-->
		<?php include 'include/footer.php' ?>
		<!--******* Footer end ***-->
	</div>
	<!--*****  Main wrapper end ***-->
	<!--****** Scripts ***-->
	<?php include 'include/scripts.php' ?>
	<script>
		// Define a function to initialize and render the line chart
		function initializeLineChart() {

			var options = {
				series: [{
					name: 'الإعلانات',
					data: <?php echo json_encode($adsPerMonth); ?>
				}, {
					name: 'المزادات',
					data: <?php echo json_encode($auctionsPerMonth); ?>
				}],
				chart: {
					height: 360,
					toolbar: {
						show: false
					},
					type: 'area'
				},
				colors: ['#FFAB2D', '#AC4CBC'],
				legend: {
					show: false
				},
				dataLabels: {
					enabled: false
				},
				stroke: {
					width: 4,
					curve: 'smooth'
				},
				xaxis: {
					categories: <?php
								if (count($adsMonths) >= count($auctionMonths)) {
									echo json_encode($adsMonths);
								} else {
									echo json_encode($auctionMonths);
								}
								?>,
					labels: {
						style: {
							colors: '#787878',
							fontSize: '14px',
							fontFamily: 'Poppins',
							fontWeight: 100
						}
					}
				},
				yaxis: {
					show: false
				},
				fill: {
					opacity: 0.2,
					type: 'solid'
				},
				tooltip: {
					x: {
						format: 'dd/MM/yy HH:mm'
					}
				}
			};

			var chart = new ApexCharts(document.querySelector("#lineChart"), options);
			chart.render();
		}

		jQuery(window).on('load', function() {
			setTimeout(initializeLineChart, 1000);
		});
	</script>
</body>

</html>