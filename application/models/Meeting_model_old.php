<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Meeting_model extends CI_Model
{
    protected $table   = 'view_user_meeting';
    protected $meeting   = 'meeting';

    public function start_exists($key)
    {
        $this->db->where('start_time', $key);
        $query = $this->db->get($this->meeting);
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function get_all_meeting()
    {
        $this->db->from($this->table);
        $this->db->order_by("name", "desc");
        return $this->db->get()->result_array();
    }

    public function get_all_meeting_by_role($role)
    {
        $condition = "role_id = " . $role;
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($condition);
        return $this->db->get()->result_array();
    }

    public function get_all_meeting_by_sesi($sesi)
    {
        $this->db->select("*");
        $this->db->from($this->table);
        $this->db->where('email', $sesi);

        return $this->db->get()->result_array();
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

    public function update_meeting($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);
    }

    public function upload_notulen($id)
    {
        $this->db->where('id', $id);
        $this->db->update($this->meeting);
    }

    public function delete_meeting($id)
    {
        return $this->db->where('id', $id)->delete($this->meeting);
    }

    public function update_meeting_status($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);
    }

    public function get_undangan_download($id)
    {
        return $this->db->get_where($this->table, ['files_upload' => $id])->row();
    }

    public function get_notulen_download($id)
    {
        return $this->db->get_where($this->table, ['files_upload1' => $id])->row();
    }

    public function get_absensi_download($id)
    {
        return $this->db->get_where($this->table, ['files_upload2' => $id])->row();
    }

    public function get_info_upload($userid)
    {
        $condition = "user_id = " . $userid;
        $this->db->select('files_upload');
        $this->db->from($this->table);
        $this->db->where($condition);
        return $this->db->get()->result_array();
    }

    public function cek_waktu_rapat($id)
    {
        $this->db->select("CONCAT(start_date, ' ', start_time) as timestampStart");
        $this->db->from($this->table);
        $this->db->where($id);
        return $this->db->get()->row();
    }

    public function cek_media_rapat($id)
    {
        $this->db->select("type_id");
        $this->db->from($this->table);
        $this->db->where($id);
        return $this->db->get()->row();
    }
}
