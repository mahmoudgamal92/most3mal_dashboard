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
 <!-- <script src="js/styleSwitcher.js"></script> -->
 <!-- Datatable -->
 <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
 <script src="js/plugins-init/datatables.init.js"></script>


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