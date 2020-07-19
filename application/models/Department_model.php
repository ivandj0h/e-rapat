<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Department_model extends CI_Model
{
    protected $table = 'meeting_department';

    // get all data from department table
    public function get_all()
    {
        return $this->db->get($this->table)
            ->result_array();
    }

    // insert data into department table
    public function insert($data)
    {
        return $this->db->insert($this->table, $data);
    }

    // update data into department table
    public function update($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);
    }

    // delete data from department table
    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete($this->table);
    }
}
