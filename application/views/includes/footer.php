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
    var subject_id;
    $(document).ready(function(){
		Load_sub(<?php echo $this->session->userdata('accnt_id');?>);

		 $('#subjTable').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/subject_list"); ?>",
                    type : 'POST',
					data: {table:"subject"}
             },
             responsive: true
        } );

		$('#form_subj').submit(function(e){//Add Subject/Subtopic
			e.preventDefault();
			var data = [];
			$("#form_subj input").each(function(){
				data.push(this.value);
			});

			$.post(base_url+'Main/Add_Subj',
				{data:data},function(result){
					$('#form_subj')[0].reset();
					$('#subj').modal('hide');
					$('#subjTable').DataTable().ajax.reload();
					alert("Insert Success");
			},'json');
		});

		$('#form_editSubj').submit(function(e){//Edit Subject/Subtopic
			e.preventDefault();
			var data = [];
			$("#form_editSubj input").each(function(){
				data.push(this.value);
			});

			$.post(base_url+'Main/editSubj',
				{data:data,id:subject_id},function(result){
					$('#form_editSubj')[0].reset();
					$('#editSubj').modal('hide');
					$('#subjTable').DataTable().ajax.reload();
					alert("Update Success");
			},'json');
		});

		$('#form_quest').submit(function(e){//Add Questionaire
			e.preventDefault();
			var data = [];
			$("#form_quest input, #form_quest textarea").each(function(){
				data.push(this.value);
			});
			$.post(base_url+'Main/add_Quest',
				{data:data,id:subject_id},function(result){
					$('#form_quest')[0].reset();
					$('#quest_modal').modal('hide');
					$('#dataQuest').DataTable().ajax.reload();
					alert("Insert Success");
			},'json');
		});

		$('#editForm_quest').submit(function(e){//Edit Questionaire
				e.preventDefault();
				var id=$("#editForm_quest").data("index");
				var data = [];
				$("#editForm_quest input, #editForm_quest textarea").each(function(){
					data.push(this.value);
				});
				$.post(base_url+'Main/editQuest',
					{data:data,id:id},function(result){
						$('#editForm_quest')[0].reset();
						$('#editQuest_modal').modal('hide');
						$('#dataQuest').DataTable().ajax.reload();
						alert("Update Success");
				},'json');
		});

		$('#editExamSett_form').submit(function(e){//Edit Exam Settings
				e.preventDefault();
				var id=$("#editExamSett_form").data("index");
				var data = [];
				$("#editExamSett_form input").each(function(){
					data.push(this.value);
				});
				$.post(base_url+'Main/editExamSett',
					{data:data,id:id},function(result){
						$('#editExamSett_form')[0].reset();
						$('#editExamSett_modal').modal('hide');
						$('#dataTest').DataTable().ajax.reload();
						alert("Update Success");
				},'json');
		});
	});



	function ViewSubj(id){
		subject_id=id;
		 $('#dataQuest').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/quest_list"); ?>",
                    type : 'POST',
					data: {table:"test_quest",column:"subj_id",id:id}
             },
             responsive: true,
			  "destroy": true
        } );

		  $('#dataTest').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/exam_set"); ?>",
                    type : 'POST',
					data: {table:"exam_settings",column:"subj_id",id:id}
             },
             responsive: true,
			  "destroy": true
        } );
	}

	function editSubj(id){
		subject_id=id;
		$.post(base_url+'Main/getSubj',
					{id:id},function(result){
					$($('#form_editSubj input')[0]).val(result[0]['subj_name']);
					$($('#form_editSubj input')[1]).val(result[0]['subj_desc']);
					$($('#form_editSubj input')[2]).val(result[0]['subj_file']);
			},'json');
	}

	function editQuest(id){
		$("#editForm_quest").data("index",id);
		$.post(base_url+'Main/getQuest',
					{id:id},function(result){
					$($('#editForm_quest textarea')[0]).val(result[0]['testq_0']);
					$($('#editForm_quest input')[0]).val(result[0]['testq_1']);
					$($('#editForm_quest input')[1]).val(result[0]['testq_hint']);
					$($('#editForm_quest input')[2]).val(result[0]['testq_1']);
					$($('#editForm_quest input')[3]).val(result[0]['testq_2']);
					$($('#editForm_quest input')[4]).val(result[0]['testq_3']);
					$($('#editForm_quest input')[5]).val(result[0]['testq_4']);
			},'json');
	}

	function editExamSett(id){
		$("#editExamSett_form").data("index",id);
		$.post(base_url+'Main/getExamSett',
					{id:id},function(result){
					$($('#editExamSett_form input')[0]).val(result[0]['exam_set_Type']);
					$($('#editExamSett_form input')[1]).val(result[0]['exam_set_Time']);
					$($('#editExamSett_form input')[2]).val(result[0]['exam_set_Items']);
			},'json');
	}

	function Load_sub(id){ //load first subject
			$.post(base_url+'Main/subjects',
					function(result){
						$('#subtopics').append('<button type="button" onclick="ViewSubjStud('+result[0]['subj_id']+',\''+result[0]['subj_name'] +'\',\''+result[0]['subj_file'] +'\')" class="list-group-item list-group-item-action">'+result[0]['subj_name']+' ('+result[0]['subj_desc']+')</button>');
						Load_sub1(<?php echo $this->session->userdata('accnt_id');?>);
			},'json');
	}

	function ViewSubjStud(id,name,link){
		checkSubtopicStatForStud(id,<?php echo $this->session->userdata('accnt_id');?>);
		var subj_id=id,accnt_id=<?php echo $this->session->userdata('accnt_id');?>, button,active,inactive;
		$('.subject_title').html(name);
		$.post(base_url+'Main/lesson',{subj_id:id,accnt_id:accnt_id},
					function(result){
						var data = checkSubjSession(subj_id,accnt_id);
						active='<button type="button" onclick="practiceExam('+data[0]['exam_id']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>';
						inactive='<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>';
						button=result.length>0 ? Number(data[0]['exam_type']) == 1 ? Number(data[0]['exam_set_trial'])> Number(data[0]['exam_trial']) ? active : inactive: inactive : inactive;
						//var sum = Number(data[0]['exam_set_trial']) > Number(data[0]['exam_trial']);
						//alert(sum);

						$('#subtopic_details').empty().append('<div id="accordion2" class="according accordion-s2">'+
						'<div class="card"><div class="card-header"><a class="card-link" data-toggle="collapse" href="#accordion21">Learning Material </a>'+
						'</div><div id="accordion21" class="collapse show" data-parent="#accordion2"><div class="card-body">'+
						'<button type="button" onclick="redirectPage(\''+link +'\','+data[0]['exam_id']+','+subj_id+',\''+name +'\')" class="btn btn-info btn-lg btn-block">View Learning Material <i class="fa fa-eye"></i></button>'+
						'</div></div></div>'+
						'<div class="card"><div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion22">Practice Exam</a>'+
						'</div><div id="accordion22" class="collapse" data-parent="#accordion2">'+
						'<div class="card-body">'+button+
						'<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+data[0]['exam_trial']+'/'+data[0]['exam_set_trial']+']</span></button>'+
						'</div></div></div><div class="card">'+
						'<div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion23">Summative Exam</a></div>'+
						'<div id="accordion23" class="collapse" data-parent="#accordion2"><div class="card-body">'+
						(data['exam_type'] == 3 && result[0]['ls_status']==0 ? '<button type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>' : '<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>')+
						'</div></div></div></div>');


			},'json');
	}
		function Load_sub1(id){
			$.post(base_url+'Main/subjects',
					function(result){
					for(var i=1; i<result.length; i++){
						$('#subtopics').append('<button type="button" onclick=ViewSubjStud('+result[i]['subj_id']+') class="list-group-item list-group-item-action">'+result[i]['subj_name']+' ('+result[i]['subj_desc']+')</button>');
					}
			},'json');
	}


	function redirectPage(page,id,subj_id,name){
		window.open(page, '_blank');
		updateSummativeExamButton(id);
		ViewSubjStud(subj_id,name,page)
	}

	function checkSubjSession(subj_id,accnt_id){ //lock subtopics if previous subtopics are not yet finished (subtopic 1 only)
			var result = $.ajax({
		url:base_url+"Main/examStatus",
		type:"POST",
		data:{subj_id:subj_id,accnt_id:accnt_id},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;
	}

	function checkSubtopicStatForStud(subj_id,accnt_id)
	{
		$.ajax({
			url:base_url+"Main/CheckLsExamTbl",
			type:"POST",
			data:{subj_id:subj_id,accnt_id:accnt_id},
			dataType:"json",
			async:false
			}).responseJSON;
	}

	function updateSummativeExamButton(id){
		$.ajax({
			url:base_url+"Main/updateExamTableSumm",
			type:"POST",
			data:{exam_id:id},
			dataType:"json",
			async:false
			}).responseJSON;
	}

	function practiceExam(id){
		$('#takeExam_modal').modal('show');
	}


    </script>
</body>

</html>
