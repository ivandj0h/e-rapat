<?php
defined('BASEPATH') or exit('No direct script access allowed');

class About extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		// was_logged_in();
		$this->load->model('Account_model');
		$this->load->model('Calendar_model');
	}

	public function index()
	{
		$data['title'] = 'E-RAPAT';
		$data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

		$this->load->view('layout/front_header', $data);
		$this->load->view('layout/front_topbar', $data);
		$this->load->view('frontend/about', $data);
		$this->load->view('layout/front_footer', $data);
	}
}
