<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_SESSION['id'];
$user = _Read('employees', array('id' => (int)$id)) ?>

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
                    <div class="col-lg-12">
                        <div class="profile card card-body px-3 pt-3 pb-0">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="mb-1">
                                            <strong>الأسم</strong>
                                        </label>
                                        <input disabled type="text" class="form-control" name="user_name" value="<?php echo $user[0]['name'] ?>">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="mb-1">
                                            <strong>البريد الإلكتروني</strong>
                                        </label>
                                        <input disabled type="email" class="form-control" name="email_address" value="<?php echo $user[0]['email'] ?>">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="mb-1">
                                            <strong>الهاتف</strong>
                                        </label>
                                        <input disabled type="number" class="form-control" name="phone_number" value="<?php echo $user[0]['phone'] ?>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="mb-1">
                                            <strong>نوع الحساب</strong>
                                        </label>
                                        <input disabled type="text" class="form-control" name="user_role" value="<?php echo $user[0]['user_role'] ?>">
                                    </div>
                                </div>

                                <!-- <div class="col-md-6">
                                    <button class="btn btn-primary">
                                        حفظ
                                    </button>
                                </div> -->
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
    <!--<script src="js/styleSwitcher.js"></script>-->

</body>

</html>