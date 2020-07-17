<?php

class BaseModel extends CI_Model
{
    protected $table = '';

    public function __construct()
    {
        parent::__construct();
    }

    public function get_all_data()
    {
        return $this->db->get($this->table)->result_array();
    }
}
