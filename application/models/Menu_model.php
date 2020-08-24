<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu_model extends CI_Model
{
    protected $table_menu = 'user_menu';
    protected $table_sub_menu = 'user_sub_menu';

    public function get_all()
    {
        return $this->db->get($this->table_menu)->result_array();
    }

    public function insert_menu($data)
    {
        $this->db->insert($this->table_menu, $data);
    }

    public function update_menu($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update($this->table_menu, $data);
    }

    public function delete_menu($id)
    {
        $this->db->where('id', $id);
        $this->db->delete($this->table_menu);
    }

    public function getSubMenu()
    {
        $query = "SELECT `user_sub_menu`.*, `user_menu`.`menu`
            FROM `user_sub_menu` JOIN `user_menu`
            ON `user_sub_menu`.`menu_id` = `user_menu`.`id`
           ";

        return $this->db->query($query)->result_array();
    }

    public function insert_sub_menu($data)
    {
        return $this->db->insert($this->table_sub_menu, $data);
    }

    public function update_sub_menu($data, $id)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->table_sub_menu, $data);
    }

    public function delete_sub_menu($id)
    {
        return $this->db->where('id', $id)->delete($this->table_sub_menu);
    }
}
