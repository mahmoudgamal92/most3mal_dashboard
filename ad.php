<?php
require_once 'utils/network.php';
require_once 'utils/config.php';
$id = $_GET['id'];
$ad = _Read('ads', array("id" => $id));
$user = _Read('users', array("id" => $ad[0]['user_id']));

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
        
        
        
        
        
        
        
        
        
        
        
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4><?php echo $ad[0]['title']; ?></h4>
                            <p class="mb-0">تاريخ الإعلان
                            <?php echo $ad[0]['created_at']; ?> : 
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
 <a class="btn btn-primary" onclick="history.back()">
                                    عودة
                                </a>                          
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-6  col-md-6 col-xxl-5 ">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                                     
                                                 <?php
                                        $img_array = explode(',', $ad[0]['images']);
                                        foreach ($img_array as $key => $img) {
                                        ?>
                                        
                                        
                                
                                            
                                            <div role="tabpanel" class="tab-pane fade <?php  if($key == 0)  echo 'show active' ?>" id="<?='key_'.$key?>">
                                                <img class="img-fluid" src="./uploads/<?= $img ?>" alt="">
                                            </div>
                                            
                                            <?php
                                        }
                                            ?>
                                        </div>
                                        <div class="tab-slide-content new-arrival-product mb-4 mb-xl-0">
                                            <!-- Nav tabs -->
                                            <ul class="nav slide-item-list mt-3" role="tablist">
                                                
                                                
                                                 <?php
                                                    $img_array = explode(',', $ad[0]['images']);
                                                    foreach ($img_array as $key => $img) {
                                                    ?>
                                        
                                                <li role="presentation" class="show">
                                                    <a href="<?='#key_'.$key?>" role="tab" data-bs-toggle="tab">
                                                        <img class="img-fluid"  src="./uploads/<?= $img ?>" alt="" 
                                                        style="width:px;height:100px;border-radius:10px;margin:10px"
                                                        >
                                                    </a>
                                                </li>

                                            <?php
                                                }
                                                
                                                ?>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--Tab slider End-->
                                    <div class="col-xl-9 col-lg-6  col-md-6 col-xxl-7 col-sm-12">
                                        <div class="product-detail-content">
                                            <!--Product details-->
                                            <div class="new-arrival-content pr">
                                                <h4><?php echo $ad[0]['title']; ?></h4>
                                                <div class="comment-review star-rating">
													<ul>
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
													    <li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
													</ul>
													<span class="review-text">(0 تقييمات)
													</span>
												</div>
												<div class="d-table mb-2">
													<p class="price float-left d-block">
													    <?php echo $ad[0]['price']; ?>
													    ريال سعودي
													</p>
                                                </div>
                                                <p>حالة الإعلان: <span class="item"> 
                                                In stock 
                                                <i class="fa fa-shopping-basket"></i></span>
                                                </p>
                                                <p>رقم الإعلان: <span class="item">
                                                     <?php echo $ad[0]['id']; ?>
                                                </span> </p>

                                                   <p>وصف الإعلان :</p>
                                                <p class="text-content">
                                                      <?php echo $ad[0]['details']; ?>
                                                </p>
                                                
                                                   <p>الموقع الجغرافي <span class="item">
                                                     <?php echo $ad[0]['address']; ?>
                                                </span> </p>

                                             <div class="d-table mb-2">
												<h3 style="margin:20px">
												    بيانات المعلن :
												</h3>
												
												  <p> 
												  أسم المعلن :
												  <span class="item"><?php echo $user[0]['name']; ?> </span> 
												  </p>
												  
												  
												   <p> 
												البريد الإلكتروني :
												  <span class="item"><?php echo $user[0]['email']; ?> </span> 
												  </p>
												  
												  
												    <p> 
											رقم الهاتف :
												  <span class="item"><?php echo $user[0]['phone']; ?> </span> 
												  </p>
												</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<!-- review -->
					<div class="modal fade" id="reviewModal">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Review</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal">
									</button>
								</div>
								<div class="modal-body">
									<form>
										<div class="text-center mb-4">
											<img class="img-fluid rounded" width="78" src="images/avatar/1.jpg" alt="DexignZone">
										</div>
										<div class="form-group">
											<div class="rating-widget mb-4 text-center">
												<!-- Rating Stars Box -->
												<div class="rating-stars">
													<ul id="stars">
														<li class="star" title="Poor" data-value="1">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="Fair" data-value="2">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="Good" data-value="3">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="Excellent" data-value="4">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="WOW!!!" data-value="5">
															<i class="fa fa-star fa-fw"></i>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="form-group">
											<textarea class="form-control" placeholder="Comment" rows="5"></textarea>
										</div>
										<button class="btn btn-success btn-block">RATE</button>
									</form>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

        
        


        <!--******* Footer start ***-->
        <?php include 'include/footer.php' ?>
        <!--*******   Footer end   *****-->


    </div>
    <!--***** Main wrapper end ***-->

    <!--******* Scripts ******-->
    <?php include 'include/scripts.php' ?>
</body>

</html>