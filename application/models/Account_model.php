<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Account_model extends CI_Model
{
    public $table = 'meeting_users';
    public $table2 = 'view_user_department';
    public $role = 'user_role';

    public function get_where($where)
    {
        return $this->db->get_where($this->table2, ['id' => $where])->row_array();
    }

    public function get_where_dept($where)
    {

        return $this->db->where($where)->get($this->table2);
    }

    public function get_where_role($where)
    {

        return $this->db->where($where)->get($this->role);
    }

    public function update_account($id, $data)
    {

        $this->db->set('menu', $data);
        $this->db->where('id', $id);
        $query = $this->db->update('meeting_users');

        return $query;
    }

    public function reset_password($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->table, $data);
    }

    public function delete_account($id)
    {
        return $this->db->where('id', $id)->delete($this->table);
    }
}
