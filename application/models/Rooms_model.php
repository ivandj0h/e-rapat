<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rooms_model extends CI_Model
{
    protected $rooms = 'meeting_place';

    public function get_all_rooms()
    {
        return $this->db->get($this->rooms)->result_array();
    }

    public function insert_room($data)
    {
        return $this->db->insert($this->rooms, $data);
    }

    public function update_room($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->rooms, $data);
    }

    public function delete_room($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete($this->rooms);
    }
}
