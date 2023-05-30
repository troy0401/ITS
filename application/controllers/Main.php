<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

	function __construct(){
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->helper('date');
        $this->load->library('session');
        $this->load->model('model');
    }

    //--------------------------->views---------------------------------------------
	  public function Subject(){
		$acc_type = $this->session->userdata('accnt_type');
		 if ($acc_type == 1) {
        $this->load->view('includes/header');
        $this->load->view('includes/sidebar');
        $this->load->view('includes/topbar');
		$this->load->view('subject');
		$this->load->view('includes/footer');
		 }else{
			 redirect(base_url('Main/Login'));
		}

    }

    public function Records(){
		$acc_type = $this->session->userdata('accnt_type');
		 if ($acc_type == 1) {
        $this->load->view('includes/header');
        $this->load->view('includes/sidebar');
        $this->load->view('includes/topbar');
		$this->load->view('records');
		$this->load->view('includes/footer');
		 }else{
			 redirect(base_url('Main/Login'));
		}

    }

    public function Index(){
		if (!$this->session->has_userdata('accnt_type')){
				redirect('Main/Login');
			}else{
			$acc_type = $this->session->userdata('accnt_type');
			if ($acc_type == 2) {
				redirect(base_url('Main/Student'));
			}else{
				redirect(base_url('Main/Subject'));
			}
		}
	}

	public function Student(){
		if (!$this->session->has_userdata('accnt_type')){
				redirect('Main/Login');
			}else{
				$acc_type = $this->session->userdata('accnt_type');
				if ($acc_type == 2) {
				$this->load->view('includes/header');
				$this->load->view('includes/sidebar');
				$this->load->view('includes/topbar');
				$this->load->view('student');
				$this->load->view('includes/footer');
				}else{
				redirect(base_url('Main/Login'));
				}
			}

    }

      public function Login(){
		$this->load->view('login');
    }

     public function Register(){
		$this->load->view('register');
    }

    //--------------------------->functions------------------------------------------
	public function add_account(){
		$post = $this->input->post('data');
        $name=$post[0];
        $email=$post[1];
        $pass=$post[2];
        $data = array(
            'accnt_user'=>$email,
            'accnt_pass'=>password_hash($pass, PASSWORD_DEFAULT),
            'accnt_name'=>$name,
			'accnt_type'=>2
        );
        if($this->model->insert_into("account", $data)){
           echo json_encode(true);
        }
    }

	public function login_function(){
		 $post = $this->input->post('data');
        $un=$post[0];
        $pass=$post[1];
        $count=$this->model->login_user($un);
        if($count>0){
            $acc=$this->model->select_table_with_id2("account","accnt_user",$un);
            foreach($acc as $ac){
                if(password_verify($pass,$ac->accnt_pass))
                {
                    $fetch=$this->model->select_table_with_id2("account","accnt_id",$ac->accnt_id);
                    foreach($fetch as $a){
                        $acc_id = $a->accnt_id;
                        $accnt = $a->accnt_name;
						$type = $a->accnt_type;

                    }
                    $newdata = array(
					  'accnt_id'=>$acc_id,
                      'accnt_name'=>$accnt,
					  'accnt_type'=>$type
                    );

                    //$this->model->update_where('accounts', $data, 'account_id', $acc_id);
                    $this->session->set_userdata($newdata);
                    //echo json_encode($newdata);
                    //redirect(base_url().'masterfile/dashboard/');
					echo json_encode($ac->accnt_type);
                }
            }
		}else{
                    echo json_encode(false);
                }
	}
       public function Add_Subj(){
		//$minutes=$this->input->post('mod_test_time')*60;
		$data = $this->input->post('data');
        $data = array(
                    "subj_name"=>$data[0],
					"subj_desc"=>$data[1],
					"subj_file"=>$data[2]
                );
         $id=$this->model->insert_into("subject", $data);
		 $practice=array(
					"exam_set_Type"=>1,//practice
					"exam_set_Time"=>10*60,
					"exam_set_Items"=>10,
					"subj_id"=>$id
		);
		 $summative=array(
					"exam_set_Type"=>2,//summative
					"exam_set_Time"=>20*60,
					"exam_set_Items"=>30,
					"subj_id"=>$id
		);
		 $this->model->insert_into("exam_settings", $practice);
		 if($this->model->insert_into("exam_settings", $summative))
		 {
           echo json_encode(true);
		 }
    }

    public function add_Quest(){
		//$minutes=$this->input->post('mod_test_time')*60;
		$data = $this->input->post('data');
		$id	=	$this->input->post('id');
        $data = array(
                    "testq_0"=>$data[0],
					"testq_1"=>$data[3],
					"testq_2"=>$data[4],
					"testq_3"=>$data[5],
					"testq_4"=>$data[6],
					"testq_ans"=>$data[1],
					"testq_hint"=>$data[2],
					"subj_id"=>$id

                );
		 if($this->model->insert_into("test_quest", $data))
		 {
           echo json_encode(true);
		 }
    }

      public function getSubj(){

            $subj = $this->model->select_table_with_id("subject","subj_id",$this->input->post('id'));
            $data=array();
            foreach($subj->result() as $s) {

                 $data[] = array(
					"subj_name"  => $s->subj_name,
					"subj_desc"  => $s->subj_desc,
					"subj_file" => $s->subj_file

                 );
              }
          echo json_encode($data);
     }

     public function getQuest(){

            $quest = $this->model->select_table_with_id("test_quest","testq_id",$this->input->post('id'));
            $data=array();
            foreach($quest->result() as $q) {

                 $data[] = array(
					"testq_0"  => $q->testq_0,
					"testq_1"  => $q->testq_1,
					"testq_2"  => $q->testq_2,
					"testq_3"  => $q->testq_3,
					"testq_4"  => $q->testq_4,
					"testq_ans"  => $q->testq_ans,
					"testq_hint"  => $q->testq_hint

                 );
              }
          echo json_encode($data);
     }



     public function editSubj(){

	  $post = $this->input->post('data');
      $data = array(
            'subj_name'=>$post[0],
            'subj_desc'=>$post[1],
			'subj_file'=>$post[2]
          );

    if($this->model->update_where('subject', $data, 'subj_id', $this->input->post('id'))){
           echo json_encode(true);
        }
	}

	 public function editQuest(){

	  $post = $this->input->post('data');
      $data = array(
            'testq_0'=>$post[0],
            'testq_1'=>$post[1],
			'testq_hint'=>$post[2],
			'testq_1'=>$post[3],
			'testq_2'=>$post[4],
			'testq_3'=>$post[5],
			'testq_4'=>$post[6]

          );

    if($this->model->update_where('test_quest', $data, 'testq_id', $this->input->post('id'))){
           echo json_encode(true);
        }
	}

	public function students()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $stud = $this->model->select_table_with_id("account","accnt_type",2);

          $data = array();

          foreach($stud->result() as $s) {
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    $s->accnt_name,
					'<div class="btn-group" role="group">
                                                <button onclick="dropButtonStud('.$s->accnt_id.');" id="btnGroupDrop" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                See Actions
                                            </button>
                                            <div class="dropdown-menu drop_button" aria-labelledby="btnGroupDrop1">
                                            </div>
                                        </div>'
      );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $stud->num_rows(),
                 "recordsFiltered" => $stud->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function studentExams()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $record = $this->model->select_tri_column("test_history","accnt_id",$this->input->post('accnt_id'),"subj_id",$this->input->post('subj_id'),"th_Type",$this->input->post('th_Type'));

          $data = array();

          foreach($record->result() as $rec) {
			  $test_history=$this->model->select_history_quest($rec->th_ID);
			  foreach($test_history->result() as $th){
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    $s->accnt_name,
					'<div class="btn-group" role="group">
                                                <button onclick="dropButtonStud('.$s->accnt_id.');" id="btnGroupDrop" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                See Actions
                                            </button>
                                            <div class="dropdown-menu drop_button" aria-labelledby="btnGroupDrop1">
                                            </div>
                                        </div>'

							);
			  }
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $stud->num_rows(),
                 "recordsFiltered" => $stud->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function subject_list()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $sub = $this->model->select_all($this->input->post("table"));

          $data = array();

          foreach($sub->result() as $r) {
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    $r->subj_name,
                    $r->subj_desc,
                    ($r->subj_file=='' ? 'No link found' : $r->subj_file),
					'<div class="btn-group" role="group">
                                                <button id="btnGroupDrop" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                See Actions
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                <a class="dropdown-item" data-toggle="modal" data-target="#ViewSubj" onclick=ViewSubj('.$r->subj_id.')>View Subject</a>
                                                <a class="dropdown-item" onclick="viewStudentRequests('.$r->subj_id.')" data-toggle="modal" data-target="#viewPracticeRequest">View requesting attempts</a>
                                                <a class="dropdown-item"  data-toggle="modal" data-target="#editSubj" onclick=editSubj('.$r->subj_id.')>Edit</a>
                                            </div>
                                        </div>'
      );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $sub->num_rows(),
                 "recordsFiltered" => $sub->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function quest_list()//List of Questionaires
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $quest = $this->model->select_table_with_id($this->input->post("table"),$this->input->post("column"),$this->input->post("id"));

          $data = array();
		$i=1;
          foreach($quest->result() as $q) {
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
					$i++,
                    $q->testq_0,
					'<a data-toggle="modal" onclick=editQuest('.$q->testq_id.')  data-target="#editQuest_modal" class="btn btn-warning btn-circle btn-sm" title="Edit">
					<i class="fa fa-edit"></i>
					</a>'
      );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $quest->num_rows(),
                 "recordsFiltered" => $quest->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

      public function exam_set()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $exam_set = $this->model->select_table_with_id($this->input->post("table"),$this->input->post("column"),$this->input->post("id"));

          $data = array();
          foreach($exam_set->result() as $es) {
			  $minutes=floor(((int)$es->exam_set_Time / 60) % 60);
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    ($es->exam_set_Type == 1 ? "Practice Exam" : "Summative Exam"),
					$minutes,
					$es->exam_set_Items,
					'<button type="button" data-toggle="modal" onclick="editExamSett('.$es->exam_set_ID.')" data-target="#editExamSett_modal" class="btn btn-rounded btn-info mb-3"><i class="fa fa-edit"></i></button>'
      );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $exam_set->num_rows(),
                 "recordsFiltered" => $exam_set->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function getStudPracticeRequest()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $req = $this->model->select_request_table($this->input->post('id'));

          $data = array();

          foreach($req->result() as $r) {
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    $r->accnt_name,
                    $r->req_message,
					'<button type="button" data-toggle="modal" onclick="addIndexToRequest('.$r->exam_id.')" data-target="#studRequest_modal" class="btn btn-rounded btn-info mb-3"><i class="fa fa-edit"></i></button>'
      );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $req->num_rows(),
                 "recordsFiltered" => $req->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

      public function getExamSett(){

            $sett = $this->model->select_table_with_id("exam_settings","exam_set_ID",$this->input->post('id'));
            $data=array();
            foreach($sett->result() as $s) {
				$minutes=floor(((int)$s->exam_set_Time / 60) % 60);

                 $data[] = array(
					"exam_set_Type"  => $s->exam_set_Type,
					"exam_set_Time"  => $minutes,
					"exam_set_Items"  => $s->exam_set_Items

                 );
              }
          echo json_encode($data);
     }

    public function editExamSett(){

		$post = $this->input->post('data');
		$data = array(
            'exam_set_Time'=>$post[1]*60,
			'exam_set_Items'=>$post[2]
		);

		if($this->model->update_where('exam_settings', $data, 'exam_set_ID', $this->input->post('id'))){
           echo json_encode(true);
        }
	}

	public function subjects(){
		$sub=$this->model->select_all("subject");
		echo json_encode($sub->result());
	}

	public function lesson(){
		$sub=$this->model->select_dual_column("lesson_status","subj_id",$this->input->post('subj_id'),"accnt_id",$this->input->post('accnt_id'));
		echo json_encode($sub->result());
	}

	public function examStatus(){
		$sub=$this->model->select_tri_column("exam","subj_id",$this->input->post('subj_id'),"accnt_id",$this->input->post('accnt_id'),"exam_type",$this->input->post('exam_type'));
		echo json_encode($sub->result());
	}

	public function examSettings(){
		$exam_set=$this->model->select_dual_column("exam_settings","subj_id",$this->input->post('subj_id'),"exam_set_Type",$this->input->post('exam_setType'));
		echo json_encode($exam_set->result());
	}

	public function activeSubj(){
		$subj=$this->model->select_dual_column("exam","subj_id",$this->input->post('subj_id'),"accnt_id",$this->input->post('accnt_id'));
		echo json_encode($subj->num_rows());
	}

	public function CheckLsExamTbl(){
		$chk=$this->model->select_dual_column("exam","subj_id",$this->input->post('subj_id'),"accnt_id",$this->input->post('accnt_id'));
		if($chk->num_rows() < 1) {
			$exam_data = array(
                    "subj_id"=>$this->input->post('subj_id'),
					"accnt_id"=>$this->input->post('accnt_id'),
					"exam_type"=>0,
					"exam_trial"=>0,
					"exam_set_trial"=>10
                );
			$lesson_data = array(
                    "subj_id"=>$this->input->post('subj_id'),
					"accnt_id"=>$this->input->post('accnt_id'),
					"ls_status"=>0
                );
			$this->model->insert_into("exam", $exam_data);
			$this->model->insert_into("lesson_status", $lesson_data);
		}
	}

	public function updateExamTableSumm(){
		$data = array(
                                'exam_type'=>1
                        );
		$this->model->update_where('exam', $data, 'exam_id', $this->input->post('exam_id'));
	}

	public function getQuestionsExam(){
		$check_trial=$this->model->select_table_with_id("exam","exam_id",$this->input->post('exam_id'));
		$trial=0;
		foreach($check_trial->result() as $ct){
			$trial=$ct->exam_trial;
		}
		$change_trial = $trial + 1;
		$data = array('exam_trial'=>$change_trial);
		$this->model->update_where('exam', $data, 'exam_id', $this->input->post('exam_id'));
		$quests=$this->model->test_questions($this->input->post('subj_id'),$this->input->post('test_items'));
		echo json_encode($quests->result());
	}

	public function recordTestHistory(){
	$test_history=array(
			"th_Type"=>$this->input->post('exam_type'),
			"subj_id"=>$this->input->post('subj_id'),
			"accnt_id"=>$this->input->post('accnt_id')
		);
	$score_data=array(
			"subj_id"=>$this->input->post('subj_id'),
			"accnt_id"=>$this->input->post('accnt_id'),
			"score_type"=>$this->input->post('exam_type')
		);
		$history_id=$this->model->insert_into("test_history", $test_history);
		$score_id=$this->model->insert_into("scores", $score_data);
		$data=array(
				"history_id"=>$history_id,
				"score_id"=>$score_id
		);
		echo json_encode($data);
	}

	public function submitAnswer(){
		$exam_ans = array(
			'testr_StudAns'=>$this->input->post('ans'),
			'testr_TimeQuest'=>$this->input->post('duration'),
			'testr_Type'=>$this->input->post('test_Type'),
			'testq_id'=>$this->input->post('testq_id'),
			'accnt_id'=>$this->session->userdata('accnt_id'),
			'th_ID'=>$this->input->post('history_id'),
			'score_ID'=>$this->input->post('score_id')
		);
		$id=$this->model->insert_into("test_report", $exam_ans);
		$qry=$this->model->select_table_with_id("test_quest","testq_id",$this->input->post('testq_id'));
		foreach($qry->result() as $q){
			$result=0;
			if($this->input->post('ans')==$q->testq_ans){
				$result=1;
				$sc_qry=$this->model->select_table_with_id("scores","score_id",$this->input->post('score_id'));
				foreach($sc_qry->result() as $sq){
					$score=$sq->score + 1;
					$data_score = array(
						'score'=>$score,
						'num_of_items'=>$this->input->post('test_items')
					);
					$this->model->update_where('scores', $data_score, 'score_id', $this->input->post('score_id'));
				}
			}else{
				$result=2;
			}
		$data = array('testr_Status'=>$result);
		$this->model->update_where('test_report', $data, 'testr_ID', $id);
		}
		echo json_encode(true);
	}

	public function getScore(){
		$score=$this->model->select_table_with_id("scores","score_id",$this->input->post('score_id'));
		echo json_encode($score->result());
	}

	public function updatePracticeStatus(){
		$data_score = array(
						'exam_status'=>$this->input->post('exam_status')
					);
		$this->model->update_where('exam', $data_score, 'exam_id', $this->input->post('exam_id'));
		$data=$this->model->select_table_with_id("exam","exam_id",$this->input->post('exam_id'));
		$new_id;
		foreach($data->result() as $d){
			$summ=array(
				"subj_id"=>$d->subj_id,
				"accnt_id"=>$d->accnt_id,
				"exam_type"=>2,
			   "exam_status"=>0,
			   "exam_trial"=>0,
			   "exam_set_trial"=>1
			);
			$new_id=$this->model->insert_into("exam", $summ);
		}

		foreach($data->result() as $old_exam){
			$new_data[]=array(
					"exam_trial"=>$old_exam->exam_trial,
					"exam_set_trial"=>$old_exam->exam_set_trial,
					"exam_summ_id"=>$new_id,
					"subj_id"=>$old_exam->subj_id
			);
		}
		echo json_encode($new_data);
	}

	public function getAttempts(){
		$data=$this->model->select_table_with_id("exam","exam_id",$this->input->post('exam_id'));
		echo json_encode($data->result());
	}

	public function requestProf(){
		$data=array(
				"exam_id"=>$this->input->post('exam_id'),
				"req_message"=>"Requesting additional attempt"
			);
			$this->model->insert_into("requests", $data);
			echo json_encode(true);
	}

	public function addSubTopicToStud(){
		$sub=$this->model->select_all("subject");
		$count_sub=$sub->num_rows();

		$check_sub=$this->model->select_table_with_id("exam","exam_type","2");
		$count_finished=$check_sub->num_rows();
		$newSub_id;
			$oldSub_id;
			$finished_sub=$this->model->select_table_with_id("exam","exam_id",$this->input->post('exam_id'));
			foreach($finished_sub->result() as $fs){
				$newSub_id=$fs->subj_id + 1;
				$oldSub_id=$fs->subj_id;
			}
		if($count_sub > $count_finished){
			$this->model->update_where_dual_column('lesson_status', 'ls_status', '1', 'subj_id', $oldSub_id, 'accnt_id', $this->session->userdata('accnt_id'));
			$this->model->update_where_dual_column('exam', 'exam_status', '1', 'subj_id', $oldSub_id, 'accnt_id', $this->session->userdata('accnt_id'));

			$data=array(
				"subj_id"=>$newSub_id,
				"accnt_id"=>$this->session->userdata('accnt_id'),
				"exam_type"=>0,
				"exam_status"=>0,
				"exam_trial"=>0,
				"exam_set_trial"=>10

			);
			$lesson_data = array(
                    "subj_id"=>$newSub_id,
					"accnt_id"=>$this->session->userdata('accnt_id'),
					"ls_status"=>0
                );
			$this->model->insert_into("exam", $data);
			$this->model->insert_into("lesson_status", $lesson_data);

		}else{
			$this->model->update_where_dual_column('lesson_status', 'ls_status', '1', 'subj_id', $oldSub_id, 'accnt_id', $this->session->userdata('accnt_id'));
			$this->model->update_where_dual_column('exam', 'exam_status', '1', 'subj_id', $oldSub_id, 'accnt_id', $this->session->userdata('accnt_id'));
			$data=null;

		}

		echo json_encode($data);
	}

	public function checkFinals(){
		$count_subject=$this->model->select_all("subject");
		$countSubs=$count_subject->num_rows();

		$count_finished=$this->model->select_tri_column("exam","accnt_id",$this->input->post('accnt_id'),"exam_type",2,"exam_status",1);
		$fin=$count_finished->num_rows();

		if($countSubs>$fin){
			$data=true;

		}else{

			$checkFinalsHist=$this->model->select_table_with_id("finals","accnt_id",$this->input->post('accnt_id'));
			$countFinals=$checkFinalsHist->num_rows();
			if($countFinals>0){
				$data=null;
			}else{
				$data=false;
			}

		}

		echo json_encode($data);

	}

	public function getFinals(){
		$finals_data = array("accnt_id"=>$this->input->post('accnt_id'));
		$id=$this->model->insert_into("finals", $finals_data);
		$data = array();
		$subs=$this->model->select_all("subject");
		foreach($subs->result() as $s){
			$quests=$this->model->select_final_quest($s->subj_id,10);
			array_push($data,$quests->result());
		}
		echo json_encode($data);
	}

	public function getFinalsID(){
		$id=$this->model->select_table_with_id("finals","accnt_id",$this->input->post('accnt_id'));
		echo json_encode($id->result());
	}

	public function submitFinalsAnswer(){
		$exam_ans = array(
			'fr_studAns'=>$this->input->post('ans'),
			'fr_TimeQuest'=>$this->input->post('duration'),
			'testq_id'=>$this->input->post('testq_id'),
			'accnt_id'=>$this->input->post('accnt_id'),
			'finals_ID'=>$this->input->post('final_id')
		);
		$id=$this->model->insert_into("finals_report", $exam_ans);
		$qry=$this->model->select_table_with_id("test_quest","testq_id",$this->input->post('testq_id'));
		$result;
		foreach($qry->result() as $q){
			if($this->input->post('ans')==$q->testq_ans){
				$result=1;
			}else{
				$result=2;
			}
		$data = array('fr_testStat'=>$result);
		$this->model->update_where('finals_report', $data, 'fr_ID', $id);
		}
		echo json_encode(true);
	}

	public function getScoreFinals(){
		$getScore=$this->model->select_dual_column("finals_report","finals_ID",$this->input->post('final_id'),"fr_testStat",1);

		echo json_encode($getScore->num_rows());

	}

	public function updateRequest(){
		$post = $this->input->post('data');
		$prev_attempt=0;
		$get=$this->model->select_table_with_id("exam","exam_id",$this->input->post('id'));
		foreach($get->result() as $g){
			$prev_attempt=$g->exam_set_trial;
		}
		$add=$post[0] + $prev_attempt;

		$data = array('exam_set_trial'=>$add);
		$this->model->update_where('exam', $data, 'exam_id', $this->input->post('id'));
		$this->model->delete_where("requests","exam_id",$this->input->post('id'));
		echo json_encode(true);
	}

	public function Logout(){
    $data = array(
					'accnt_id'=>'',
					'accnt_name'=>'',
					'accnt_type'=>''
                    );
    $this->session->unset_userdata($data);
    $this->session->sess_destroy();
    redirect(base_url('Main/Login'));
   }

}
