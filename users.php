<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$users = _Read('users');
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
                                        المستخدمين
                                    </h4>
                                </div>

                                <div class="col-sm-12 col-md-5">
                                    <div class="row">

                                        <div class="col-md-4">
                                            <a class="btn btn-md btn-secondary" disabled>
                                                إضافة
                                                <i class="fas fa-plus"></i>
                                            </a>
                                        </div>

                                        <div class="col-md-4">
                                            <a class="btn btn-md btn-primary" href="export.php?tableName=users">
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
                                                <th>رقم المستخدم</th>
                                                <th>أسم المستخدم</th>
                                                <th>البريد الإلكتروني</th>
                                                <th>رقم الهاتف </th>
                                                <th>حالة المستخدم</th>
                                                <th>الرصيد الحالي </th>
                                                <th>تاريخ التسجيل</th>
                                                <th>الإجراءات</th>
                                                <th>سجل المعاملات</th>
                                                <th>سجل المحادثات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($users as $item) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $item['id'] ?></td>
                                                    <td><?php echo $item['name'] ?></td>
                                                    <td><?php echo $item['email'] ?></td>
                                                    <td><?php echo $item['phone'] ?></td>

                                                    <td>

                                                        <?php
                                                        if ($item['status'] == "active") {
                                                        ?>
                                                            <span class="badge light badge-success">نشط</span>
                                                        <?php

                                                        } else {

                                                        ?>
                                                            <span class="badge light badge-danger">
                                                                غير نشط
                                                            </span>
                                                        <?php
                                                        }
                                                        ?>

                                                    </td>
                                                    <td>
                                                        <?php echo $item['current_balance'] ?>
                                                    </td>

                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>
                                                        <div class="d-flex">

                                                            <?php
                                                            if ($item['status'] == "active") {
                                                            ?>
                                                                <a class="btn btn-primary shadow btn-sm sharp ms-1" href="api/users/update.php?status=inactive&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تعطيل المستخدم')" class="btn btn-danger">
                                                                    <i class="fas fa-eye-slash"></i>
                                                                </a>
                                                            <?php

                                                            } else {
                                                            ?>
                                                                <a class="btn btn-primary shadow btn-sm sharp ms-1" href="api/users/update.php?status=active&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تفعيل المستخدم?')" class="btn btn-success">
                                                                    <i class="fas fa-eye"></i>

                                                                </a>

                                                            <?php

                                                            }
                                                            ?>

                                                            <div>
                                                    </td>

                                                    <td>
                                                        <a class="btn btn-info shadow btn-sm sharp ms-1" href="transactions.php?id=<?= $item['id'] ?>">
                                                            <i class="fas fa-list"></i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-info shadow btn-sm sharp ms-1" href="conversations.php?id=<?= $item['id'] ?>">
                                                            <i class="fas fa-list"></i>
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