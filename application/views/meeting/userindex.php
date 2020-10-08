<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Content Table -->
        <div class="row">
            <div class="col-lg-12">

                <!-- Check for error using form validation -->
                <?php if (validation_errors()) : ?>
                    <div class="alert alert-danger alert-dismissible fade show col-md-12" role="alert">
                        <h4 class="alert-heading">Error!</h4>
                        <hr>
                        <?= validation_errors(); ?>
                    </div>
                <?php endif; ?>

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('messages'); ?>

                <!-- DataTales Example -->
                <div class="card shadow-none mb-4">
                    <div class="card-header py-3">
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-backdrop="static" data-target="#addMeeting" data-keyboard="false">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Tambah Rapat Baru</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data Rapat</h6>
                    </div>
                    <div class="card-body">
                        <div class="col-md-12">
                            <table class="table table-striped table-condensed" id="meeting" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Tanggal</th>
                                        <th class="text-center w-20">Mulai</th>
                                        <th class="text-center w-20">Akhir</th>
                                        <th class="text-center w-20">Nama Bidang</th>
                                        <th class="text-center w-20">Media</th>
                                        <th class="text-center w-20">ID Media</th>
                                        <th class="text-center w-20">File Upload</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($meeting as $a) : ?>
                                        <tr>
                                            <td class="text-center"><?= date("d-m-Y", strtotime($a['end_date'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['start_time'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['end_time'])); ?></td>
                                            <td class="text-left"><?= $a['sub_department_name']; ?></td>
                                            <td class="text-left"><?= $a['meeting_subtype']; ?>
                                            <td class="text-center">
                                                <?php
                                                if ($a['type_id'] == 1) {
                                                    if ($a['sub_type_id'] == 1) {
                                                        echo "<strong><span class='text-success'>" . $a['zoomid'] . "</span></strong>";
                                                    } else {
                                                        echo "<strong><span class='text-primary'>" . $a['other_online_id'] . "</span></strong>";
                                                    }
                                                } else {
                                                    echo "<span class='text-danger'>Offline</span>";
                                                }
                                                ?>
                                            </td>
                                            <td class="text-center">
                                                <?php
                                                $combine_now = date("Y-m-d");
                                                $combine_time_now = date("H:i:s");
                                                $cmd = date('Y-m-d H:i:s', strtotime("$combine_now $combine_time_now"));

                                                $combine_db = date($a['start_date']);
                                                $combine_db_now = date($a['end_time']);
                                                $cmb = date('Y-m-d H:i:s', strtotime("$combine_db $combine_db_now"));

                                                $datedb = strtotime($cmd);
                                                $timedb = strtotime($cmb);

                                                if ($a['request_status'] == '1') {
                                                    status_all_cancel_upload($a);
                                                } else {
                                                    if (!empty($a['files_upload']) && !empty($a['files_upload1']) && !empty($a['files_upload2'])) {
                                                        status_all_upload($a);
                                                        // uploadpages($a['unique_code']);
                                                    } elseif (!empty($a['files_upload']) && empty($a['files_upload1']) && empty($a['files_upload2'])) {
                                                        // uploadpages($a['unique_code']);
                                                        notulen_upload($a);
                                                    } elseif (!empty($a['files_upload']) && !empty($a['files_upload1']) && empty($a['files_upload2'])) {
                                                        // uploadpages($a['unique_code']);
                                                        absensi_upload($a);
                                                    } else {
                                                        // uploadpages($a['unique_code']);
                                                        status_no_upload($a);
                                                    }
                                                }
                                                ?>
                                            </td>
                                            <td class="text-center action mx-2">
                                                <?= status_meeting($a); ?>
                                                <span class="badge badge-success" data-toggle="modal" data-target="#meetingDetail<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-search"></i> Detail Rapat</span>
                                                <span class="badge badge-primary" data-toggle="modal" data-target="#meetingEdit<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-marker"></i> Ubah Rapat</span>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-animation="true" data-delay="5000" data-autohide="true">
                    <div class="toast-header">
                        <span class="rounded mr-2 bg-danger" style="width: 15px;height: 15px"></span>

                        <strong class="mr-auto">Notifikasi</strong>
                        <small>File Upload</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        Anda Belum Mengunduh Berkas Notulen!
                        <hr />
                        <small>@Administrator</small>
                    </div>
                </div> -->
                <!-- End of Notification -->
            </div>
        </div>
        <!-- End of Content Table -->
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Start of Modal Add -->
<div class="modal fade" id="addMeeting" tabindex="-1" role="dialog" aria-labelledby="staticBackdropAddMeeting" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addMeeting">Buat Rapat Baru - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="POST" id="addMeeting" enctype="multipart/form-data">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <?= enable_add_new(); ?>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Add -->

<!-- Start of Modal Edit -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $meeting_subtype = $a['meeting_subtype'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingEdit<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header mb-2">
                    <h5 class="modal-title" id="addMeeting"> Ubah Data Rapat <strong><?= $a['sub_department_name']; ?></strong></h5>
                </div>
                <form action="<?= base_url('meeting/editmeeting'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="members_name" class="col-sm-2 col-form-label">Rapat</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control-user" id="participants_name" value="<?= $a['meeting_type']; ?>" disabled>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="members_name" class="col-sm-2 col-form-label">Media Rapat</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control-user" id="participants_name" value="<?= $a['meeting_subtype']; ?>" disabled>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="agenda" class="col-sm-2 col-form-label">Agenda</label>
                            <div class="col-sm-10">
                                <textarea class="form-control form-control-user textarea-autosize" name="agenda" id="agenda" placeholder="Describe Agenda here..."><?= $a['agenda']; ?></textarea>
                                <?= form_error('agenda', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="members_name" class="col-sm-2 col-form-label">Pimpinan Rapat</label>
                            <div class="col-sm-10">
                                <input data-role="tagsinput" type="text" name="participants_name" class="form-control form-control-user" id="participants_name" value="<?= $a['members_name']; ?>" placeholder="Add Participant's Name...">
                                <?= form_error('participants_name', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="speakers_name" class="col-sm-2 col-form-label">Narasumber</label>
                            <div class="col-sm-10">
                                <input data-role="tagsinput" type="text" name="speakers_name" class="form-control form-control-user" id="speakersName" value="<?= $a['speakers_name']; ?>" placeholder="Add Speaker's Name...">
                                <?= form_error('speakers_name', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="<?= $id; ?>">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</button>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-copy"></i> Ubah Data Rapat</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Detail -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $meeting_subtype = $a['meeting_subtype'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingDetail<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header mb-2">
                    <h5 class="modal-title" id="addMeeting"> Detail Rapat <strong><?= $a['sub_department_name']; ?></strong></h5>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="members_name" class="col-sm-2 col-form-label">Tanggal Rapat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-user" id="participants_name" value="<?= date("d-m-Y", strtotime($a['start_date'])); ?>" disabled>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="members_name" class="col-sm-2 col-form-label">Tipe Rapat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-user" id="participants_name" value="<?= $a['meeting_type']; ?>" disabled>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="members_name" class="col-sm-2 col-form-label">Media Rapat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-user" id="participants_name" value="<?= $a['meeting_subtype']; ?>" disabled>
                        </div>
                    </div>
                    <?php
                    if ($a['type_id'] == 1) {
                        if ($a['sub_type_id'] != 1) { ?>
                            <div class="form-group row">
                                <label for="members_name" class="col-sm-2 col-form-label">ID Rapat</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control form-control-user" id="participants_name" value="<?= $a['other_online_id']; ?> ( <?= $a['meeting_subtype']; ?> ID )" disabled>
                                </div>
                            </div>
                        <?php
                        } else { ?>
                            <div class="form-group row">
                                <label for="members_name" class="col-sm-2 col-form-label">ID Rapat</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control form-control-user" id="participants_name" value="<?= $a['zoomid']; ?> ( <?= $a['meeting_subtype']; ?> ID )" disabled>
                                </div>
                            </div>
                    <?php
                        }
                    }
                    ?>
                    <div class="form-group row">
                        <label for="agenda" class="col-sm-2 col-form-label">Agenda</label>
                        <div class="col-sm-10">
                            <textarea class="form-control form-control-user textarea-autosize" disabled><?= $a['agenda']; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="members_name" class="col-sm-2 col-form-label">Pimpinan Rapat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-user" value="<?= $a['members_name']; ?>" disabled>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="members_name" class="col-sm-2 col-form-label">Narasumber Rapat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-user" value="<?= $a['speakers_name']; ?>" disabled>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
                </div>
            </div>
        </div>
    </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Detail -->


<!-- Start of Modal Change Status -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $meeting_subtype = $a['meeting_subtype'];
    $request_status = $a['request_status'];
    $remark_status = $a['remark_status'];
?>
    <div class="modal fade" id="meetingStatus<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addMeeting">Status Rapat - (<?= $this->session->userdata('name'); ?>) </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('meeting/updatestatus'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <?php
                        $date_now = date("Y-m-d");
                        if ($date_now <= $a['start_date']) {
                            if ($a['request_status'] == '1') {
                                form_cancel_status($a);
                            } else {
                                if ($a['type_id'] == '1') {
                                    form_change_status_online($a);
                                } else {
                                    form_change_status_offline($a);
                                }
                            }
                        } else {
                            form_expired_status($a);
                        }
                        ?>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Change Status -->

<!-- Start of Modal Upload Undangan -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="uploadUndangan<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadUndangan">Unggah Berkas Undangan - (<?= $this->session->userdata('name'); ?>) </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <?= form_open_multipart('meeting/uploadundangan'); ?>
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Nama Bagian</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <strong><?= $a['sub_department_name']; ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Agenda Rapat</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <strong><?= word_limiter($a['agenda'], 100); ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Berkas Undangan</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="undangan" name="undangan">
                                <label class="custom-file-label" for="image">Choose file</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="id" value="<?= $id; ?>">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</button>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-up"></i> Unggah Berkas Undangan!</button>
                </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Undangan Undangan -->

<!-- Start of Modal Upload Notulen -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="uploadNotulen<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadNotulen">Unggah Berkas Notulen - (<?= $this->session->userdata('name'); ?>) </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <?= form_open_multipart('meeting/uploadnotulen'); ?>
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Nama Bagian</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <strong><?= $a['sub_department_name']; ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Agenda Rapat</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <strong><?= word_limiter($a['agenda'], 100); ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Berkas Notulen</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="notulen" name="notulen">
                                <label class="custom-file-label" for="image">Choose file</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="id" value="<?= $id; ?>">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</button>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-up"></i> Unggah Berkas Notulen!</button>
                </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Upload Notulen -->

<!-- Start of Modal Upload Absensi -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="uploadAbsensi<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadAbsensi">Unggah Berkas Absensi - (<?= $this->session->userdata('name'); ?>) </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <?= form_open_multipart('meeting/uploadabsensi'); ?>
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Nama Bagian</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <strong><?= $a['sub_department_name']; ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Agenda Rapat</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <strong><?= word_limiter($a['agenda'], 100); ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="upload" class="col-sm-2 col-form-label">Berkas Absensi</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="absensi" name="absensi">
                                <label class="custom-file-label" for="image">Choose file</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="checkbox" class="col-sm-2 col-form-label">Akhiri Rapat</label>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <input id="changeZoom" type="checkbox" name="changeZoom" value="1">
                                <label for="changeZoom" class="text-danger">Centang box ini untuk mengakhiri Rapat (Pemakai Google Zoom)</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="id" value="<?= $id; ?>">
                    <input type="hidden" name="zoomid" value="<?= $a['zoomid']; ?>">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</button>
                    <button type="submit" class="btn btn-primary" disabled><i class="fas fa-arrow-alt-circle-up"></i> Unggah Berkas Absensi!</button>
                </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Upload Absensi -->

<!-- Start of Modal Upload Error Notulen -->
<div class="modal fade" id="errorNotulen" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorNotulen">Unggah Berkas Notulen - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-danger text-center text-uppercase">Silahkan Unggah File <strong>UNDANGAN RAPAT</strong> terlebih dahulu.</p>
            </div>
            <div class="modal-footer">
                <div class="actions">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Upload Error Notulen -->


<!-- Start of Modal Upload Error Absensi -->
<div class="modal fade" id="errorAbsensi" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorAbsensi">Unggah Berkas Absensi - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-danger text-center text-uppercase">Silahkan Unggah File <strong>NOTULEN RAPAT</strong> terlebih dahulu.</p>
            </div>
            <div class="modal-footer">
                <div class="actions">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Upload Error Absensi -->

<!-- Start of Modal Download Error -->
<div class="modal fade" id="errorDownload" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorDownload">Unduh Berkas Rapat - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <?= disable_download($id); ?>
            </div>
            <div class="modal-footer">
                <div class="actions">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Download Error -->

<!-- Start of Modal Expired Error -->
<div class="modal fade" id="expiredDownload" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="expiredDownload">Unduh Berkas Rapat - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <?= expired_download($id); ?>
            </div>
            <div class="modal-footer">
                <div class="actions">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Expired Error -->

<!-- Start of Modal Delete -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $meeting_subtype = $a['meeting_subtype'];
?>
    <div class="modal fade" id="meetingDel<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('meeting/delete'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Yakin ingin menghapus <b><?= $meeting_subtype; ?> ?</b></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal">Batal</button>
                        <button type="submit" class="btn btn-danger">Confirm!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Delete -->

<!-- Start of Modal Disabled Create Meeting -->
<div class="modal fade" id="noMeeting" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="noMeeting" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="noMeeting">Buat Rapat Baru - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-danger">Maaf Anda tidak dapat membuat meeting</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal">Tutup</button>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Disabled Create Meeting -->

<!-- Start of Modal Expired Meeting -->
<div class="modal fade" id="expiredMeeting" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="expiredMeeting" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="expiredMeeting">Rapat Kadaluarsa - (<?= $this->session->userdata('name'); ?>) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-danger text-center text-uppercase"><strong>Maaf, </strong> Data Rapat ini Sudah kadaluarsa dan tidak bisa dirubah, Silahkan menghubungi Administrator e-rapat untuk informasi selanjutnya.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="batal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Tutup</button>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Expired Meeting -->

<!-- <script script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
</script>
<script>
    $("#changeZoom").click(function() {
        if ($(this).is(":checked")) {
            $('button[type=submit]').attr('disabled', false);
        } else {
            $('button[type=submit]').attr('disabled', true);
        }
    });
</script> -->