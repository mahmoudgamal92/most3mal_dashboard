<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$users = json_decode(CURL_GET(API_URL.'records/users'), true);
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
                                <h4 class="card-title">المستخدمين </h4>
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
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php 
                                            foreach ($users['records'] as $item) {
                                                ?>
                                            <tr>
                                                <td><?php echo $item['id'] ?></td>
                                                <td><?php echo $item['name'] ?></td>
                                                <td><?php echo $item['email'] ?></td>
                                                <td><?php echo $item['phone'] ?></td>

                                                <td>
                                                    <span class="badge light badge-success">
                                                        <?php echo $item['status'] ?>
                                                    </span>
                                                </td>
                                                <td>
                                                    <?php echo $item['current_balance'] ?>
                                                </td>

                                                <td><?php echo $item['created_at'] ?></td>
                                                <td>
                                                    <div class="d-flex">

                                                        <a href="#" class="btn btn-primary shadow btn-xs sharp ms-1">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </a>

                                                        <a href="<?php echo "api/static/users.php?action=delete&id=".$item['id'] ?>"
                                                            class="btn btn-danger shadow btn-xs sharp">
                                                            <i class="fa fa-trash"></i>
                                                        </a>


                                                        <a href="#" class="btn btn-primary shadow btn-xs sharp">
                                                            <i class="fa fa-eye"></i>
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
        <?php include 'include/footer.php'?>
        <!--*******   Footer end   *****-->


    </div>
    <!--***** Main wrapper end ***-->

    <!--******* Scripts ******-->
    <?php include 'include/scripts.php'?>
</body>

</html>