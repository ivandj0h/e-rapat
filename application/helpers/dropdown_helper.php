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

function get_dropdown_media()
{
    $ci = get_instance();
    $data['subtype'] = $ci->db->get('meeting_sub_type')->result_array();
    if ($data['subtype'][0]['type_id'] == 1) {
        echo "<option value='0' disabled>-- Media Online --</option>";
        foreach ($data['subtype'] as $st) {
            echo "<option value=" . $st['id'] . ">" . $st['meeting_subtype'] . "</option>";
        }
    } else if ($data['subtype'][0]['type_id'] != 1) {
        echo "<option value='0' disabled>-- Media Offline --</option>";
        foreach ($data['subtype'] as $st) {
            echo "<option value=" . $st['id'] . ">" . $st['meeting_subtype'] . "</option>";
        }
    }
}
