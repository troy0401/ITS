

            <!-- page title area start -->
			<div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Subject</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <li><span>Subject</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/images/author/avatar.png')?>" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown"><?php echo $this->session->userdata('accnt_name'); ?><i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Message</a>
                                <a class="dropdown-item" href="#">Settings</a>
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
                                <h4 class="header-title">Sub Topics</h4>
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
                                            <div class="modal-body">
												<div class="question bg-white p-3 border-bottom question-list">
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
                                            </div>
                                            <div class="modal-footer button_handler">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>
                    <!-- Custom Content end -->
                </div>
            </div>
