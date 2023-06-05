		<!--[header]-->
        <!--[sidebar]-->

            <!--[topbar]-->

            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Subject</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="<?php echo base_url('Main/Admin')?>">Home</a></li>
                                <li><span>Subject</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="<?php echo base_url('uploads/'.$this->session->userdata('accnt_img'))?>" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown"><?php echo $this->session->userdata('accnt_name'); ?><i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" data-toggle="modal" data-target="#profile">Change Profile</a>
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
                            <button type="button" class="btn btn-primary btn-xl mb-3" data-toggle="modal" data-target="#addAccount">Add Account <i class="fa fa-plus"></i> </button>
                                <div class="data-tables">
                                    <table id="accounts" class="text-center">
                                        <thead class="bg-light text-capitalize">
                                            <tr>
                                                <th>Account Name</th>
                                                <th>User name</th>
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

                        <div id="viewAccount" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Account Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <form id="edit_account" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Name</label>
                                                    <input type="text" class="form-control" placeholder="Subject name" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
													<label>User Type</label>
													<select required id="acc_type" class="custom-select">
														<option value="">Choose type..</option>
														<option value="1">Professor</option>
														<option value="2">Student</option>
														<option value="3">Admin</option>
													</select>
												</div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Username</label>
                                                    <input type="email" class="form-control" placeholder="Subject Description" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Password</label>
                                                    <input type="password" class="form-control" placeholder="Tutorial Links" required>
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

                        <div id="addAccount" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">New User</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_account" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Name</label>
                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="Account name" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
													<label>User Type</label>
													<select required id="acc_type1" class="custom-select">
														<option value="">Choose type..</option>
														<option value="1">Professor</option>
														<option value="2">Student</option>
														<option value="3">Admin</option>
													</select>
												</div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Username</label>
                                                    <input type="email" class="form-control" id="validationCustom02" placeholder="Username" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Password</label>
                                                    <input type="password" class="form-control" id="validationCustom03" placeholder="Password" required>
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

                                <div id="profile" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Profile Picture</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="profile_form" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Profile Picture</label>
                                                    <input type="file" name="userfile" accept="image/*" class="form-control"  required>
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

                                <!--Ending for Modals -->
                    </div>
            </div>
       <!--footer-->
