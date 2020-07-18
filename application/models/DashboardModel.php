<?php

class DashboardModel extends CI_Model
{
    protected $table = 'view_meeting';

    public function __construct()
    {
        parent::__construct();
    }

    public function get_todays_meeting()
    {
        $date = new DateTime("now");
        $curr_date = $date->format('Y-m-d ');

        return $this->db->get_where('view_meeting', ['DATE(date_issues)' => $curr_date])->result_array();
    }

    public function get_count_status()
    {
        return $this->db->get('view_total_request_status')->result_array();
    }

    public function get_count_status_by_department()
    {
        $sp = "CALL sp_meeting_department()";
        return $this->db->query($sp)->row_array();
    }

    public function get_department()
    {
        return $this->db->get('meeting_department')->result_array();
    }

    public function get_meeting_place()
    {
        return $this->db->get('meeting_place')->result_array();
    }
}
