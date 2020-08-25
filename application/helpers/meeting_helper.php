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

function was_logged_in()
{
    $ci = get_instance();
    if (!$ci->session->userdata('email')) {
        redirect('home');
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

    $ci->db->where('role_id', $role_id);
    $ci->db->where('menu_id', $menu_id);
    $result = $ci->db->get('user_access_menu');

    if ($result->num_rows() > 0) {
        return "checked = 'checked'";
    }
}

function check_upload_exist($userid)
{
    $ci = get_instance();
    $ci->db->where($userid);
    $res['file'] = $ci->db->get('view_user_meeting')->result_array();



    if ($res['file'] == '') {
        return "<a href=\"#\" class=\"btn btn-danger btn-icon-split\" data-toggle=\"modal\" data-target=\"#noMeeting\">
            <span class=\"icon text-white-50\">
                <i class=\"fas fa-file\"></i>
            </span>
            <span class=\"text\">Tambah Rapat Baru</span>
        </a>";
    } else {
        return "<a href=\"#\" class=\"btn btn-success btn-icon-split\" data-toggle=\"modal\" data-target=\"#addMeeting\">
        <span class=\"icon text-white-50\">
            <i class=\"fas fa-file\"></i>
        </span>
        <span class=\"text\">Tambah Rapat Baru</span>
    </a>";
    }
}
