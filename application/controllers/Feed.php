<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Feed extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper(array('string', 'text', 'tanggal', 'date'));
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
        $this->load->model('Type_model');
        $this->load->model('Zoom_model');
        $this->load->model('History_model');
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

    public function cekzoom()
    {
        $data['title'] = 'Pembaharuan';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_updates'] = $this->Meeting_model->get_all_meeting_today();
        $data['zoom'] = $this->Zoom_model->check_status_zoom_today();


        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('feed/cekavailzoom', $data);
        $this->load->view('layout/footer');
    }

    public function penjelajahan()
    {
        $data['title'] = 'Pembaharuan';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_updates'] = $this->Meeting_model->get_all_meeting_today();
        $data['subtype'] = $this->Type_model->get_offline_room();

        $this->form_validation->set_rules('sub_type_id', 'Departmen Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('feed/penjelajahan', $data);
            $this->load->view('layout/footer');
        } else {
            $data['offline_updates'] = $this->History_model->get_all_history_meeting_by_offline($this->input->post('sub_type_id'));


            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('feed/penjelajahan', $data);
            $this->load->view('layout/footer');
        }
    }

    public function offlinemeeting()
    {
        $data['title'] = 'Pembaharuan';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['offline_updates'] = $this->History_model->get_offline_meeting_today();
        $data['subtype'] = $this->Type_model->get_offline_room();

        $this->form_validation->set_rules('sub_type_id', 'Ruangan Rapat', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('feed/offlinemeeting', $data);
            $this->load->view('layout/footer');
        } else {
            $data['offline_updates'] = $this->History_model->get_all_history_meeting_by_offline($this->input->post('sub_type_id'));


            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('feed/offlinemeeting', $data);
            $this->load->view('layout/footer');
        }
    }
}
