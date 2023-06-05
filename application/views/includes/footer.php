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

     <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

    <!-- others plugins -->
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/plugins.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/scripts.js')?>"></script>
    <script src="<?php echo base_url('srtdash-admin-dashboard-master/srtdash/assets/js/pie-chart.js')?>"></script>
    <script>
    var base_url='<?php echo base_url(); ?>'
    var subject_id;
	var count_quest=0,total_quest=1;next_quest=0
var startTime, endTime, durationInSeconds, timer,countdown,chart,chart1
    $(document).ready(function(){
		viewStudSubj();
		var ctx = $("#subjChart");
		chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'pie',
        // The data for our dataset
        data: {
            labels: ["Passed", "Failed"],
            datasets: [{
                backgroundColor: [
                    "green",
					"red"
                ],
                borderColor: '#fff',
                data: [10, 10],
            }]
        },
        // Configuration options go here
        options: {
            legend: {
                display: true
            },
            animation: {
                easing: "easeInOutBack"
            }
        }
    });

		var ctx = $("#subjChart1");
		chart1 = new Chart(ctx, {
        // The type of chart we want to create
        type: 'pie',
        // The data for our dataset
        data: {
            labels: ["Passed", "Failed"],
            datasets: [{
                backgroundColor: [
                    "green",
					"red"
                ],
                borderColor: '#fff',
                data: [10, 10],
            }]
        },
        // Configuration options go here
        options: {
            legend: {
                display: true
            },
            animation: {
                easing: "easeInOutBack"
            }
        }
    });

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

		$('#students').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/students"); ?>",
                    type : 'POST'
             },
             responsive: true
        } );

		$('#accounts').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/accounts"); ?>",
                    type : 'POST'
             },
             responsive: true
        } );

		$('#profile_form').submit(function(e){
        e.preventDefault();
           $.ajax({
            type: 'POST',
            url: base_url+'Main/changeProfile',
            data: new FormData(this),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData:false,
            success: function(response){ //console.log(response);
                $('#profile_form')[0].reset();
                $('#profile').modal('hide');
				alert("Update Success");
				location.reload();
          }
      });
    });

		$('#form_account').submit(function(e){//Add Subject/Subtopic
			e.preventDefault();
			var data = [];
			$("#form_account input").each(function(){
				data.push(this.value);
			});
			var type=$("#acc_type1").val();
			$.post(base_url+'Main/addAccount',
				{data:data,type:type},function(result){
					$('#form_account')[0].reset();
					$('#addAccount').modal('hide');
					$('#accounts').DataTable().ajax.reload();
					alert("Insert Success");
			},'json');
		});

		$('#edit_account').submit(function(e){//Add Subject/Subtopic
			e.preventDefault();
			var data = [];
			$("#edit_account input").each(function(){
				data.push(this.value);
			});
			var id=$("#edit_account").data("index");
			var type=$("#acc_type").val();
			$.post(base_url+'Main/updateAccount',
				{data:data,id:id,type:type},function(result){
					$('#edit_account')[0].reset();
					$('#viewAccount').modal('hide');
					$('#accounts').DataTable().ajax.reload();
					alert("Update Success");
			},'json');
		});

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

		$('#form_request').submit(function(e){//Add new Attempts for students
			e.preventDefault();
			var data = [];
			var id=$("#form_request").data("index");
			$("#form_request input").each(function(){
				data.push(this.value);
			});

			$.post(base_url+'Main/updateRequest',
				{data:data,id:id},function(result){
					$('#form_request')[0].reset();
					$('#studRequest_modal').modal('hide');
					$('#studPracticeRequestTable').DataTable().ajax.reload();
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

		 $('#submitSummExamForm').submit(function(e){//submit summative exam answer
            e.preventDefault();
             $.post(base_url+'Main/submitAnswer',
            {
                ans:$($("#submitSummExamForm input[type='radio']:checked")[0]).val(),
                testq_id:$($("#submitSummExamForm input[type='hidden']")[0]).val(),
                test_Type:$($("#submitSummExamForm input[type='hidden']")[1]).val(),
				duration:$($("#submitSummExamForm input[type='hidden']")[2]).val(),
				//score_id:$($("#submitExamForm input[type='hidden']")[3]).val(),
				test_items:$($("#submitSummExamForm input[type='hidden']")[3]).val(),
				history_id:$($("#submitSummExamForm input[type='hidden']")[4]).val(),
				score_id:$($("#submitSummExamForm input[type='hidden']")[5]).val(),
				exam_id:$($("#submitSummExamForm input[type='hidden']")[6]).val()
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
                            $("#submitSummExamForm button[type=submit]").prop('disabled',true);
                          }else{
							stopCountdown();
                            stopTimer();
                            //GetScore($($("#submitExamForm input[type='hidden']")[1]).val(),$($("#submitExamForm input[type='hidden']")[2]).val());
							getScoreSummative($($("#submitSummExamForm input[type='hidden']")[5]).val(),$($("#submitSummExamForm input[type='hidden']")[6]).val());//score_id and exam_id
                            $('#question'+next_quest+'').remove();
                            $('.summbutton_handler').empty().append('<button class="btn btn-primary submit_quiz" type="button">Close</button>');
                            $('.submit_quiz').click(function(){
                               $('#summExam_modal').modal('hide');
                               $('.summbutton_handler').empty().append('<button type="submit" disabled class="btn btn-primary">Submit</button>');

                            });
                          }

            },'json');
        });

		 $('#submitFinalExamForm').submit(function(e){//submit summative exam answer
            e.preventDefault();
             $.post(base_url+'Main/submitFinalsAnswer',
            {
                ans:$($("#submitFinalExamForm input[type='radio']:checked")[0]).val(),
                testq_id:$($("#submitFinalExamForm input[type='hidden']")[0]).val(),
				duration:$($("#submitFinalExamForm input[type='hidden']")[1]).val(),
				//score_id:$($("#submitExamForm input[type='hidden']")[3]).val(),
				final_id:$($("#submitFinalExamForm input[type='hidden']")[2]).val(),
				accnt_id:<?php echo $this->session->userdata('accnt_id');?>
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
                            $("#submitFinalExamForm button[type=submit]").prop('disabled',true);
                          }else{
							stopCountdown();
                            stopTimer();
                            //GetScore($($("#submitExamForm input[type='hidden']")[1]).val(),$($("#submitExamForm input[type='hidden']")[2]).val());
							getScoreFinals($($("#submitFinalExamForm input[type='hidden']")[2]).val());//score_id and exam_id
                            $('#question'+next_quest+'').remove();
                            $('.finalbutton_handler').empty().append('<button class="btn btn-primary submit_quiz" type="button">Close</button>');
                            $('.submit_quiz').click(function(){
                               $('#finalExam_modal').modal('hide');
                               $('.finalbutton_handler').empty().append('<button type="submit" disabled class="btn btn-primary">Submit</button>');

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

    function summ_change(val){
      $("#submitSummExamForm button[type=submit]").prop('disabled',false);
    }

    function finals_change(val){
      $("#submitFinalExamForm button[type=submit]").prop('disabled',false);
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
	$($('#submitSummExamForm input')[2]).val(formattedTime);
	$($('#submitFinalExamForm input')[1]).val(formattedTime);
	}

	function padZero(number) {
	return number.toString().padStart(2, "0"); // Add leading zero if needed
	}
	function stopTimer() {
	clearInterval(timer);
	$($('#submitExamForm input')[2]).val('');
	$($('#submitSummExamForm input')[2]).val('');
	$($('#submitFinalsExamForm input')[1]).val('');
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
		var subj_id=id,accnt_id=<?php echo $this->session->userdata('accnt_id');?>, button,active,inactive,request_button;
		var redirect_button;
		$('.subject_title').html(name);
		$.post(base_url+'Main/lesson',{subj_id:id,accnt_id:accnt_id},
					function(result){
						var learnExamData = checkSubjSession(subj_id,accnt_id,0)
						var practiceExamData = checkSubjSession(subj_id,accnt_id,1);//practice exam parameter
						var summativeExamData = checkSubjSession(subj_id,accnt_id,2);//summative exam paramater
						var exam_setData = getExamSettings(subj_id,1);
						var summexam_setData = getExamSettings(subj_id,2);

						active=(learnExamData.length> 0 ? '<button type="button" onclick="practiceExam('+learnExamData[0]['exam_id']+','+subj_id+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button><button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+learnExamData[0]['exam_trial']+'/'+learnExamData[0]['exam_set_trial']+']</span></button>' : '<button type="button" onclick="practiceExam('+practiceExamData[0]['exam_id']+','+subj_id+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button><button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+practiceExamData[0]['exam_trial']+'/'+practiceExamData[0]['exam_set_trial']+']</span></button>');

						inactive='<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+(learnExamData.length>0 ? '<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+learnExamData[0]['exam_trial']+'/'+learnExamData[0]['exam_set_trial']+']</span></button>' : '<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+practiceExamData[0]['exam_trial']+'/'+practiceExamData[0]['exam_set_trial']+']</span></button>');

						request_button=(learnExamData.length>0 ? '<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+
						'<button type="button" onclick="showRequestModal('+learnExamData[0]['exam_id']+')" class="btn btn-danger btn-lg mb-3">Request Additional attempt <i class="fa fa-send-o"></i></button>' : '<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+
						'<button type="button" onclick="showRequestModal('+practiceExamData[0]['exam_id']+')" class="btn btn-danger btn-lg mb-3">Request Additional attempt <i class="fa fa-send-o"></i></button>');

						redirect_button=(learnExamData.length>0 ? '<button type="button" onclick="redirectPage(\''+link +'\','+learnExamData[0]['exam_id']+','+subj_id+',\''+name +'\')" class="btn btn-info btn-lg btn-block">View Learning Material <i class="fa fa-eye"></i></button>' : '<button type="button" onclick="redirectPage(\''+link +'\','+practiceExamData[0]['exam_id']+','+subj_id+',\''+name +'\')" class="btn btn-info btn-lg btn-block">View Learning Material <i class="fa fa-eye"></i></button>');


						//button=learnExamData.length>0 ? Number(practiceExamData[0]['exam_type']) == 1 ? Number(practiceExamData[0]['exam_status']) == 0 ? Number(practiceExamData[0]['exam_set_trial'])> Number(practiceExamData[0]['exam_trial']) ? active : request_button : inactive: inactive : inactive;
						if(learnExamData.length>0){
							if(Number(learnExamData[0]['exam_type'])==1){
									if(Number(learnExamData[0]['exam_set_trial'])> Number(learnExamData[0]['exam_trial'])){
										button=active;
									}else{
										button=request_button;
									}
							}else{
								button=inactive;
							}
						}else{
							if(Number(practiceExamData[0]['exam_type'])==1){
								if(Number(practiceExamData[0]['exam_set_trial'])> Number(practiceExamData[0]['exam_trial'])){
									button=active;
								}else{
									button=request_button;
								}
							}else{
								button=inactive;
							}
						}
						//var sum = Number(data[0]['exam_set_trial']) > Number(data[0]['exam_trial']);
						//alert(sum);
						if(summativeExamData.length>0){
							if(result[0]['ls_status']==0){
								summ_button='<button type="button" onclick=takeSummExam('+summativeExamData[0]['exam_id']+','+subj_id+','+summexam_setData[0]['exam_set_Items']+','+summexam_setData[0]['exam_set_Time']+','+summexam_setData[0]['exam_set_Type']+') class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>';
							}else{
								summ_button='<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i> [Finished]</button>'
							}
						}else{
							summ_button='<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i> [Not Yet Finished]</button>'
						}

						$('#subtopic_details').empty().append('<div id="accordion2" class="according accordion-s2">'+
						'<div class="card"><div class="card-header"><a class="card-link" data-toggle="collapse" href="#accordion21">Learning Material </a>'+
						'</div><div id="accordion21" class="collapse show" data-parent="#accordion2"><div class="card-body">'+redirect_button+
						'</div></div></div>'+
						'<div class="card"><div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion22">Practice Exam</a>'+
						'</div><div id="accordion22" class="collapse" data-parent="#accordion2">'+
						'<div class="card-body practice_buttons">'+button+
						'</div></div></div><div class="card">'+
						'<div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion23">Summative Exam</a></div>'+
						'<div id="accordion23" class="collapse" data-parent="#accordion2"><div class="card-body summative_button">'
						+summ_button+
						'</div></div></div></div>');


			},'json');
	}
	function Load_sub1(id){
			$.post(base_url+'Main/subjects',
					function(result){
					for(var i=1; i<result.length; i++){
						var checks=checkActiveSubj(result[i]['subj_id'],<?php echo $this->session->userdata('accnt_id'); ?>);
						if(checks>0){
						$('#subtopics').append('<button id="subj_id'+result[i]['subj_id']+'" type="button" onclick="ViewSubjStudCont('+result[i]['subj_id']+',\''+result[i]['subj_name'] +'\',\''+result[i]['subj_file'] +'\')" class="list-group-item list-group-item-action">'+result[i]['subj_name']+' ('+result[i]['subj_desc']+')</button>');
						}else{
						$('#subtopics').append('<button id="subj_id'+result[i]['subj_id']+'" disabled type="button" onclick="ViewSubjStudCont('+result[i]['subj_id']+',\''+result[i]['subj_name'] +'\',\''+result[i]['subj_file'] +'\')" class="list-group-item list-group-item-action">'+result[i]['subj_name']+' ('+result[i]['subj_desc']+')</button>');
						}
					}
					renderFinals(<?php echo $this->session->userdata('accnt_id'); ?>);
			},'json');
	}

		function ViewSubjStudCont(id,name,link){
		var subj_id=id,accnt_id=<?php echo $this->session->userdata('accnt_id');?>, button,active,inactive,request_button;
		var redirect_button,summ_button;
		$('.subject_title').html(name);
		$.post(base_url+'Main/lesson',{subj_id:id,accnt_id:accnt_id},
					function(result){
						var learnExamData = checkSubjSession(subj_id,accnt_id,0)
						var practiceExamData = checkSubjSession(subj_id,accnt_id,1);//practice exam parameter
						var summativeExamData = checkSubjSession(subj_id,accnt_id,2);//summative exam paramater
						var exam_setData = getExamSettings(subj_id,1);
						var summexam_setData = getExamSettings(subj_id,2);

						active=(learnExamData.length> 0 ? '<button type="button" onclick="practiceExam('+learnExamData[0]['exam_id']+','+subj_id+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button><button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+learnExamData[0]['exam_trial']+'/'+learnExamData[0]['exam_set_trial']+']</span></button>' : '<button type="button" onclick="practiceExam('+practiceExamData[0]['exam_id']+','+subj_id+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button><button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+practiceExamData[0]['exam_trial']+'/'+practiceExamData[0]['exam_set_trial']+']</span></button>');

						inactive='<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+(learnExamData.length>0 ? '<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+learnExamData[0]['exam_trial']+'/'+learnExamData[0]['exam_set_trial']+']</span></button>' : '<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+practiceExamData[0]['exam_trial']+'/'+practiceExamData[0]['exam_set_trial']+']</span></button>');

						request_button=(learnExamData.length>0 ? '<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+
						'<button type="button" onclick="showRequestModal('+learnExamData[0]['exam_id']+')" class="btn btn-danger btn-lg mb-3">Request Additional attempt <i class="fa fa-send-o"></i></button>' : '<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+
						'<button type="button" onclick="showRequestModal('+practiceExamData[0]['exam_id']+')" class="btn btn-danger btn-lg mb-3">Request Additional attempt <i class="fa fa-send-o"></i></button>');

						redirect_button=(learnExamData.length>0 ? '<button type="button" onclick="redirectPage1(\''+link +'\','+learnExamData[0]['exam_id']+','+subj_id+',\''+name +'\')" class="btn btn-info btn-lg btn-block">View Learning Material <i class="fa fa-eye"></i></button>' : '<button type="button" onclick="redirectPage(\''+link +'\','+practiceExamData[0]['exam_id']+','+subj_id+',\''+name +'\')" class="btn btn-info btn-lg btn-block">View Learning Material <i class="fa fa-eye"></i></button>');


						//button=learnExamData.length>0 ? Number(practiceExamData[0]['exam_type']) == 1 ? Number(practiceExamData[0]['exam_status']) == 0 ? Number(practiceExamData[0]['exam_set_trial'])> Number(practiceExamData[0]['exam_trial']) ? active : request_button : inactive: inactive : inactive;
						if(learnExamData.length>0){
							if(Number(learnExamData[0]['exam_type'])==1){
								if(Number(learnExamData[0]['exam_status'])==0){
									if(Number(learnExamData[0]['exam_set_trial'])> Number(learnExamData[0]['exam_trial'])){
										button=active;
									}else{
										button=request_button;
									}
								}else{
									button=inactive;
								}
							}else{
								button=inactive;
							}
						}else{
							if(Number(practiceExamData[0]['exam_type'])==1){
								if(Number(practiceExamData[0]['exam_status'])==0){
									if(Number(practiceExamData[0]['exam_set_trial'])> Number(practiceExamData[0]['exam_trial'])){
										button=active;
									}else{
										button=request_button;
									}
								}else{
									button=inactive;
								}
							}else{
								button=inactive;
							}
						}
						//var sum = Number(data[0]['exam_set_trial']) > Number(data[0]['exam_trial']);
						//alert(sum);
						if(summativeExamData.length>0){
							if(result[0]['ls_status']==0){
								summ_button='<button type="button" onclick=takeSummExam('+summativeExamData[0]['exam_id']+','+subj_id+','+summexam_setData[0]['exam_set_Items']+','+summexam_setData[0]['exam_set_Time']+','+summexam_setData[0]['exam_set_Type']+') class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>';
							}else{
								summ_button='<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i> [Finished]</button>'
							}
						}else{
							summ_button='<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i> [Not Yet Finished]</button>'
						}

						$('#subtopic_details').empty().append('<div id="accordion2" class="according accordion-s2">'+
						'<div class="card"><div class="card-header"><a class="card-link" data-toggle="collapse" href="#accordion21">Learning Material </a>'+
						'</div><div id="accordion21" class="collapse show" data-parent="#accordion2"><div class="card-body">'+redirect_button+
						'</div></div></div>'+
						'<div class="card"><div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion22">Practice Exam</a>'+
						'</div><div id="accordion22" class="collapse" data-parent="#accordion2">'+
						'<div class="card-body practice_buttons">'+button+
						'</div></div></div><div class="card">'+
						'<div class="card-header"><a class="collapsed card-link" data-toggle="collapse" href="#accordion23">Summative Exam</a></div>'+
						'<div id="accordion23" class="collapse" data-parent="#accordion2"><div class="card-body summative_button">'+summ_button+
						'</div></div></div></div>');


			},'json');
	}


	function redirectPage(page,id,subj_id,name){
		window.open(page, '_blank');
		updateSummativeExamButton(id);
		ViewSubjStud(subj_id,name,page)
	}

	function redirectPage1(page,id,subj_id,name){
		window.open(page, '_blank');
		updateSummativeExamButton(id);
		ViewSubjStudCont(subj_id,name,page)
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

	function checkActiveSubj(subj_id,accnt_id){// get active subjects per student
		var result = $.ajax({
		url:base_url+"Main/activeSubj",
		type:"POST",
		data:{subj_id:subj_id,accnt_id:accnt_id},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;

	}

	function showRequestModal(id){
		$('#requestAttempt_modal').modal('show');
		$('.button_attempt').empty().append('<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'+
											'<button type="button" onclick="submitRequestToProf('+id+')" class="btn btn-primary">Submit request</button>');
	}

	function submitRequestToProf(id){
		$.post(base_url+'Main/requestProf',{exam_id:id},
					function(result){
						alert('Request Sent..');
						$('#requestAttempt_modal').modal('hide');
			},'json');
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
                        '<h4>'+result[i]['subj_name']+'</h4><span id="total_count">(5 of 20)</span>'+
                        '<div class="d-flex flex-row align-items-center question-title"><h3><b>Q.</b></h3>'+
                        '<input type="hidden" value="'+result[i]['testq_id']+'">'+
                        '<input type="hidden" value="'+type+'">'+
						'<input type="hidden" value="">'+
						'<input type="hidden" value="'+test_items+'">'+
						'<input type="hidden" value="'+id['history_id']+'">'+
						'<input type="hidden" value="'+id['score_id']+'">'+
						'<input type="hidden" value="'+exam_id+'">'+
                        '<h5 class="mt-1 ml-2">'+result[i]['testq_0']+'</h5></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input onchange="change(this.value);" type="radio" name="answer'+i+'" value="'+result[i]['testq_1']+'"> <span><b>'+result[i]['testq_1']+'</b></span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="change(this.value);" value="'+result[i]['testq_2']+'"> <span><b>'+result[i]['testq_2']+'</b></span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="change(this.value);" value="'+result[i]['testq_3']+'"> <span><b>'+result[i]['testq_3']+'</b></span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="change(this.value);" value="'+result[i]['testq_4']+'"> <span><b>'+result[i]['testq_4']+'</b></span></label></div>');
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
					var summativeExamData = checkSubjSession(result[0]['subj_id'],<?php echo $this->session->userdata('accnt_id') ?>,2);
					var exam_setData = getExamSettings(result[0]['subj_id'],2);
					$('.practice_buttons').empty().append('<button type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>'+'<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+result[0]['exam_trial']+'/'+result[0]['exam_set_trial']+']</span></button>');
					$('#accordion23').empty().append('<div class="card-body summative_button" >'+
					'<button type="button" onclick=takeSummExam('+result[0]['exam_summ_id']+','+summativeExamData[0]['subj_id']+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+') class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i></button>'+
					'</div>');
			},'json');
		}else{
			$.post(base_url+'Main/getAttempts',{exam_id:exam_id}, function(result){
				var exam_setData = getExamSettings(result[0]['subj_id'],1);
					$('.practice_buttons').empty().append((Number(result[0]['exam_set_trial'])> Number(result[0]['exam_trial']) ? '<button type="button" onclick="practiceExam('+result[0]['exam_id']+','+result[0]['subj_id']+','+exam_setData[0]['exam_set_Items']+','+exam_setData[0]['exam_set_Time']+','+exam_setData[0]['exam_set_Type']+')" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button>' : '<button disabled type="button" class="btn btn-success btn-lg mb-3">Take Exam <i class="fa fa-edit"></i></button><button type="button" onclick="showRequestModal('+exam_id+')" class="btn btn-danger btn-lg mb-3">Request Additional attempt <i class="fa fa-send-o"></i></button>')+'<button disabled type="button" class="btn btn-warning mb-3">Attempts <span class="badge badge-light">['+result[0]['exam_trial']+'/'+result[0]['exam_set_trial']+']</span></button>');
			},'json');
		}
	}

	function takeSummExam(exam_id,subj_id,exam_items,exam_time,exam_type){
		$('#summExam_modal').modal('show');
		$.post(base_url+'Main/getQuestionsExam',{exam_id:exam_id,subj_id:subj_id,test_items:exam_items},
					function(result){
					$('.summ-list').empty();
					countdownTimer(exam_time);
					startTimer();
					var id =recordTestHistory(subj_id,<?php echo $this->session->userdata('accnt_id')?>,2);
					for(var i=0; i<result.length; i++){
						$('.summ-list').append('<div id="question'+count_quest+'" '+(count_quest<1 ? 'style="display: block;"' : 'style="display:none;"')+'>'+
						'<h5>Time Remaining: <b><span class="timer"></span></b></h5>'+
                        '<h4>'+result[i]['subj_name']+'</h4><span id="total_count">(5 of 20)</span>'+
                        '<div class="d-flex flex-row align-items-center question-title"><h3><b>Q.</b></h3>'+
                        '<input type="hidden" value="'+result[i]['testq_id']+'">'+
                        '<input type="hidden" value="'+exam_type+'">'+
						'<input type="hidden" value="">'+
						'<input type="hidden" value="'+exam_items+'">'+
						'<input type="hidden" value="'+id['history_id']+'">'+
						'<input type="hidden" value="'+id['score_id']+'">'+
						'<input type="hidden" value="'+exam_id+'">'+
                        '<h5 class="mt-1 ml-2">'+result[i]['testq_0']+'</h5></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input onchange="summ_change(this.value);" type="radio" name="answer'+i+'" value="'+result[i]['testq_1']+'"> <span><b>'+result[i]['testq_1']+'</b></span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="summ_change(this.value);" value="'+result[i]['testq_2']+'"> <span><b>'+result[i]['testq_2']+'</b></span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="summ_change(this.value);" value="'+result[i]['testq_3']+'"> <span><b>'+result[i]['testq_3']+'</b></span></label></div>'+
                        '<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="summ_change(this.value);" value="'+result[i]['testq_4']+'"> <span><b>'+result[i]['testq_4']+'</b></span></label></div>');
                      count_quest++;
                         }
                         var total_display=total_quest+" of "+count_quest;
                         $('#total_count').html(total_display);
			},'json');

	}

	function getScoreSummative(score_id,exam_id){
      $.post(base_url+'Main/getScore',{score_id:score_id}, function(result){
          var score=result[0]['score'];
          var final= score/count_quest*100;
		  addNewLesson(exam_id); //add new subtopic for student
          if(final>=70){
            $('.summ-list').html('<h2 class="text-center">Your score:'+result[0]['score']+'/'+count_quest+'</h2>'+
              '<h3 class="text-success text-center">You Passed!</h3>');
				//updatePracticeButtons(exam_id,1);//1=passed; 0=failed
          }else{
            $('.summ-list').html('<h2 class="text-center">'+result[0]['score']+'/'+count_quest+'</h2>'+
              '<h3 class="text-danger text-center">You Failed!</h3>');
				//updatePracticeButtons(exam_id,0);
          }
          count_quest=0,prev_quest=0,next_quest=0,total_quest=1;

      },'json');
    }

    function addNewLesson(exam_id){
		$.post(base_url+'Main/addSubTopicToStud',{exam_id:exam_id},
					function(result){
					$('.summative_button').empty().append('<button disabled type="button" class="btn btn-info btn-lg btn-block">Take Summative Exam <i class="fa fa-edit"></i> [Completed]</button>');
					if(result==null){
						renderFinals(<?php echo $this->session->userdata('accnt_id'); ?>);
					}else{
						$("#subj_id"+result['subj_id']+"").prop('disabled',false);
					}

		},'json');
	}

	function renderFinals(accnt_id){
		$.post(base_url+'Main/checkFinals',{accnt_id:accnt_id},
			function(result){
				if(result==false){
				$('#subtopics').append('<button id="finals_subject" onclick="takeFinals('+accnt_id+')" type="button" class="list-group-item list-group-item-action">Final Summative Exam</button>');
				}else if(result==null){
				$('#subtopics').append('<button disabled type="button" class="list-group-item list-group-item-action">Final Summative Exam</button>');
				}

		},'json');
	}

	function takeFinals(accnt_id){
		$('#finalExam_modal').modal('show');
		$.post(base_url+'Main/getFinals',{accnt_id:accnt_id},
					function(result){
					var finals_id=getFinalsID(accnt_id);
					$('.final-list').empty();
					countdownTimer(3600);
					startTimer();
					for(var i=0; i<result.length; i++){
							for(var j=0; j<result[i].length; j++){
								$('.final-list').append('<div id="question'+count_quest+'" '+(count_quest<1 ? 'style="display: block;"' : 'style="display:none;"')+'>'+
								'<h5>Time Remaining: <b><span class="timer"></span></b></h5>'+
								'<h4>'+result[i][j]['subj_name']+'</h4><span id="total_count">(5 of 20)</span>'+
								'<div class="d-flex flex-row align-items-center question-title"><h3><b>Q.</b></h3>'+
								'<input type="hidden" value="'+result[i][j]['testq_id']+'">'+
								'<input type="hidden" value="">'+
								'<input type="hidden" value="'+finals_id[0]['finals_ID']+'">'+
								'<h5 class="mt-1 ml-2">'+result[i][j]['testq_0']+'</h5></div>'+
								'<div class="ans ml-2"><label class="radio"> <input onchange="finals_change(this.value);" type="radio" name="answer'+i+'" value="'+result[i][j]['testq_1']+'"> <span><b>'+result[i][j]['testq_1']+'</b></span></label></div>'+
								'<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="finals_change(this.value);" value="'+result[i][j]['testq_2']+'"> <span><b>'+result[i][j]['testq_2']+'</b></span></label></div>'+
								'<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="finals_change(this.value);" value="'+result[i][j]['testq_3']+'"> <span><b>'+result[i][j]['testq_3']+'</b></span></label></div>'+
								'<div class="ans ml-2"><label class="radio"> <input type="radio" name="answer'+i+'" onchange="finals_change(this.value);" value="'+result[i][j]['testq_4']+'"> <span><b>'+result[i][j]['testq_4']+'</b></span></label></div>');
                      count_quest++;
							}

                         }
                         var total_display=total_quest+" of "+count_quest;
                         $('#total_count').html(total_display);
			},'json');
	}

	function getFinalsID(accnt_id){// get Last Insert ID for finals
		var result = $.ajax({
		url:base_url+"Main/getFinalsID",
		type:"POST",
		data:{accnt_id:accnt_id},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;

	}

	function getScoreFinals(final_id){
      $.post(base_url+'Main/getScoreFinals',{final_id:final_id}, function(result){
          var score=result;
          var final= score/count_quest*100;
          if(final>=70){
            $('.final-list').html('<h2 class="text-center">Your score:'+result+'/'+count_quest+'</h2>'+
              '<h3 class="text-success text-center">You Passed!</h3>');
				//updatePracticeButtons(exam_id,1);//1=passed; 0=failed
          }else{
            $('.final-list').html('<h2 class="text-center">'+result+'/'+count_quest+'</h2>'+
              '<h3 class="text-danger text-center">You Failed!</h3>');
				//updatePracticeButtons(exam_id,0);
          }
          count_quest=0,prev_quest=0,next_quest=0,total_quest=1;
		  $("#finals_subject").prop('disabled',true);

      },'json');
    }

    function viewStudentRequests(id){
			 $('#studPracticeRequestTable').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/getStudPracticeRequest"); ?>",
                    type : 'POST',
					data: {id:id}
             },
             responsive: true,
			 "destroy": true
        } );
	}
	function addIndexToRequest(id){
	$("#form_request").data("index",id);
	}

	function dropButtonStud(accnt_id){
		$.post(base_url+'Main/subjects',
			function(result){
				$('.drop_button').empty();
				for(var i=0; i<result.length; i++){
				$('.drop_button').append('<a class="dropdown-item" data-toggle="modal" data-target="#viewRecordStud" onclick=viewRecordStudHistory('+accnt_id+','+result[i]['subj_id']+',1)>'+result[i]['subj_name']+'</a>');
				}
		},'json');

	}

	function viewRecordStud(accnt_id,subj_id){
		 $('#practiceStud').DataTable( {
            "ajax": {
				url : "<?php echo base_url("Main/getStudPracticeRequest"); ?>",
				type : 'POST',
				data: {th_Type:1,accnt_id:accnt_id,subj_id:subj_id}
             },
             responsive: true,
			 "destroy": true
        } );

		  $('#summativeStud').DataTable( {
            "ajax": {
				url : "<?php echo base_url("Main/getStudPracticeRequest"); ?>",
				type : 'POST',
				data: {th_Type:2,accnt_id:accnt_id,subj_id}
             },
             responsive: true,
			 "destroy": true
        } );
	}

	function updateAccountForm(id){
		$("#edit_account").data("index",id);
		$.post(base_url+'Main/getStudDetails',{id:id},
			function(result){
				$($("#edit_account input")[0]).val(result[0]['accnt_name']);
				$($("#edit_account input")[1]).val(result[0]['accnt_user']);
				$($("#edit_account input")[2]).val(result[0]['accnt_pass']);
		},'json');
	}

	function getChartData(subj,score,type){
		var result = $.ajax({
		url:base_url+"Main/getPassFail",
		type:"POST",
		data:{subj:subj,score:score,type:type},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;

	}

	function getChartDataSummative(subj,type){
		var result = $.ajax({
		url:base_url+"Main/getPassFailSummative",
		type:"POST",
		data:{subj:subj,type:type},
		dataType:"json",
		async:false
	}).responseJSON;
	return result;

	}

	function renderSubjChart(id){
		chart.destroy();
		var pass=getChartData(id,7,1);
		var fail=getChartData(id,6,1);
		var ctx = $("#subjChart");
		 chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'pie',
        // The data for our dataset
        data: {
            labels: ["Passed", "Failed"],
            datasets: [{
                backgroundColor: [
                    "green",
					"red"
                ],
                borderColor: '#fff',
                data: [Number(pass), Number(fail)],
            }]
        },
        // Configuration options go here
        options: {
            legend: {
                display: true
            },
            animation: {
                easing: "easeInOutBack"
            }
        }
    });
		 renderSubjChart1(id);
	}

	function renderSubjChart1(id){
		chart1.destroy();
		var pass=getChartDataSummative(id,2);
		var fail=getChartDataSummative(id,2);
		var ctx = $("#subjChart1");
		var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'pie',
        // The data for our dataset
        data: {
            labels: ["Passed", "Failed"],
            datasets: [{
                backgroundColor: [
                    "green",
					"red"
                ],
                borderColor: '#fff',
                data: [Number(pass['passed']), Number(fail['failed'])],
            }]
        },
        // Configuration options go here
        options: {
            legend: {
                display: true
            },
            animation: {
                easing: "easeInOutBack"
            }
        }
    });
	}

	function viewRecordStudHistory(subj_id,accnt_id){
		$('#studRecordPractice').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/testHistory"); ?>",
                    type : 'POST',
					data: {subj_id:subj_id,accnt_id:accnt_id,type:1}
             },
             responsive: true,
			  "destroy": true
        } );

		$('#studRecordSummative').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/testHistory1"); ?>",
                    type : 'POST',
					data: {subj_id:subj_id,accnt_id:accnt_id,type:2}
             },
             responsive: true,
			  "destroy": true
        } );

	}


	function viewRecordStudHistoryQuestions(th_id,type){
		$('#studRecordHistPractice').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/testHistoryQuestions"); ?>",
                    type : 'POST',
					data: {th_id:th_id,type:type}
             },
             responsive: true,
			  "destroy": true
        } );

	}

	function viewRecordStudHistoryQuestions1(th_id,type){
		$('#studRecordHistSummative').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/testHistoryQuestions"); ?>",
                    type : 'POST',
					data: {th_id:th_id,type:type}
             },
             responsive: true,
			  "destroy": true
        } );

	}

	function viewStudSubj(){
		$('#students_subj').DataTable( {
            "ajax": {
                    url : "<?php echo base_url("Main/viewStudSubj"); ?>",
                    type : 'POST'
             },
             responsive: true,
			  "destroy": true
        } );

	}


    </script>
</body>

</html>
