<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Meeting_model extends CI_Model
{
    protected $table   = 'view_user_meeting';
    protected $meeting   = 'meeting';

    public function get_all_meeting()
    {
        return $this->db->get($this->table)->result_array();
    }

    public function get_one_meeting($unique)
    {
        $this->db->where('unique_code', $unique);
        return $this->db->get($this->table)->result_array();
    }

    public function insert_meeting($data)
    {
        return $this->db->insert($this->meeting, $data);
    }

    public function delete_meeting($id)
    {
        // Running the Query
        $query = $this->db->where('id', $id)->delete($this->meeting);

        // Return result of the Query
        return $query;
    }

    public function update_meeting_status($id, $data)
    {
        // Running the Query
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);
    }
}
