<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Meeting extends CI_Controller
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
        $data['title'] = 'Meeting';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting();
        $data['place'] = $this->db->get('meeting_place')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('meeting/index', $data);
        $this->load->view('layout/footer');
    }

    public function addmeeting()
    {
        $data['title'] = 'Meeting';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting();
        $data['place'] = $this->db->get('meeting_place')->result_array();

        $this->form_validation->set_rules('place_id', 'Place Name', 'required');
        $this->form_validation->set_rules('agenda', 'Agenda', 'required|trim');

        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('meeting/create', $data);
            $this->load->view('layout/footer');
        } else {

            $data = [
                'user_id' => $data['user']['id'],
                'place_id' => $this->input->post('place_id', true),
                'unique_code' => uniqid(),
                'agenda' => htmlspecialchars($this->input->post('agenda', true)),
                'date_issues' => $this->input->post('date_issues', true),
                'date_requested' => date('Y-m-d'),
                'start_time' => $this->input->post('start_time', true),
                'end_time' => $this->input->post('end_time', true),
                'request_status' => 0
            ];

            $this->Meeting_model->insert_meeting($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> New subMenu was Added!</div>');
            redirect('meeting');
        }
    }

    public function detailsmeeting($unique)
    {
        $data['title'] = 'Meeting';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_one_meeting($unique);

        // var_dump($data['meeting']);
        // die;
        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('meeting/details', $data);
        $this->load->view('layout/footer');
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
