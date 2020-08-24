<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Role extends CI_Controller
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
        $data['title'] = 'Master Data Akses';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['role'] = $this->Role_model->get_all_role();

        $this->form_validation->set_rules('role', 'Role', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('role/index', $data);
            $this->load->view('layout/footer');
        } else {

            $data = array('role' => $this->input->post('role'));

            $this->Role_model->insert_role($data);
            $this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> Role baru telah ditambahkan!</div>');
            redirect('role');
        }
    }

    public function updaterole()
    {
        $id = $this->input->post('id');
        $data = array('role' => $this->input->post('role'));

        $this->Role_model->update_role($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> Data Role berhasil diubah!</div>');
        redirect('role');
    }

    public function deleterole()
    {
        $id = $this->input->post('id');

        $this->Role_model->delete_role($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> Data Role berhasil dihapus!</div>');
        redirect('role');
    }
}
