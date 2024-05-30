<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$payment = _Read('item_offers', array('id' => (int)$id))
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
            <div class="modal fade" id="basicModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form method="post" action="api/banner/insert.php" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h5 class="modal-title">إضافة بانر جدبد</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal">
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-xl-12 col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">
                                                تعديل بيانات عملية الدفع
                                            </h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="basic-form">

                                                <div class="mb-3">
                                                    <input type="text" class="form-control input-default " name="name_ar" placeholder="معرف العملية">
                                                </div>

                                                <select name="payment_status" class="default-select form-control wide mt-3">

                                                    <option value="users">
                                                        إتمام العملية
                                                    </option>

                                                    <option value="users">
                                                        إلغاء العملية
                                                    </option>
                                                    <option value="users">
                                                        تعليق العملية
                                                    </option>
                                                </select>
                                                <p>
                                                    إختر المرفقات
                                                </p>
                                                <div class="input-group custom_file_input">
                                                    <div class="form-file">
                                                        <input type="file" name="image" class="form-file-input form-control">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">إغلاق</button>
                                <button type="submit" class="btn btn-primary">
                                    حفظ التغيرات
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    بيانات الطلب
                                </h4>

                                <a disabled class="btn btn-md btn-secondary" onclick="history.back()">
                                    عودة
                                </a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <tr>
                                            <th>الترتيب</th>
                                            <th> <?php echo $payment[0]['id']; ?></th>

                                        </tr>

                                        <tr>
                                            <th>المشتري</th>
                                            <th> <?php echo $payment[0]['user_id']; ?></th>

                                        </tr>

                                        <tr>
                                            <th>القيمة</th>
                                            <th> <?php echo $payment[0]['amount']; ?></th>
                                        </tr>


                                        <!--<tr>-->
                                        <!--    <th>المنتج </th>-->
                                        <!--    <th> <?php echo $payment[0]['item_id']; ?></th>-->

                                        <!--</tr>-->

                                        <tr>
                                            <th>حالة العملية </th>
                                            <th> <?php echo $payment[0]['status']; ?></th>

                                          

                                        </tr>
                                        <!-- 
                                        <tr>
                                            <th>بوابة الدفع</th>
                                            <th> <?php echo $payment[0]['payment_gateway']; ?></th>

                                        </tr> -->

                                        <tr>
                                            <th>تاريخ العملية</th>
                                            <th> <?php echo $payment[0]['created_at']; ?></th>

                                        </tr>


                                        <tr>
                                            <th>التقييم</th>
                                            <th> <?php echo $payment[0]['rating_val']; ?></th>

                                        </tr>
                                        <tr>
                                            <th>العميل</th>
                                            <th> <?php echo $payment[0]['item_id']; ?></th>
                                            <th>
                                                <a class="btn btn-primary" href="transactions.php?id=<?= $payment[0]['user_id'] ?>">
                                                    سجل المعاملات
                                                </a>
                                            </th>
                                        </tr>

                                        <p></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--*****  Content body end  ***-->



    </div>
    <!--***** Main wrapper end ***-->

    <!--******* Scripts ******-->
    <?php include 'include/scripts.php' ?>
</body>

</html>