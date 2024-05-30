<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$roles = _Read('roles');
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
                                <h4 class="card-title">الصلاحيات </h4>

                                <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                                    إضافة جديد
                                </a>
                            </div>






                            <div class="modal fade" id="basicModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form method="post" action="api/roles/insert.php" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <h5 class="modal-title">إضافة جدبد</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-xl-12 col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">
                                                                إضافة صلاحية جديدة للموظفين
                                                                (مسمي وظيفي)
                                                            </h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="basic-form">


                                                                <div class="mb-3">
                                                                    <input type="text" class="form-control input-default" name="title" placeholder="المسمي الوظيفي">
                                                                </div>

                                                                <div class="mb-3">
                                                                    <input type="text" class="form-control input-default" name="name" placeholder="المعرف البرمجي">
                                                                </div>
                                                                <p>
                                                                    إختر الأقسام المتاحة للمستخدم
                                                                </p>

                                                                <select name="roles[]" multiple class="default-select form-control wide mt-3">

                                                                    <option value="users">
                                                                        المستخدمين
                                                                    </option>
                                                                    <option value="departments">
                                                                        الأقسام
                                                                    </option>
                                                                    <option value="banner">
                                                                        البانر الاعلاني
                                                                    </option>
                                                                    <option value="ads">
                                                                        الاعلانات
                                                                    </option>
                                                                    <option value="auctions">
                                                                        المزادات
                                                                    </option>

                                                                    <option value="finance">
                                                                        قسم المالية
                                                                    </option>

                                                                    <option value="managment">
                                                                        قسم الإدارة
                                                                    </option>

                                                                    <option value="support">
                                                                        الدعم الفني
                                                                    </option>
                                                                </select>
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
                                                <th>ID</th>
                                                <th>المسمي الوظيفي</th>
                                                <th>الدور</th>
                                                <th>الصلاحيات</th>
                                                <th>الحالة</th>
                                                <th>تاريخ التسجيل</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($roles as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td><?php echo $item['title'] ?></td>
                                                    <td><?php echo $item['name'] ?></td>
                                                    <td><?php echo $item['role'] ?></td>
                                                    <td><?php echo $item['status'] ?></td>
                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>
                                                        <a href="edit_role.php?id=<?= $item['id'] ?>" class="btn btn-primary shadow btn-sm sharp ms-1">
                                                            <i class="fas fa-pencil-alt"></i>
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