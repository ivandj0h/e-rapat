<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('Account_model');
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/index', $data);
        $this->load->view('layout/footer');
    }

    public function role()
    {
        $data['title'] = 'Role';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['role'] = $this->Account_model->get_where_role();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/role', $data);
        $this->load->view('layout/footer');
    }

    public function roleaccess($role_id)
    {
        $data['title'] = 'Role Access';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['role'] = $this->Account_model->get_where_user_role($role_id);

        $this->db->where('id !=', 1);
        $data['menu'] = $this->db->get('user_menu')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/role-access', $data);
        $this->load->view('layout/footer');
    }

    public function changeaccess()
    {
        // first, get data from ajax
        $role_id = $this->input->post('roleId');
        $menu_id = $this->input->post('menuId');

        $data = [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ];

        $result = $this->db->get_where('user_access_menu', $data);

        if ($result->num_rows() < 1) {
            $this->db->insert('user_access_menu', $data);
        } else {
            $this->db->delete('user_access_menu', $data);
        }

        // create Success Alert
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Congradulation!</strong> You have successfully change the Access!
      </div>');
    }

    public function account()
    {
        $data['title']   = 'Account';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['account'] = $this->Account_model->get_all_users();
        $data['department'] = $this->Account_model->get_all_department();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/account', $data);
        $this->load->view('layout/footer');
    }

    public function addaccount()
    {
        $data['title']   = 'Account';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['account'] = $this->Account_model->get_all_users();
        $data['department'] = $this->Account_model->get_all_department();

        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[meeting_users.email]', [
            "is_unique" => "This Email already registered!"
        ]);
        $this->form_validation->set_rules('department_id', 'Department Name', 'required');

        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('admin/account', $data);
            $this->load->view('layout/footer');
        } else {

            $uniqueid = uniqid();
            $password = "admin"; // $2y$10$rlSQG0XGwZnCtqv61NLKkONCAL1SUJdVeJ/95FFWOxSEeGJ9rqLwW
            $data = [
                'uniqueid' => $uniqueid,
                'name' => htmlspecialchars($this->input->post('name', true)),
                'email' => htmlspecialchars($this->input->post('email', true)),
                'image' => "default-avatar.jpg",
                'password' => password_hash($password, PASSWORD_DEFAULT),
                'role_id' => 2,
                'is_active' => intval($this->input->post('is_active', true)),
                'department_id' => intval($this->input->post('department_id')),
                'date_created' => time()
            ];

            $this->Account_model->insert_account($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> Account has been Added!.</div>');
            redirect('admin/account');
        }
    }

    public function updateaccount()
    {
        $data['title']   = 'Account';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['account'] = $this->Account_model->get_all_users();
        $data['department'] = $this->Account_model->get_all_department();

        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');

        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('admin/account', $data);
            $this->load->view('layout/footer');
        } else {

            $data = [
                'id' => intval($this->input->post('id')),
                'name' => htmlspecialchars($this->input->post('name')),
                'email' => htmlspecialchars($this->input->post('email')),
                'role_id' => $this->input->post('role_id', true),
                'is_active' => intval($this->input->post('is_active')),
                'department_id' => intval($this->input->post('department_id')),
                'date_updated' => time()
            ];

            $this->Account_model->update_account($data);
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> Account has beed Updated!.</div>');
            redirect('admin/account');
        }
    }

    public function deleteaccount()
    {
        $id = $this->input->post('id');

        $data = $this->Account_model->get_where($id);
        $old_images = $data['image'];

        if ($old_images != 'default-avatar.jpg') {
            unlink(FCPATH . 'assets/img/profile/' . $old_images);
        }

        $this->Account_model->delete_account($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Account has beed deleted!.</div>');
        redirect('admin/account');
    }

    public function forceresetpass()
    {
        $id = $this->input->post('id');
        $password = "admin"; // $2y$10$rlSQG0XGwZnCtqv61NLKkONCAL1SUJdVeJ/95FFWOxSEeGJ9rqLwW
        $data = [
            'password' => password_hash($password, PASSWORD_DEFAULT),
            'date_updated' => time()
        ];

        $this->Account_model->reset_password($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Password has beed Updated!.</div>');
        redirect('admin/account');
    }
}
