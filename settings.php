<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
?>

<?php include 'include/headTag.php'; ?>
<script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/classic/ckeditor.js"></script>

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
                                    إعدادات التطبيق
                                </h4>

                                    <a class="btn btn-primary" onclick="history.back()">
                                    عودة
                                </a>
                            </div>
                        </div>
                    </div>



                    <div class="col-xl-6 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    المعلومات الأساسية
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form method="post" action="./api/settings/index.php">
                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                أسم التطبيق
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[app_name]" value="<?= getValueByKey('app_name') ?>" type="text" class="form-control form-control-lg" placeholder="أسم التطبيق">
                                            </div>
                                        </div>


                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                البريد الإلكتروني
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[email]" value="<?= getValueByKey('email') ?>" type="text" class="form-control form-control-lg" placeholder="البريد الإلكتروني">
                                            </div>
                                        </div>


                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                رقم الهاتف
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[phone_number]" value="<?= getValueByKey('phone_number') ?>" type="text" class="form-control form-control-lg" placeholder="رقم الهاتف">
                                            </div>
                                        </div>

                                        <div class="mb-3 row">
                                            <button class="btn btn-primary" type="submit">
                                                تعديل
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-xl-6 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    حسابات التواصل الإجتماعي
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form method="post" action="./api/settings/index.php">
                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                فيسبوك
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[facebook]" value="<?= getValueByKey('facebook') ?>" type="text" class="form-control form-control-lg" placeholder="facebook">
                                            </div>
                                        </div>


                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                منصة إكس
                                            </label>


                                            <div class="col-sm-8">
                                                <input name="settings[x]" value="<?= getValueByKey('x') ?>" type="text" class="form-control form-control-lg" placeholder="x">
                                            </div>
                                        </div>


                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                سناب شات
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[snapchat]" value="<?= getValueByKey('snapchat') ?>" type="text" class="form-control form-control-lg" placeholder="snapchat">
                                            </div>
                                        </div>

                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                يوتيوب
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[youtube]" value="<?= getValueByKey('youtube') ?>" type="text" class="form-control form-control-lg" placeholder="youtube">
                                            </div>
                                        </div>

                                        <div class="mb-3 row">
                                            <label class="col-sm-4 col-form-label col-form-label-lg">
                                                انستجرام
                                            </label>
                                            <div class="col-sm-8">
                                                <input name="settings[instagram]" value="<?= getValueByKey('instagram') ?>" type="text" class="form-control form-control-lg" placeholder="instagram">
                                            </div>
                                        </div>


                                        <div class="mb-3 row">
                                            <button class="btn btn-primary" type="submit">
                                                تعديل
                                            </button>
                                        </div>
                                    </form>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    سياسة الإستخدام و الخصوصية
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form method="post" action="./api/settings/index.php">
                                        <h5>
                                            العربية
                                        </h5>
                                        <textarea id="privacy_ar" class="form-control form-control-lg">
                                        <?php echo getValueByKey('privacy_ar'); ?>
                                        </textarea>

                                        <h5>
                                            الإنجليزية
                                        </h5>
                                        <textarea id="privacy_en" class="form-control form-control-lg">
                                            <?php echo getValueByKey('privacy_en'); ?>
                                        </textarea>
                                </div>
                                <div class="mb-3 row">
                                    <button class="btn btn-primary" style="margin-top: 50px;" type="submit">
                                        تعديل
                                    </button>
                                </div>
                                </form>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">
                                الشروط و الأحكام
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form method="post" action="./api/settings/index.php">
                                    <h5>
                                        العربية
                                    </h5>
                                    <textarea name="settings[terms_ar]" id="terms_ar" class=" form-control form-control-lg">
                                    <?php echo getValueByKey('terms_ar'); ?>
                                    </textarea>
                                    <h5>
                                        الإنجليزية
                                    </h5>
                                    <textarea name="settings[terms_en]" id="terms_en" class=" form-control form-control-lg">
                                    <?php echo getValueByKey('terms_en'); ?>
                                    </textarea>
                                    <div class="mb-3 row">
                                        <button class="btn btn-primary" style="margin-top: 50px;" type="submit">
                                            حفظ
                                        </button>
                                    </div>
                                </form>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-xl-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">
                                كيف يعمل التطبيق
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form method="post" action="./api/settings/index.php">
                                    <h5>
                                        العربية
                                    </h5>
                                    <textarea name="settings[how_works_ar]" id="how_works_ar" class="form-control form-control-lg">
                                            <?php echo getValueByKey('how_works_ar') ?>
                                        </textarea>
                                    <h5>
                                        الإنجليزية
                                    </h5>
                                    <textarea name="settings[how_works_en]" id="how_works_en" class="form-control form-control-lg">
                                            <?php echo getValueByKey('how_works_en') ?>
                                        </textarea>
                                    <div class="mb-3 row">
                                        <button class="btn btn-primary" style="margin-top: 50px;" type="submit">
                                            تعديل
                                        </button>
                                    </div>
                                </form>
                                </form>
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
    <script>
        ClassicEditor
            .create(document.querySelector('#privacy_ar'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });

        ClassicEditor
            .create(document.querySelector('#privacy_en'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });

        ClassicEditor
            .create(document.querySelector('#terms_ar'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });

        ClassicEditor
            .create(document.querySelector('#terms_en'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });


        ClassicEditor
            .create(document.querySelector('#how_works_ar'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });

        ClassicEditor
            .create(document.querySelector('#how_works_en'))
            .then(editor => {
                console.log(editor);
            })
            .catch(error => {
                console.error(error);
            });
    </script>
    <?php include 'include/scripts.php' ?>
</body>

</html>