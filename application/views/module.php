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
                                <li><span>Module</span></li>
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
                                <h4 class="header-title"><button type="button" class="btn btn-primary btn-xl mb-3" data-toggle="modal" data-target="#mod">Add Module <i class="fa fa-plus"></i> </button></h4>
                                <div class="data-tables">
                                    <table id="dataTable" class="text-center">
                                        <thead class="bg-light text-capitalize">
                                            <tr>
                                                <th>Module Title</th>
                                                <th>Description</th>
                                                <th>Duration</th>
                                                <th>Test Items</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div  id="mod" class="modal fade bd-example-modal-lg">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Module Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
										<form id="form_module" class="needs-validation" autocomplete="off">
                                            <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom01">Module Name</label>
                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="Module name" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Module Description</label>
                                                    <input type="text" class="form-control" id="validationCustom02" placeholder="Module Description" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Final Summative Exam (Duration)</label>
                                                    <input type="number" class="form-control" id="validationCustom03" placeholder="Duration (Minutes)" required>
                                                </div>
                                                 <div class="col-md-6 mb-3">
                                                    <label for="validationCustom02">Final Summative Exam (number of items)</label>
                                                    <input type="number" class="form-control" id="validationCustom03" placeholder="Number of items" required>
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
                    </div>
            </div>
       <!--footer-->
