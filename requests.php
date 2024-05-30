<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$requests = _Read('item_offers');
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
                                        الصفقات
                                    </h4>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <a class="btn btn-primary" href="export.php?tableName=item_offers">
                                                تصدير CSV
                                            </a>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="btn btn-sm btn-success" onclick="location.reload()">
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
                                                <th>معرف العملية</th>
                                                <th>المنتج</th>
                                                <th>المشتري</th>
                                                <th>السعر</th>
                                                <th>حالة العملية</th>
                                                <th>تاريخ التسجيل</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($requests as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td><?php echo $item['item_id'] ?></td>
                                                    <td><?php echo $item['user_id'] ?></td>
                                                    <td><?php echo $item['amount'] ?></td>
                                                    <td>
                                                        <?php echo getBadge($item['status']) ?>
                                                    </td>
                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>

                                                        <div class="d-flex">

                                                            <a href="request.php?id=<?= $item['id'] ?>" class="btn btn-primary shadow btn-sm sharp ms-1">
                                                                <i class="fas fa-eye"></i>
                                                            </a>

                                                            <div class="dropdown">
                                                                <button type="button" class="btn btn-danger light sharp" data-bs-toggle="dropdown">
                                                                    <i class="fas fa-pencil-alt">

                                                                    </i>
                                                                </button>
                                                                <div class="dropdown-menu">

                                                                    <a class="dropdown-item" href="api/requests/update.php?status=delivered&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من إتمام الصفقة')" class="btn btn-danger">
                                                                        إتمام الصفقة
                                                                    </a>


                                                                    <a class="dropdown-item" href="api/requests/update.php?status=cancelled&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من إلغاء الصفقة')" class="btn btn-danger">
                                                                        إلغاء الصفقة
                                                                    </a>


                                                                    <a class="dropdown-item" href="api/requests/update.php?status=onhold&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تعليق الصفقة')" class="btn btn-danger">
                                                                        تعليق الصفقة
                                                                    </a>

                                                                </div>
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