<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Calendar extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('string', 'text', 'tanggal', 'dropdown'));
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
    }

    public function index()
    {
        $data['title'] = 'E-RAPAT';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));

        $this->load->view('layout/calendar_header', $data);
        $this->load->view('frontend/getcalendar', $data);
        $this->load->view('layout/calendar_footer', $data);
    }

    public function get_data_calendar()
    {
        $hostname = 'localhost';
        $username = 'root';
        $password = '';

        try {
            $dbh = new PDO("mysql:host=$hostname;dbname=rapat", $username, $password);

            $query = "select * from view_user_meeting";

            $stmt = $dbh->prepare($query);
            $stmt->execute();

            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $values = array();

            for ($row = 0; $row < count($result); $row++) {
                if ($result[$row]['meeting_type'] == 'Online') {
                    $color = '#28a745';
                }
                if ($result[$row]['meeting_type'] == 'Offline') {
                    $color = '#dc3545';
                }
                if ($result[$row]['request_status'] == '1') {
                    $color = '#000000';
                }
                $values[] = array(
                    '_id' => $result[$row]['sub_department_id'],
                    'title' => $result[$row]['sub_department_name'],
                    'bagid' => $result[$row]['sub_department_id'],
                    'media' => $result[$row]['meeting_type'],
                    'submedia' => $result[$row]['meeting_subtype'],
                    'submediaid' => $result[$row]['sub_type_id'],
                    'otherid' => $result[$row]['other_online_id'],
                    'calendar' => $result[$row]['meeting_type'],
                    'zoomid' => $result[$row]['zoomid'],
                    'speakers_name' => $result[$row]['speakers_name'],
                    'members_name' => $result[$row]['members_name'],
                    'agenda' => $result[$row]['agenda'],
                    'start' => implode("T", array($result[$row]['start_date'], $result[$row]['start_time'])),
                    'end' => implode("T", array($result[$row]['end_date'], $result[$row]['end_time'])),
                    'type' => $result[$row]['sub_type_id'],
                    'statuses' => $result[$row]['request_status'],
                    'className' => 'colorAppointment',
                    'username' => $result[$row]['name'],
                    'location' => $result[$row]['meeting_subtype'],
                    'backgroundColor' => $color,
                    'textColor' => '#ffffff',
                    'allDay' => false
                );
            }

            $to_encode = array(
                array(
                    'key' => 'data',
                    'value' => $values,
                )
            );
            echo json_encode($to_encode, true);
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
}
