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
        $this->load->view('includes/header');
        $this->load->view('includes/sidebar');
        $this->load->view('includes/topbar');
		$this->load->view('subject');
		$this->load->view('includes/footer');


    }

    //--------------------------->functions-----------------------------------------
       public function Add_Subj(){
		//$minutes=$this->input->post('mod_test_time')*60;
		$data = $this->input->post('data');
        $data = array(
                    "subj_name"=>$data[0],
					"subj_desc"=>$data[1],
					"subj_file"=>$data[2]
                );
         if($this->model->insert_into("subject", $data)){
           echo json_encode(true);
        }
    }

     public function subject_list()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_all($this->input->post("table"));

          $data = array();

          foreach($mod->result() as $r) {
              //$minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    $r->subj_name,
                    $r->subj_desc,
                    ($r->subj_file=='' ? 'No link found' : $r->subj_file),
                   '<a data-toggle="modal" data-target="#ViewSubj" data-toggle="tooltip" data-placement="top" title="View Subjects" class="btn btn-info btn-circle btn-sm">
                                                    <i class="fa fa-info-circle"></i>
                                                </a>
                                                <a   data-toggle="modal" data-target="#ViewStuds" data-toggle="tooltip" data-placement="top" title="View Students" class="btn btn-primary btn-circle btn-sm">
                                                    <i class="fa fa-child"></i>
                                                </a>
                                                <a data-toggle="modal"  data-target="#EditMod" class="btn btn-warning btn-circle btn-sm" title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </a>'
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
}
