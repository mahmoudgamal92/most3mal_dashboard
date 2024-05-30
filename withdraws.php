<?php
require_once 'utils/network.php';
require_once 'utils/config.php';

$params = array('payment_type' => 'withdraw');
$withdraws = _Read('payment_process', $params);


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
                                        طلبات السحب
                                    </h4>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <a class="btn btn-primary" href="export.php?tableName=payment_process">
                                                تصدير CSV
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
                                                <th>الترتيب</th>
                                                <th>معرف العملية</th>
                                                <th>النوع</th>
                                                <th>الحالة</th>
                                                <th>بوابة الدفع</th>
                                                <th>قيمة العملية</th>
                                                <th>العميل</th>
                                                <th>تاريخ التسجيل</th>
                                                <th>الإجراءات</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($withdraws as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['payment_id'] ?></td>
                                                    <td><?php echo $item['payment_token'] ?></td>
                                                    <td><?php echo $item['payment_type'] ?></td>
                                                    <td><?php echo $item['payment_gateway'] ?></td>

                                                    <td>
                                                        <span class="badge light badge-success">
                                                            <?php echo $item['payment_status'] ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <?php echo $item['amount'] ?>
                                                    </td>

                                                    <td>
                                                        <?php echo $item['user_id'] ?>
                                                    </td>

                                                    <td><?php echo $item['created_at'] ?></td>

                                                    <td>

                                                        <div class="d-flex">

                                                            <a href="transaction.php?id=<?= $item['payment_id'] ?>" class="btn btn-primary shadow btn-sm sharp ms-1">
                                                                <i class="fa fa-eye"></i>
                                                            </a>

                                                            <div class="dropdown">
                                                                <button type="button" class="btn btn-danger light sharp" data-bs-toggle="dropdown">
                                                                    <i class="fas fa-pencil-alt">

                                                                    </i>
                                                                </button>
                                                                <div class="dropdown-menu">

                                                                    <a class="dropdown-item" href="api/payment/update.php?status=delivered&id=<?= $item['payment_id'] ?>" onclick="return confirm('هل أنت متأكد من إتمام الطلب')" class="btn btn-danger">
                                                                        إتمام الطلب
                                                                    </a>


                                                                    <a class="dropdown-item" href="api/payment/update.php?status=cancelled&id=<?= $item['payment_id'] ?>" onclick="return confirm('هل أنت متأكد من إلغاء الطلب')" class="btn btn-danger">
                                                                        إلغاء الطلب
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