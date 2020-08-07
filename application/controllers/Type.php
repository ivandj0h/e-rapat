<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Type extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        // is_logged_in();
        $this->load->model('Account_model');
        $this->load->model('Type_model');
    }

    // Media Meeting Type
    public function index()
    {
        $data['title']   = 'Media Type';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['type'] = $this->Type_model->get_all_type();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('type/index', $data);
        $this->load->view('layout/footer');
    }

    public function addtype()
    {
        $data['title']   = 'Media Type';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['type'] = $this->Type_model->get_all_type();

        $this->form_validation->set_rules('meeting_type', 'Media Type', 'required|trim');
        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('type/index', $data);
            $this->load->view('layout/footer');
        } else {

            $data = array('meeting_type' => $this->input->post('meeting_type'));
            $this->Type_model->insert_type($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Media Type has been Added!</div>');
            redirect('type/index');
        }
    }

    public function edittype()
    {

        $id = $this->input->post('id');
        $data = array('meeting_type' => $this->input->post('meeting_type'));

        $this->Type_model->update_type($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Media Type has been Updated!</div>');
        redirect('type/index');
    }

    public function deletetype()
    {
        $id = $this->input->post('id');

        $this->Type_model->delete_type($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Media Type has been Deleted!</div>');
        redirect('type/index');
    }
}
