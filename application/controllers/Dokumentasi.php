<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dokumentasi extends CI_Controller
{

	function index()
	{
		$data['title'] = 'E-RAPAT';

		$this->load->view('layout/front_header', $data);
		$this->load->view('frontend/dokumentasi', $data);
		$this->load->view('layout/front_footer', $data);
	}
}
