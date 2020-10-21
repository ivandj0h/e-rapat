<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Docs extends CI_Controller
{


    public function index()
    {
        $data['title'] = 'E-RAPAT';

        $this->load->view('frontend/getdokumentasi', $data);
    }

    public function getdokumentasi()
    {
        $data['title'] = 'E-RAPAT';

        $this->load->view('frontend/getdokumentasi', $data);
    }
}
