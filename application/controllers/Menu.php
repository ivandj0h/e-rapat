<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->library('form_validation');
        $this->load->model('PUAModel');
        $this->load->model('MenuModel', 'menu');
        $this->load->model('MenuModel');
    }

    public function index()
    {
        $data['title'] = 'Menu Management';
        $data['profiles'] = $this->PUAModel->get_all_data();
        $data['menu'] = $this->MenuModel->get_all_menu();

        $this->form_validation->set_rules('menu', 'Menu', 'required');

        if ($this->form_validation->run() == false) {

            $this->load->view('layout/app/app_header', $data);
            $this->load->view('layout/app/app_sidebar', $data);
            $this->load->view('layout/app/app_topbar', $data);
            $this->load->view('modul/menu/index', $data);
            $this->load->view('layout/app/app_footer');
        } else {

            $data = array('menu' => $this->input->post('menu'));

            $this->MenuModel->insert_menu($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu <strong>' . $data['menu'] . '</strong> has been Added!</div>');
            redirect('menu');
        }
    }

    public function updatemenu()
    {
        $id = $this->input->post('id');
        $data = array('menu' => $this->input->post('menu'));

        $this->MenuModel->update_menu($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu <strong>' . $data['menu'] . '</strong> has been Updated!</div>');
        redirect('menu');
    }

    public function deletemenu()
    {
        $id = $this->input->post('id');

        $this->MenuModel->delete_menu($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Deleted!</div>');
        redirect('menu');
    }
}
