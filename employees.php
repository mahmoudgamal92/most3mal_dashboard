<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$employees = _Read('employees');
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


            <div class="modal fade" id="basicModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form method="post" action="api/employees/insert.php" enctype="multipart/form-data">
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
                                                إضافة موظف جديد
                                            </h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="basic-form">

                                                <div class="mb-3">
                                                    <input type="text" class="form-control input-default " name="name" placeholder="أسم الموظف">
                                                </div>


                                                <div class="mb-3">
                                                    <input type="number" class="form-control input-default" name="phone" placeholder="رقم الهاتف">

                                                </div>


                                                <div class="mb-3">
                                                    <input type="email" class="form-control input-default" name="email" placeholder="البريد الألكتروني">

                                                </div>



                                                <div class="mb-3">
                                                    <input type="password" class="form-control input-default" name="password" placeholder="كلمة المرور">

                                                </div>

                                                <select name="role" class="default-select form-control wide mt-3">
                                                    <?php
                                                    foreach ($roles as $item) {
                                                    ?>
                                                        <option value=" <?php echo $item['name']; ?>">
                                                            <?php echo $item['title']; ?>
                                                        </option>
                                                    <?php
                                                    }
                                                    ?>

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



            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">الموظفين </h4>
                                <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                                    إضافة موظف
                                </a>
                                <a class="btn btn-primary" href="export.php?tableName=employees">
                                    تصدير csv
                                </a>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>رقم الموظف</th>
                                                <th>الأسم</th>
                                                <th>البريد الإلكتروني</th>
                                                <th>رقم الهاتف </th>
                                                <th>الصلاحيات</th>
                                                <th>الإجراءات</th>
                                                <th>سجل التحركات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($employees as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td><?php echo $item['name'] ?></td>
                                                    <td><?php echo $item['email'] ?></td>
                                                    <td><?php echo $item['phone'] ?></td>
                                                    <td><?php echo $item['user_role'] ?></td>

                                                    <td>
                                                        <a onclick="return confirm('هل أنت متأكد من حذف الموظف')" href="api/employees/delete.php?id=<?= $item['id'] ?>" class="btn btn-danger shadow btn-sm sharp ms-1">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                    </td>

                                                    <td>
                                                        <a href="logs.php?id=<?=$item['id']?>" class="btn btn-primary shadow btn-sm sharp ms-1">
                                                            <i class="fas fa-eye"></i>
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