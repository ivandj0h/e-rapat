<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Docs extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('string', 'text', 'tanggal', 'dropdown'));
        $this->load->model('Account_model');
    }

    public function index()
    {
        $data['title'] = 'E-RAPAT';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('frontend/getdokumentasi', $data);
    }

    public function getdokumentasi()
    {
        $data['title'] = 'E-RAPAT';

        $this->load->view('frontend/getdokumentasi', $data);
    }
}
