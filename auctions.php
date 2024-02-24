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
                                <div class="col-md-6">
                                    <h4 class="card-title">
                                        المزادات
                                    </h4>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <a class="btn btn-primary" href="export.php?tableName=auctions">
                                                تصدير CSV
                                            </a>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="btn btn-info" onclick="window.reload()">
                                                تحديث
                                            </a>
                                        </div>


                                    </div>
                                </div>
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


                                                            <a href="api/auctions/delete.php?&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من حذف الإعلان')" class="btn btn-danger shadow btn-sm sharp ms-1">
                                                                <i class="fa fa-trash"></i>
                                                            </a>

                                                            <a href="auction.php?id=<?= $item['id'] ?>" class="btn btn-info shadow btn-sm sharp ms-1">
                                                                <i class="fa fa-eye"></i>
                                                            </a>

                                                            <div class="dropdown">
                                                                <button type="button" class="btn btn-danger light sharp" data-bs-toggle="dropdown">
                                                                    <i class="fas fa-pencil-alt">

                                                                    </i>
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <?php
                                                                    if ($item['status'] == "active") {
                                                                    ?>
                                                                        <a class="dropdown-item" href="api/auctions/update.php?status=canceled&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تعطيل الإعلان')" class="btn btn-danger">
                                                                            تعطيل </a>
                                                                    <?php

                                                                    } else {
                                                                    ?>
                                                                        <a class="dropdown-item" href="api/auctions/update.php?status=active&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تفعيل الإعلان?')" class="btn btn-primary">
                                                                            تفعيل
                                                                        </a>
                                                                    <?php

                                                                    }
                                                                    ?>
                                                                </div>
                                                            </div>
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