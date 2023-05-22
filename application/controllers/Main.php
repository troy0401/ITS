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
	  public function Module(){
        $this->load->view('includes/header');
        $this->load->view('includes/sidebar');
        $this->load->view('includes/topbar');
		$this->load->view('module');
		$this->load->view('includes/footer');


    }

    //--------------------------->functions-----------------------------------------
       public function Add_module(){
		//$minutes=$this->input->post('mod_test_time')*60;
		$data = $this->input->post('data');
        $data = array(
                    "mod_name"=>$data[0],
					"mod_desc"=>$data[1],
					"mod_exam_time"=>$data[2]*60,
					"mod_exam_item"=>$data[3],
                );
         if($this->model->insert_into("module", $data)){
           echo json_encode(true);
        }
    }

     public function modules()//admin view of modules
     {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));


          $mod = $this->model->select_all($this->input->post("table"));

          $data = array();

          foreach($mod->result() as $r) {
              $minutes=floor(((int)$r->mod_exam_time / 60) % 60);
               $data[] = array(
                    $r->mod_name,
                    $r->mod_desc,
                    ($r->mod_exam_time=='' ? '' : $minutes),
					$r->mod_exam_item,
                   '<a  data-toggle="modal" data-target="#ViewSubj" data-toggle="tooltip" data-placement="top" title="View Subjects" class="btn btn-info btn-circle btn-sm">
                                                    <i class="fa fa-info-circle"></i>
                                                </a>
                                                <a  onclick="ViewStuds('.$r->mod_id.','.$this->input->post("id").');" data-toggle="modal" data-target="#ViewStuds" data-toggle="tooltip" data-placement="top" title="View Students" class="btn btn-primary btn-circle btn-sm">
                                                    <i class="fa fa-child"></i>
                                                </a>
                                                <a data-toggle="modal" onclick="modhead('.$minutes.',\''.$r->mod_name.'\',\''.$r->mod_desc.'\','.$r->mod_id.')" data-target="#EditMod" class="btn btn-warning btn-circle btn-sm" title="Edit">
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
