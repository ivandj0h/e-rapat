<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Beranda extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		// was_logged_in();
		$this->load->model('Account_model');
		$this->load->model('Calendar_model');
	}

	function index()
	{
		$data['title'] = 'E-RAPAT';
		$data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

		$this->load->view('layout/front_header', $data);
		$this->load->view('layout/front_topbar', $data);
		$this->load->view('frontend/calendar', $data);
		$this->load->view('layout/front_footer', $data);
	}

	function load()
	{
		$event_data = $this->fullcalendar_model->fetch_all_event();
		foreach ($event_data->result_array() as $row) {
			$data[] = array(
				'id'	=>	$row['id'],
				'title'	=>	$row['name'],
				'sub_department_id'	=>	$row['sub_department_id'],
				'sub_department_name'	=>	$row['sub_department_name'],
				'meeting_subtype'	=>	$row['meeting_subtype'],
				'start_time'	=>	$row['start_time'],
				'end_time'	=>	$row['end_time'],
				'start'	=>	$row['start_date'],
				'end'	=>	$row['end_date']
			);
		}
		// var_dump($data);die;
		echo json_encode($data);
	}
}
