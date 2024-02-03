<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$users = json_decode(CURL_GET(API_URL . 'records/payment_process'), true);
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
                                <h4 class="card-title">طلبات الإيداع </h4>
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
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($users['records'] as $item) {
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