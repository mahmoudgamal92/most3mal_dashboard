<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$users = json_decode(CURL_GET(API_URL . 'records/ads'), true);
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
                                <h4 class="card-title">الإعلانات </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example4" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>صورة الإعلان</th>
                                                <th>رقم الإعلان</th>
                                                <th>عنوان الإعلان</th>
                                                <th>السعر</th>
                                                <th>حالة الإعلان</th>
                                                <th>العنوان</th>
                                                <th>تاريخ العرض</th>
                                                <th>الإجراءات</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            foreach ($users['records'] as $item) {
                                            ?>
                                                <tr>
                                                    <td><img src="./uploads/<?= $item['images'] ?>" style="width:50px;width:50px" /></td>
                                                    <td><?php echo $item['ad_number'] ?></td>
                                                    <td><?php echo $item['title'] ?></td>
                                                    <td><?php echo $item['price'] ?></td>
                                                    <td>
                                                        <?php
                                                        if ($item['status'] == "active") {
                                                        ?>
                                                            <span class="badge light badge-success">
                                                                <?php echo $item['status'] ?>
                                                            </span>
                                                        <?php
                                                        } else {
                                                        ?>
                                                            <span class="badge light badge-danger">
                                                                <?php echo $item['status'] ?>
                                                            </span>
                                                        <?php
                                                        }
                                                        ?>
                                                    </td>
                                                    <td><?php echo $item['address'] ?></td>
                                                    <td><?php echo $item['created_at'] ?></td>
                                                    <td>
                                                        <div class="d-flex">


                                                            <a href="api/ads/delete.php?&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من حذف الإعلان')" class="btn btn-danger shadow btn-sm sharp ms-1">
                                                                <i class="fa fa-trash"></i>
                                                            </a>

                                                            <a href="ad.php?id=<?= $item['id'] ?>" class="btn btn-info shadow btn-sm sharp ms-1">
                                                                <i class="fa fa-eye"></i>
                                                            </a>


                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="button" class="btn btn-danger light sharp" data-bs-toggle="dropdown">
                                                                <i class="fas fa-pencil-alt">

                                                                </i>
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <?php
                                                                if ($item['status'] == "active") {
                                                                ?>
                                                                    <a class="dropdown-item" href="api/ads/update.php?status=inactive&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تعطيل الإعلان')" class="btn btn-danger">
                                                                        تعطيل الإعلان
                                                                    </a>
                                                                <?php

                                                                } else {
                                                                ?>
                                                                    <a class="dropdown-item" href="api/ads/update.php?status=active&id=<?= $item['id'] ?>" onclick="return confirm('هل أنت متأكد من تفعيل الإعلان?')" class="btn btn-primary">
                                                                        تفعيل
                                                                    </a>
                                                                <?php

                                                                }
                                                                ?>
                                                            </div>
                                                        </div>
                                                    </td>
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