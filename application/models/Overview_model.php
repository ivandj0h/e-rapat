<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Overview_model extends CI_Model
{
    protected $table   = 'view_user_meeting';

    public function get_all_today()
    {
        $todaydate = date('Y-m-d');
        $in = array(0, 1, 2);
        $this->db->where('date_issues', $todaydate);
        $this->db->where_in('request_status', $in);
        return $this->db->get($this->table)->result_array();
    }

    public function get_free_meeting_room()
    {
        $todaydate = date('Y-m-d');
        // $ignore = array(0, 1, 2);
        $this->db->where('date_issues', $todaydate);
        // $this->db->where_not_in('request_status', $ignore);
        return $this->db->get($this->table)->result_array();
    }
}
