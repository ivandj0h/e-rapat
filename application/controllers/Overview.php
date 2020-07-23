<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Overview extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper('date');
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
    }

    public function index()
    {
        $data['title'] = 'Overview';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting();
        $data['place'] = $this->db->get('meeting_place')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('overview/index', $data);
        $this->load->view('layout/footer');
    }
}
