<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$payments = _Read('payment_process', array('user_id' => (int)$id))
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
                                <div class="col-md-7">
                                    <h4 class="card-title">
                                        سجل معاملات المستخدم
                                    </h4>
                                </div>

                                <div class="col-sm-12 col-md-5">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <a class="btn btn-md btn-primary" href="export.php?tableName=payment_process&filterCondition=user_id=<?php echo $id ?>">
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
                                                <th>الصورة</th>
                                                <th>ID</th>
                                                <th>معرف العملية</th>
                                                <th>نوع العملية</th>
                                                <th>الحالة</th>
                                                <th>بوابة الدفع</th>
                                                <th>التاريخ</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php foreach ($payments as $item) { ?>
                                                <tr>
                                                    <td>
                                                        <img src="./images/plus.png" style="width:50px;height:50px" />
                                                    </td>

                                                    <td><?php echo $item['payment_id'] ?></td>
                                                    <td>
                                                        <?php echo $item['payment_token'] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $item['payment_type'] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $item['payment_status'] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $item['payment_gateway'] ?>
                                                    </td>

                                                    <td>
                                                        <?php echo $item['amount'] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $item['created_at'] ?>
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