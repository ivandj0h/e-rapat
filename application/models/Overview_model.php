<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Overview_model extends CI_Model
{
    protected $table   = 'view_user_meeting';

    public function get_all_today()
    {
        $todaydate = date('Y-m-d');
        $this->db->where('date_issues', $todaydate);
        return $this->db->get($this->table)->result_array();
    }
}
