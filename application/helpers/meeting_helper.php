<?php

function is_logged_in()
{
    $ci = get_instance();
    if (!$ci->session->userdata('email')) {
        redirect('auth');
    } else {
        $role_id = $ci->session->userdata('role_id');
        $menu = $ci->uri->segment(1);

        $queryMenu = $ci->db->get_where('user_menu', ['menu' => $menu])->row_array();

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

/**
 * All About Form
 * by Ivandi Djoh Gah
 */

// Show Meeting Form
function show_add_meeting()
{
    enable_add_new();
}

// Show Expired Status
function status_meeting_expired($a)
{ ?>
    <span class="badge badge-dark" data-toggle="modal" data-target="#expiredMeeting" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-angry"></i> Status Expired!</span>
<?php }

// Show Offline Status
function status_meeting_offline($a)
{ ?>
    <?php if ($a['request_status'] == '0') { ?>
        <span class="badge badge-danger" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-angry"></i> Status Booked</span>
    <?php } else if ($a['request_status'] == '1') { ?>
        <span class="badge badge-secondary" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-tired"></i> Rapat Dibatalkan</span>
    <?php } else { ?>
        <span class="badge badge-success" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-grin-hearts"></i> Perubahan Jadwal</span>
    <?php }
}

// Show Online Status
function status_meeting_online($a)
{ ?>
    <?php if ($a['request_status'] == '0') { ?>
        <span class="badge badge-danger" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-angry"></i> Status Booked</span>
    <?php } else if ($a['request_status'] == '1') { ?>
        <span class="badge badge-secondary" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-tired"></i> Rapat Dibatalkan</span>
    <?php } else { ?>
        <span class="badge badge-success" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-grin-hearts"></i> Perubahan Jadwal</span>
    <?php }
}

// if meeting already expired
function expired_form_editable_date($a)
{ ?>
    <div class="form-group row">
        <label for="start_date" class="col-sm-2 col-form-label">Tanggal Awal</label>
        <div class="col-sm-10">
            <input type="date" class="border" value="<?= $a['start_date']; ?>" disabled> <small class="text-danger"> Rapat sudah Expired! </small>
        </div>
    </div>
    <div class="form-group row">
        <label for="end_date" class="col-sm-2 col-form-label">Tanggal Akhir</label>
        <div class="col-sm-10">
            <input type="date" class="border" value="<?= $a['end_date']; ?>" disabled> <small class="text-danger"> Rapat sudah Expired! </small>
        </div>
    </div>
    <div class="form-group row">
        <label for="start_time_edit" class="col-sm-2 col-form-label">Jam Awal</label>
        <div class="col-sm-10">
            <input type="time" class="border" value="<?= $a['start_time']; ?>" disabled> <small class="text-danger"> Rapat sudah Expired! </small>
        </div>
    </div>
    <div class="form-group row">
        <label for="end_time_edit" class="col-sm-2 col-form-label">Jam Akhir</label>
        <div class="col-sm-10">
            <input type="time" class="border" value="<?= $a['end_time']; ?>" disabled> <small class="text-danger"> Rapat sudah Expired! </small>
        </div>
    </div>
<?php }

// if meeting not expired
function form_editable_date($a)
{ ?>
    <div class="form-group row">
        <label for="start_date" class="col-sm-2 col-form-label">Tanggal Awal</label>
        <div class="col-sm-10">
            <input type="date" id="start_date" name="start_date" class="tt" class="border" value="<?= $a['start_date']; ?>">
            <?= form_error('Meeting Date', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="end_date" class="col-sm-2 col-form-label">Tanggal Akhir</label>
        <div class="col-sm-10">
            <input type="date" id="end_date" name="end_date" class="tt" value="<?= $a['end_date']; ?>">
            <?= form_error('Meeting Date', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="start_time_edit" class="col-sm-2 col-form-label">Jam Awal</label>
        <div class="col-sm-10">
            <input type="time" id="start_time" name="start_time" class="tt" value="<?= $a['start_time']; ?>">
        </div>
    </div>
    <div class="form-group row">
        <label for="end_time_edit" class="col-sm-2 col-form-label">Jam Akhir</label>
        <div class="col-sm-10">
            <input type="time" id="end_time" name="end_time" class="tt" value="<?= $a['end_time']; ?>">
        </div>
    </div>
<?php }

/*
*
all about status part
*
*/
function status_all_cancel_upload($a)
{ ?>
    <span class="badge badge-secondary" data-toggle="modal" data-target="#errorDownload" style="cursor:pointer;margin:2px;">Undangan Rapat</span><br>
    <span class="badge badge-secondary" data-toggle="modal" data-target="#errorDownload" style="cursor:pointer;margin:2px;">Notulen Rapat</span><br>
    <span class="badge badge-secondary" data-toggle="modal" data-target="#errorDownload" style="cursor:pointer;margin:2px;">Absensi Rapat</span>
<?php }

function status_all_upload($a)
{ ?>
    <a href="<?= base_url('meeting/undangandownload/' . $a['files_upload']); ?>" class="badge badge-success">Undangan Rapat</a> <br>
    <a href="<?= base_url('meeting/notulendownload/' . $a['files_upload1']); ?>" class="badge badge-success">Notulen Rapat</a> <br>
    <a href="<?= base_url('meeting/absensidownload/' . $a['files_upload2']); ?>" class="badge badge-success">Absensi Rapat</a>
<?php }

function status_undangan_upload($a)
{ ?>
    <a href="<?= base_url('meeting/undangandownload/' . $a['files_upload']); ?>" class="badge badge-success">Undangan Rapat</a> <br>
    <span class="badge badge-danger" data-toggle="modal" data-target="#uploadNotulen<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"> Notulen Rapat</span> <br>
    <span class="badge badge-danger" data-toggle="modal" data-target="#errorAbsensi" style="cursor:pointer;margin:2px;"> Absensi Rapat</span>
<?php }

function status_notulen_upload($a)
{ ?>
    <a href="<?= base_url('meeting/undangandownload/' . $a['files_upload']); ?>" class="badge badge-success">Undangan Rapat</a> <br>
    <a href="<?= base_url('meeting/notulendownload/' . $a['files_upload1']); ?>" class="badge badge-success">Notulen Rapat</a> <br>
    <span class="badge badge-danger" data-toggle="modal" data-target="#uploadAbsensi<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"> Absensi Rapat</span>
<?php }

function status_no_upload($a)
{ ?>
    <a href="#" class="badge badge-danger">Undangan Rapat</a> <br>
    <a href="#" class="badge badge-danger">Notulen Rapat</a> <br>
    <a href="#" class="badge badge-danger">Absensi Rapat</a>
<?php }

// can't change status if meeting already Canceled
function form_cancel_status($a)
{ ?>
    <p class="text-danger text-center text-uppercase"><strong>Maaf, </strong> Data Rapat ini Sudah dibatalkan, Silahkan menghubungi Administrator e-rapat untuk informasi selanjutnya.</p>
<?php }

// can't change status if meeting already expired
function form_expired_status($a)
{ ?>
    <p class="text-danger text-center text-uppercase"><strong>Maaf, </strong> Data Rapat ini Sudah kadaluarsa dan tidak bisa dirubah, Silahkan menghubungi Administrator e-rapat untuk informasi selanjutnya.</p>
<?php }

// can change status Online Meeting if meeting not expired
function form_change_status_online($a)
{ ?>
    <div class="form-group row">
        <label for="place_id" class="col-sm-2 col-form-label">Status Rapat</label>
        <div class="col-sm-5">
            <select name="request_status" id="request_status" class="form-control ">

                <?php
                if ($a['request_status'] == 0) { ?>
                    <option value="<?= $a['request_status']; ?>">Booked</option>
                <?php } elseif ($a['request_status'] == 1) { ?>
                    <option value="<?= $a['request_status']; ?>">Pembatalan</option>
                <?php } elseif ($a['request_status'] == 2) { ?>
                    <option value="<?= $a['request_status']; ?>">Perubahan Jadwal</option>
                <?php } ?>

                <option value="" disabled>--</option>
                <option value="0">Booked</option>
                <option value="1">Pembatalan</option>
                <option value="2">Perubahan Jadwal</option>
            </select>
        </div>
    </div>
    <?php
    $datenow = date("Y-m-d");
    $timenow = date("H:i:s");
    $datedb = $a['start_date'];
    $timedb = $a['end_time'];
    if ($datenow > $datedb && $timenow > $timedb) {
        expired_form_editable_date($a);
    } else {
        form_editable_date($a);
    }
    ?>
    <div class="form-group row">
        <label for="remark_status" class="col-sm-2 col-form-label">Keterangan Status</label>
        <div class="col-sm-10">
            <textarea class="form-control form-control-user" name="remark_status" id="texta" placeholder="Tuliskan mengapa Anda membatalkan Rapat atau melakukan perubahan Jadwal Rapat..."><?= $a['remark_status']; ?></textarea>
            Batas Maksimum <span id="remain">1000</span> Karakter
            <?= form_error('remark_status', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
<?php }


// can change status Offline Meeting if meeting not expired
function form_change_status_offline($a)
{ ?>
    <div class="form-group row">
        <label for="place_id" class="col-sm-2 col-form-label">Status Rapat</label>
        <div class="col-sm-5">
            <select name="request_status" id="request_status" class="form-control ">

                <?php
                if ($a['request_status'] == 0) { ?>
                    <option value="<?= $a['request_status']; ?>">Booked</option>
                <?php } elseif ($a['request_status'] == 1) { ?>
                    <option value="<?= $a['request_status']; ?>">Pembatalan</option>
                <?php } elseif ($a['request_status'] == 2) { ?>
                    <option value="<?= $a['request_status']; ?>">Perubahan Jadwal</option>
                <?php } ?>

                <option value="" disabled>--</option>
                <option value="0">Booked</option>
                <option value="1">Pembatalan</option>
                <option value="2">Perubahan Jadwal</option>
            </select>
        </div>
    </div>
    <?php
    $datenow = date("Y-m-d");
    $timenow = date("H:i:s");
    $datedb = $a['start_date'];
    $timedb = $a['end_time'];
    if ($datenow > $datedb && $timenow > $timedb) {
        expired_form_editable_date($a);
    } else {
        form_editable_date($a);
    }
    ?>
    <div class="form-group row">
        <label for="remark_status" class="col-sm-2 col-form-label">Keterangan Status</label>
        <div class="col-sm-10">
            <textarea class="form-control form-control-user" name="remark_status" id="texta" placeholder="Tuliskan mengapa Anda membatalkan Rapat atau melakukan perubahan Jadwal Rapat..."><?= $a['remark_status']; ?></textarea>
            Batas Maksimum <span id="remain">1000</span> Karakter
            <?= form_error('remark_status', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
<?php }

// Add new Meeting
function enable_add_new()
{
    $ci = get_instance();
    $alltype = $ci->Type_model->get_all_type();

?>
    <!-- Start Form Add Meeting -->
    <div class="form-group row">
        <label for="type_id" class="col-sm-2 col-form-label">Tipe Rapat</label>
        <div class="col-sm-5">
            <select name="type_id" id="type_id" class="form-control">
                <option value='0'>-- Pilih Tipe Rapat --</option>
                <?php $i = 1; ?>
                <?php foreach ($alltype as $p) : ?>
                    <option value="<?= $p['id']; ?>"><?= $i++; ?>. <?= $p['meeting_type']; ?></option>
                <?php endforeach; ?>
            </select>
            <?= form_error('type_id', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="meeting_subtype" class="col-sm-2 col-form-label">Media Rapat</label>
        <div class="col-sm-5">
            <select class="form-control" name="meeting_subtype" id="meeting_subtype">
                <option value='0'>-- Pilih Media Rapat --</option>
                <!-- SubMedia Rapat akan diload menggunakan ajax, dan ditampilkan disini -->
            </select>
        </div>
    </div>
    <div class="form-group row" id="other_online_id">
        <label for="other_online_id" class="col-sm-2 col-form-label">ID Rapat lain</label>
        <div class="col-sm-10">
            <input type="text" id="onlineId" name="other_online_id" class="border" placeholder="ID Rapat" autocomplete="off" disabled>
            <br />
            <input type="checkbox" class="dissable" id="yourBox" />
            <small class="text-danger"> Aktifkan CkeckBox ini dan Isikan kolom tersebut dengan ID Rapat yang lain jika anda tidak menggunakan ZOOM Meeting</small>
        </div>
    </div>
    <div class="form-group row">
        <label for="agenda" class="col-sm-2 col-form-label">Agenda Rapat</label>
        <div class="col-sm-10">
            <textarea class="form-control form-control-user" name="agenda" id="agenda" placeholder="Tuliskan Agenda di sini..."><?= set_value('agenda'); ?></textarea>
            <?= form_error('agenda', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="members_name" class="col-sm-2 col-form-label">Pimpinan Rapat</label>
        <div class="col-sm-10">
            <input data-role="tagsinput" type="text" name="participants_name" class="form-control form-control-user" id="participants_name" value="<?= set_value('participants_name'); ?>" placeholder="Tambah Pimpinan Rapat">
            <?= form_error('participants_name', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="speakers_name" class="col-sm-2 col-form-label">Narasumber</label>
        <div class="col-sm-10">
            <input data-role="tagsinput" type="text" name="speakers_name" class="form-control form-control-user" id="speakersName" value="<?= set_value('speakers_name'); ?>" placeholder="Tambah Narasumber">
            <?= form_error('speakers_name', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="start_date" class="col-sm-2 col-form-label">Tanggal Rapat</label>
        <div class="col-sm-10">
            <input type="text" id="start_date" name="start_date" class="border" placeholder="Tanggal Rapat" autocomplete="off">
            <?= form_error('Tanggal Rapat', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="start_time" class="col-sm-2 col-form-label">Jam Awal Rapat</label>
        <div class="col-sm-10">
            <input type="text" id="start_time" name="start_time" class="border" placeholder="Jam Awal Rapat" autocomplete="off">
            <?= form_error('Jam Awal Rapat', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="end_time" class="col-sm-2 col-form-label">Jam Akhir Rapat</label>
        <div class="col-sm-10">
            <input type="text" id="end_time" name="end_time" class="border" placeholder="Jam Akhir Rapat" autocomplete="off">
            <?= form_error('Jam Akhir Rapat', '<small class="text-danger">', '</small>'); ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="end_time" class="col-sm-2 col-form-label">Upload Undangan</label>
        <div class="col-sm-10">
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="files" name="file">
                <label class="custom-file-label" for="image">Choose file</label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <div class="actions">
            <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</button>
            <button type="submit" class="btn btn-success"><i class="fas fa-file"></i> Buat Rapat</button>
        </div>
    </div>
    <!-- End Form Add Meeting -->
<?php }

// can't add meeting num one
function disable_add_one($a)
{ ?>
    <p class="text-danger text-center text-uppercase"><strong>Maaf, </strong> Anda tidak dapat membuat Rapat baru. Silahkan Unggah File <strong>NOTULENSI RAPAT</strong>.</p>
<?php }

// can't add meeting num two
function disable_add_two($a)
{ ?>
    <p class="text-danger text-center text-uppercase"><strong>Maaf, </strong> Anda tidak dapat membuat Rapat baru. Silahkan Unggah File <strong>ABSENSI RAPAT</strong>.</p>
<?php }

// can't add meeting num two
function disable_download($a)
{ ?>
    <p class="text-danger text-center text-uppercase"><strong>Maaf, </strong> File tidak bisa di unduh, karena Rapat sudah dibatalkan</p>
<?php }

// Modal Disabled footer
function form_disable_footer()
{ ?>
    <div class="actions">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
    </div>

<?php }

// Modal Enable footer
function form_enable_footer($id)
{ ?>
    <input type="hidden" name="id" value="<?= $id; ?>">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
    <button type="submit" class="btn btn-danger">Confirm!</button>
<?php }
