<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Feed extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper(array('string', 'text'));
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
        $this->load->model('History_model');
        $this->load->model('Zoom_model');
    }


    public function index()
    {
        $data['title'] = 'Pembaharuan';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_user'] = $this->Meeting_model->get_all_meeting_by_sesi($this->session->userdata('email'));
        $data['meeting_admin'] = $this->Meeting_model->get_all_meeting();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('feed/pembaharuan', $data);
        $this->load->view('layout/footer');
    }

    public function pembaharuan()
    {
        $data['title'] = 'Pembaharuan';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_updates'] = $this->Meeting_model->get_all_meeting_today();
        $data['zoom'] = $this->Zoom_model->getzoom();


        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('feed/pembaharuan', $data);
        $this->load->view('layout/footer');
    }
}
