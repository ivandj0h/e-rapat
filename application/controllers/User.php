<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        // is_logged_in();
        $this->load->library('form_validation');
        $this->load->model('PUAModel');
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $data['profiles'] = $this->PUAModel->get_all_data();

        $this->load->view('layout/app/app_header', $data);
        $this->load->view('layout/app/app_sidebar', $data);
        $this->load->view('layout/app/app_topbar', $data);
        $this->load->view('user/index', $data);
        $this->load->view('layout/app/app_footer');
    }
}
