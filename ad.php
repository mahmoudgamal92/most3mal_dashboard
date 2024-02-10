<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$ad = json_decode(CURL_GET(API_URL . 'records/ads/' . $id), true);
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
                                <h4 class="card-title">
                                    <?php echo $ad['title']; ?>
                                </h4>

                                <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                                    عودة
                                </a>
                            </div>


                            <div class="card-body">
                                <div class="post-details">
                                    <h3 class="mb-2 text-black">
                                        <?php echo $ad['title']; ?>

                                    </h3>
                                    <ul class="mb-4 post-meta d-flex flex-wrap">
                                        <li class="post-author me-3">
                                            الإعلان بواسطة : <?php echo  $ad['user_id']; ?>
                                        </li>
                                        <li class="post-date me-3">
                                            <i class="fa fa-calender"></i>
                                            <?php echo $ad['created_at']; ?>
                                        </li>
                                        <li class="post-comment"><i class="fa fa-comments-o"></i> 28</li>
                                    </ul>
                                    <img src="images/profile/8.jpg" alt="" class="img-fluid mb-3 w-100">
                                    <p>A wonderful serenity has take possession of my entire soul like these sweet morning of spare which enjoy whole heart.A wonderful serenity has take possession of my entire soul like these sweet morning of spare which enjoy whole heart.</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--*****  Content body end  ***-->

        <!--******* Footer start ***-->
        <?php include 'include/footer.php' ?>
        <!--*******   Footer end   *****-->


    </div>
    <!--***** Main wrapper end ***-->

    <!--******* Scripts ******-->
    <?php include 'include/scripts.php' ?>
</body>

</html>