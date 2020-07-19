<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Account_model extends CI_Model
{
    public $table = 'meeting_users';
    public $table2 = 'view_user_department';
    public $role = 'user_role';

    public function get_where($where)
    {
        // Run this Query
        $query = $this->db->where($where)->get($this->table);

        // Return result of the Query
        return $query;
    }

    public function get_where_dept($where)
    {
        // Run this Query
        $query = $this->db->where($where)->get($this->table2);

        // Return result of the Query
        return $query;
    }

    public function get_where_role($where)
    {
        // Run this Query
        $query = $this->db->where($where)->get($this->role);

        // Return result of the Query
        return $query;
    }

    public function update_account($id, $data)
    {
        // Run this Query
        $this->db->set('menu', $data);
        $this->db->where('id', $id);
        $query = $this->db->update('meeting_users');

        // Return result of the Query
        return $query;
    }

    public function delete_account($id)
    {
        $query = $this->db->where('id', $id)->delete($this->table);

        // Return result of the Query
        return $query;
    }
}
