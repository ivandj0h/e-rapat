<?php

function is_logged_in()
{
    $ci = get_instance();
    if (!$ci->session->userdata('email')) {
        redirect('auth');
    } else {
        $role_id = $ci->session->userdata('role_id');
        $menu = $ci->uri->segment(1);

        // query to db to get the id
        $queryMenu = $ci->db->get_where('user_menu', ['menu' => $menu])->row_array();

        // we just need the id
        $menu_id = $queryMenu['id'];

        $queryAccess = $ci->db->get_where('user_access_menu', [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ]);

        if ($queryAccess->num_rows() < 1) {
            redirect('auth/blocked');
        }
    }
}

function check_access($role_id, $menu_id)
{
    $ci = get_instance();

    // first way to query with where condition 
    $ci->db->where('role_id', $role_id);
    $ci->db->where('menu_id', $menu_id);
    $result = $ci->db->get('user_access_menu');

    // Check if result > 0
    if ($result->num_rows() > 0) {
        return "checked = 'checked'";
    }
}

function greetings()
{
    date_default_timezone_set('Asia/Jakarta');

    $Hour = date('G');

    if ($Hour >= 5 && $Hour <= 11) {
        echo "Selamat Pagi";
    } else if ($Hour >= 12 && $Hour <= 18) {
        echo "Selamat Siang";
    } else if ($Hour >= 19 || $Hour <= 4) {
        echo "Selamat Malam";
    }
}
