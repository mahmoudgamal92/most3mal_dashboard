<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$account = _Read('bank_accounts', array('account_id' => (int)$id))
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
                                <h4 class="card-title">
                                    بيانات الحساب
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
                                            <th> <?php echo $account[0]['account_id']; ?></th>

                                        </tr>

                                        <tr>
                                            <th>معرف الحساب</th>
                                            <th> <?php echo $account[0]['account_token']; ?></th>

                                        </tr>

                                        <tr>
                                            <th>رقم الحساب</th>
                                            <th> <?php echo $account[0]['account_number']; ?></th>
                                        </tr>


                                        <tr>
                                            <th>IBAN</th>
                                            <th> <?php echo $account[0]['iban_number']; ?></th>

                                        </tr>

                                        <tr>
                                            <th>كود السويفت للبنك</th>
                                            <th> <?php echo $account[0]['bank_swift']; ?></th>


                                        </tr>
                                        <th>مالك الحساب</th>
                                            <th> <?php echo $account[0]['account_holder']; ?></th>

                                        </tr>

                                        <tr>
                                            <th>فرع البنك</th>
                                            <th> <?php echo $account[0]['bank_city']; ?></th>

                                        </tr>


                                        <tr>
                                            <th>الرمز البريدي</th>
                                            <th> <?php echo $account[0]['postal_code']; ?></th>

                                        </tr>
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