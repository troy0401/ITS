<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Controller extends CI_Controller {

    function __construct(){
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->helper('date');
        $this->load->library('session');
        $this->load->model('model');
    }
    
    public function Login()
    {   
        if ($this->session->userdata('account_sessions') == 1) {
            if($this->session->userdata('acc_type')=='student'){  
                $this->load->view('admin/includes/header');
                $this->load->view('admin/includes/sidebar_student');
                $this->load->view('admin/user-student');
            } else{
                $this->load->view('admin/includes/header');
                $this->load->view('admin/includes/admin_sidebar');
                $this->load->view('admin/index');
            }
        }
        else{
            $this->load->view('includes/header');
            $this->load->view('login');
            $this->load->view('includes/footer');
        }
    }

    public function Admin(){
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Academic Section' || $acc_type == 'Non-Academic Section' || $acc_type == 'Medical Section'|| $acc_type == 'Registrar Section' || $acc_type == 'Admin Section') {
            $this->load->view('admin/includes/header');
            $this->load->view('admin/includes/admin_sidebar');
            $this->load->view('admin/index');
        }
        else{
            redirect(base_url('Controller/.'));
        }
    }

    public function Students(){
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Registrar Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/students');
        }
        else{
            redirect(base_url('Controller/.'));
        } 
    }

    public function StudentsRoster(){
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Academic Section' || $acc_type == 'Non-Academic Section' || $acc_type == 'Medical Section' || $acc_type == 'Admin Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/studentsroster');
        }
        else{
            redirect(base_url('Controller/.'));
        }
    }

    public function StudentArchive(){
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Registrar Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/studentarchive');
        }
        else{
            redirect(base_url('Controller/.'));
        }
    }

    public function Admin_user_account(){
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Admin Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/admin_account');
        }
        else{
            redirect(base_url('Controller/.'));
        } 
    }

    public function DailyAttendance(){
        $this->load->view('admin/includes/header');
        $this->load->view('admin/includes/admin_sidebar');
        $this->load->view('admin/dailyattendance');

    }

    public function StudentApproval(){
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Registrar Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/studentapproval');
        }
        else{
            redirect(base_url('Controller/.'));
        } 
    }

    public function login_function(){
        $username=$this->input->post('email');
        $password=$this->input->post('password');
        $count=$this->model->login_user($username);
        if($count>0){
            $acc=$this->model->users($username);
            foreach($acc as $ac){
                if(password_verify($password,$ac->password))
                {
                  if (empty($this->model->select_personalinfo($ac->account_id))) {
                      $fetch = $this->model->select_account($ac->account_id);
                      foreach($fetch as $a){
                        $acc_id = $a->account_id;
                        $course_id = $a->course_id;
                        $course_type = $a->course_type;
                        $acc_type = $a->acc_type;
                        $position = $a->position;
                        $approval = $a->approval;
                        $form = $a->form;
                        $rank = $a->rank;
                        $email = $a->email;
                        $account_status = $a->account_status;
                        $acc_type = $a->acc_type;
                        $name = $a->name;
                        $fname = $a->f_name;
                        $mname = $a->m_name;
                        $lname = $a->l_name;
                        $pic=$a->acct_img;
                    }
                    $newdata = array(
                       'acc_id'=> $acc_id,
                       'rank'=> $rank,
                       'course_id'=> $course_id,
                       'course_type'=> $course_type,
                       'acc_type'=> $acc_type,
                       'approval'=> $approval,
                       'position'=> $position,
                       'form'=> $form,
                       'email'=> $email,
                       'account_status'=> $account_status,
                       'acc_type'=> $acc_type,
                       'name'=> $name,
                       'fname'=> $fname,
                       'mname'=> $mname,
                       'lname'=> $lname,
                       'account_sessions'=>1,
                       'pic'=>$pic
                    );

                  } else { 
                    $fetch=$this->model->select_personalinfo($ac->account_id);
                    foreach($fetch as $a){
                        $acc_id = $a->account_id;
                        $archive = $a->archive;
                        $birthdate = $a->birthdate;
                        $birthplace = $a->birthplace;
                        $address = $a->address;
                        $class = $a->class;
                        $company = $a->company;
                        $badge_no = $a->badge_no;
                        $gender = $a->gender;
                        $age = $a->age;
                        $civil_status = $a->civil_status;
                        $religion = $a->religion;
                        $contact_num = $a->contact_num;
                        $blood_type = $a->blood_type;
                        $weight = $a->weight;
                        $height = $a->height;
                        $ethnic = $a->ethnic;
                        $eligibility = $a->eligibility;
                        $rating = $a->rating;
                        $skill = $a->skill;
                        $unit = $a->unit;
                        $sencondary_school = $a->sencondary_school;
                        $vocational_course = $a->vocational_course;
                        $vocational_school = $a->vocational_school;
                        $vocational_year = $a->vocational_year;
                        $baccalaureate_course = $a->baccalaureate_course;
                        $baccalaureate_school = $a->baccalaureate_school;
                        $baccalaureate_year = $a->baccalaureate_year;
                        $masteral_course = $a->masteral_course;
                        $masteral_school = $a->masteral_school;
                        $masteral_year = $a->masteral_year;
                        $masteral_unit_earned = $a->masteral_unit_earned;
                        $doctoral_course = $a->doctoral_course;
                        $doctoral_school = $a->doctoral_school;
                        $doctoral_year = $a->doctoral_year;
                        $doctoral_unit_earned = $a->doctoral_unit_earned;
                        $mother_name = $a->mother_name;
                        $mother_address = $a->mother_address;
                        $mother_contact = $a->mother_contact;
                        $father_name = $a->father_name;
                        $father_address = $a->father_address;
                        $father_contact = $a->father_contact;
                        $spouse_name = $a->spouse_name;
                        $spouse_address = $a->spouse_address;
                        $spouse_contact = $a->spouse_contact;
                        $emergency_contact_person = $a->emergency_contact_person;
                        $emergency_relation = $a->emergency_relation;
                        $emergency_contact = $a->emergency_contact;
                        $emergency_address = $a->emergency_address;
                        $course_id = $a->course_id;
                        $course_type = $a->course_type;
                        $approval = $a->approval;
                        $form = $a->form;
                        $rank = $a->rank;
                        $email = $a->email;
                        $account_status = $a->account_status;
                        $acc_type = $a->acc_type;
                        $name = $a->name;
                        $fname = $a->f_name;
                        $mname = $a->m_name;
                        $lname = $a->l_name;
                        $pic=$a->acct_img;
                        $recom_letter=$a->recom_letter;
                        $cert_nonpending=$a->cert_nonpending;
                        $ecg=$a->ecg;
                        $pins_spo_elig=$a->pins_spo_elig;
                        $train_diploma=$a->train_diploma;
                        $decla_grad=$a->decla_grad;
                        $f_o_merit=$a->f_o_merit;
                        $col_diploma=$a->col_diploma;
                        $col_tor=$a->col_tor;
                        $prom_order=$a->prom_order;



                    }
                    $newdata = array(
                      'archive'=>$archive,
                      'birthdate'=>$birthdate,
                      'birthplace'=>$birthplace,
                      'address'=>$address,
                      'birthdate'=>$birthdate,
                      'class'=>$class,
                      'company'=>$company,
                      'rank'=>$rank,
                      'badge_no'=>$badge_no,
                      'gender'=>$gender,
                      'age'=>$age,
                      'civil_status'=>$civil_status,
                      'religion'=>$religion,
                      'contact_num'=>$contact_num,
                      'blood_type'=>$blood_type,
                      'weight'=>$weight,
                      'height'=>$height,
                      'ethnic'=>$ethnic,
                      'eligibility'=>$eligibility,
                      'rating'=>$rating,
                      'skill'=>$skill,
                      'unit'=>$unit,
                      'sencondary_school'=>$sencondary_school,
                      'vocational_course'=>$vocational_course,
                      'vocational_school'=>$vocational_school,
                      'vocational_year'=>$vocational_year,
                      'baccalaureate_course'=>$baccalaureate_course,
                      'baccalaureate_school'=>$baccalaureate_school,
                      'baccalaureate_year'=>$baccalaureate_year,
                      'masteral_course'=>$masteral_course,
                      'masteral_school'=>$masteral_school,
                      'masteral_year'=>$masteral_year,
                      'masteral_unit_earned'=>$masteral_unit_earned,
                      'doctoral_course'=>$doctoral_course,
                      'doctoral_school'=>$doctoral_school,
                      'doctoral_year'=>$doctoral_year,
                      'doctoral_unit_earned'=>$doctoral_unit_earned,
                      'mother_name'=>$mother_name,
                      'mother_address'=>$mother_address,
                      'mother_contact'=>$mother_contact,
                      'father_name'=>$father_name,
                      'father_contact'=>$father_contact,
                      'father_address'=>$father_address,
                      'spouse_name'=>$spouse_name,
                      'spouse_address'=>$spouse_address,
                      'spouse_contact'=>$spouse_contact,
                      'emergency_contact_person'=>$emergency_contact_person,
                      'emergency_relation'=>$emergency_relation,
                      'emergency_contact'=>$emergency_contact,
                      'emergency_address'=>$emergency_address,

                       'acc_id'=> $acc_id,
                       'course_id'=> $course_id,
                       'course_type'=> $course_type,
                       'approval'=> $approval,
                       'form'=> $form,
                       'email'=> $email,
                       'account_status'=> $account_status,
                       'acc_type'=> $acc_type,
                       'name'=> $name,
                       'fname'=> $fname,
                       'mname'=> $mname,
                       'lname'=> $lname,
                       'account_sessions'=>1,
                       'pic'=>$pic,
                       'recom_letter'=>$recom_letter,
                        'cert_nonpending'=>$cert_nonpending,
                        'ecg'=>$ecg,
                        'pins_spo_elig'=>$pins_spo_elig,
                        'train_diploma'=>$train_diploma,
                        'decla_grad'=>$decla_grad,
                        'f_o_merit'=>$f_o_merit,
                        'col_diploma'=>$col_diploma,
                        'col_tor'=>$col_tor,
                        'prom_order'=>$prom_order
                    );
                  }
                    $data = array(
                                'account_sessions'=>1,
                                'remarks'=>'present'
                        );
                    $this->model->update_where('accounts', $data, 'account_id', $acc_id);
                    $this->session->set_userdata($newdata);
                    echo json_encode($newdata);
                    //redirect(base_url().'masterfile/dashboard/');
                }else{
                    echo json_encode(false);
                }
            }
        }else{
            echo json_encode($count);   
        }
    }
    
    public function add_personalInfo(){
        $account_id=$this->input->post('acc_id');
        $birthdate=$this->input->post('birthdate');
        $birthplace=$this->input->post('birthplace');
        $address=$this->input->post('address');
        $class=$this->input->post('class');
        $coy=$this->input->post('coy');
        $badge=$this->input->post('badge');
        $gender=$this->input->post('gender');
        $age=$this->input->post('age');
        $civil_status=$this->input->post('civil_status');
        $religion=$this->input->post('religion');
        $contactNumber=$this->input->post('contactNumber');
        $blood_type=$this->input->post('blood_type');
        $weight=$this->input->post('weight');
        $height=$this->input->post('height');
        $ethnic=$this->input->post('ethnic');
        $eligibility=$this->input->post('eligibility');
        $rating=$this->input->post('rating');
        $skill=$this->input->post('skill');
        $unit=$this->input->post('unit');
        $secondary=$this->input->post('secondary');
        $vocational=$this->input->post('vocational');
        $voc_school=$this->input->post('voc_school');
        $voc_year=$this->input->post('voc_year');
        $baccalaureate=$this->input->post('baccalaureate');
        $bac_school=$this->input->post('bac_school');
        $bac_year=$this->input->post('bac_year');
        $masteral=$this->input->post('masteral');
        $mas_school=$this->input->post('mas_school');
        $mas_year=$this->input->post('mas_year');
        $mas_unit=$this->input->post('mas_unit');
        $doctoral=$this->input->post('doctoral');
        $doc_school=$this->input->post('doc_school');
        $doc_year=$this->input->post('doc_year');
        $doc_unit=$this->input->post('doc_unit');
        $mother_name=$this->input->post('mother_name');
        $mother_address=$this->input->post('mother_address');
        $mother_contact=$this->input->post('mother_contact');
        $father_name=$this->input->post('father_name');
        $father_address=$this->input->post('father_address');
        $father_contact=$this->input->post('father_contact');
        $spouse_name=$this->input->post('spouse_name');
        $spouse_address=$this->input->post('spouse_address');
        $spouse_contact=$this->input->post('spouse_contact');
        $emergencyName=$this->input->post('emergencyName');
        $emergency_rel=$this->input->post('emergency_rel');
        $emergency_contact=$this->input->post('emergency_contact');
        $emergency_address=$this->input->post('emergency_address');

        $data = array(

            'account_id'=>$account_id,
            'birthdate'=>$birthdate,
            'birthplace'=>$birthplace,
            'address'=>$address,
            'class'=>$class,
            'company'=>$coy,
            'badge_no'=>$badge,
            'gender'=>$gender,
            'age'=>$age,
            'civil_status'=>$civil_status,
            'religion'=>$religion,
            'contact_num'=>$contactNumber,
            'blood_type'=>$blood_type,
            'weight'=>$weight,
            'height'=>$height,
            'ethnic'=>$ethnic,
            'eligibility'=>$eligibility,
            'rating'=>$rating,
            'skill'=>$skill,
            'unit'=>$unit,
            'sencondary_school'=>$secondary,
            'vocational_course'=>$vocational,
            'vocational_school'=>$voc_school,
            'vocational_year'=>$voc_year,
            'baccalaureate_course'=>$baccalaureate,
            'baccalaureate_school'=>$bac_school,
            'baccalaureate_year'=>$bac_year,
            'masteral_course'=>$masteral,
            'masteral_school'=>$mas_school,
            'masteral_year'=>$mas_year,
            'masteral_unit_earned'=>$mas_unit,
            'doctoral_course'=>$doctoral,
            'doctoral_school'=>$doc_school,
            'doctoral_year'=>$doc_year,
            'doctoral_unit_earned'=>$doc_unit,
            'mother_name'=>$mother_name,
            'mother_address'=>$mother_address,
            'mother_contact'=>$mother_contact,
            'father_name'=>$father_name,
            'father_address'=>$father_address,
            'father_contact'=>$father_contact,
            'spouse_name'=>$spouse_name,
            'spouse_address'=>$spouse_address,
            'spouse_contact'=>$spouse_contact,
            'emergency_contact_person'=>$emergencyName,
            'emergency_relation'=>$emergency_rel,
            'emergency_contact'=>$emergency_contact,
            'emergency_address'=>$emergency_address
        );
        if($this->model->insert_into("personal_information", $data)){
          $ndata = array(
                      'form'=>'complete'
              );
          if($this->model->update_where('accounts', $ndata, 'account_id', $account_id)){
           echo json_encode(true); 
          }
        }
    }

    public function add_account(){
        $position=$this->input->post('position');
        $fname=$this->input->post('fname');
        $mname=$this->input->post('mname');
        $lname=$this->input->post('lname');
        $name=$lname.', '.$fname.' '.$mname;
        $email=$this->input->post('email');
        $course_id=$this->input->post('course_id');
        $rank=$this->input->post('rank');
        $pass1=$this->input->post('pass1');
        $acc_type=$this->input->post('acc_type');
        $acc_status=$this->input->post('acc_status');
        $data = array(
            'position'=>$position,
            'course_id'=>$course_id,
            'rank_id'=>$rank,
            'email'=>$email,
            'password'=>password_hash($pass1, PASSWORD_DEFAULT),
            'f_name'=>$fname,
            'm_name'=>$mname,
            'l_name'=>$lname,
            'name'=>$name,
            'acc_type'=>$acc_type,
            'account_status'=>$acc_status,
        );
        if($this->model->insert_into("accounts", $data)){
           echo json_encode(true); 
        }
    }
    public function Change_pass(){
        $data = array(
                    'password'=>password_hash($this->input->post('newpass'), PASSWORD_DEFAULT),
                );
        if($this->model->update_where('accounts', $data, 'account_id', $this->input->post('id'))){
            echo json_encode(true);
        }else{
            echo json_encode(false);
        }   
    }

    public function Add_module(){
    $minutes=$this->input->post('mod_test_time')*60;
        $data = array(
                    'mod_name'=>$this->input->post('mod_name'),
                    'mod_desc'=>$this->input->post('mod_desc'),
          'mod_status'=>'0',
          'mod_test_time'=>$minutes,
                    'course_id'=>$this->input->post('course')
                );
         if($this->model->insert_into("module", $data)){
           echo json_encode(true); 
        }
    }

    public function Add_subject(){
                $config['upload_path']          = './uploads/';
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;
                $config['max_width']            = 1024;
                $config['max_height']           = 768;

                $this->load->library('upload', $config);
                $this->upload->do_upload('userfile');
        $data = array(
                    'subject_name'=>$this->input->post('subject_name'),
                    'subject_desc'=>$this->input->post('subject_desc'),
                    'mod_id'=>$this->input->post('mod_id'),
                    'subject_file'=>$this->upload->data('file_name')
                );
         if($this->model->insert_into("subjects", $data)){
           echo json_encode(true); 
        }
    }

    public function Edit_subject(){
                $config['upload_path']          = './uploads/';
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;
                $config['max_width']            = 1024;
                $config['max_height']           = 1000;
                $data=array();
                $this->load->library('upload', $config);
                if($this->input->post('subject_file')!=='') {
                $filename=$this->input->post('subject_file');
                unlink('./uploads/'.$filename);
                }
                $this->upload->do_upload('userfile');
                 $data = array(
                    'subject_name'=>$this->input->post('subject_name'),
                    'subject_desc'=>$this->input->post('subject_desc'),
                    'subject_file'=>$this->upload->data('file_name')
                    );
        
        if($this->model->update_where('subjects', $data, 'subject_id', $this->input->post('subject_id'))){
           echo json_encode(true); 
        }
    }

  public function Add_question(){

      // $data = array(
      //       'question'=>$this->input->post('question'),
      //       'answer'=>$this->input->post('answer'),
      //       'option1'=>$this->input->post('option1'),
      //       'option2'=>$this->input->post('option2'),
      //       'option3'=>$this->input->post('option3'),
      //       'option4'=>$this->input->post('option4'),
      //       'subject_id'=>$this->input->post('subquiz_id')
      //     );

      $post = $this->input->post();
                for ($i = 0; $i < count($post['question']); $i++) 
                {
                $data=array('question' => $post['question'][$i],
                            'answer' => $post['answer'][$i],
                            'option1' => $post['option1'][$i],
                            'option2'=>$post['option2'][$i],
                            'option3'=>$post['option3'][$i],
                            'option4'=>$post['option4'][$i],
                            'subject_id'=>$this->input->post('subquiz_id'));
                    
                $this->model->insert_into("quiz", $data);
                }   
             echo json_encode(true); 
  }


    public function Admin_account()
    {
         $data = array(
            'acc_type'=>'1',
            'email'=>$this->input->post('user'),
            'password'=>password_hash($this->input->post('pass'), PASSWORD_DEFAULT)
         );
          if($this->model->insert_into("accounts", $data)){
           echo json_encode(true); 
        }
    }

    public function count_student()
    {

        $occ = $this->model->select_all_where("accounts","course_id","4");
        $slc = $this->model->select_all_where("accounts","course_id","3");
        $jlc = $this->model->select_all_where("accounts","course_id","2");
        $brc = $this->model->select_all_where("accounts","course_id","1");

         $data = array(
            'occ'=> $occ->num_rows(),
            'slc'=> $slc->num_rows(),
            'jlc'=> $jlc->num_rows(),
            'brc'=> $brc->num_rows()
         );

         echo json_encode($data); 

    }

  public function Edit_module(){
      $minutes=$this->input->post('mod_time')*60;
      $data = array(
            'mod_name'=>$this->input->post('mod_name'),
            'mod_desc'=>$this->input->post('mod_desc'),
            'mod_test_time'=>$minutes,
            'course_id'=>$this->input->post('course_id')
          );
        
    if($this->model->update_where('module', $data, 'mod_id', $this->input->post('mod_id'))){
           echo json_encode(true); 
        }
  }

    public function Del_module()
    {
        if($this->model->delete_where('module','mod_id', $this->input->post('mod_id'))){
            echo json_encode(true);
        }else{
            echo json_encode(false);
        }   
    }
    
      public function modules()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_mod($this->input->post("id"));

          $data = array();

          foreach($mod->result() as $r) {
              $minutes=floor(((int)$r->mod_test_time / 60) % 60);
               $data[] = array(
                    $r->mod_name,
                    $r->mod_desc,
                    ($r->mod_test_time=='' ? '' : $minutes),
                    '<a  onclick="ViewSubs(\''.$r->mod_name.'\',\''.$r->mod_desc.'\','.$r->mod_id.');" data-toggle="modal" data-target="#ViewMod" data-toggle="tooltip" data-placement="top" title="View Subjects" class="btn btn-info btn-circle btn-sm">
                                                    <i class="fas fa-info-circle"></i>
                                                </a>
                                                <a  onclick="ViewStuds('.$r->mod_id.','.$this->input->post("id").');" data-toggle="modal" data-target="#ViewStuds" data-toggle="tooltip" data-placement="top" title="View Students" class="btn btn-info btn-circle btn-sm">
                                                    <i class="fas fa-book-open"></i>
                                                </a>
                                                <a data-toggle="modal" onclick="modhead('.$minutes.',\''.$r->mod_name.'\',\''.$r->mod_desc.'\','.$r->mod_id.','.$r->course_id.')" data-target="#EditMod" class="btn btn-warning btn-circle btn-sm" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </a>'.($r->mod_test_time!=='' && $r->mod_test_time>1?
                                                ($r->mod_status==0 ?' <a data-toggle="modal" onclick="StartExam(\''.$r->mod_name.'\','.$r->mod_id.','.$r->course_id.',0);" data-target="#modalQuiz" data-toggle="tooltip" data-placement="top" title="Start Quiz" class="btn btn-primary btn-circle btn-sm">
                                                    <i class="fas fa-toggle-off"></i>
                                                </a>': ' <a data-toggle="modal" onclick="StartExam(\''.$r->mod_name.'\','.$r->mod_id.','.$r->course_id.',1);" data-target="#modalQuiz" data-toggle="tooltip" data-placement="top" title="End Quiz" class="btn btn-primary btn-circle btn-sm">
                                                    <i class="fas fa-toggle-on"></i>
                                                </a>') :  ' <button disabled data-toggle="modal" onclick="StartExam(\''.$r->mod_name.'\','.$r->mod_id.','.$r->course_id.',1);" data-target="#modalQuiz" data-toggle="tooltip" data-placement="top" title="End Quiz" class="btn btn-primary btn-circle btn-sm">
                                                    <i class="fas fa-toggle-off"></i>
                                                </button>')
      );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

      public function non_acad_modules()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_mod($this->input->post("id"));

          $data = array();

          foreach($mod->result() as $r) {
              $minutes=floor(((int)$r->mod_test_time / 60) % 60);
               $data[] = array(
                    $r->mod_name,
                    $r->mod_desc,
                    '<a  onclick="ViewSubs(\''.$r->mod_name.'\',\''.$r->mod_desc.'\','.$r->mod_id.');" data-toggle="modal" data-target="#ViewMod" data-toggle="tooltip" data-placement="top" title="View Subjects" class="btn btn-info">View Subjects <i class="fas fa-search"></i></a>');
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function StartQuiz()
     {
      $stat=$this->input->post('status');
      $data = array(
            'mod_status'=>($stat==0 ? '1' : '0' )
          );
      $data1 = array(
            'mod_id'=>($stat==0 ? $this->input->post('mod_id') : '0' )
          );
      $this->model->update_where('accounts', $data1, 'course_id', $this->input->post('course_id'));
          if($this->model->update_where('module', $data, 'mod_id', $this->input->post('mod_id'))){
             echo json_encode(true); 
          }

     }

     public function TakeQuiz()
     {
      $count=$this->model->count_module_item($this->input->post('mod_id'));
      $data = array(
          'account_id'=>$this->input->post('user_id'),
          'mod_id'=>$this->input->post('mod_id'),
          'sq_score'=>0,
          'sq_total'=>$count,
          'score_word'=>"0 out of ".$count,
          'sq_time'=>$this->input->post('timer'),
          'sq_status'=>$this->input->post('quiz_status')
        );
     $id=$this->model->insert_into("student_quiz", $data);
     $sub = $this->model->select_sub($this->input->post('mod_id'));
     $data = array();
     foreach($sub->result() as $s) {

                 $data[] = array(
                       "sq_id"  => $id,
                       "sub_id" => $s->subject_id

                 );
              }
              echo json_encode($data);
            
        
     }

     public function Admin_subjects()//admin view of subjects
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $sub = $this->model->select_sub($this->input->post('mod_id'));

          $data = array();

          foreach($sub->result() as $r) {
           $quiz = $this->model->count_quiz("quiz","subject_id",$r->subject_id);

               $data[] = array(
                    $r->subject_name,
                    $r->subject_desc,
                    ($r->subject_file!=='' ? '<div class="btn-group" role="group"><button id="btnGroupDrop1" type="button" class="btn btn-secondary btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.$r->subject_file.'</button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <a class="dropdown-item" target="_blank" href="'.site_url("/uploads/".$r->subject_file).'">View <i class="fas fa-search"></i></a>
                                <a class="dropdown-item" onclick="delsubheader('.$r->subject_id.',\''.$r->subject_file.'\')" data-toggle="modal"  data-target="#DelFile">Delete <i class="fas fa-trash"></i></a>
                                </div>
                                </div>' : 'To be updated' ),
                      '<a data-toggle="modal" data-target="#EditSub" onclick="subject_id(\''.$r->subject_name.'\',\''.$r->subject_desc.'\','.$r->subject_id.',\''.$r->subject_file.'\')" class="btn btn-warning">
                          Edit <i class="fas fa-edit"></i> 
                      </a>
                      <a data-toggle="modal" data-target="#ViewQuiz" onclick="subject_quiz_id(\''.$r->subject_name.'\','.$r->subject_id.')" class="btn btn-primary">
                          View Quiz <i class="fas fa-search"></i> ('.$quiz.')
                      </a>'
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

       public function Non_acad_subjects()//admin view of subjects
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $sub = $this->model->select_sub($this->input->post('mod_id'));

          $data = array();

          foreach($sub->result() as $r) {

               $data[] = array(
                    $r->subject_name,
                    $r->subject_desc,
                    ($r->subject_file!=='' ? '
                                <a class="btn btn-info" target="_blank" href="'.site_url("/uploads/".$r->subject_file).'">'.$r->subject_file.' <i class="fas fa-search"></i></a>' : 'To be updated' ),
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

     public function subjects()//student view of subjects
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_all_where("subjects","mod_id",$this->input->post("id"));

          $data = array();

          foreach($mod->result() as $r) {

               $data[] = array(
                    $r->subject_name,
                    '<a data-toggle="modal" data-target="#ViewSubs" onclick="subs('.$r->subject_id.')" class="btn btn-warning">View Subject</a>',
                    '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                     Take Quiz</button>'
               );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function account_list()//account list
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $stud = $this->model->select_user_account();

          $data = array();

          foreach($stud->result() as $r) {

               $data[] = array(
                    $r->position,
                    $r->name,
                    $r->email,
                    $r->acc_type,
                    $r->account_status,
                    '
                    <button type="button" title="edit" onclick="edit('.$r->account_id.')" class="btn btn-warning btn-circle btn-sm"data-toggle="modal" data-target="#edit_accountmod">
                          <i class="fas fa-edit"></i>
                    </button>
                    <button type="button" title="reset password" onclick="reset('.$r->account_id.')" class="btn btn-secondary btn-circle btn-sm"data-toggle="modal" data-target="#reset_password">
                          <i class="fas fa-fw fa-cog"></i>
                    </button>
                        '
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

    public function edit_account_modal(){

    $data = array();
    $draw = intval($this->input->post("draw"));
    $start = intval($this->input->post("start"));
    $length = intval($this->input->post("length"));

    $fetch=$this->model->select_account_modal($this->input->post("id"));

    foreach($fetch->result() as $a){
        $account_id = $a->account_id;
        $position = $a->position;
        $f_name = $a->f_name;
        $m_name = $a->m_name;
        $l_name = $a->l_name;
        $name = $a->name;
        $email = $a->email;
        $acc_type = $a->acc_type;
        $acc_status = $a->account_status;

    }
    $data = array(
       'account_id'=> $account_id,
       'position'=> $position,
       'f_name'=> $f_name,
       'm_name'=> $m_name,
       'l_name'=> $l_name,
       'name'=> $name,
       'email'=> $email,
       'account_status'=> $acc_status,
       'acc_type'=> $acc_type
      );

    echo json_encode($data);
    }

  public function edit_account_submit(){

      $data = array(
            'name' =>$this->input->post('l_name').', '.$this->input->post('f_name').' '.$this->input->post('m_name'),
            'position'=>$this->input->post('position'),
            'f_name'=>$this->input->post('f_name'),
            'm_name'=>$this->input->post('m_name'),
            'l_name'=>$this->input->post('l_name'),
            'email'=>$this->input->post('email'),
            'account_status'=>$this->input->post('acc_status'),
            'acc_type'=>$this->input->post('acc_type')
          );
        
    if($this->model->update_where('accounts', $data, 'account_id', $this->input->post('account_id'))){
           echo json_encode(true); 
        }
  }


     public function student_approval()// student lists for approval
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));

        $fetch=$this->model->select_student_for_approval();

        $data = array();

        foreach($fetch->result() as $a) {
          $data[] = array(
            $a->date_application,
            $a->rank,
            $a->name,
            $a->badge_no,
            $a->course_type,
            $a->unit,
            $a->rank,
            '<button type="button" class="btn btn-primary btn-sm" onclick="approval('.$a->account_id.')" data-toggle="modal" data-target="#exampleModalLong">
              Info <i class="fa fa-search"></i>
            </button>
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#docs" onclick="load_docs('.$a->account_id.')">
              Files <i class="fa fa-file-pdf"></i>
            </button>'
          );
        }
          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $fetch->num_rows(),
                 "recordsFiltered" => $fetch->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function student_info_approval()// MODAL for student approval
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));

        $fetch=$this->model->select_personalinfo($this->input->post("id"));

        foreach($fetch as $a){
            $acc_id = $a->account_id;
            $password = $a->password;
            $rank = $a->rank;
            $rank_id = $a->rank_id;
            $email = $a->email;
            $birthdate = $a->birthdate;
            $birthplace = $a->birthplace;
            $address = $a->address;
            $class = $a->class;
            $company = $a->company;
            $badge_no = $a->badge_no;
            $gender = $a->gender;
            $age = $a->age;
            $civil_status = $a->civil_status;
            $religion = $a->religion;
            $contact_num = $a->contact_num;
            $blood_type = $a->blood_type;
            $weight = $a->weight;
            $height = $a->height;
            $ethnic = $a->ethnic;
            $eligibility = $a->eligibility;
            $rating = $a->rating;
            $skill = $a->skill;
            $unit = $a->unit;
            $sencondary_school = $a->sencondary_school;
            $vocational_course = $a->vocational_course;
            $vocational_school = $a->vocational_school;
            $vocational_year = $a->vocational_year;
            $baccalaureate_course = $a->baccalaureate_course;
            $baccalaureate_school = $a->baccalaureate_school;
            $baccalaureate_year = $a->baccalaureate_year;
            $masteral_course = $a->masteral_course;
            $masteral_school = $a->masteral_school;
            $masteral_year = $a->masteral_year;
            $masteral_unit_earned = $a->masteral_unit_earned;
            $doctoral_course = $a->doctoral_course;
            $doctoral_school = $a->doctoral_school;
            $doctoral_year = $a->doctoral_year;
            $doctoral_unit_earned = $a->doctoral_unit_earned;
            $mother_name = $a->mother_name;
            $mother_address = $a->mother_address;
            $mother_contact = $a->mother_contact;
            $father_name = $a->father_name;
            $father_address = $a->father_address;
            $father_contact = $a->father_contact;
            $spouse_name = $a->spouse_name;
            $spouse_address = $a->spouse_address;
            $spouse_contact = $a->spouse_contact;
            $emergency_contact_person = $a->emergency_contact_person;
            $emergency_relation = $a->emergency_relation;
            $emergency_contact = $a->emergency_contact;
            $emergency_address = $a->emergency_address;
            $course_id = $a->course_id;
            $course_type = $a->course_type;
            $approval = $a->approval;
            $form = $a->form;
            $rank = $a->rank;
            $email = $a->email;
            $account_status = $a->account_status;
            $acc_type = $a->acc_type;
            $name = $a->name;
            $fname = $a->f_name;
            $mname = $a->m_name;
            $lname = $a->l_name;
        }
        $data = array(
          'acc_id'=>$acc_id,
          'password'=>$password,
          'rank'=>$rank,
          'rank_id'=>$rank_id,
          'unit'=>$unit,
          'email'=>$email,
          'birthdate'=>$birthdate,
          'birthplace'=>$birthplace,
          'address'=>$address,
          'birthdate'=>$birthdate,
          'class'=>$class,
          'company'=>$company,
          'gender'=>$gender,
          'age'=>$age,
          'civil_status'=>$civil_status,
          'religion'=>$religion,
          'contact_num'=>$contact_num,
          'blood_type'=>$blood_type,
          'weight'=>$weight,
          'height'=>$height,
          'ethnic'=>$ethnic,
          'eligibility'=>$eligibility,
          'rating'=>$rating,
          'skill'=>$skill,
          'sencondary_school'=>$sencondary_school,
          'vocational_course'=>$vocational_course,
          'vocational_school'=>$vocational_school,
          'vocational_year'=>$vocational_year,
          'baccalaureate_course'=>$baccalaureate_course,
          'baccalaureate_school'=>$baccalaureate_school,
          'baccalaureate_year'=>$baccalaureate_year,
          'masteral_course'=>$masteral_course,
          'masteral_school'=>$masteral_school,
          'masteral_year'=>$masteral_year,
          'masteral_unit_earned'=>$masteral_unit_earned,
          'doctoral_course'=>$doctoral_course,
          'doctoral_school'=>$doctoral_school,
          'doctoral_year'=>$doctoral_year,
          'doctoral_unit_earned'=>$doctoral_unit_earned,
          'mother_name'=>$mother_name,
          'mother_address'=>$mother_address,
          'mother_contact'=>$mother_contact,
          'father_name'=>$father_name,
          'father_address'=>$father_address,
          'father_contact'=>$father_contact,
          'spouse_name'=>$spouse_name,
          'spouse_address'=>$spouse_address,
          'spouse_contact'=>$spouse_contact,
          'emergency_contact_person'=>$emergency_contact_person,
          'emergency_relation'=>$emergency_relation,
          'emergency_contact'=>$emergency_contact,
          'emergency_address'=>$emergency_address,
           'approval'=> $approval,
           'company'=> $company,
           'course_type'=> $course_type,
           'course_id'=> $course_id,
           'email'=> $email,
           'badge_no'=> $badge_no,
           'name'=> $name,
           'fname'=> $fname,
           'mname'=> $mname,
           'lname'=> $lname
          );
        echo json_encode($data);
     }

     public function approve_student () // approve student
     {
        $data = array(
            'approval'=>'yes'
          );
        $this->model->update_where('accounts', $data, 'account_id', $this->input->post('account_id'));
        echo json_encode(true);
     }

     public function search_studentsroster () // search student
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));

        $course_type = $this->input->post("course_type");
        $class_name = $this->input->post("class_name");

        $fetch=$this->model->select_student($course_type, $class_name);

        $data = array();

        foreach($fetch->result() as $a) {
          $data[] = array(
            $a->rank,
            $a->name,
            $a->class,
            $a->company,
            $a->unit,
            $a->remarks
          );
        }
          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $fetch->num_rows(),
                 "recordsFiltered" => $fetch->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function search_student () // search student
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));

        $course_type = $this->input->post("course_type");
        $class_name = $this->input->post("class_name");

        $fetch=$this->model->select_student($course_type, $class_name);

        $data = array();

        foreach($fetch->result() as $a) {
          $data[] = array(
            $a->rank,
            $a->name,
            $a->class,
            $a->company,
            $a->unit,
            '<button type="button" title="edit" class="btn btn-warning btn-circle btn-sm" onclick="edit_info('.$a->account_id.')" data-toggle="modal" data-target="#exampleModalLong">
              <i class="fas fa-edit"></i>
            </button>
            <button type="button" title="reset password" onclick="reset('.$a->account_id.')" class="btn btn-secondary btn-circle btn-sm" data-toggle="modal" data-target="#reset_password">
                  <i class="fas fa-fw fa-cog"></i>
            </button>
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#docs" onclick="load_docs('.$a->account_id.','.$a->badge_no.')">
              <i class="fa fa-file-pdf"></i>
            </button>
            '
          );
        }
          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $fetch->num_rows(),
                 "recordsFiltered" => $fetch->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }


     public function search_student_archive () // search student
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));

        $course_type = $this->input->post("course_type");
        $class_name = $this->input->post("class_name");

        $fetch=$this->model->select_student_archive($course_type, $class_name);

        $data = array();

        foreach($fetch->result() as $a) {
          $data[] = array(
            $a->rank,
            $a->name,
            $a->class,
            $a->company,
            $a->unit,
            $a->remarks,
            '<button type="button" class="btn btn-warning" onclick="edit_info('.$a->account_id.')" data-toggle="modal" data-target="#exampleModalLong">
              edit
            </button>'
          );
        }
          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $fetch->num_rows(),
                 "recordsFiltered" => $fetch->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function edit_personalinfo()// MODAL for edit student info
     {

      $data = array(
            'birthdate'=>$this->input->post('birthdate'),
            'birthplace'=>$this->input->post('birthplace'),
            'address'=>$this->input->post('address'),
            'class'=>$this->input->post('class'),
            'company'=>$this->input->post('coy'),
            'badge_no'=>$this->input->post('badge'),
            'gender'=>$this->input->post('gender'),
            'age'=>$this->input->post('age'),
            'civil_status'=>$this->input->post('civil_status'),
            'religion'=>$this->input->post('religion'),
            'contact_num'=>$this->input->post('contact_num'),
            'blood_type'=>$this->input->post('bloodtype'),
            'weight'=>$this->input->post('weight'),
            'height'=>$this->input->post('height'),
            'ethnic'=>$this->input->post('ethnic'),
            'eligibility'=>$this->input->post('eligibility'),
            'rating'=>$this->input->post('rating'),
            'skill'=>$this->input->post('skill'),
            'unit'=>$this->input->post('unit'),
            'sencondary_school'=>$this->input->post('secondary'),
            'vocational_course'=>$this->input->post('voccourse'),
            'vocational_school'=>$this->input->post('vocschool'),
            'vocational_year'=>$this->input->post('vocyear'),
            'baccalaureate_course'=>$this->input->post('baccourse'),
            'baccalaureate_school'=>$this->input->post('bacschool'),
            'baccalaureate_year'=>$this->input->post('bacyear'),
            'masteral_course'=>$this->input->post('mascourse'),
            'masteral_school'=>$this->input->post('masschool'),
            'masteral_year'=>$this->input->post('masyear'),
            'masteral_unit_earned'=>$this->input->post('masteral_unit_earned'),
            'doctoral_course'=>$this->input->post('doccourse'),
            'doctoral_school'=>$this->input->post('docschool'),
            'doctoral_year'=>$this->input->post('docyear'),
            'doctoral_unit_earned'=>$this->input->post('doctoral_unit_earned'),
            'mother_name'=>$this->input->post('motname'),
            'mother_address'=>$this->input->post('motaddress'),
            'mother_contact'=>$this->input->post('motcontact'),
            'father_name'=>$this->input->post('fatname'),
            'father_address'=>$this->input->post('fataddress'),
            'father_contact'=>$this->input->post('fatcontact'),
            'spouse_name'=>$this->input->post('sponame'),
            'spouse_address'=>$this->input->post('spoaddress'),
            'spouse_contact'=>$this->input->post('spocontact'),
            'emergency_contact_person'=>$this->input->post('emername'),
            'emergency_relation'=>$this->input->post('emerrelation'),
            'emergency_contact'=>$this->input->post('emercontact'),
            'emergency_address'=>$this->input->post('emeraddress')
          );

      $name = $this->input->post('l_name').', '.$this->input->post('f_name').' '.$this->input->post('m_name');
      $data2 = array(
            'course_id'=>$this->input->post('course_type_form'),
            'rank_id'=>$this->input->post('rank'),
            'email'=>$this->input->post('email'),
            'name'=>$name,
            'f_name'=>$this->input->post('f_name'),
            'm_name'=>$this->input->post('m_name'),
            'l_name'=>$this->input->post('l_name')

      );

      $qry1 = $this->model->update_where('personal_information', $data, 'account_id', $this->input->post('acc_id'));

      $qry2 = $this->model->update_where('accounts', $data2, 'account_id', $this->input->post('acc_id'));

    if($qry1 && $qry2){
           echo json_encode(true); 
        }
     }

     public function Course_mod()//student view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_mod($this->input->post("id"));
          $check_stud = $this->model->select_all_where("accounts","account_id",$this->session->userdata('acc_id'));

          $data = array();

          foreach($mod->result() as $r) {
            $minutes=floor(((int)$r->mod_test_time / 60) % 60);
              foreach($check_stud->result() as $s){
               $data[] = array(
                    $r->mod_name,
                    $r->mod_desc,
                    ($r->mod_status==1 && $r->mod_id==$s->mod_id? '<button disabled data-toggle="modal" data-target="#ViewSubs" onclick="subs(\''.$r->mod_name.'\',\''.$r->mod_desc.'\','.$r->mod_id.')" class="btn btn-warning">Subjects <i class="fa fa-book"></i></button> <button data-toggle="modal" onclick="TakeQuiz(\''.$r->mod_name.'\','.$this->session->userdata('acc_id').','.$r->mod_id.','.$r->mod_test_time.','.$r->course_id.',1)" data-target="#exampleModal" class="btn btn-info">Take Quiz <i class="fa-sign-in"></i></button>' : '<button data-toggle="modal" data-target="#ViewSubs" onclick="subs(\''.$r->mod_name.'\',\''.$r->mod_desc.'\','.$r->mod_id.')" class="btn btn-warning">Subjects <i class="fa fa-book"></i></button> <button disabled data-toggle="modal" data-target="#exampleModal" class="btn btn-info">Take Quiz <i class="fa-sign-in"></i></button>')
               );
             }
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function Course_sub()//student view of subjects
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_sub($this->input->post('mod_id'));

          $data = array();

          foreach($mod->result() as $r) {

               $data[] = array(
                    $r->subject_name,
                     ($r->subject_file!=='' ? '<a href="'.site_url("/uploads/".$r->subject_file).'" target="_blank" class="btn btn-success">'.$r->subject_file.' <i class="fa fa-search"></i></a>' : 'To be updated' )
                     //'<a data-toggle="modal" data-target="#ViewPdf" onclick="ViewPdf(\''.$r->subject_name.'\',\''.$r->subject_file.'\')" class="btn btn-success">'.$r->subject_file.' <i class="fa fa-search"></i></a>'
                    
               );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

       public function questions()//admin view of questions
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_all_where("quiz","subject_id",$this->input->post('id'));

          $data = array();

          foreach($mod->result() as $r) {

               $data[] = array(
                    $r->question,
                     $r->answer,
                     $r->option1,
                     $r->option2,
                     $r->option3,
                     '<a data-toggle="modal" data-target="#editQuestion" onclick="edit_quest_modal(\''.$r->question.'\',\''.$r->answer.'\',\''.$r->option1.'\',\''.$r->option2.'\',\''.$r->option3.'\',\''.$r->option4.'\','.$r->quiz_id.','.$r->subject_id.')" class="btn btn-success"><i class="fa fa-edit"></i></a>
                     <a data-toggle="modal" data-target="#delquest" onclick="delete_quest_modal('.$r->quiz_id.')" class="btn btn-danger"><i class="fa fa-trash"></i></a>' 
                    
               );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function QuizQuestions(){

            $quest = $this->model->test_questions($this->input->post("course_id"),$this->input->post("mod_id"),$this->input->post("sub_id"));
            $data=array();
            foreach($quest->result() as $q) {

                 $data[] = array(
                      "sub_name"  => $q->subject_name,
                       "quiz_id"  => $q->quiz_id,
                       "question" => $q->question,
                       "option1" => $q->option1,
                       "option2" => $q->option2,
                       "option3" => $q->option3,
                       "option4" => $q->option4

                 );
              }
          echo json_encode($data);
     }

     public function TimerQuiz(){
      $timer=$this->input->post('timer') - 1;
      $init = $timer;
      $minutes = floor(($init / 60) % 60);
      $seconds = $init % 60;
      $data = array(
            'timer'=>($init > 59 ? ($minutes > 1 ? "$minutes minutes and $seconds seconds" : "$minutes minute and $seconds seconds") : ($seconds < 2 ? "$seconds second" : "$seconds seconds")),
            'time'=>$timer
          ); 
      echo json_encode($data); 
    }

    public function SubmitAnswer(){
      $qry=$this->model->select_all_where("quiz","quiz_id",$this->input->post('quiz_id'));    
      foreach($qry->result() as $r) {
               if($r->answer == $this->input->post('ans')){
                    $score=$this->model->select_all_where("student_quiz","sq_id",$this->input->post('sq_id'));
                      foreach($score->result() as $s){
                          $no_score=$s->sq_score;
                          $scores=$s->sq_score + 1;
                      }
                      $data = array(
                          'sq_score'=>$scores,
                          'sq_total'=>$this->input->post('total'),
                          'score_word'=>$scores.' out of '.$this->input->post('total')
                        );
                      $this->model->update_where('student_quiz', $data, 'sq_id', $this->input->post('sq_id'));
                      echo json_encode(true);
          }else{
                      echo json_encode(false);
          }

           $data1 = array(
                          'account_id'=>$this->session->userdata('acc_id'),
                          'mod_id'=>$this->input->post('mod_id'),
                          'subject_id'=>$r->subject_id,
                          'sq_id'=>$this->input->post('sq_id'),
                          'quiz_id'=>$this->input->post('quiz_id'),
                          'right_ans'=>$r->answer,
                          'student_ans'=>($this->input->post('ans')=='' ? "no answer" : $this->input->post('ans'))
                      );
                      $this->model->insert_into("stud_quiz_ans", $data1);
                        
                      
      } 
       
    }

    public function FetchScore(){
       $data1 = array('sq_status'=>0,'sq_date'=>date('Y-m-d H:i:s'));
       $data3 = array('mod_id'=>0);
      $this->model->update_where('student_quiz', $data1, 'sq_id', $this->input->post('sq_id'));
      $this->model->update_where('accounts',$data3,'account_id',$this->session->userdata('acc_id'));
      $score=$this->model->select_all_where("student_quiz","sq_id",$this->input->post('sq_id'));
      foreach($score->result() as $s){
        $data = array(
                        'score'=>$s->sq_score,
                        'score_word'=>$s->score_word
        );
        echo json_encode($data);
      }
    }

     public function Del_Quest(){
      if($this->model->delete_where("quiz", "quiz_id", $this->input->post('id')))
      {
        echo json_encode(true);
      }
     }

     public function Edit_question(){

      $data = array(
            'question'=>$this->input->post('question'),
            'answer'=>$this->input->post('answer'),
            'option1'=>$this->input->post('option1'),
            'option2'=>$this->input->post('option2'),
            'option3'=>$this->input->post('option3'),
            'option4'=>$this->input->post('option4'),
            'subject_id'=>$this->input->post('subquiz_id')
          );
        
    if($this->model->update_where('quiz', $data, 'quiz_id', $this->input->post('quiz_id'))){
           echo json_encode(true); 
        }
  }

    public function Del_file(){
        $filename=$this->input->post("file");
        $data = array(
        'subject_file' => '',
        );
        $this->model->update_where("subjects", $data, "subject_id", $this->input->post("id"));
        if(unlink('./uploads/'.$filename)){
            echo json_encode(true);
        }
     }

  public function Add_announcement(){
    $data = array(
          'title'=>$this->input->post('title'),
          'content'=>$this->input->post('content'),
          'source'=>$this->input->post('source'),
          'course_id'=>$this->input->post('course_id')
        );
     if($this->model->insert_into("announcement", $data)){
           echo json_encode(true); 
        }
  }
    
  public function announcement_list()//announcement list
     {
      $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $qry = $this->model->select_announcement();
          $data = array();
          foreach($qry->result() as $r) {

               $data[] = array(
                  $r->title,
                  $r->content,
                  $r->source,
                  $r->course_type,
                  '    
                  <button type="button" class="btn btn-warning btn-circle" onclick="edit_announcement('.$r->announce_id.')" data-toggle="modal" data-target="#edit" title="Edit">
                      <span class="icon text-white-50">
                          <i class="fas fa-edit"></i>
                      </span>
                  </button>
                  <button type="button" class="btn btn-danger btn-circle" onclick="delete_announcement('.$r->announce_id.')" data-toggle="modal" data-target="#delete" title="delete">
                      <span class="icon text-white-50">
                          <i class="fas fa-trash"></i>
                      </span>
                  </button>
                  '
               );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $qry->num_rows(),
                 "recordsFiltered" => $qry->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }    

 public function announcement_modal()// MODAL for edit announcement
 {
    $draw = intval($this->input->post("draw"));
    $start = intval($this->input->post("start"));
    $length = intval($this->input->post("length"));

    $fetch=$this->model->select_announcement_modal($this->input->post("id"));

    foreach($fetch->result() as $a){
        $title = $a->title;
        $content = $a->content;
        $course_id = $a->course_id;
        $announce_id = $a->announce_id;
        $course_type = $a->course_type;
    }
    $data = array(
       'title'=> $title,
       'content'=> $content,
       'course_id'=> $course_id,
       'announce_id'=> $announce_id,
       'course_type'=> $course_type
      );

    echo json_encode($data);
 }


  public function edit_announcement_submit(){

      $data = array(
            'title'=>$this->input->post('announce_title'),
            'content'=>$this->input->post('announce_content'),
            'course_id'=>$this->input->post('course_id_form')
          );
        
    if($this->model->update_where('announcement', $data, 'announce_id', $this->input->post('announce_id'))){
           echo json_encode(true); 
        }
  }

  public function archive_student(){

    $fetch=$this->model->select_student_for_archive($this->input->post('course_type'), $this->input->post('class_name'));

    $data = array();

    foreach($fetch->result() as $a) {
      $data[] = array(
       'account_id'=> $a->account_id
      );
    }

    echo json_encode($data);
  }

  public function update_archive(){
      $data = array('archive'=>"yes");
      if($this->model->update_where('accounts', $data, 'account_id', $this->input->post('id'))){
        echo json_encode(true);
      }
  }

    public function delete_announcement()
    {
        if($this->model->delete_where('announcement','announce_id', $this->input->post('announce_id'))){
            echo json_encode(true);
        }else{
            echo json_encode(false);
        }   
    }

  public function announcement_stud()//announcement list on student view
     {
      $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));

          $qry = $this->model->select_all_where("announcement","course_id",$this->input->post("id"));

          $data = array();
          foreach($qry->result() as $r) {

               $data[] = array(
                    $r->title,
                    $r->content,
                    $r->source
               );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $qry->num_rows(),
                 "recordsFiltered" => $qry->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }

     public function ScoresHistory(){
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_all_where("module","course_id",$this->input->post("id"));
          $data = array();
          foreach($mod->result() as $r) {
          $quiz = $this->model->select_all_where("student_quiz","mod_id",$r->mod_id);
            foreach($quiz->result() as $q) {
                 $date = date( 'F j, Y h:i A', strtotime($q->sq_date));
                 $check_score= ($q->sq_score==0 ? 0 : $q->sq_total / 2);
                 $data[] = array(
                      $r->mod_name,
                      $q->sq_total,
                      $q->sq_score,
                      $date,
                      ($check_score!==0? ($q->sq_score>=$check_score  ? "<p class='text-success'>Passed</p>": "<p class='text-danger'>Failed</p>") : "<p class='text-danger'>Failed</p>"),
                     '<a data-toggle="modal" data-target="#ViewAnswers" onclick="Answers('.$q->sq_id.','.$r->mod_id.')" title="Review Answers" class="btn btn-info"><i class="fa fa-search"></i></a>'
                 );
              }
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
     }  

    public function GetQuestAns()
    {
        $stud_ans=$this->model->select_dual_column("stud_quiz_ans","sq_id",$this->input->post('sq_id'),"mod_id",$this->input->post('mod_id'));
        $data=array();
        foreach($stud_ans->result() as $ans ){
          $quiz=$this->model->select_all_where("quiz","quiz_id",$ans->quiz_id);
          foreach($quiz->result() as $q ){
            if($ans->student_ans !== $ans->right_ans){
              $data[]=array(
                "question" => $q->question,
                "student_ans" => $ans->student_ans,
                "right_ans" => $ans->right_ans
              );
            }
          }
        }

        echo json_encode($data);
    }    

    public function FetchStudents(){

      $draw = intval($this->input->post("draw"));
      $start = intval($this->input->post("start"));
      $length = intval($this->input->post("length"));

      $data=array();
      $studs=$this->model->studs_per_course($this->input->post('course_id'));
      foreach($studs->result() as $s){
        $check_stud=$this->model->select_all_where2("student_quiz","account_id",$s->account_id,"mod_id",$this->input->post('mod_id'));
         $data[]=array(
                $s->rank,
                $s->name,
                ($s->class == null ? "not available yet" : $s->class),
                ($s->company == null ? "not available yet" : $s->company),
                ($check_stud->num_rows() > 0 ? "<h6 class='text-success'>Finished exam</h6>" : "<h6 class='text-danger'>Not yet taken exam</h6>" )
              );
      }
      $output = array(
              "draw" => $draw,
              "recordsTotal" => $studs->num_rows(),
              "recordsFiltered" => $studs->num_rows(),
              "data" => $data
      );
          echo json_encode($output);
          exit();
    }

    public function CourseStuds(){

      $draw = intval($this->input->post("draw"));
      $start = intval($this->input->post("start"));
      $length = intval($this->input->post("length"));

      $data=array();
      $sq_total='';
      $score='';
      $date='';
      $remarks='';
      $studs=$this->model->studs_per_course2($this->input->post('course_id'),$this->input->post('class'));
      foreach($studs->result() as $s){
        $check_stud=$this->model->select_all_where2("student_quiz","account_id",$s->account_id,"mod_id",$this->input->post('mod_id'));
        foreach($check_stud->result() as $c){
         $sq_total=$c->sq_total;
         $score=$c->sq_score;
         $date=$c->sq_date;
         $remarks=$c->sq_total / 2;
        }
         $data[]=array(
                $s->rank,
                $s->name,
                ($s->company == null ? "not available yet" : $s->company),
                ($check_stud->num_rows()> 0 ? "<h6>".$sq_total."</h6>" : "<h6 class='text-danger'> Not available </h6>"),
                ($check_stud->num_rows()> 0 ? "<h6>".$score."</h6>" : "<h6 class='text-danger'> Not available </h6>"),
                ($check_stud->num_rows()> 0 ? "<h6>".$date."</h6>" : "<h6 class='text-danger'> Not available </h6>"),
                ($check_stud->num_rows()> 0 ? ($score>=$remarks ? "<h6 class='text-success'>PASSED</h6>" :"<h6 class='text-danger'> FAILED </h6>") : "<h6 class='text-danger'> Not yet taken exam </h6>")


              );
         
      }
      $output = array(
              "draw" => $draw,
              "recordsTotal" => $studs->num_rows(),
              "recordsFiltered" => $studs->num_rows(),
              "data" => $data
      );
          echo json_encode($output);
          exit();
    }    

    public function course_type(){
      $class=$this->model->select_course_class($this->input->post('id'));
      $data=array();
      foreach($class->result() as $c){
        $data[]=array(
          "class"=>($c->class !==null ? $c->class : null)
        );
      }
      echo json_encode($data);
    }

    public function course_type_archived(){
      $class=$this->model->select_course_class_archived($this->input->post('id'));
      $data=array();
      foreach($class->result() as $c){
        $data[]=array(
          "class"=>($c->class !==null ? $c->class : null)
        );
      }
      echo json_encode($data);
    }

    public function Add_newsfeed(){
                $news=$this->model->select_all("newsfeed");
               /* if($news->num_rows()==5){
                  $get_first=$this->model->select_all_with_limit("newsfeed");
                  foreach($get_first->result() as $f){
                    $this->model->delete_where('newsfeed','news_id', $f->news_id);
                    unlink('./uploads/newsfeed/'.$f->news_image);
                  }
                }*/
                //unlink('./uploads/'.$filename);
                $config['upload_path']          = './uploads/newsfeed';
                $config['allowed_types']        = 'gif|jpg|png';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('userfile');

                
                 $data = array(
                    'news_title'=>$this->input->post('title'),
                    'news_content'=>$this->input->post('content'),
                    'source'=>$this->input->post('source'),
                    'news_image'=>$this->upload->data('file_name')
                  );
                if($this->model->insert_into("newsfeed", $data)){
                  echo json_encode(true); 
                }
    }

     public function Update_newsfeed(){
                $config['upload_path']          = './uploads/newsfeed';
                $config['allowed_types']        = 'gif|jpg|png';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('userfile');
                unlink('./uploads/newsfeed/'.$this->input->post('image'));
                 $data = array(
                    'news_title'=>$this->input->post('title'),
                    'news_content'=>$this->input->post('content'),
                    'news_image'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("newsfeed", $data, "news_id", $this->input->post('id'))){
                  echo json_encode(true); 
                }
    }

    public function Del_news()
    {
        if($this->model->delete_where('newsfeed','news_id', $this->input->post('id'))){
          unlink('./uploads/newsfeed/'.$this->input->post('image'));
            echo json_encode(true);
        }else{
            echo json_encode(false);
        }   
    }


    public function newsfeed_content(){
        $draw = intval($this->input->post("draw")); //for search input
        $start = intval($this->input->post("start")); //starting entry for first ten
        $length = intval($this->input->post("length")); //for pagination


          $mod = $this->model->select_all("newsfeed");

          $data = array();

          foreach($mod->result() as $r) {

               $data[] = array(
                    $r->news_title,
                     $r->news_content,
                     "<img src='/ABS/uploads/newsfeed/".$r->news_image."' width='300' height='250'>",
                     $r->source,
                    '<button data-toggle="modal" onclick="ModalNews('.$r->news_id.')" data-target="#EditNews" class="btn btn-warning"><i class="fa fa-edit"></i></button> <button class="btn btn-danger" onclick="DelNews('.$r->news_id.',\''.$r->news_image.'\')" data-toggle="modal" data-target="#DelNews"><i class="fa fa-trash"></i></button>',
               );
           }

          $output = array(
               "draw" => $draw,
                 "recordsTotal" => $mod->num_rows(),
                 "recordsFiltered" => $mod->num_rows(),
                 "data" => $data
            );
          echo json_encode($output);
          exit();
    }

    public function load_newsfeed(){
        $news=$this->model->select_all_where3("newsfeed");
        $data=array();
        if($news->num_rows()>0){
            foreach($news->result() as $n){
                $data[]=array(
                    "news_image"=>$n->news_image,
                    "news_id"=>$n->news_id,
                    "news_title"=>$n->news_title,
                    "source"=>$n->source,
                    "news_content"=>$n->news_content
                );
            }

        }else{
            $data=null;
        }
        echo json_encode($data);
    }

    public function select_newsfeed(){
        $news=$this->model->select_all_where("newsfeed","news_id",$this->input->post('id'));
        $data=array();
        foreach($news->result() as $n){
          $data[]=array(
            "news_id"=>$n->news_id,
            "news_title"=>$n->news_title,
            "news_image"=>$n->news_image,
            "source"=>$n->source,
            "news_content"=>$n->news_content
          );
        }
        echo json_encode($data);
    }

    public function view_more(){
        $news=$this->model->select_all("newsfeed");
        $data=array();
        foreach($news->result() as $n){
          $data[]=array(
            "news_id"=>$n->news_id,
            "news_title"=>$n->news_title,
            "news_image"=>$n->news_image,
            "source"=>$n->source,
            "news_content"=>$n->news_content
          );
        }
        echo json_encode($data);
    }

    public function load_studentfiles(){
        $sfile=$this->model->select_all_where("personal_information","account_id",$this->input->post('id'));
        $data=array();
        foreach($sfile->result() as $s){
          $data[]=array(
            "recom_letter"=>$s->recom_letter,
            "cert_nonpending"=>$s->cert_nonpending,
            "ecg"=>$s->ecg,
            "pins_spo_elig"=>$s->pins_spo_elig,
            "train_diploma"=>$s->train_diploma,
            "decla_grad"=>$s->decla_grad,
            "f_o_merit"=>$s->f_o_merit,
            "col_diploma"=>$s->col_diploma,
            "col_tor"=>$s->col_tor,
            "prom_order"=>$s->prom_order
          );
        }
        echo json_encode($data);
    }



       public function recom_letter(){

        $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('recom_letter');
                $folder='';
        if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
          unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('recom_letter'));
        }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
        }
                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('recom_letter');

                $this->session->unset_userdata('recom_letter');
                $data['recom_letter'] = $this->upload->data('file_name');
                $this->session->set_userdata('recom_letter', $data['recom_letter']);
                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'recom_letter'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function cert_nonpending(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('cert_nonpending');
                $folder='';
        if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files'; 
          $files=$this->session->userdata('cert_nonpending');
          if($files!==''){
            unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('cert_nonpending'));
          } 
        }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
        }
                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('cert_nonpending');

                $this->session->unset_userdata('cert_nonpending');
                $data['cert_nonpending'] = $this->upload->data('file_name');
                $this->session->set_userdata('cert_nonpending', $data['cert_nonpending']);
                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'cert_nonpending'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    
    }

       public function ecg(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('ecg');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
            $files=$this->session->userdata('ecg');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('ecg'));
            } 
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }

                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('ecg');

                $this->session->unset_userdata('ecg');
                $data['ecg'] = $this->upload->data('file_name');
                $this->session->set_userdata('ecg', $data['ecg']);


                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'ecg'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function pins_spo_elig(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('pins_spo_elig');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
            $files=$this->session->userdata('pins_spo_elig');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('pins_spo_elig'));
            }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }

                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('pins-spo_elig');

                $this->session->unset_userdata('pins_spo_elig');
                $data['pins_spo_elig'] = $this->upload->data('file_name');
                $this->session->set_userdata('pins_spo_elig', $data['pins_spo_elig']);

                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'pins_spo_elig'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function train_diploma(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('train_diploma');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
          $files=$this->session->userdata('train_diploma');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('train_diploma'));
            }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }
                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('train_diploma');


                $this->session->unset_userdata('train_diploma');
                $data['train_diploma'] = $this->upload->data('file_name');
                $this->session->set_userdata('train_diploma', $data['train_diploma']);


                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'train_diploma'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function decla_grad(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('decla_grad');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
          $files=$this->session->userdata('decla_grad');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('decla_grad'));
            }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }

                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('decla_grad');

                $this->session->unset_userdata('decla_grad');
                $data['decla_grad'] = $this->upload->data('file_name');
                $this->session->set_userdata('decla_grad', $data['decla_grad']);

                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'decla_grad'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function f_o_merit(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('f_o_merit');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
          $files=$this->session->userdata('f_o_merit');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('f_o_merit'));
            }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }

                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('f_o_merit');

                $this->session->unset_userdata('f_o_merit');
                $data['f_o_merit'] = $this->upload->data('file_name');
                $this->session->set_userdata('f_o_merit', $data['f_o_merit']);

                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'f_o_merit'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function col_diploma(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('col_diploma');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
          $files=$this->session->userdata('col_diploma');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('col_diploma'));
            }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }
                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('col_diploma');

                $this->session->unset_userdata('col_diploma');
                $data['col_diploma'] = $this->upload->data('file_name');
                $this->session->set_userdata('col_diploma', $data['col_diploma']);


                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'col_diploma'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function col_tor(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('col_tor');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
          $files=$this->session->userdata('col_tor');
            if($files!==''){
              unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('col_tor'));
            }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }
                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('col_tor');


                $this->session->unset_userdata('col_tor');
                $data['col_tor'] = $this->upload->data('file_name');
                $this->session->set_userdata('col_tor', $data['col_tor']);

                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'col_tor'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

       public function prom_order(){
          $filename = './uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('prom_order');
                $folder='';
          if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files';  
           $files=$this->session->userdata('prom_order');
              if($files!==''){
                unlink('./uploads/students/'.$this->session->userdata('badge_no').'/files/'.$this->session->userdata('prom_order'));
              }
          }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/files/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/files/', 0777, true);
          }
                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'pdf';
                $config['max_size']             = 5000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('prom_order');


                $this->session->unset_userdata('prom_order');
                $data['prom_order'] = $this->upload->data('file_name');
                $this->session->set_userdata('prom_order', $data['prom_order']);

                $acc_id=$this->session->userdata('acc_id');


                
                 $data = array(
                    'prom_order'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("personal_information", $data, "account_id", $acc_id )){
                  echo json_encode($data); 
                }
    }

    public function Forms()
    {
        $this->load->view('includes/header');
        $this->load->view('forms');
    }
    
    public function index()
    {
        $this->load->view('includes/header');
        $this->load->view('index');
        $this->load->view('includes/footer');
    }
    
     public function PSOCC()
    {
        $this->load->view('includes/header');
        $this->load->view('psocc');
        $this->load->view('includes/footer');
    }
    
     public function PSSLC()
    {
        $this->load->view('includes/header');
        $this->load->view('psslc');
        $this->load->view('includes/footer');
    }
    
     public function PSJLC()
    {
        $this->load->view('includes/header');
        $this->load->view('psjlc');
        $this->load->view('includes/footer');
    }
    
     public function PSBRC()
    {
        $this->load->view('includes/header');
        $this->load->view('psbrc');
        $this->load->view('includes/footer');
    }

    public function Course_Modules()
    {
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Academic Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/course-modules');
        }
        else{
            redirect(base_url('Controller/.'));
        }   
    }

     public function NAS_Modules()
    {
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Non-Academic Section' || $acc_type == 'Academic Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/nas-modules');
        }
        else{
            redirect(base_url('Controller/.'));
        }   
    }
    
    public function Others()
    {
        $this->load->view('includes/header');
        $this->load->view('others');
        $this->load->view('includes/footer');
    }

    public function Entertainment1()
    {
        $this->load->view('includes/header');
        $this->load->view('entertainment1');
        $this->load->view('includes/footer');
    }
    
    public function Entertainment2()
    {
        $this->load->view('includes/header');
        $this->load->view('entertainment2');
        $this->load->view('includes/footer');
    }

    public function Entertainment3()
    {
        $this->load->view('includes/header');
        $this->load->view('entertainment3');
        $this->load->view('includes/footer');
    }

    public function Entertainment4()
    {
        $this->load->view('includes/header');
        $this->load->view('entertainment4');
        $this->load->view('includes/footer');
    }

    public function Gallery()
    {
        $this->load->view('includes/header');
        $this->load->view('gallery');
        $this->load->view('includes/footer');
    }

    public function Register_student()
    {
        $this->load->view('includes/header');
        $this->load->view('register_student');
        $this->load->view('includes/footer');
    }

    //admin side
    
    public function Register_user()
    {
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Admin Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/register_user');
        }
        else{
            redirect(base_url('Controller/.'));
        }  
    }

     public function Admin_page()
    {
        $this->load->view('admin/admin_page');
    }

    public function Admin_subject()
    {

        $this->load->view('admin/includes/header');
        $this->load->view('admin/includes/admin_sidebar');
        $this->load->view('admin/admin-subject');

    }

  public function Announcement()
  {
      $acc_type = $this->session->userdata('acc_type'); 

      if ($acc_type == 'superadmin' || $acc_type == 'Academic Section' || $acc_type == 'Non-Academic Section' || $acc_type == 'Medical Section'|| $acc_type == 'Registrar Section' || $acc_type == 'Admin Section') {
        $this->load->view('admin/includes/header');
        $this->load->view('admin/includes/admin_sidebar');
        $this->load->view('admin/announcement');
      }
      else{
          redirect(base_url('Controller/.'));
      }
  }

    public function Admin_personalinfo(){
      $acc_type = $this->session->userdata('acc_type'); 

      if ($acc_type == 'superadmin' || $acc_type == 'Admin Section' || $acc_type == 'Academic Section' || $acc_type == 'Non-Academic Section' || $acc_type == 'Medical Section'|| $acc_type == 'Registrar Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/admin-personalinfo');
      }
      else{
          redirect(base_url('Controller/.'));
      }
    }

    public function Admin_quiz()
    {

        $this->load->view('admin/includes/header');
        $this->load->view('admin/includes/admin_sidebar');
        $this->load->view('admin/admin-quiz');

    }

    public function Newsfeed()
    {
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Non-Academic Section' || $acc_type == 'Admin Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/newsfeed');
        }
        else{
            redirect(base_url('Controller/.'));
        }  
    }
    
    public function admin_gallery()
    {
        $acc_type = $this->session->userdata('acc_type'); 

        if ($acc_type == 'superadmin' || $acc_type == 'Non-Academic Section' || $acc_type == 'Admin Section') {
          $this->load->view('admin/includes/header');
          $this->load->view('admin/includes/admin_sidebar');
          $this->load->view('admin/admin_gallery');
        }
        else{
            redirect(base_url('Controller/.'));
        }  
    }

    public function Enroll_psbrc(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
                $this->load->view('admin/includes/header');
                // $this->load->view('admin/includes/sidebar_student');
                $this->load->view('admin/enroll-psbrc');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_quiz(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
                $this->load->view('admin/includes/header');
                $this->load->view('admin/includes/sidebar_student');
                $this->load->view('admin/user-quiz');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_score(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
                $this->load->view('admin/includes/header');
                $this->load->view('admin/includes/sidebar_student');
                $this->load->view('admin/user-score');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_student(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
              $this->load->view('admin/includes/header');
              $this->load->view('admin/includes/sidebar_student');
              $this->load->view('admin/user-student');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_info(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
              $this->load->view('admin/includes/header');
              $this->load->view('admin/includes/sidebar_student');
              $this->load->view('admin/user-personalinfo');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_subject(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
              $this->load->view('admin/includes/header');
              $this->load->view('admin/includes/sidebar_student');
              $this->load->view('admin/user-subject');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_module(){
        if ($this->session->has_userdata('acc_id')) {
            if($this->session->userdata('acc_type')=='student'){  
              $this->load->view('admin/includes/header');
              $this->load->view('admin/includes/sidebar_student');
              $this->load->view('admin/user-module');
            }else{
                redirect(base_url('Controller/Admin'));
            }
        }else{
            redirect(base_url('Controller/.'));
        }
    }

    public function User_superadmin(){
        if($this->session->userdata('acc_type')=='superadmin' || $this->session->userdata('acc_type')=='Non-Academic Section' || $this->session->userdata('acc_type')=='Academic Section' || $this->session->userdata('acc_type')=='Registrar Section' || $this->session->userdata('acc_type')=='Medical Section' || $this->session->userdata('acc_type')=='Admin Section'){  
            redirect(base_url('Controller/Admin'));
        }
        else{
            redirect(base_url('Controller/User_student'));
        }
    }

    public function change_profile(){

        $filename = './uploads/students/'.$this->session->userdata('badge_no').'/images/'.$this->session->userdata('pic');
                $folder='';
        if(file_exists($filename)) {
          $folder = './uploads/students/'.$this->session->userdata('badge_no').'/images';  
          unlink('./uploads/students/'.$this->session->userdata('badge_no').'/images/'.$this->session->userdata('pic'));
        }else{
            $folder = './uploads/students/'.$this->session->userdata('badge_no').'/images/';
            mkdir('./uploads/students/'.$this->session->userdata('badge_no').'/images/', 0777, true);
        }

                $config['upload_path']          = $folder;
                $config['allowed_types']        = 'gif|jpg|png';
                $config['max_size']             = 500000;

                $this->load->library('upload', $config);
                $this->upload->do_upload('file');
                $this->session->unset_userdata('pic');
                $data['pic'] = $this->upload->data('file_name');
                $this->session->set_userdata('pic', $data['pic']);
                 $data = array(
                    'acct_img'=>$this->upload->data('file_name')
                  );
                if($this->model->update_where("accounts", $data, "account_id", $this->session->userdata('acc_id'))){
                  echo json_encode($this->upload->data('file_name')); 
                }
    }

    public function Logout(){
    $data = array(
                       'acc_id'=> '',
                       'email'=> '',
                       'fname'=> '',
                       'mname'=> '',
                       'mname'=> '',
                       'account_sessions'=>0
                    );
    $acc_id=$this->session->userdata('acc_id');
    $data1=array('account_sessions'=>0,'remarks'=>'');
    $this->model->update_where('accounts', $data1, 'account_id', $acc_id);
    $this->session->unset_userdata($data);
    $this->session->sess_destroy();
    redirect(base_url('Controller/Login'));
   }    
}
