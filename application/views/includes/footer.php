 </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <footer>
            <div class="footer-area">
                <p>© Copyright <?php echo date('Y'); ?>. All rights reserved.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- offset area end -->
    <!-- jquery latest version -->
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
    var base_url='<?php echo base_url(); ?>'
    $(document).ready(function(){
		 $('#dataTable').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/subject_list"); ?>",
                    type : 'POST',
					data: {table:"subject"}
             }
        } );

		$('#form_subj').submit(function(e){
			e.preventDefault();
			var data = [];
			$("#form_subj input").each(function(){
				data.push(this.value);
			});

			$.post(base_url+'Main/Add_Subj',
				{data:data},function(result){
					$('#form_subj')[0].reset();
					$('#subj').modal('hide');
					alert(result);
			},'json');
		})
	})

    </script>
</body>

</html>
