<?php
defined('BASEPATH') or exit('No direct script access allowed');

class History extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper(array('string', 'text'));
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
        $this->load->model('History_model');
        $this->load->model('Department_model');
    }

    public function index()
    {
        $data['title'] = 'Riwayat Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_user'] = $this->Meeting_model->get_all_meeting_by_sesi($this->session->userdata('email'));
        $data['meeting_admin'] = $this->Meeting_model->get_all_meeting();

        $this->form_validation->set_rules('from_date', 'From Date', 'required');
        $this->form_validation->set_rules('to_date', 'To Date', 'required');

        $where = array(
            'from_date' => $this->input->post('from_date'),
            'to_date' => $this->input->post('to_date')
        );

        if ($this->form_validation->run() == false) {
            if ($data['user']['role_id'] == 1) {
                $this->load->view('layout/header', $data);
                $this->load->view('layout/sidebar', $data);
                $this->load->view('layout/topbar', $data);
                $this->load->view('history/admin', $data);
                $this->load->view('layout/footer');
            } else {
                $this->load->view('layout/header', $data);
                $this->load->view('layout/sidebar', $data);
                $this->load->view('layout/topbar', $data);
                $this->load->view('history/index', $data);
                $this->load->view('layout/footer');
            }
        } else {
            $data['meeting_admin'] = $this->History_model->get_all_history_meeting_by_daterange_admin($where);
            $data['meeting_user'] = $this->History_model->get_all_history_meeting_by_daterange($where, $this->session->userdata('email'));

            if ($data['user']['role_id'] == 1) {
                $this->load->view('layout/header', $data);
                $this->load->view('layout/sidebar', $data);
                $this->load->view('layout/topbar', $data);
                $this->load->view('history/admin', $data);
                $this->load->view('layout/footer');
            } else {
                $this->load->view('layout/header', $data);
                $this->load->view('layout/sidebar', $data);
                $this->load->view('layout/topbar', $data);
                $this->load->view('history/index', $data);
                $this->load->view('layout/footer');
            }
        }
    }

    public function searchdept()
    {
        $data['title'] = 'Riwayat Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting_user'] = $this->History_model->get_all_history_meeting($this->session->userdata('email'));
        $data['meeting_admin'] = $this->Meeting_model->get_all_meeting();
        $data['dept'] = $this->Department_model->get_all_department();

        $this->form_validation->set_rules('department_id', 'Nama Esalon 2', 'required');

        $where = array(
            'department_id' => $this->input->post('department_id')
        );

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('history/searchdept', $data);
            $this->load->view('layout/footer');
        } else {

            $data['meeting_admin'] = $this->History_model->get_all_history_meeting_by_department_admin($where);

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('history/searchdept', $data);
            $this->load->view('layout/footer');
        }
    }
}
