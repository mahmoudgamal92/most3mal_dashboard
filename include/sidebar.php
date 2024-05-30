<div class="deznav">
    <div class="deznav-scroll">
        <ul class="metismenu" id="menu">


            <?php
            if (str_contains($user_selected_roles, 'users')) {
            ?>
                <li><a class="has-arrow ai-icon" href="users.php" aria-expanded="false">
                        <i class="flaticon-381-user"></i>
                        <span class="nav-text">
                            المستخدمين
                        </span>
                    </a>
                </li>
            <?php
            }
            ?>

            <?php
            if (str_contains($user_selected_roles, 'departments')) {
            ?>
                <li>
                    <a class="has-arrow ai-icon" href="departments.php" aria-expanded="false">
                        <i class="flaticon-381-networking"></i>
                        <span class="nav-text">
                            الأقسام
                        </span>
                    </a>

                </li>
            <?php
            }
            ?>

            <?php
            if (str_contains($user_selected_roles, 'banner')) {
            ?>

                <li>
                    <a class="has-arrow ai-icon" href="banner.php" aria-expanded="false">
                        <i class="flaticon-381-picture"></i>
                        <span class="nav-text">البانر الإعلاني</span>
                    </a>

                </li>
            <?php
            }
            ?>



            <?php
            if (str_contains($user_selected_roles, 'ads')) {
            ?>
                <li>
                    <a class="has-arrow ai-icon" href="ads.php" aria-expanded="false">
                        <i class="flaticon-381-television"></i>
                        <span class="nav-text">الإعلانات</span>
                    </a>
                </li>
            <?php
            }
            ?>


            <?php
            if (str_contains($user_selected_roles, 'auctions')) {
            ?>
                <li>
                    <a class="has-arrow ai-icon" href="auctions.php" aria-expanded="false">
                        <i class="flaticon-381-television"></i>
                        <span class="nav-text">المزادات</span>
                    </a>
                </li>
            <?php
            }
            ?>

            <?php
            if (str_contains($user_selected_roles, 'finance')) {
            ?>
                <li>
                    <a class="has-arrow ai-icon" aria-expanded="false">
                        <i class="flaticon-381-dollar"></i>
                        <span class="nav-text">قسم المالية</span>
                    </a>
                    <ul aria-expanded="false">
                        <li><a href="requests.php">الصفقات</a></li>
                        <li><a href="deopsites.php">طلبات الإيداع</a></li>
                        <li><a href="withdraws.php">طلبات السحب</a></li>
                    </ul>
                </li>

            <?php
            }
            ?>

            <li>
                <a class="has-arrow ai-icon" href="settings.php" aria-expanded="false">
                    <i class="flaticon-381-controls-3"></i>
                    <span class="nav-text"> الإعدادات</span>
                </a>
            </li>


            <?php
            if (str_contains($user_selected_roles, 'managment')) {
            ?>
                <li><a class="has-arrow ai-icon" aria-expanded="false">
                        <i class="flaticon-381-television"></i>
                        <span class="nav-text">قسم الإدارة</span>
                    </a>
                    <ul aria-expanded="false">
                        <!--<li><a href="reports.php">التقارير المالية</a></li>-->
                        <li><a href="employees.php">الموظفين</a></li>
                        <li><a href="roles.php">الصلاحيات</a></li>
                        <li><a href="logs.php">تحركات الموظفين</a></li>
                    </ul>
                </li>

            <?php
            }
            ?>

            <?php
            if (str_contains($user_selected_roles, 'support')) {
            ?>
                <li>
                    <a class="has-arrow ai-icon" href="support.php" aria-expanded="false">
                        <i class="flaticon-381-television"></i>
                        <span class="nav-text">الدعم الفني</span>
                    </a>
                </li>
            <?php
            }
            ?>
        </ul>

        <div class="copyright">
            <p>

                <strong>منصة مستعمل.كوم</strong>
                © جميع الحقوق محفوظة 2024
            </p>
            <p class="fs-12">Developed By <span class="heart"></span> by Mahmoud Gamal</p>
        </div>
    </div>
</div>