<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}


	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('user');
		}

		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'required|trim');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'E-MEETING | Login';

			$this->load->view('layout/auth/auth_header', $data);
			$this->load->view('auth/login');
			$this->load->view('layout/auth/auth_footer');
		} else {
			$this->_login();
		}
	}

	private function _login()
	{
		$email = $this->input->post('email');
		$password = $this->input->post('password');

		$user = $this->db->get_where('meeting_users', ['email' => $email])->row_array();
		if ($user) {
			if ($user['is_active'] == 1) {
				if (password_verify($password, $user['password'])) {
					$data = [
						'id' => $user['id'],
						'email' => $user['email'],
						'role_id' => $user['role_id'],
					];
					$this->session->set_userdata($data);
					if ($user['role_id'] == 1) {

						redirect('admin');
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
}
