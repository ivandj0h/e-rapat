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
    }

    public function index()
    {
        $data['title'] = 'Master Data Form';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('forms/index', $data);
    }

    public function user()
    {
        $data['title'] = 'Kelolah User Form';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('forms/users', $data);
    }
}
