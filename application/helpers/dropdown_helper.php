<?php

function get_dropdown_time()
{
    for ($x = 1; $x <= 23; $x++) {
        if ($x < 10) {
            echo "<option value=0" . $x . ":00:00>0" . $x . ":00 AM</option>";
        } else {
            if ($x >= 12) {
                echo "<option value=" . $x . ":00:00>" . $x . ":00 PM</option>";
            } else {
                echo "<option value=" . $x . ":00:00>" . $x . ":00 AM</option>";
            }
        }
    }
}

function get_dropdown_media_online()
{
    $ci = get_instance();
    $condition = "type_id = 1";
    $ci->db->select('*');
    $ci->db->from('meeting_sub_type');
    $ci->db->where($condition);
    $data['subtype'] = $ci->db->get()->result_array();

    foreach ($data['subtype'] as $st) {
        echo "<option value=" . $st['id'] . ">" . $st['meeting_subtype'] . "</option>";
    }
}

function get_dropdown_media_offline()
{
    $ci = get_instance();
    $condition = "type_id = 2";
    $ci->db->select('*');
    $ci->db->from('meeting_sub_type');
    $ci->db->where($condition);
    $data['subtype'] = $ci->db->get()->result_array();
    foreach ($data['subtype'] as $st) {
        echo "<option value=" . $st['id'] . ">" . $st['meeting_subtype'] . "</option>";
    }
}

function get_dropdown_esalon_2()
{
    $ci = get_instance();
    $data['department'] = $ci->db->get('meeting_department')->result_array();
    foreach ($data['department'] as $d) {
        echo "<option value=" . $d['id'] . ">" . $d['department_name'] . "</option>";
    }
}
