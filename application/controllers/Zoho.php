<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Zoho extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('Account_model');
        $this->load->model('Role_model');
    }

    public function index()
    {
        $data['title'] = 'Zoho API';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('zoho/index', $data);
        $this->load->view('layout/footer');
    }

    public function createform()
    {
        $data['title'] = 'Zoho API';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('zoho/createform', $data);
    }

    public function manageform()
    {
        $data['title'] = 'Zoho API';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('zoho/manageform', $data);
    }
}
