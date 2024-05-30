<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$departs = _Read('departments');
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
                                        الأقسام الرئيسية
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
                                            <!-- href="export.php?tableName=departments&filterCondition=id='57'" -->
                                            <a class="btn btn-md btn-primary" href="export.php?tableName=departments">
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

                            <div class="modal fade" id="basicModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form method="post" action="api/departments/insert.php" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <h5 class="modal-title">إضافة قسم جدبد</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-xl-12 col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">
                                                                إضافة قسم جديد
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
                                                                    إختر صورة القسم
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




                            <div class="modal fade" id="basicModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form method="post" action="api/departments/insert.php" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <h5 class="modal-title">إضافة قسم جدبد</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-xl-12 col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">
                                                                إضافة قسم جديد
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
                                                                    إختر صورة القسم
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


                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>صورة القسم</th>
                                                <th>رقم القسم</th>
                                                <th>عنوان القسم</th>
                                                <th>الحالة</th>
                                                <th>تاريخ العرض</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            foreach ($departs as $item) {
                                            ?>
                                                <tr>
                                                    <td>
                                                        <img src="uploads/<?= $item['image'] ?>" style="width:50px;height:50px" />
                                                    </td>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td>
                                                        <?php
                                                        echo  $item['name_ar'];
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <span class="badge light badge-success">
                                                            <?php echo $item['status'] ?>
                                                        </span>
                                                    </td>
                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>
                                                        <div class="d-flex">

                                                            <a href="department.php?id=<?= $item['id'] ?>" class="btn btn-primary shadow btn-sm sharp ms-1">
                                                                <i class="fas fa-pencil-alt"></i>
                                                            </a>

                                                            <a href="cats.php?id=<?= $item['id'] ?>" class="btn btn-info shadow btn-sm sharp ms-1">
                                                                <i class="fas fa-eye"></i>
                                                            </a>


                                                            <a href="api/departments/delete.php?id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من حذف القسم ؟')" class="btn btn-danger shadow btn-sm sharp ms-1">
                                                                <i class="fas fa-trash"></i>
                                                            </a>

                                                            <div>
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