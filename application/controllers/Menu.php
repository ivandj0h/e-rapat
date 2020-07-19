<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('Menu_model', 'menu');
        $this->load->model('Menu_model');
    }

    public function index()
    {
        $data['title'] = 'Menu Management';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['menu'] = $this->Menu_model->get_all();

        // set Rules for menu
        $this->form_validation->set_rules('menu', 'Menu', 'required');


        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('menu/index', $data);
            $this->load->view('layout/footer');
        } else {

            $data = array('menu' => $this->input->post('menu'));

            // calling model to save data
            $this->Menu_model->insert_menu($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Added!</div>');
            redirect('menu');
        }
    }

    public function updatemenu()
    {
        // get post id
        $id = $this->input->post('id');
        $data = array('menu' => $this->input->post('menu'));

        // calling model to update data
        $this->Menu_model->update_menu($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Updated!</div>');
        redirect('menu');
    }

    public function submenu()
    {
        $data['title'] = 'SubMenu Management';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();

        $data['subMenu'] = $this->menu->getSubMenu();
        $data['menu'] = $this->db->get('user_menu')->result_array();

        // set Rules for menu
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
                'menu_id'   => $this->input->post('menu_id'),
                'url'       => $this->input->post('url'),
                'icon'      => $this->input->post('icon'),
                'is_active' => $this->input->post('is_active')
            ];

            // calling model to save data
            $this->Menu_model->insert_sub_menu($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> New subMenu was Added!</div>');
            redirect('menu/submenu');
        }
    }

    public function deletemenu()
    {
        // get post id
        $id = $this->input->post('id');

        // calling model to delete data
        $this->Menu_model->delete($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Congradulation!</strong> Menu has been Deleted!</div>');
        redirect('menu');
    }
}
