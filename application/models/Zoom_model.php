<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Zoom_model extends CI_Model
{
    protected $meeting_users = 'meeting_users';
    protected $meeting_zoom = 'meeting_zoom';
    protected $view_zoom_meeting = 'view_zoom_meeting';

    public function get_all_user_accounts()
    {
        return $this->db->get($this->meeting_users)->result_array();
    }

    public function getzoom()
    {
        return $this->db->get($this->view_zoom_meeting)->result_array();
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
}
