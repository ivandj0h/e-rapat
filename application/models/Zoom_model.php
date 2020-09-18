<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Zoom_model extends CI_Model
{
    protected $meeting_users = 'meeting_users';
    protected $meeting_zoom = 'meeting_zoom';
    protected $view_zoom_meeting = 'view_zoom_meeting';
    protected $view_zoom_users = 'view_zoom_users';

    public function get_all_user_accounts()
    {
        return $this->db->get($this->meeting_users)->result_array();
    }

    public function getzoom_users()
    {
        return $this->db->get($this->view_zoom_users)->result_array();
    }

    public function getzoom_where_active()
    {
        return $this->db->get_where($this->view_zoom_users, array('type_id' => 1, 'is_active' => 1))->result_array();
    }

    public function getzoom()
    {
        return $this->db->get($this->view_zoom_meeting)->result_array();
    }

    public function check_status_zoom_today()
    {
        $date = new DateTime("now");
        $curr_date = $date->format('Y-m-d ');
        $typeId = 1;
        $this->db->select('*');
        $this->db->from($this->view_zoom_meeting);
        $this->db->where('DATE(date_activated)', $curr_date);
        $this->db->where('type_id', $typeId);
        return $this->db->get()->result_array();
    }

    public function insert_zoom($data)
    {
        return $this->db->insert($this->meeting_zoom, $data);
        $this->db->where('id', 1);
        $this->db->update($this->meeting_users, $data);
    }

    public function update_zoom($data, $id)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->meeting_zoom, $data);
    }

    public function delete_zoom($id)
    {
        return $this->db->where('id', $id)->delete($this->meeting_zoom);
    }

    public function reset_zoom($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->meeting_zoom, $data);
    }
}
