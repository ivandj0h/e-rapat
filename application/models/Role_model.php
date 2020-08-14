<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Role_model extends CI_Model
{
    protected $role = 'user_role';

    public function get_all_role()
    {
        return $this->db->get($this->role)->result_array();
    }

    public function insert_role($data)
    {
        return $this->db->insert($this->role, $data);
    }

    public function update_role($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->role, $data);
    }

    public function delete_role($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete($this->role);
    }
}
