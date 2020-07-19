<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Meeting_model extends CI_Model
{
    protected $table   = 'meeting';

    public function delete_meeting($id)
    {
        // Running the Query
        $query = $this->db->where('id', $id)->delete($this->table);

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
