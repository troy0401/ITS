		<!--[header]-->
        <!--[sidebar]-->

            <!--[topbar]-->

            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Home</h4>
                            <ul class="breadcrumbs pull-left">
                                <!--<li><a href="index.html">Home</a></li>
                                <li><span>Subject</span></li>-->
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
                <!-- accroding start -->
                <div class="row">
                     <div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title"><button type="button" class="btn btn-primary btn-xl mb-3" data-toggle="modal" data-target="#subj">Add Subtopic <i class="fa fa-plus"></i> </button><button onclick="renderFinalChart();" type="button" class="btn btn-warning btn-xl mb-3" data-toggle="modal" data-target="#finalChart">Final Exam Analytics <i class="fa fa-pie-chart"></i> </button></h4>
                                <div class="data-tables">
                                    <table id="subjTable" class="text-center">
                                        <thead class="bg-light text-capitalize">
                                            <tr>
                                                <th>Subtopic Title</th>
                                                <th>Description</th>
                                                <th>Link</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!--Modals-->

                        <div id="subj" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Subtopic Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_subj" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Subtopic Name</label>
                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="Subtopic name" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Subtopic Description</label>
                                                    <input type="text" class="form-control" id="validationCustom02" placeholder="Subtopic Description" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">E-Learning Site 1 (links)</label>
                                                    <input type="text" class="form-control" id="validationCustom03" placeholder="Tutorial Links" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">E-Learning Site 2 (links)</label>
                                                    <input type="text" class="form-control" id="validationCustom03" placeholder="Tutorial Links" required>
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

								 <div id="editSubj" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Update Subtopic</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_editSubj" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Subtopic Name</label>
                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="Subtopic name" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Subtopic Description</label>
                                                    <input type="text" class="form-control" id="validationCustom02" placeholder="Subtopic Description" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">E-Learning Site 1 (links)</label>
                                                    <input type="text" class="form-control" id="validationCustom03" placeholder="Tutorial Links" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">E-Learning Site 2 (links)</label>
                                                    <input type="text" class="form-control" id="validationCustom03" placeholder="Tutorial Links" required>
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

                                 <div id="viewPracticeRequest" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Grant Request</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                           <div class="data-tables">
											<table id="studPracticeRequestTable" class="text-center" width="100%">
												<thead class="bg-light text-capitalize">
													<tr>
														<th>Student Name</th>
														<th>Request Message</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="finalRecord" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Grant Request</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                           <div class="data-tables">
											<table id="studFinalRecord" class="text-center" width="100%">
												<thead class="bg-light text-capitalize">
													<tr>
														<th>Subtopic Name</th>
														<th>Question</th>
														<th>Student Answer</th>
                                                        <th>Time Spent</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div id="ViewSubj" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Exam Settings</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
												<ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#question" role="tab" aria-controls="home" aria-selected="true">Questionaires</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#exam" role="tab" aria-controls="profile" aria-selected="false">Exam Settings</a>
                                    </li>
                                </ul>
                                <div class="tab-content mt-3" id="myTabContent">
                                    <div class="tab-pane fade show active" id="question" role="tabpanel" aria-labelledby="home-tab">
										<div class="data-tables">
										 <button type="button" class="btn btn-primary btn-xl mb-3" data-toggle="modal" data-target="#quest_modal">Add Questionaire <i class="fa fa-plus"></i> </button>
											<table id="dataQuest" class="text-center" width="100%">
												<thead class="bg-light text-capitalize">
													<tr>
														<th>Question No.</th>
														<th>Questionaire list</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
                                    </div>
                                    <div class="tab-pane fade" id="exam" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="data-tables">
											<table id="dataTest" class="text-center" width="100%">
												<thead class="bg-light text-capitalize">
													<tr>
														<th>Exam Type</th>
														<th>Duration</th>
														<th>Number of Items</th>
														<th>Actions</th>

													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                 <div id="quest_modal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Questionaire Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_quest" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="col-md-12 mb-3">
													<label class="col-form-label">Select Question type</label>
													<select onChange="displayQuestType(this.value);" class="form-control">
														<option>Choose Type...</option>
														<option value="1">Multiple Choice</option>
														<option value="2">Fill in the Blank</option>
													</select>
											<div id="question_set"></div>
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

                                 <div id="editQuest_modal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Questionaire Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="editForm_quest" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
													<div class="question_set"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>

                                <div id="editExamSett_modal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Exam Settings</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="editExamSett_form" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Exam Type</label>
                                                    <input type="text" class="form-control" id="validationCustom01" disabled required>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <label for="validationCustom02">Time Duration (minutes)</label>
                                                    <input type="number" class="form-control" id="validationCustom02" placeholder="Subject Description" required>
                                                </div>
                                                 <div class="col-md-3 mb-3">
                                                    <label for="validationCustom02">Number of Items</label>
                                                    <input type="number" class="form-control" id="validationCustom03" placeholder="Tutorial Links" required>
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

                                <div id="studRequest_modal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Attempt Request</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_request" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Number of Additional Attempt/s</label>
                                                    <input type="number" class="form-control" id="validationCustom02" placeholder="Attempts" required>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                             </form>
                                        </div>
                                    </div>
                                </div>
								</div>

								<div id="viewSubjRecModal" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Analytics</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
												<ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#test1" role="tab" aria-controls="home" aria-selected="true">Practice Exam</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#test2" role="tab" aria-controls="profile" aria-selected="false">Summative Exam</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="cert-tab" data-toggle="tab" href="#cert_sub" role="tab" aria-controls="profile" aria-selected="false">Certainty</a>
                                    </li>
                                </ul>
                                <div class="tab-content mt-3" id="myTabContent">
                                    <div class="tab-pane fade show active" id="test1" role="tabpanel" aria-labelledby="home-tab">
									<div class="card h-full">
										<div class="card-body">
											<canvas id="subjChart" height="233"></canvas>
										</div>
									</div>
                                    </div>
                                    <div class="tab-pane fade" id="test2" role="tabpanel" aria-labelledby="profile-tab">
                                   <div class="card h-full">
										<div class="card-body">
											<canvas id="subjChart1" height="233"></canvas>
										</div>
									</div>

									</div>
									<div class="tab-pane fade" id="cert_sub" role="tabpanel" aria-labelledby="profile-tab">
                                   <div class="card h-full">
										<div class="card-body">
											<canvas id="subjCertChart" height="233"></canvas>
										</div>
									</div>

									</div>
                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
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

                                    <div id="finalChart" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Final Exam Analytics</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="profile_form" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
												<div class="card h-full">
													<div class="card-body">
														<canvas id="viewFinalsChart" height="233"></canvas>
													</div>
												</div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                    </div>


                                <!--Ending for Modals -->
                    </div>
            </div>
       <!--footer-->
