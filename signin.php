<?php
session_start();
include './dbcontext/connect.php';
if (isset($_POST['email'])) {
    $email = $_POST['email'];
    $pwd = $_POST['password'];
    $cmd = "select * from employees where email ='$email' and password = '$pwd'";
    $result = mysqli_query($con, $cmd);
    $count = mysqli_num_rows($result);
    if ($count == 1) {
        $row = mysqli_fetch_array($result);
        $_SESSION['id'] = $row['id'];
        $_SESSION['name'] = $row['name'];
        $_SESSION['email'] = $row['email'];
        $_SESSION['role'] = strval($row['user_role']);
        header("Location: index.php");
    } else {
        header("Location: signin.php");
    }
}
?>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="admin, dashboard" />
    <meta name="author" content="most3mal" />
    <meta name="robots" content="index, follow" />
    <meta property="og:image" content="../xhtml/social-image.png" />
    <meta name="format-detection" content="telephone=no">
    <title>تسجيل الدخول - مستعمل</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="vh-100">
    <div class="authincation h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <div class="text-center mb-3">
                                        <a href="index.html">
                                            <img src="images/logo-full.png" alt="" style="width:250px;height:100px">
                                        </a>
                                    </div>
                                    <h4 class="text-center mb-4">Sign in your account</h4>
                                    <form action="signin.php" method="post">
                                        <div class="form-group">
                                            <label class="mb-1">
                                                <strong>Email</strong>
                                            </label>
                                            <input type="email" class="form-control" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label class="mb-1">
                                                <strong>Password</strong>
                                            </label>
                                            <input type="password" class="form-control" name="password">
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check custom-checkbox ms-1">
                                                    <input type="checkbox" class="form-check-input" id="basic_checkbox_1">
                                                    <label class="form-check-label" for="basic_checkbox_1">
                                                        Remember my
                                                        preference</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--************* Scripts ***************-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/deznav-init.js"></script>
    <script src="js/demo.js"></script>
    <!-- <script src="js/styleSwitcher.js"></script> -->
</body>

</html>