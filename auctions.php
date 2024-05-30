<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$auctions = _Read('auctions');

function isDateGreaterThanToday($dateString)
{
    $date = new DateTime($dateString);
    $today = new DateTime();
    return $date > $today;
}
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

                                <div class="col-sm-12 col-md-6">
                                    <div class="row">

                                        <div class="col-md-4">
                                            <a data-bs-toggle="modal" data-bs-target="#basicModal" class="btn btn-md btn-secondary">
                                                إضافة
                                                <i class="fas fa-plus"></i>
                                            </a>
                                        </div>

                                        <div class="col-md-4">
                                            <a class="btn btn-md btn-primary" href="export.php?tableName=auctions">
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
                                                <th>#</th>
                                                <th>صورة المزاد</th>
                                                <th>رقم المزاد</th>
                                                <th>عنوان المزاد</th>
                                                <th>مدة العرض</th>
                                                <th>تاريخ الإنتهاء</th>
                                                <th>الموقع</th>
                                                <th>حالة المزاد</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($auctions as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td>
                                                        <img src="./uploads/<?= explode(',', $item['images'])[0] ?>" style="width:50px;height:50px" />
                                                    </td>
                                                    <td><?php echo $item['auction_number'] ?></td>
                                                    <td><?php echo $item['title'] ?></td>
                                                    <td><?php echo $item['duration'] . "أيام " ?></td>
                                                    <td>
                                                        <?php
                                                        echo date('Y-m-d', strtotime($item['created_at'] . ' + ' . $item['duration'] . ' days'));
                                                        ?>
                                                    </td>
                                                    <td><?php echo $item['address'] ?></td>

                                                    <td>
                                                        <?php echo getBadge($item['status']) ?>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex">


                                                            <a href="api/auctions/delete.php?&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من حذف المزاد ؟')" class="btn btn-danger shadow btn-sm sharp ms-1">
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
                                                                        <a class="dropdown-item" href="api/auctions/update.php?status=cancelled&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تعطيل المزاد ؟')" class="btn btn-danger">
                                                                            تعطيل </a>
                                                                    <?php

                                                                    } else {
                                                                    ?>
                                                                        <a class="dropdown-item" href="api/auctions/update.php?status=active&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تفعيل  المزاد ؟')" class="btn btn-primary">
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