<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Meeting extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->helper(array('string', 'text', 'tanggal'));
        $this->load->model('Account_model');
        $this->load->model('Meeting_model');
        $this->load->model('Type_model');
        $this->load->model('Zoom_model');
    }

    public function index()
    {
        $data['title'] = 'Master Data Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting_by_sesi($this->session->userdata('email'));
        $data['meeting_admin'] = $this->Meeting_model->get_all_meeting();

        if ($data['user']['role_id'] == '1') {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('meeting/index', $data);
            $this->load->view('layout/footer');
        } elseif ($data['user']['role_id'] == '4' && $data['user']['role_id'] == '5') {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('meeting/superuser', $data);
            $this->load->view('layout/footer');
        } else {
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $data);
            $this->load->view('meeting/userindex', $data);
            $this->load->view('layout/footer');
        }
    }

    public function store_meeting()
    {
        $data['title'] = 'Master Data Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting_by_sesi($this->session->userdata('email'));
        $data['alltype'] = $this->Type_model->get_all_type();
        $data['types'] = $this->Type_model->getSubType();
        $data['zoom'] = $this->Zoom_model->getzoom();

        $this->load->library('form_validation');
        $this->form_validation->set_rules('agenda', 'Agenda', 'required|trim|xss_clean');
        $this->form_validation->set_rules('participants_name', 'Pimpinan Rapat', 'required|trim|xss_clean');
        $this->form_validation->set_rules('start_date', 'Tanggal Rapat', 'required|trim|xss_clean');
        $this->form_validation->set_rules('start_time', 'Jam Awal Rapat', 'required');
        $this->form_validation->set_rules('end_time', 'Jam Akhir Rapat', 'required');

        if ($this->form_validation->run()) {
            $data = $this->Meeting_model->store_meeting();
            $array = array(
                'success' => '<div class="popup-wrapper" id="popup"><div class="popup-container"><h2>Mohon Menunggu</h2><p>System Sedang membuat Rapat untuk anda<br/></div></div><div id="countdown"></div></img>',
            );
        } else {
            $array = array(
                'error'   => true,
                'agenda_error' => form_error('agenda'),
                'start_date_error' => form_error('start_date'),
                'participants_name_error' => form_error('participants_name'),
                'start_time_error' => form_error('start_time'),
                'end_time_error' => form_error('end_time')
            );
        }
        echo json_encode($array);
    }

    public function detailsmeeting($unique)
    {
        $data['title'] = 'Master Data Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_one_meeting($unique);

        foreach ($data['meeting'] as $pecah) {
            $data['speakers'] = explode(",", $pecah['speakers_name']);
            $data['members'] = explode(",", $pecah['members_name']);
        }

        $this->load->view('layout/header', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('layout/topbar', $data);
        $this->load->view('meeting/details', $data);
        $this->load->view('layout/footer');
    }

    public function editmeeting()
    {
        $id = $this->input->post('id');
        $a = $this->input->post('speakers_name');
        $b = $this->input->post('participants_name');
        $speakers = implode(',', (array) $a);
        $participants = implode(',', (array) $b);

        $data = array(
            'speakers_name' => $speakers,
            'members_name' => $participants,
            'agenda' => htmlspecialchars($this->input->post('agenda', true)),
        );

        $this->Meeting_model->update_meeting($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> Data Rapat berhasil diubah!</div>');
        redirect('meeting');
    }

    public function uploadundangan()
    {
        $data['title'] = 'Master Data Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting();

        $config = array(
            'upload_path' => "uploads/",
            'allowed_types' => "gif|jpg|png|jpeg|pdf",
            'encrypt_name' => false,
            'overwrite' => TRUE,
            'max_size' => "2048000", // Can be set to particular file size , here it is 2 MB(2048 Kb)
        );

        $id = $this->input->post('id');

        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('undangan')) {
            $error = array('error' => $this->upload->display_errors());
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $error);
            $this->load->view('meeting/userindex', $data);
            $this->load->view('layout/footer');
        } else {
            $undangan = $this->upload->data('file_name');
            $this->db->set('files_upload', $undangan);

            $this->db->where('id', $id);
            $this->db->update('meeting');
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> File Undangan Rapat berhasil di unggah!</div>');
            redirect('meeting');
        }
    }

    public function uploadnotulen()
    {
        $data['title'] = 'Master Data Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting();

        $config = array(
            'upload_path' => "uploads/",
            'allowed_types' => "gif|jpg|png|jpeg|pdf",
            'encrypt_name' => false,
            'overwrite' => TRUE,
            'max_size' => "2048000", // Can be set to particular file size , here it is 2 MB(2048 Kb)
        );

        $id = $this->input->post('id');

        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('notulen')) {
            $error = array('error' => $this->upload->display_errors());
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $error);
            $this->load->view('meeting/userindex', $data);
            $this->load->view('layout/footer');
        } else {
            $notulensi = $this->upload->data('file_name');
            $this->db->set('files_upload1', $notulensi);

            $this->db->where('id', $id);
            $this->db->update('meeting');
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> File Notulensi Rapat berhasil di unggah!</div>');
            redirect('meeting');
        }
    }

    public function uploadabsensi()
    {
        $data['title'] = 'Master Data Rapat';
        $data['user'] = $this->Account_model->get_admin($this->session->userdata('email'));
        $data['meeting'] = $this->Meeting_model->get_all_meeting();

        $config = array(
            'upload_path' => "uploads/",
            'allowed_types' => "gif|jpg|png|jpeg|pdf",
            'encrypt_name' => false,
            'overwrite' => TRUE,
            'max_size' => "2048000", // Can be set to particular file size , here it is 2 MB(2048 Kb)
        );

        $id = $this->input->post('id');
        $zoomid = $this->input->post('zoomid');
        $checked = $this->input->post('changeZoom');


        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('absensi')) {
            $error = array('error' => $this->upload->display_errors());
            $this->load->view('layout/header', $data);
            $this->load->view('layout/sidebar', $data);
            $this->load->view('layout/topbar', $error);
            $this->load->view('meeting/userindex', $data);
            $this->load->view('layout/footer');
        } else {
            $absensi = $this->upload->data('file_name');

            if ((int) $checked == 1) {
                $this->db->set('status', 0);
                $this->db->where('zoom_id', $zoomid);
                $this->db->update('meeting_zoom');
            }

            $this->db->set('files_upload2', $absensi);

            $this->db->where('id', $id);
            $this->db->update('meeting');
            $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> File Absensi Rapat berhasil di unggah!</div>');
            redirect('meeting');
        }
    }

    public function undangandownload($id)
    {
        $this->load->helper('download');
        $data = $this->Meeting_model->get_undangan_download($id);
        force_download('uploads/' . $data->files_upload, NULL);
    }

    public function notulendownload($id)
    {
        $this->load->helper('download');
        $data = $this->Meeting_model->get_notulen_download($id);
        force_download('uploads/' . $data->files_upload1, NULL);
    }

    public function absensidownload($id)
    {
        $this->load->helper('download');
        $data = $this->Meeting_model->get_absensi_download($id);
        force_download('uploads/' . $data->files_upload2, NULL);
    }

    public function updatestatus()
    {
        $id = $this->input->post('id');
        $datenow = strtotime(date('Y-m-d'));
        $timenow = strtotime(date("H:i:s"));
        $end_date = strtotime($this->input->post('end_date', true));
        $end_time = strtotime($this->input->post('end_time', true));
        $request_status = '3';

        if ($datenow >= $end_date && $timenow >= $end_time) {
            $data = array(
                'request_status' => $request_status,
                'start_date' => $this->input->post('start_date', true),
                'end_date' => $this->input->post('end_date', true),
                'start_time' => $this->input->post('start_time', true),
                'end_time' => $this->input->post('end_time', true),
                'remark_status' => htmlspecialchars($this->input->post('remark_status', true)),
            );
        } else {
            $data = array(
                'request_status' => $this->input->post('request_status'),
                'start_date' => $this->input->post('start_date', true),
                'end_date' => $this->input->post('end_date', true),
                'start_time' => $this->input->post('start_time', true),
                'end_time' => $this->input->post('end_time', true),
                'remark_status' => htmlspecialchars($this->input->post('remark_status', true)),
            );
        }

        if ($data['sub_type_id'] == 1) {
            $this->db->set('status', '1');
            $this->db->set('pemakai_id', $this->session->userdata('id'));
            $this->db->set('date_activated', $data['end_date']);
            $this->db->set('start_time', $data['start_time']);
            $this->db->set('end_time', $data['end_time']);
            $this->db->where('zoom_id', $data['zoomid']);
            $this->db->update('meeting_zoom');
        }

        $this->Meeting_model->update_meeting_status($id, $data);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> Status berhasil dirubah!</div>');
        redirect('meeting');
    }

    public function delete()
    {
        $id = $this->input->post('id');

        $this->Meeting_model->delete_meeting($id);
        $this->session->set_flashdata('messages', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Selamat!</strong> Data Rapat berhasil dihapus!</div>');
        redirect('meeting');
    }

    function get_media_meeting()
    {
        $id_type = $this->input->post('id_type');
        $data = $this->Type_model->get_id_type($id_type);
        echo json_encode($data);
    }

    function checkupload()
    {
        $data['meeting'] = $this->Meeting_model->get_all_meeting();
        echo $data['meeting'];
    }

    function startime_exists($key)
    {
        $this->Meeting_model->start_exists($key);
    }

    public function check_zoomid()
    {
        echo "test";
    }
}
