<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$role = _Read('roles' , array('id' => (int)$id));
$roles_string = $role[0]['role'];
$roles = explode(",", $roles_string);
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
                                <h4 class="card-title">تعديل الصلاحياات </h4>
                              <a class="btn btn-primary" onclick="history.back()">
                                عودة
                              </a>
                      
                            </div>
                            
                            
                                <div class="card-body">
                                    <div class="basic-form">


                                                                <div class="mb-3">
                                                                    <input type="text"
                                                                        class="form-control" name="title"
                                                                        value=<?=$role[0]['title']?>
                                                                        >
                                                                </div>

                                                                <div class="mb-3">
                                                                    <input type="text"
                                                                        class="form-control input-default" name="name" disabled
                                                                       value=<?=$role[0]['name']?>
                                                                </div>
                                                                <p style="margin:10px">
                                                                    تعديل الأقسام المتاحة للدور :
                                                                </p>

                                                                <select name="roles[]" multiple
                                                                    class="default-select form-control wide mt-3">

                                                                    <option value="users"  <?php if(in_array("users", $roles)) {echo "selected";}?>>
                                                                        المستخدمين
                                                                    </option>
                                                                    <option value="departments"  <?php if(in_array("departments", $roles)) {echo "selected";}?>>
                                                                        الأقسام
                                                                    </option>
                                                                    <option value="banner" <?php if(in_array("banner", $roles)) {echo "selected";}?>>
                                                                        البانر الاعلاني
                                                                    </option>
                                                                 <option value="ads" <?php if(in_array("ads", $roles)) {echo "selected";}?>>
                                                                        الاعلانات
                                                                    </option>
                                                                     <option value="auctions" <?php if(in_array("auctions", $roles)) {echo "selected";}?>>
                                                                        المزادات
                                                                    </option>

                                                                   <option value="finance" <?php if(in_array("finance", $roles)) {echo "selected";}?>>
                                                                        قسم المالية
                                                                    </option>

                                                                    <option value="managment" <?php if(in_array("managment", $roles)) {echo "selected";}?>>
                                                                        قسم الإدارة
                                                                    </option>
                                                                    
                                                                </select>
                                                                
                                                  <button type="submit" class="btn btn-primary" style="margin:20px">
                                                    حفظ التغيرات
                                                </button>
                                                            </div>
                                </div>
                                
                        </div>
                </div>
            </div>
        </div>
        </div>
        <!--******* Content body end *****-->

        <!--******* Footer Start ***-->
        <?php include 'include/footer.php' ?>
        <!--*******  Footer End ***-->


    </div>
    <!--******* Main wrapper End ***-->

    <!--******* Scripts *******-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="vendor/chart.js/Chart.bundle.min.js"></script>

    <!-- Chart piety plugin files -->
    <script src="vendor/peity/jquery.peity.min.js"></script>

    <!-- Apex Chart -->
    <script src="vendor/apexchart/apexchart.js"></script>

    <!-- Dashboard 1 -->
    <script src="js/dashboard/dashboard-1.js"></script>

    <script src="vendor/owl-carousel/owl.carousel.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/deznav-init.js"></script>
    <script src="js/demo.js"></script>
    <script src="js/styleSwitcher.js"></script>

</body>

</html>