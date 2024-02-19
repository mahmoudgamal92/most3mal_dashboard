<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$auctions = _Read('auctions');
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
                                <h4 class="card-title">المزادات</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>صورة المزاد</th>
                                                <th>رقم المزاد</th>
                                                <th>عنوان المزاد</th>
                                                <th>السعر</th>
                                                <th>حالة المزاد</th>
                                                <th>العنوان</th>
                                                <th>تاريخ العرض</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($auctions as $item) {
                                            ?>
                                            <tr>
                                                <td>--</td>
                                                <td><?php echo $item['auction_number'] ?></td>
                                                <td><?php echo $item['title'] ?></td>
                                                <td><?php echo $item['duration'] ?></td>
                                                <td>
                                                    <span class="badge light badge-success">
                                                        <?php echo $item['status'] ?>
                                                    </span>
                                                </td>
                                                <td><?php echo $item['address'] ?></td>
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

        <!--******* Footer start ***-->
        <?php include 'include/footer.php' ?>
        <!--*******   Footer end   *****-->


    </div>
    <!--***** Main wrapper end ***-->

    <!--******* Scripts ******-->
    <?php include 'include/scripts.php' ?>
</body>

</html>