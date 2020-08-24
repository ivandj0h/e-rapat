<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth_model extends CI_Model
{
    protected $account_table = 'view_user_department';

    public function get_user_login($email)
    {
        return $this->db->get_where($this->account_table, ['email' => $email])->row_array();
    }
}
