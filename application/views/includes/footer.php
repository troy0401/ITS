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
	var count_quest=0,total_quest=1;next_quest=0
var startTime, endTime, durationInSeconds, timer,countdown
    $(document).ready(function(){
		Load_sub(<?php echo $this->session->userdata('accnt_id');?>);
		//startTimer();
		//countdownTimer(600);

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

		 $('#submitExamForm').submit(function(e){//submit practice exam answer
            e.preventDefault();
             $.post(base_url+'Main/submitAnswer',
            {
                ans:$($("#submitExamForm input[type='radio']:checked")[0]).val(),
                testq_id:$($("#submitExamForm input[type='hidden']")[0]).val(),
                test_Type:$($("#submitExamForm input[type='hidden']")[1]).val(),
				duration:$($("#submitExamForm input[type='hidden']")[2]).val(),
				//score_id:$($("#submitExamForm input[type='hidden']")[3]).val(),
				test_items:$($("#submitExamForm input[type='hidden']")[3]).val(),
				history_id:$($("#submitExamForm input[type='hidden']")[4]).val(),
				score_id:$($("#submitExamForm input[type='hidden']")[5]).val(),
				exam_id:$($("#submitExamForm input[type='hidden']")[6]).val()
            }, function(result){
						stopTimer();
						startTimer();
                        if(count_quest>total_quest){
                            $('#question'+next_quest+'').remove();
                            next_quest++;
                            $('#question'+next_quest+'').css({"display":"block"});
                            total_quest++;
                            var total_display=total_quest+" of "+count_quest;
                            $('#total_count').html(total_display);
                            $("#submitExamForm button[type=submit]").prop('disabled',true);
                          }else{
							stopCountdown();
                            stopTimer();
                            //GetScore($($("#submitExamForm input[type='hidden']")[1]).val(),$($("#submitExamForm input[type='hidden']")[2]).val());
							getScorePractice($($("#submitExamForm input[type='hidden']")[5]).val(),$($("#submitExamForm input[type='hidden']")[6]).val());//score_id and exam_id
                            $('#question'+next_quest+'').remove();
                            $('.button_handler').empty().append('<button class="btn btn-primary submit_quiz" type="button">Close</button>');
                            $('.submit_quiz').click(function(){
                               $('#takeExam_modal').modal('hide');
                               $('.button_handler').empty().append('<button type="submit" disabled class="btn btn-primary">Submit</button>');

                            });
                          }

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

	function change(val){
      $("#submitExamForm button[type=submit]").prop('disabled',false);
    }

	function countdownTimer(seconds) {
	countdown = setInterval(function() {
    var minutes = Math.floor(seconds / 60);
    var remainingSeconds = seconds % 60;

    // Add leading zero if the value is less than 10
    minutes = minutes < 10 ? "0" + minutes : minutes;
    remainingSeconds = remainingSeconds < 10 ? "0" + remainingSeconds : remainingSeconds;

    // Display the countdown timer in the console or update a HTML element
    //console.log(minutes + ":" + remainingSeconds);
	$('.timer').empty().append(minutes + ":" + remainingSeconds);

			if (seconds <= 0) {
			clearInterval(countdown);
			console.log("Countdown timer has ended");
			} else {
			seconds--;
			}
		}, 1000);
	}

	function stopCountdown() {
	clearInterval(countdown);
	$('.timer').empty();
	}

	function startTimer() {
	startTime = new Date();
	timer = setInterval(updateTimer, 1000); // Update the timer every second
	}

	function updateTimer() {
	var currentTime = new Date();
	durationInSeconds = Math.floor((currentTime - startTime) / 1000); // Calculate duration in seconds

	var hours = Math.floor(durationInSeconds / 3600);
	var minutes = Math.floor((durationInSeconds % 3600) / 60);
	var seconds = durationInSeconds % 60;

	var formattedTime = padZero(hours) + ":" + padZero(minutes) + ":" + padZero(seconds);
	//console.log("Duration: " + formattedTime);
	$($('#submitExamForm input')[2]).val(formattedTime);
	}

	function padZero(number) {
	return number.toString().padStart(2, "0"); // Add leading zero if needed
	}
	function stopTimer() {
	clearInterval(timer);
	$($('#submitExamForm input')[2]).val('');
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
					$($('#editForm_quest input')[0]).val(result[0]['testq_ans']);
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
						var practiceExamData = checkSubjSession(subj_id,accnt_id,1);//practice exam parameter
						var summativeExamData = checkSubjSession(subj_id,accnt_id,2);//summative exam paramater
						var exam_setData = getExamSettings(subj_id,1);
						active='<button type="button" onclick="practiceExam('+practiceExamData[0]['exam_id']+','+subj_id+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>';
						inactive='<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>';
						button=result.length>0 ? Number(practiceExamData[0]['exam_type']) == 1 ? Number(practiceExamData[0]['exam_status']) == 0 ? Number(practiceExamData[0]['exam_set_trial'])> Number(practiceExamData[0]['exam_trial']) ? active :inactive : inactive: inactive : inactive;
						//var sum = Number(data[0]['exam_set_trial']) > Number(data[0]['exam_trial']);
						//alert(sum);

						$('#subtopic_details').empty().append('<div id="accordion2" class="according accordion-s2">'+
						'<div class="card"><div class="card-header"><a class="card-link" data-toggle="collapse" href="#accordion21">Learning Material </a>'+
						'</div><div id="accordion21" class="collapse show" data-parent="#accordion2"><div class="card-body">'+
						'<button type="button" onclick="redirectPage(\''+link +'\','+practiceExamData[0]['exam_id']+','+subj_id+',\''+name +'\')" class="btn btn-info btn-lg btn-block">View Learning Material <i class="fa fa-eye"></i></button>'+
						'</div></div></div>'+
						'<div class="card"><div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion22">Practice Exam</a>'+
						'</div><div id="accordion22" class="collapse" data-parent="#accordion2">'+
						'<div class="card-body practice_buttons">'+button+
						'<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+practiceExamData[0]['exam_trial']+'/'+practiceExamData[0]['exam_set_trial']+']</span></button>'+
						'</div></div></div><div class="card">'+
						'<div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion23">Summative Exam</a></div>'+
						'<div id="accordion23" class="collapse" data-parent="#accordion2"><div class="card-body">'+
						(summativeExamData.length>0 && result[0]['ls_status']==0 ? '<button type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>' : '<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>')+
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

	function checkSubjSession(subj_id,accnt_id,type){ //lock subtopics if previous subtopics are not yet finished (subtopic 1 only)
			var result = $.ajax({
		url:base_url+"Main/examStatus",
		type:"POST",
		data:{subj_id:subj_id,accnt_id:accnt_id,exam_type:type},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;
	}

	function recordTestHistory(subj_id,accnt_id,type){ //records attempts history
	var result = $.ajax({
		url:base_url+"Main/recordTestHistory",
		type:"POST",
		data:{subj_id:subj_id,accnt_id:accnt_id,exam_type:type},
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

	function getExamSettings(subj_id,exam_setType){ //get exam settings for exam type and duration of the exam and  number of items
			var result = $.ajax({
		url:base_url+"Main/examSettings",
		type:"POST",
		data:{subj_id:subj_id,exam_setType:exam_setType},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;
	}

	function practiceExam(exam_id,subj_id,test_items,time,type){
		$('#takeExam_modal').modal('show');
		$.post(base_url+'Main/getQuestionsExam',{exam_id:exam_id,subj_id:subj_id,test_items:test_items},
					function(result){
					$('.question-list').empty();
					countdownTimer(time);
					startTimer();
					var id =recordTestHistory(subj_id,<?php echo $this->session->userdata('accnt_id')?>,1);
					for(var i=0; i<result.length; i++){
						$('.question-list').append('<div id="question'+count_quest+'" '+(count_quest<1 ? 'style="display: block;"' : 'style="display:none;"')+'>'+
						'<h5>Time Remaining: <b><span class="timer"></span></b></h5>'+
                        '<h4>'+result[i]['subj_name']+'</h5><span id="total_count">(5 of 20)</span>'+
                        '<div class="d-flex flex-row align-items-center question-title"><h3 class="text-danger">Q.</h3>'+
                        '<input type="hidden" value="'+result[i]['testq_id']+'">'+
                        '<input type="hidden" value="'+type+'">'+
						'<input type="hidden" value="">'+
						'<input type="hidden" value="'+test_items+'">'+
						'<input type="hidden" value="'+id['history_id']+'">'+
						'<input type="hidden" value="'+id['score_id']+'">'+
						'<input type="hidden" value="'+exam_id+'">'+
                        '<h5 class="mt-1 ml-2">'+result[i]['testq_0']+'</h5></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input onchange="change(this.value);" type="radio" name="answer'+i+'" value="'+result[i]['testq_1']+'"> <span>'+result[i]['testq_1']+'</span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="change(this.value);" value="'+result[i]['testq_2']+'"> <span>'+result[i]['testq_2']+'</span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="change(this.value);" value="'+result[i]['testq_3']+'"> <span>'+result[i]['testq_3']+'</span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="change(this.value);" value="'+result[i]['testq_4']+'"> <span>'+result[i]['testq_4']+'</span></label></div>');
                      count_quest++;
                         }
                         var total_display=total_quest+" of "+count_quest;
                         $('#total_count').html(total_display);
			},'json');
	}

	function getScorePractice(score_id,exam_id){
      $.post(base_url+'Main/getScore',{score_id:score_id}, function(result){
          var score=result[0]['score'];
          var final= score/count_quest*100;
          if(final>=70){
            $('.question-list').html('<h2 class="text-center">Your score:'+result[0]['score']+'/'+result[0]['num_of_items']+'</h2>'+
              '<h3 class="text-success text-center">You Passed!</h3>');
				updatePracticeButtons(exam_id,1);//1=passed; 0=failed
          }else{
            $('.question-list').html('<h2 class="text-center">'+result[0]['score']+'/'+result[0]['num_of_items']+'</h2>'+
              '<h3 class="text-danger text-center">You Failed!</h3>');
				updatePracticeButtons(exam_id,0);
          }
          count_quest=0,prev_quest=0,next_quest=0,total_quest=1;

      },'json');
    }

    function updatePracticeButtons(exam_id,status){
		if(status==1){
			$.post(base_url+'Main/updatePracticeStatus',{exam_id:exam_id,exam_status:status}, function(result){
					$('.practice_buttons').empty().append('<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+'<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+result[0]['exam_trial']+'/'+result[0]['exam_set_trial']+']</span></button>');
					$('#accordion23').empty().append('<div class="card-body">'+
					'<button type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>'+
					'</div>');
			},'json');
		}else{
			$.post(base_url+'Main/getAttempts',{exam_id:exam_id}, function(result){
				var exam_setData = getExamSettings(result[0]['subj_id'],1);
					$('.practice_buttons').empty().append((Number(result[0]['exam_set_trial'])> Number(result[0]['exam_trial']) ? '<button type="button" onclick="practiceExam('+result[0]['exam_id']+','+result[0]['subj_id']+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>' : '<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>')+'<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+result[0]['exam_trial']+'/'+result[0]['exam_set_trial']+']</span></button>');
			},'json');
		}
	}




    </script>
</body>

</html>
