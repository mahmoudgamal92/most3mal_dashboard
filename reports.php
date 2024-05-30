<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
//$users = json_decode(CURL_GET(API_URL . 'records/departments'), true);
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

                </div>
            </div>
        </div>


        <!--******* Content body end ***-->
        <!--****** Footer start ***-->
        <?php include 'include/footer.php' ?>
        <!--******* Footer End ***-->


    </div>
    <!--******* Main wrapper end ***-->
    <!--******* Scripts ***-->
    <?php include 'include/scripts.php' ?>
</body>

</html>