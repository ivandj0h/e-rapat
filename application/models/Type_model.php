<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Type_model extends CI_Model
{
    protected $type = 'meeting_type';

    public function get_all_type()
    {
        return $this->db->get($this->type)->result_array();
    }

    public function insert_type($data)
    {
        return $this->db->insert($this->type, $data);
    }

    public function update_type($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->type, $data);
    }

    public function delete_type($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete($this->type);
    }
}
