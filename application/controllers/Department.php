<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Department extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('Department_model');
    }

    public function index()
    {
        $data['title'] = 'Department';
        $data['acc'] = $this->db->get_where('view_user_department', ['email' => $this->session->userdata('email')])->row_array();
        $data['dept'] = $this->Department_model->get_all();

        // set Rules for menu
        $this->form_validation->set_rules('department_name', 'Department', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('department/index', $data);
            $this->load->view('layout/footer');
        } else {

            $data = array('department_name' => $this->input->post('department_name'));

            // calling model to save data
            $this->Department_model->insert_department($data);
            $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> New Menu was Added!</div>');
            redirect('admin/department');
        }
    }

    public function updatedepartment()
    {
        // get post id
        $id = $this->input->post('id');
        $data = array('department_name' => $this->input->post('department_name'));

        // calling model to update data
        $this->Department_model->update($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Department has been Updated!</div>');
        redirect('admin/department');
    }

    public function deletedepartment()
    {
        // get post id
        $id = $this->input->post('id');

        // calling model to delete data
        $this->Department_model->delete($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Department has been Deleted!</div>');
        redirect('admin/department');
    }
}
