<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Type_model extends CI_Model
{
    protected $type = 'meeting_type';
    protected $table_sub_type = 'meeting_sub_type';

    public function get_all_type()
    {
        return $this->db->get($this->type)->result_array();
    }

    public function insert_type($data)
    {
        return $this->db->insert($this->type, $data);
    }

    function get_id_type($id)
    {
        $this->db->where('type_id', $id);
        $this->db->where('is_active', 1);
        return $this->db->get($this->table_sub_type)->result_array();
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

    public function getSubType()
    {
        $query = "SELECT `meeting_sub_type`.*, `meeting_type`.`meeting_type`
            FROM `meeting_sub_type` JOIN `meeting_type`
            ON `meeting_sub_type`.`type_id` = `meeting_type`.`id`
           ";

        return $this->db->query($query)->result_array();
    }

    public function insert_sub_type($data)
    {
        return $this->db->insert($this->table_sub_type, $data);
    }

    public function update_sub_type($data, $id)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->table_sub_type, $data);
    }

    public function delete_sub_type($id)
    {
        return $this->db->where('id', $id)->delete($this->table_sub_type);
    }
}
