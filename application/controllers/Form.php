<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Form extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper(array('string', 'text'));
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
        $this->load->model('Type_model');
        $this->load->model('Zoom_model');
        $this->load->model('History_model');
    }

    public function index()
    {
        $data['title'] = 'Master Data Form';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_user'] = $this->Meeting_model->get_all_meeting_by_sesi($this->session->userdata('email'));
        $data['meeting_admin'] = $this->Meeting_model->get_all_meeting();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('forms/index', $data);
    }
}
