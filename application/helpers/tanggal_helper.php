<?php

if (!function_exists('changeDateFormat')) {

    function changeDateFormat($format = 'd-m-Y', $originalDate)

    {
        return date($format, strtotime($originalDate));
    }
}

date_default_timezone_set('Asia/Jakarta');
// echo facebook_time_ago('2016-03-11 04:58:00');
function facebook_time_ago($timestamp)
{
    $time_ago = strtotime($timestamp);
    $current_time = time();
    $time_difference = $current_time - $time_ago;
    $seconds = $time_difference;
    $minutes      = round($seconds / 60);           // value 60 is seconds  
    $hours           = round($seconds / 3600);           //value 3600 is 60 minutes * 60 sec  
    $days          = round($seconds / 86400);          //86400 = 24 * 60 * 60;  
    $weeks          = round($seconds / 604800);          // 7*24*60*60;  
    $months          = round($seconds / 2629440);     //((365+365+365+365+366)/5/12)*24*60*60  
    $years          = round($seconds / 31553280);     //(365+365+365+365+366)/5 * 24 * 60 * 60  
    if ($seconds <= 60) {
        return " Baru saja";
    } else if ($minutes <= 60) {
        if ($minutes == 1) {
            return " 1 menit yang lalu";
        } else {
            return " $minutes menit yang lalu";
        }
    } else if ($hours <= 24) {
        if ($hours == 1) {
            return " sejam yang lalu";
        } else {
            return " $hours jam yang lalu";
        }
    } else if ($days <= 7) {
        if ($days == 1) {
            return " kemarin";
        } else {
            return " $days hari yang lalu";
        }
    } else if ($weeks <= 4.3) //4.3 == 52/12  
    {
        if ($weeks == 1) {
            return " seminggu yang lalu";
        } else {
            return " $weeks minggu yang lalu";
        }
    } else if ($months <= 12) {
        if ($months == 1) {
            return " sebulan yang lalu";
        } else {
            return " $months bulan yang lalu";
        }
    } else {
        if ($years == 1) {
            return "setahun yang lalu";
        } else {
            return "$years tahun yang lalu";
        }
    }
}

function status_meeting($a)
{
    $combine_now = date("Y-m-d");
    $combine_time_now = date("H:i:s");
    $cmd = date('Y-m-d H:i:s', strtotime("$combine_now $combine_time_now"));

    $combine_db = date($a['start_date']);
    $combine_db_now = date($a['end_time']);
    $cmb = date('Y-m-d H:i:s', strtotime("$combine_db $combine_db_now"));

    $datedb = strtotime($cmd);
    $timedb = strtotime($cmb);

    if ($datedb > $timedb) {
        status_meeting_expired($a);
    } else {
        if ($a['type_id'] == '1') {
            status_meeting_online($a);
        } else {
            status_meeting_offline($a);
        }
    }
}
