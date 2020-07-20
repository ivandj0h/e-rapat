<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Department_model extends CI_Model
{
    protected $department = 'meeting_department';

    public function get_all_department()
    {
        return $this->db->get($this->department)
            ->result_array();
    }

    public function insert_department($data)
    {
        return $this->db->insert($this->department, $data);
    }

    public function update_department($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->department, $data);
    }

    public function delete_department($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete($this->department);
    }
}
