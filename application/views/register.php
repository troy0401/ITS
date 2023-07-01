<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ITS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/images/icon/favicon.ico')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/bootstrap.min.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/font-awesome.min.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/themify-icons.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/metisMenu.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/owl.carousel.min.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/slicknav.min.css')?>">
    <!-- amcharts css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- Start datatable css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/typography.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/default-css.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/styles.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/css/responsive.css')?>">
    <!-- modernizr css -->
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/vendor/modernizr-2.8.3.min.js')?>"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="login-area login-s2">
        <div class="container">
            <div class="login-box ptb--100">
                <form id="reg">
                    <div class="login-form-head">
                        <h4>Sign up</h4>
                        <p>Hello there, Sign up and Join with Us</p>
                    </div>
                    <div class="login-form-body">
                        <div class="form-gp">
                            <label for="exampleInputName1">Full Name</label>
                            <input type="text" id="exampleInputName1" required>
                            <i class="ti-user"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" id="email1" required>
                            <i class="ti-email"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputEmail1">Confirm Email address</label>
                            <input type="email" oninput="valEmail(this.value);" id="email2" required>
                            <i class="ti-email"></i>
                            <div class="text-danger mail_output"></div>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputEmail1">Password</label>
                            <input type="password" id="pass1" required>
                            <i class="ti-email"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputEmail1">Confirm Password</label>
                            <input type="password" oninput="valPass(this.value);" id="pass2" required>
                            <i class="ti-email"></i>
                            <div class="text-danger pass_output"></div>
                        </div>
                        <!-- <div class="form-gp">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" id="exampleInputPassword1" required>
                            <i class="ti-lock"></i>
                            <div class="text-danger"></div>
                        </div> -->
                        <div class="submit-btn-area">
                            <button id="form_submit" type="submit">Submit <i class="ti-arrow-right"></i></button>
                        </div>

                        <div class="form-footer text-center mt-5">
                            <p class="text-muted">Already have an account? <a href="<?php echo base_url('Main/Login'); ?>">Login</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->
    <div id="otpModal" class="modal fade ">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Confirm One-Time Password</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="checkOTP" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">One-Time Password</label>
                                                    <input type="text" class="form-control" id="validationCustom03" placeholder="OTP PIN" required>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Confirm</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>

     <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/vendor/jquery-2.2.4.min.js')?>"></script>
    <!-- bootstrap 4 js -->
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/popper.min.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/bootstrap.min.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/owl.carousel.min.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/metisMenu.min.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/jquery.slimscroll.min.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/jquery.slicknav.min.js')?>"></script>

    <!-- Start datatable js -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <!-- others plugins -->
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/plugins.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/scripts.js')?>"></script>
    <script>
     var base_url='<?php echo base_url(); ?>';
       $(document).ready(function() {
		   
            $("#reg").submit(function(e) {
                var data = [];
				e.preventDefault();
				$("#reg input").each(function(){
				data.push(this.value);
			});
				$.post(base_url+'Main/add_TempAcc',
					 {data:data}, function(result){
                        if(result==false){
                            alert('Account already existed. Please use another one.')
                        }else{
                          $('#otpModal').modal('show');
                        }
					 },'json');
                     
                });

                $("#checkOTP").submit(function(e){
                    var data = [];
                    e.preventDefault();
				    $("#checkOTP input").each(function(){
				        data.push(this.value);
			        });
                    $.post(base_url+'Main/verifyAccount',
					 {data:data,email:$('#email1').val()}, function(result){
                          if(result==true){
                          $('#checkOTP')[0].reset();
                          $('#reg')[0].reset();
                          $('#otpModal').modal('hide');
                          alert('Account has been activated, You may now login your account');
                          window.location=base_url+'Main/Login';
                          }else{
                          alert('Invalid OTP, Please try again');
                          }
					 },'json');
                    
                })
            });

    function valEmail(val){
        var mail1=$('#email1').val();
        $('.mail_output').empty();
        if(val==mail1){
            $("#reg button[type=submit]").prop('disabled',false);
        }else{
            $('.mail_output').append('Email addresses are not the same');
            $("#reg button[type=submit]").prop('disabled',true);
        }
    }

    function valPass(val){
        var mail1=$('#pass1').val();
        $('.pass_output').empty();
        if(val==mail1){
            $("#reg button[type=submit]").prop('disabled',false);
        }else{
            $('.pass_output').append('Passwords are not the same');
            $("#reg button[type=submit]").prop('disabled',true);
        }
    }
    </script>
</body>

</html>
