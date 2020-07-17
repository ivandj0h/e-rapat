<?php

class PUAModel extends CI_Model
{
    protected $table = 'view_user_department';

    public function __construct()
    {
        parent::__construct();
    }

    public function get_all_data()
    {
        return $this->db->get_where($this->table, ['email' => $this->session->userdata('email')])->row_array();
    }
}
