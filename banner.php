<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$users = json_decode(CURL_GET(API_URL.'records/banners'), true);
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
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">البانر الإعلاني</h4>

                                <a href="#" class="btn btn-primary shadow btn-xs sharp ms-1">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>المعرف</th>
                                                <th>الصورة</th>
                                                <th>العنوان</th>
                                                <th>الحالة</th>
                                                <th>تاريخ النشر </th>
                                                <th> الإجراءات </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            foreach ($users['records'] as $item) {
                                            ?>
                                            <tr>
                                                <td><?php echo $item['id'] ?></td>
                                                <td> Image </td>
                                                <td>
                                                    <?php
                                                        $obj = json_decode($item['name'], true);
                                                        echo $obj['ar'];
                                                        ?>
                                                </td>
                                                <td>
                                                    <span class="badge light badge-success">
                                                        <?php echo $item['status'] ?>
                                                    </span>
                                                </td>
                                                <td><?php echo $item['created_at'] ?></td>
                                                <td>
                                                    <div class="d-flex">

                                                        <a href="#" class="btn btn-primary shadow btn-xs sharp ms-1">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </a>

                                                        <a href="#" class="btn btn-danger shadow btn-xs sharp">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                        <div>
                                                </td>
                                            </tr>
                                            <?php
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--*****  Content body end  ***-->


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