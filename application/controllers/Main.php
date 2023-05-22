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
                );
         if($this->model->insert_into("module", $data)){
           echo json_encode(true);
        }
    }
}
