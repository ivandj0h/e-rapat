<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['user'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/index', $data);
        $this->load->view('layout/footer');
    }

    public function role()
    {
        $data['title'] = 'Role';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['user'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['role'] = $this->db->get('user_role')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/role', $data);
        $this->load->view('layout/footer');
    }

    public function roleaccess($role_id)
    {
        $data['title'] = 'Role Access';
        $data['acc'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();
        $data['user'] = $this->db->get_where('meeting_users', ['email' => $this->session->userdata('email')])->row_array();

        // get data role were passed through url and find it on role table
        $data['role'] = $this->db->get_where('user_role', ['id' => $role_id])->row_array();

        // get all menu from table menu but not include admin
        $this->db->where('id !=', 1);
        $data['menu'] = $this->db->get('user_menu')->result_array();

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('admin/role-access', $data);
        $this->load->view('layout/footer');
    }

    // change role access using ajax by clicking the check input
    public function changeaccess()
    {
        // first, get data from ajax
        $role_id = $this->input->post('roleId');
        $menu_id = $this->input->post('menuId');

        // then put it together into array
        $data = [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ];

        // do query in to the table using where condition
        // it would be return true/false
        $result = $this->db->get_where('user_access_menu', $data);

        // then check the result
        if ($result->num_rows() < 1) {

            // if false or there's no data means the role wasn't found on the table
            // then do insert directly
            $this->db->insert('user_access_menu', $data);
        } else {
            $this->db->delete('user_access_menu', $data);
        }

        // create Success Alert
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Congradulation!</strong> You have successfully change the Access!
      </div>');
    }
}
