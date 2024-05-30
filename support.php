<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$payments = _Read('contact_us')
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
                                        طلبات التواصل
                                    </h4>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <a class="btn btn-primary" href="export.php?tableName=contact_us">
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
                                                <th>ID</th>
                                                <th>البريد الإلكتروني</th>
                                                <th>الرسالة</th>
                                                <th>تاريخ الإرسال</th>
                                                <th>الإجراءات</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php foreach ($payments as $item) { ?>
                                                <tr>

                                                    <td><?php echo $item['id'] ?></td>
                                                    <td>
                                                        <?php echo $item['email'] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $item['message'] ?>
                                                    </td>

                                                    <td>
                                                        <?php echo $item['created_at'] ?>
                                                    </td>

                                                    <td>
                                                        <a href="mailto:<?php echo $item['email'] ?>" class="btn btn-info shadow btn-sm sharp ms-1">
                                                            <i class="fas fa-envelope"></i>
                                                        </a>

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