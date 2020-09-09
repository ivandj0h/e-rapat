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

    public function get_all_meeting_today()
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('date_format(end_date,"%Y-%m-%d")', 'CURDATE()', FALSE);
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

    public function store_meeting()
    {
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $a = $this->input->post('speakers_name');
        $b = $this->input->post('participants_name');
        $speakers = implode(',', (array) $a);
        $participants = implode(',', (array) $b);

        $sub_type_id = $this->input->post('meeting_subtype', true);
        $datenow = strtotime(date('Y-m-d'));
        $timenow = strtotime(date("H:i:s"));
        $end_date = strtotime($this->input->post('start_date', true));
        $end_time = strtotime($this->input->post('end_time', true));

        $zoomid = ($this->input->post('zoomid', true) ? $this->input->post('zoomid', true) : '0');

        if ($datenow >= $end_date && $timenow >= $end_time && $sub_type_id != '1') {
            $request_status = 3;
        } else {
            $request_status = 0;
        }

        $data = array(
            'user_id' => $data['user']['id'],
            'sub_type_id' => $sub_type_id,
            'zoomid' => $zoomid,
            'other_online_id' => htmlspecialchars($this->input->post('other_online_id', true)),
            'speakers_name' => $speakers,
            'members_name' => $participants,
            'unique_code' => uniqid(),
            'agenda' => htmlspecialchars($this->input->post('agenda', true)),
            'start_date' => $this->input->post('start_date', true),
            'end_date' => $this->input->post('start_date', true),
            'date_requested' =>  date('Y-m-d'),
            'start_time' => $this->input->post('start_time', true),
            'end_time' => $this->input->post('end_time', true),
            'request_status' => $request_status
        );

        if ($data['sub_type_id'] == 1) {
            $this->db->set('status', '1');
            $this->db->set('pemakai_id', $this->session->userdata('id'));
            $this->db->set('date_activated', $data['end_date']);
            $this->db->set('start_time', $data['start_time']);
            $this->db->set('end_time', $data['end_time']);
            $this->db->where('zoom_id', $data['zoomid']);
            $this->db->update('meeting_zoom');
        }

        $result = $this->db->insert($this->meeting, $data);
        return $result;
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
