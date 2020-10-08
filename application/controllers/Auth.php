<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->library('form_validation');
    $this->load->model('Auth_model');
  }

  public function index()
  {
    if ($this->session->userdata('email')) {
      redirect('user');
    }

    $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
    $this->form_validation->set_rules('password', 'Password', 'required|trim');

    if ($this->form_validation->run() == false) {
      $data['title'] = 'E-RAPAT';

      $this->load->view('layout/front_header', $data);
      // $this->load->view('layout/front_topbar', $data);
      $this->load->view('auth/login');
      // $this->load->view('user');
    } else {
      // $this->load->view('user');
      $this->_login();
    }
  }

  private function _login()
  {
    $password = $this->input->post('password');
    $user = $this->Auth_model->get_user_login($this->input->post('email'));

    if ($user) {
      if ($user['is_active'] == 1) {
        if (password_verify($password, $user['password'])) {
          $data = [
            'id' => $user['id'],
            'email' => $user['email'],
            'name' => $user['name'],
            'role_id' => $user['role_id'],
          ];
          $this->session->set_userdata($data);
          if ($user['role_id'] == 1) {
            redirect('user');
          } else {
            redirect('user');
          }
        } else {
          $this->session->set_flashdata('messages', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Login Failed!</strong> You entered a wrong password!.</div>');
          redirect('auth');
        }
      } else {
        $this->session->set_flashdata('messages', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Login Failed!</strong> Your account has been blocked!.</div>');
        redirect('auth');
      }
    } else {
      $this->session->set_flashdata('messages', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Login Failed!</strong> Your account isn\'t registered!.</div>');
      redirect('auth');
    }
  }

  public function blocked()
  {
    $this->load->view('auth/blocked');
  }

  public function logout()
  {
    $this->session->unset_userdata('email');
    $this->session->unset_userdata('role_id');

    $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Congradulation!</strong> Logged out Success!.</div>');

    redirect('auth');
  }
}
