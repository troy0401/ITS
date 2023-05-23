		<!--[header]-->
        <!--[sidebar]-->

            <!--[topbar]-->

            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Module</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <li><span>Subject</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/images/author/avatar.png')?>" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Kumkum Rai <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Message</a>
                                <a class="dropdown-item" href="#">Settings</a>
                                <a class="dropdown-item" href="#">Log Out</a>
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
                                <h4 class="header-title"><button type="button" class="btn btn-primary btn-xl mb-3" data-toggle="modal" data-target="#subj">Add Subject <i class="fa fa-plus"></i> </button></h4>
                                <div class="data-tables">
                                    <table id="dataTable" class="text-center">
                                        <thead class="bg-light text-capitalize">
                                            <tr>
                                                <th>Subject Title</th>
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
                                                <h5 class="modal-title">Subject Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_subj" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Subject Name</label>
                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="Subject name" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Subject Description</label>
                                                    <input type="text" class="form-control" id="validationCustom02" placeholder="Subject Description" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">E-Learning Site (links)</label>
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


                                <div id="ViewSubj" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Subject Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_module" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
												<ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
                                    </li>
                                </ul>
                                <div class="tab-content mt-3" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dicta soluta doloribus, ullam, ut obcaecati laboriosam eos, officia dolores voluptatum quas impedit placeat cumque animi quos odio quibusdam voluptatibus magnam minima facilis necessitatibus libero! Error velit veritatis veniam ipsa? Reiciendis quas qui neque atque repudiandae quidem incidunt, a consectetur ipsam impedit.</p>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dicta soluta doloribus, ullam, ut obcaecati laboriosam eos, officia dolores voluptatum quas impedit placeat cumque animi quos odio quibusdam voluptatibus magnam minima facilis necessitatibus libero! Error velit veritatis veniam ipsa? Reiciendis quas qui neque atque repudiandae quidem incidunt, a consectetur ipsam impedit.</p>
                                    </div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                        <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dicta soluta doloribus, ullam, ut obcaecati laboriosam eos, officia dolores voluptatum quas impedit placeat cumque animi quos odio quibusdam voluptatibus magnam minima facilis necessitatibus libero! Error velit veritatis veniam ipsa? Reiciendis quas qui neque atque repudiandae quidem incidunt, a consectetur ipsam impedit.</p>
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
