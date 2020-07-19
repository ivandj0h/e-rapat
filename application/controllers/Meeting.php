<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Meeting extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper('date');
        $this->load->model('Meeting_model');
    }

    public function index()
    {
        $data['title'] = 'Meeting';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['meeting'] = $this->db->get('view_meeting')->result_array();
        $data['place'] = $this->db->get('meeting_place')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('meeting/index', $data);
        $this->load->view('layout/footer');
    }

    public function create()
    {
        $data['title'] = 'Meeting';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['meeting'] = $this->db->get('view_meeting')->result_array();
        $data['place'] = $this->db->get('meeting_place')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('meeting/create', $data);
        $this->load->view('layout/footer');
    }

    public function request()
    {
        // get user id from session
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $user_id = $data['acc']['id'];

        // set Rules for menu
        $this->form_validation->set_rules('agenda', 'Agenda', 'required');
        $this->form_validation->set_rules('place_id', 'Meeting Place', 'required');
        $this->form_validation->set_rules('date_issues', 'Meeting Date', 'required');
        $this->form_validation->set_rules('start_time', 'Start Meeting', 'required');
        $this->form_validation->set_rules('end_time', 'End Meeting', 'required');

        if ($this->form_validation->run() == false) {

            $data['title'] = 'Meeting';
            $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
            $data['meeting'] = $this->db->get('view_meeting')->result_array();
            $data['place'] = $this->db->get('meeting_place')->result_array();

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('meeting/create', $data);
            $this->load->view('layout/footer');
        } else {

            $data = [
                'user_id' => $user_id,
                'place_id' => $this->input->post('place_id', true),
                'agenda' => htmlspecialchars($this->input->post('agenda', true)),
                'date_issues' => $this->input->post('date_issues', true),
                'date_requested' => date('Y-m-d'),
                'start_time' => $this->input->post('start_time', true),
                'end_time' => $this->input->post('end_time', true),
                'request_status' => 0
            ];

            // var_dump($data);
            // die;
            $this->db->insert('meeting', $data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Data Meeting has been requested!</div>');
            redirect('meeting');
        }
    }

    public function updatestatus()
    {
        // get post id
        $id = $this->input->post('id');
        $data = array('request_status' => $this->input->post('request_status'));

        // updating execution
        $this->Meeting_model->update_meeting_status($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Status Meeting has been Updated!</div>');
        redirect('meeting');
    }

    public function delete()
    {
        // get post id
        $id = $this->input->post('id');

        // deleting execution
        $this->Meeting_model->delete_meeting($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Data Meeting has been Deleted!</div>');
        redirect('meeting');
    }
}
