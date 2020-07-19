<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MenuModel extends CI_Model
{
    protected $table_menu = 'user_menu';

    public function get_all_menu()
    {
        return $this->db->get($this->table_menu)->result_array();
    }

    public function insert_menu($data)
    {
        return $this->db->insert($this->table_menu, $data);
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
}
