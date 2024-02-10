<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$users = json_decode(CURL_GET(API_URL . 'records/banners'), true);
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
                                                إضافة بانر جديد
                                            </h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="basic-form">

                                                <div class="mb-3">
                                                    <input type="text" class="form-control input-default " name="name_ar" placeholder="الأسم بالعربية">
                                                </div>


                                                <div class="mb-3">
                                                    <input type="text" class="form-control input-default" name="name_en" placeholder="الأسم بالإنجليزية">

                                                </div>
                                                <p>
                                                    إختر الصورة
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


            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">البانر الإعلاني</h4>

                                <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                                    إضافة بانر
                                </a>
                            </div>


                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>الصورة</th>
                                                <th>العنوان</th>
                                                <th>تاريخ الإضافة</th>
                                                <th>الإجراءات</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($users['records'] as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td>
                                                        <img src="uploads/<?= $item['image'] ?>" style="width:50px;height:50px" />
                                                    </td>
                                                    <td>
                                                        <?php
                                                        $obj = json_decode($item['name'], true);
                                                        echo $obj['ar'];
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <span class="badge light badge-success">
                                                            <?php echo $item['status'] ?>
                                                        </span>
                                                    </td>
                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>
                                                        <a href="api/banner/delete.php?id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من حذف  البانر')" class="btn btn-primary shadow btn-sm sharp ms-1">
                                                            <i class="fas fa-trash"></i>
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