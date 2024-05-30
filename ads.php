<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$ads = _Read('ads');
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
                                        الإعلانات
                                    </h4>
                                </div>

                                <div class="col-sm-12 col-md-6">
                                    <div class="row">

                                        <div class="col-md-4">
                                            <a data-bs-toggle="modal" data-bs-target="#basicModal" class="btn btn-md btn-secondary">
                                                إضافة
                                                <i class="fas fa-plus"></i>
                                            </a>
                                        </div>

                                        <div class="col-md-4">
                                            <a class="btn btn-md btn-primary" href="export.php?tableName=ads">
                                                تصدير CSV
                                                <i class="fas fa-print"></i>
                                            </a>
                                        </div>

                                        <div class="col-md-4">
                                            <a class="btn btn-md btn-success" onclick="location.reload()">
                                                تحديث
                                                <i class="fas fa-sync"></i>
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
                                                <th>ID</th>
                                                <th>صورة الإعلان</th>
                                                <th>رقم الإعلان</th>
                                                <th>عنوان الإعلان</th>
                                                <th>فئة الإعلان</th>
                                                <th>السعر</th>
                                                <th>حالة الإعلان</th>
                                                <th>الموقع</th>
                                                <th>تاريخ العرض</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($ads as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td><img src="./uploads/<?= explode(',', $item['images'])[0] ?>" style="width:50px;width:50px" /></td>
                                                    <td><?php echo $item['ad_number'] ?></td>
                                                    <td><?php echo $item['title'] ?></td>
                                                    <td><?php echo getDepartById($item['depart_id']); ?></td>
                                                    <td><?php echo $item['price'] ?></td>
                                                    <td>
                                                          <?php echo getBadge($item['status']) ?>
                                                    </td>
                                                    <td><?php echo $item['address'] ?></td>
                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>
                                                        <div class="d-flex">
                                                            <a href="api/ads/delete.php?&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من حذف الإعلان')" class="btn btn-danger shadow btn-sm sharp ms-1">
                                                                <i class="fa fa-trash"></i>
                                                            </a>

                                                            <a href="ad.php?id=<?= $item['id'] ?>" class="btn btn-info shadow btn-sm sharp ms-1">
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
                                                                        <a class="dropdown-item" href="api/ads/update.php?status=inactive&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تعطيل الإعلان')" class="btn btn-danger">
                                                                            تعطيل الإعلان
                                                                        </a>
                                                                    <?php

                                                                    } else {
                                                                    ?>
                                                                        <a class="dropdown-item" href="api/ads/update.php?status=active&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تفعيل الإعلان?')" class="btn btn-primary">
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