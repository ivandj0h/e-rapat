<?php defined('BASEPATH') or exit('No direct script access allowed');

class Calendar_model extends CI_Model
{
    function fetch_all_event()
    {
        $this->db->order_by('id');
        return $this->db->get('view_user_meeting');
    }

    function insert_event($data)
    {
        $this->db->insert('events', $data);
    }

    function update_event($data, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('events', $data);
    }

    function delete_event($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('events');
    }
}
