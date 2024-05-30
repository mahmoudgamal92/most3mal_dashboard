<?php
require_once 'utils/network.php';
require_once 'utils/config.php';

$depart_id = $_GET['id'];
$departs = _Read('categories', array("id" => $depart_id));
//print_r($departs[0]);
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
            <div class="container">
                <div class="row">

                    <form method="post" action="api/cats/update.php" enctype="multipart/form-data">

                        <div class="col-xl-12 col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        تعديل بيانات القسم الفرعي
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="basic-form">
                                                <input type="hidden" name="cat_id" value="<?= $depart_id ?>">

                                                <div class="mb-3">

                                                    <input type="text" class="form-control " name="name_ar" value=<?php echo '"' . $departs[0]['name_ar'] . '"' ?>>
                                                </div>

                                                <div class="mb-3">
                                                    <input type="text" class="form-control" name="name_en" value=<?php echo '"' . $departs[0]['name_en'] . '"' ?>>
                                                </div>

                                                <div class="mb-3">
                                                    <p>
                                                        إختيار صورة جديدة
                                                    </p>
                                                    <div class="input-group custom_file_input">
                                                        <div class="form-file">
                                                            <input type="file" name="image" class="form-file-input form-control">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <img style="width:200px;height:200px" src="<?php echo  MEDIA_URL  . $departs[0]['image']; ?>" />
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                        حفظ التغيرات
                                    </button>
                                </div>

                            </div>
                        </div>
                </div>
                </form>
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

</body>

</html>