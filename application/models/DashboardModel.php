<?php

class DashboardModel extends CI_Model
{
    protected $table = 'view_meeting';

    public function __construct()
    {
        parent::__construct();
    }

    public function get_meeting_hari_ini()
    {
        $date = new DateTime("now");
        $curr_date = $date->format('Y-m-d ');

        return $this->db->get_where('view_meeting', ['DATE(date_issues)' => $curr_date])->result_array();
    }
}
