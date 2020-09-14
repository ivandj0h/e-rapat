<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper(array('alert'));
        $this->load->library('form_validation');
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
    }

    public function index()
    {
        $data['title'] = 'Profil Pengguna';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting_by_sesi($this->session->userdata('email'));

        // var_dump($data['meeting']);
        // die;

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('user/index', $data);
        $this->load->view('layout/footer');
    }

    public function changepassword()
    {

        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2], [
            "matches" => "Passwords do not match!",
            "min_length" => "Password too short"
        ]');
        $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');

        if ($this->form_validation->run() == false) {
            $data['title'] = 'Profile';
            $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('user/index', $data);
            $this->load->view('layout/footer');
        } else {

            $session_id = $this->session->userdata('id');
            $password = password_hash($this->input->post('password1'), PASSWORD_DEFAULT);
            $this->db->query("UPDATE `meeting_users` SET `password` = '$password' where `id` = '$session_id'");

            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Congradulation!</strong> Your Password has been Changed!.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            </div>');

            redirect('user');
        }
    }

    public function edit()
    {

        $data['title'] = 'Profil Pengguna';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        // give rules
        $this->form_validation->set_rules('name', 'Full Name', 'required|trim');

        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('user/edit', $data);
            $this->load->view('layout/footer');
        } else {
            $name = htmlspecialchars($this->input->post('name', true));
            $email = htmlspecialchars($this->input->post('email', true));

            // check if there's any picture uploaded
            $image_upload = $_FILES['image']['name'];

            if ($image_upload) {
                $config['allowed_types'] = 'gif|jpg|jpeg|png|bmp';
                $config['max_size'] = '1024';
                $config['upload_path'] = './assets/img/profile/';

                $this->load->library('upload', $config);


                if ($this->upload->do_upload('image')) {

                    $old_images = $data['user']['image'];

                    if ($old_images != 'default-avatar.jpg') {
                        unlink(FCPATH . 'assets/img/profile/' . $old_images);
                    }

                    $new_image = $this->upload->data('file_name');
                    $this->db->set('image', $new_image);
                } else {
                    echo $this->upload->display_errors();
                }
            }
            $this->db->set('name', $name);
            $this->db->where('email', $email);
            $this->db->update('meeting_users');

            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> Account has been Modified!.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>');
            redirect('user');
        }
    }
}
