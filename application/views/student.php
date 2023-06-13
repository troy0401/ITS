

            <!-- page title area start -->
			<div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Home</h4>
                            <ul class="breadcrumbs pull-left">
                                <!--<li><a href="<?php  echo base_url('Main/Student') ?>">Home</a></li>
                                <li><span>Records</span></li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="<?php echo base_url('uploads/'.$this->session->userdata('accnt_img'))?>" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown"><?php echo $this->session->userdata('accnt_name'); ?><i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" data-toggle="modal" data-target="#profile">Edit Profile</a>
                                <a class="dropdown-item" data-toggle="modal" data-target="#viewprofile">View Profile</a>
                                <a class="dropdown-item" href="<?php echo base_url('Main/Logout');?>">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
                <div class="row">
                    <!-- Basic List Group start -->
                    <!-- Buttons Items start -->
                    <div class="col-md-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Subtopics</h4>
                                <div class="list-group" id="subtopics">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title subject_title"></h4>
                                <div class="list-group" id="subtopic_details">

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Buttons Items end -->

					 <div id="takeExam_modal" class="modal fade bd-example-modal-lg"  data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Practice Exam</h5>
                                            </div>
										<form id="submitExamForm" class="needs-validation" autocomplete="off">
                                            <div class="modal-body question-list">
                                                    <div class="d-flex flex-row align-items-center question-title">
                                                        <h3 class="text-danger">Q.</h3>
                                                        <h5 class="mt-1 ml-2">Which of the following country has largest population?</h5>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="brazil"> <span>Brazil</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Germany"> <span>Germany</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Indonesia"> <span>Indonesia</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Russia"> <span>Russia</span>
                                                        </label>
                                                    </div>
                                            </div>
                                            <div class="modal-footer button_handler">
                                                <button type="submit" disabled class="btn btn-primary">Submit</button>
                                                <button type="button" onclick="skipQuest();" style="display:none;" class="btn btn-warning">Skip</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>

                                <div id="requestAttempt_modal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Request Attempts</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <h4>Request additional attempt for practice exam?</h4>
                                            </div>
                                            </div>
                                            <div class="modal-footer button_attempt">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="practiceExamStartModal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Start of exam</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <form id="practiceExamStartForm">
                                            <div class="modal-body">
                                                <div class="form-row">
                                                    <h4>Please read the questions carefully. Answers must be in lowercase (except in code evaluation). Obeserve proper spacing. There are only <b>10</b> attempts per question. Click on <u>Next</u> button to proceed to the exam.</h4>
                                                    <input value="" type="hidden">
                                                    <input value="" type="hidden">
                                                    <input value="" type="hidden">
                                                    <input value="" type="hidden">
                                                    <input value="" type="hidden">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Next</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                 <div id="summExam_modal" class="modal fade bd-example-modal-lg"  data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Summative Exam</h5>
                                            </div>
										<form id="submitSummExamForm" class="needs-validation" autocomplete="off">
                                            <div class="modal-body summ-list">
                                                    <div class="d-flex flex-row align-items-center question-title">
                                                        <h3 class="text-danger">Q.</h3>
                                                        <h5 class="mt-1 ml-2">Which of the following country has largest population?</h5>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="brazil"> <span>Brazil</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Germany"> <span>Germany</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Indonesia"> <span>Indonesia</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Russia"> <span>Russia</span>
                                                        </label>
                                                    </div>
                                            </div>
                                            <div class="modal-footer summbutton_handler">
                                                <button type="submit" disabled class="btn btn-primary">Submit</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>

                                 <div id="finalExam_modal" class="modal fade bd-example-modal-lg"  data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Final Exam</h5>
                                            </div>
										<form id="submitFinalExamForm" class="needs-validation" autocomplete="off">
                                            <div class="modal-body final-list">
                                                    <div class="d-flex flex-row align-items-center question-title">
                                                        <h3 class="text-danger">Q.</h3>
                                                        <h5 class="mt-1 ml-2">Which of the following country has largest population?</h5>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="brazil"> <span>Brazil</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Germany"> <span>Germany</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Indonesia"> <span>Indonesia</span>
                                                        </label>
                                                    </div>
                                                    <div class="ans ml-2">
                                                        <label class="radio"> <input type="radio" name="answer" value="Russia"> <span>Russia</span>
                                                        </label>
                                                    </div>
                                            </div>
                                            <div class="modal-footer finalbutton_handler">
                                                <button type="submit" disabled class="btn btn-primary">Submit</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>

                                <div id="profile" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Profile Settings</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="profile_form" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Profile Picture</label>
                                                    <input type="file" name="userfile" accept="image/*" class="form-control"  required>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Name</label>
                                                    <input type="text" name="fullname"  class="form-control"  required>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Username</label>
                                                    <input type="email" name="username"  class="form-control"  required>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Password</label>
                                                    <input type="password" name="pass"  class="form-control"  required>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                    </div>

                                    <div id="viewprofile" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Profile viewing</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
												<div class="card card-bordered">
													<img class="card-img-top img-fluid" src="<?php echo site_url('uploads/'.$this->session->userdata('accnt_img')); ?>" alt="image">
													<div class="card-body">
														<h5 class="title"><?php echo $this->session->userdata('accnt_name'); ?></h5>
														<p class="card-text">
														Username: <?php echo $this->session->userdata('accnt_user'); ?><br>
														Account Type: <?php $accnt=$this->session->userdata('accnt_type');
														if($accnt==1){
															echo "Professor";
														}else if($accnt==2){
															echo "Student";
														}else{
															echo "Admin";
														}?>
														</p>
													</div>
												</div>
												</div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                    </div>


                    <!-- Custom Content end -->
                </div>
            </div>
