<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

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

			$this->load->view('layout/auth_header', $data);
			$this->load->view('auth/login');
			$this->load->view('layout/auth_footer');
		} else {
			// Give an underscore to indicate that the method is private
			$this->_login();
		}
	}

	/** 
	 * Script below are supported functions
	 * Script was made using private function
	 * the scripts are __login()
	 * 
	 * re-write code by dave
	 * on july 17, 2020
	 */
	// login function goes here
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
