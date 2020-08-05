<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Department_model extends CI_Model
{
    protected $department = 'meeting_department';
    protected $subdepartment = 'meeting_sub_department';

    public function get_all_department()
    {
        return $this->db->get($this->department)->result_array();
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

    // Sub Department
    public function getSubDepartment()
    {
        $query = "SELECT `meeting_sub_department`.*, `meeting_department`.`department_name`
            FROM `meeting_sub_department` JOIN `meeting_department`
            ON `meeting_sub_department`.`department_id` = `meeting_department`.`id`
           ";

        return $this->db->query($query)->result_array();
    }

    public function insert_sub_department($data)
    {
        return $this->db->insert($this->subdepartment, $data);
    }

    public function update_sub_department($data, $id)
    {
        $this->db->where('id', $id);
        return $this->db->update($this->subdepartment, $data);
    }

    public function delete_sub_department($id)
    {
        return $this->db->where('id', $id)->delete($this->subdepartment);
    }
}
