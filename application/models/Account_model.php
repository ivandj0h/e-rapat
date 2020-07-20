<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Account_model extends CI_Model
{
    public $table = 'meeting_users';
    public $table2 = 'view_user_department';
    public $role = 'user_role';
    public $department = 'meeting_department';
    protected $user_access_menu = 'user_access_menu';

    public function get_all_users()
    {
        return $this->db->get($this->table2)->result_array();
    }

    public function get_admin($where)
    {
        return $this->db->get_where($this->table2, ['email' => $where])->row_array();
    }

    public function get_all_department()
    {
        return $this->db->get($this->department)->result_array();
    }

    public function get_where($where)
    {
        return $this->db->get_where($this->table2, ['id' => $where])->row_array();
    }

    public function get_where_dept($where)
    {

        return $this->db->where($where)->get($this->table2);
    }

    public function get_where_role()
    {
        return $this->db->get($this->role)->result_array();
    }

    public function get_where_user_role($where)
    {
        return $this->db->get_where($this->role, ['id' => $where])->row_array();
    }

    public function insert_account($data)
    {
        return $this->db->insert($this->table, $data);
    }

    public function update_account($data)
    {
        $this->db->where('id', $data['id']);
        return $this->db->update($this->table, $data);
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

    public function get_user_access_menu($data)
    {
        return $this->db->get_where($this->user_access_menu, $data);
    }

    public function insert_user_access_menu($data)
    {
        return $this->db->insert($this->user_access_menu, $data);
    }

    public function delete_user_access_menu($id)
    {
        return $this->db->where('id', $id)->delete($this->user_access_menu);
    }
}
