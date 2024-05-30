<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$params = array("conv_id" => $id);
$conversations = _Read('messages', $params); ?>

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
                    <div class="card">

                        <div class="card-header">
                            <h4 class="card-title">
                                رسائل المحادثة
                            </h4>
                        </div>

                        <div class="card-body">
                            <?php
                            foreach ($conversations as $item) {
                            ?>
                                <div style="border-bottom:1px solid grey">

                                    <div style="display:flex;align-items:center">
                                        <img src="./images/man.png" style="width: 50px;height:50px;" />
                                        <p> <?php echo getUserById($item['sender_id'])['name']; ?></p>
                                    </div>

                                    <p><?php echo $item['message']; ?></p>
                                    <?php
                                    if ($item['attatchments'] !== "null") {
                                    ?>

                                        <img src=<?= $item['attatchments'] ?> style="width:120px;heght:120px" />
                                    <?php
                                    }
                                    ?>
                                    <p><?php echo $item['created_at']; ?></p>
                                </div>

                            <?php


                            }
                            ?>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--******* Content body end ***-->

        <!--******* Footer Start ***-->
        <?php include 'include/footer.php' ?>
        <!--*******  Footer End ***-->


    </div>
    <!--******* Main wrapper End ***-->

    <!--******* Scripts *******-->
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