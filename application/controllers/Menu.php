<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('Account_model');
        $this->load->model('Menu_model');
    }

    public function index()
    {
        $data['title'] = 'Pengelolaan Menu';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['menu'] = $this->Menu_model->get_all();

        $this->form_validation->set_rules('menu', 'Menu', 'required');

        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('menu/index', $data);
            $this->load->view('layout/footer');
        } else {

            $data = array('menu' => $this->input->post('menu'));

            $this->Menu_model->insert_menu($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Added!</div>');
            redirect('menu');
        }
    }

    public function updatemenu()
    {
        $id = $this->input->post('id');
        $data = array('menu' => $this->input->post('menu'));
        $this->session->set_flashdata('messages', '<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>Attention!</strong> This feature are disabled!, contact Developer</div>');
        redirect('menu');
    }


    public function deletemenu()
    {
        $id = $this->input->post('id');

        $this->Menu_model->delete_menu($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Deleted!</div>');
        redirect('menu');
    }

    public function submenu()
    {
        $data['title'] = 'Pengelolaan SubMenu';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $data['subMenu'] = $this->Menu_model->getSubMenu();
        $data['menu'] = $this->Menu_model->get_all();

        $this->form_validation->set_rules('title', 'menu', 'required');
        $this->form_validation->set_rules('menu_id', 'id menu', 'required');
        $this->form_validation->set_rules('url', 'url', 'required');
        $this->form_validation->set_rules('icon', 'icon', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('menu/submenu', $data);
            $this->load->view('layout/footer');
        } else {

            $data = [
                'title'     => $this->input->post('title'),
                'menu_id'   => intval($this->input->post('menu_id', true)),
                'url'       => $this->input->post('url'),
                'icon'      => $this->input->post('icon'),
                'is_active' => intval($this->input->post('is_active', true)),
            ];

            $this->Menu_model->insert_sub_menu($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> New subMenu was Added!</div>');
            redirect('menu/submenu');
        }
    }

    public function updatesubmenu()
    {
        if ($this->input->post('id')) {
            $data = array(
                'title'     => $this->input->post('title'),
                'menu_id'   => $this->input->post('menu_id'),
                'url'       => $this->input->post('url'),
                'icon'      => $this->input->post('icon'),
                'is_active' => intval($this->input->post('is_active', true)),
            );

            $this->Menu_model->update_sub_menu($data, $this->input->post('id', true));
        }
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Updated!</div>');
        redirect('menu/submenu');
    }

    public function deletesubmenu()
    {
        $id = $this->input->post('id');

        $this->Menu_model->delete_sub_menu($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Deleted!</div>');
        redirect('menu/submenu');
    }
}
