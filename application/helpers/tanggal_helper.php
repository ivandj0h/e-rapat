<?php

if (!function_exists('changeDateFormat')) {

    function changeDateFormat($format = 'd-m-Y', $originalDate)

    {

        return date($format, strtotime($originalDate));
    }
}
