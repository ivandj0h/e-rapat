<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Start Content Table -->
        <div class="row form-heigt">
            <div class="col-lg-12">

                <!-- Check for error using form validation -->
                <!-- Alert if Error occurred-->
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
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#addMeeting">
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
                                        <th class="text-center w-20">Media Rapat</th>
                                        <th class="text-center w-20">Tanggal Rapat</th>
                                        <th class="text-center w-20">Pimpinan Rapat</th>
                                        <th class="text-center w-20">Mulai</th>
                                        <th class="text-center w-20">Akhir</th>
                                        <th class="text-center w-20">Agenda</th>
                                        <th class="text-center w-20">Nama Bagian</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($meeting as $a) : ?>
                                        <tr>
                                            <td class="text-left"><?= $a['meeting_subtype']; ?>
                                            <td class="text-center"><?= date("d-m-Y", strtotime($a['start_date'])); ?></td>
                                            <td><?= $a['members_name']; ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['start_time'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['end_time'])); ?></td>
                                            <td><?= word_limiter($a['agenda'], 5); ?></td>
                                            <td><?= $a['sub_department_name']; ?></td>
                                            <td class="text-center action mx-2">
                                                <?php if ($a['request_status'] == '0') { ?>
                                                    <span class="badge badge-primary" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-flushed"></i> Status Requested</span>
                                                <?php } else if ($a['request_status'] == '1') { ?>
                                                    <span class="badge badge-danger" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-angry"></i> Status Booked</span>
                                                <?php } else if ($a['request_status'] == '2') { ?>
                                                    <span class="badge badge-secondary" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-tired"></i> Status Cancel</span>
                                                <?php } else { ?>
                                                    <span class="badge badge-success" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-grin-hearts"></i> Status Open</span>
                                                <?php } ?>
                                                <a class="badge badge-success" href="<?= base_url('meeting/detailsmeeting/' . $a['unique_code']); ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-search "></i> Details</a>
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#meetingEdit<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-marker"></i> Edit</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#meetingDel<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-trash"></i> Delete</span>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Content Table -->
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Start of Modal Add -->
<div class="modal fade" id="addMeeting" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="addMeeting" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addMeeting">Buat Rapat Baru</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <?= form_open_multipart('meeting/addmeeting'); ?>
            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="type_id" class="col-sm-2 col-form-label">Media Meeting</label>
                    <div class="col-sm-5">
                        <select name="type_id" id="type_id" class="form-control">
                            <option value='0'>-- Pilih Media Rapat --</option>
                            <?php $i = 1; ?>
                            <?php foreach ($alltype as $p) : ?>
                                <option value="<?= $p['id']; ?>"><?= $i++; ?>. <?= $p['meeting_type']; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?= form_error('type_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="type_id" class="col-sm-2 col-form-label">SubMedia Meeting</label>
                    <div class="col-sm-5">
                        <select class="form-control" name="meeting_subtype" id="meeting_subtype">
                            <option value='0'>-- Pilih SubMedia Rapat --</option>
                            <!-- SubMedia Rapat akan diload menggunakan ajax, dan ditampilkan disini -->
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="agenda" class="col-sm-2 col-form-label">Agenda</label>
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
                    <label for="start_date" class="col-sm-2 col-form-label">Tanggal Awal Rapat</label>
                    <div class="col-sm-10">
                        <input type="text" id="start_date" name="start_date" class="border" placeholder="Tanggal Awal Rapat" autocomplete="off">
                        <?= form_error('Tanggal Awal Rapat', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="end_date" class="col-sm-2 col-form-label">Tanggal Akhir Rapat</label>
                    <div class="col-sm-10">
                        <input type="text" id="end_date" name="end_date" class="border" placeholder="Tanggal Akhir Rapat" autocomplete="off">
                        <?= form_error('Tanggal Akhir Rapat', '<small class="text-danger">', '</small>'); ?>
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
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-window-close"></i> Batal</button>
                        <button type="submit" class="btn btn-success"><i class="fas fa-file"></i> Buat Rapat</button>
                    </div>
                </div>
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
                <form action="<?= base_url('meeting/editmeeting'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="type_id" class="col-sm-2 col-form-label">Media Meeting</label>
                            <div class="col-sm-5">
                                <select name="type_id" id="type_id2" class="form-control">
                                    <option value="<?= $a['type_id']; ?>"><?= $a['meeting_type']; ?></option>
                                    <option value='0'>-- Pilih Media Rapat --</option>
                                    <?php $i = 1; ?>
                                    <?php foreach ($alltype as $p) : ?>
                                        <option value="<?= $p['id']; ?>"><?= $i++; ?>. <?= $p['meeting_type']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <?= form_error('type_id', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="type_id" class="col-sm-2 col-form-label">SubMedia Meeting</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="meeting_subtype" id="meeting_subtype2">
                                    <option value="<?= $a['sub_type_id']; ?>"><?= $a['meeting_subtype']; ?></option>
                                    <option value='0'>-- Pilih SubMedia Rapat --</option>
                                    <!-- SubMedia Rapat akan diload menggunakan ajax, dan ditampilkan disini -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="agenda" class="col-sm-2 col-form-label">Agenda</label>
                            <div class="col-sm-10">
                                <textarea class="form-control form-control-user" name="agenda" id="agenda" placeholder="Describe Agenda here..."><?= $a['agenda']; ?></textarea>
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
                        <div class="form-group row">
                            <label for="start_date" class="col-sm-2 col-form-label">Tanggal Awal</label>
                            <div class="col-sm-10">
                                <input type="date" id="start_date" name="start_date" class="border" value="<?= $a['start_date']; ?>">
                                <?= form_error('Meeting Date', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="end_date" class="col-sm-2 col-form-label">Tanggal Akhir</label>
                            <div class="col-sm-10">
                                <input type="date" id="end_date" name="end_date" class="border" value="<?= $a['end_date']; ?>">
                                <?= form_error('Meeting Date', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="start_time_edit" class="col-sm-2 col-form-label">Jam Awal</label>
                            <div class="col-sm-10">
                                <input type="time" id="start_time" name="start_time" class="border" value="<?= $a['start_time']; ?>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="end_time_edit" class="col-sm-2 col-form-label">Jam Akhir</label>
                            <div class="col-sm-10">
                                <input type="time" id="end_time" name="end_time" class="border" value="<?= $a['end_time']; ?>">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="<?= $id; ?>">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-primary">Ubah Rapat</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Change Status -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $meeting_subtype = $a['meeting_subtype'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingStatus<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <form action="<?= base_url('meeting/updatestatus'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to Change Status of <b><?= $meeting_subtype; ?> ?</b></p>
                        <div class="form-group row">
                            <label for="place_id" class="col-sm-3 col-form-label">Status Rapat</label>
                            <div class="col-sm-5">
                                <select name="request_status" id="request_status" class="form-control">

                                    <?php
                                    if ($a['request_status'] == 0) { ?>
                                        <option value="<?= $a['request_status']; ?>">Permintaan</option>
                                    <?php } elseif ($a['request_status'] == 1) { ?>
                                        <option value="<?= $a['request_status']; ?>">Sudah Dipesan</option>
                                    <?php } elseif ($a['request_status'] == 2) { ?>
                                        <option value="<?= $a['request_status']; ?>">Pembatalan</option>
                                    <?php } elseif ($a['request_status'] == 3) { ?>
                                        <option value="<?= $a['request_status']; ?>">Tersedia</option>
                                    <?php } elseif ($a['request_status'] == 4) { ?>
                                        <option value="<?= $a['request_status']; ?>">Perubahan Jadwal</option>
                                    <?php } ?>

                                    <option value="" disabled>--</option>
                                    <option value="0">Permintaan</option>
                                    <option value="1">Sudah Dipesan</option>
                                    <option value="2">Pembatalan</option>
                                    <option value="3">Tersedia</option>
                                    <option value="4">Perubahan Jadwal</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="remark_status" class="col-sm-3 col-form-label">Keterangan Status</label>
                            <div class="col-sm-5">
                                <textarea class="form-control form-control-user" name="remark_status" id="remark_status" placeholder="Describe Agenda here..."><?= $a['remark_status']; ?></textarea>
                                <?= form_error('remark_status', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-danger">Confirm!</button>
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
    $meeting_subtype = $a['meeting_subtype'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingUpload<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <form action="<?= base_url('meeting/updatestatus'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to Change Status of <b><?= $meeting_subtype; ?> ?</b></p>
                        <div class="form-group row">
                            <label for="place_id" class="col-sm-3 col-form-label">Status Rapat</label>
                            <div class="col-sm-5">
                                <select name="request_status" id="request_status" class="form-control">

                                    <?php
                                    if ($a['request_status'] == 0) { ?>
                                        <option value="<?= $a['request_status']; ?>">Permintaan</option>
                                    <?php } elseif ($a['request_status'] == 1) { ?>
                                        <option value="<?= $a['request_status']; ?>">Sudah Dipesan</option>
                                    <?php } elseif ($a['request_status'] == 2) { ?>
                                        <option value="<?= $a['request_status']; ?>">Pembatalan</option>
                                    <?php } elseif ($a['request_status'] == 3) { ?>
                                        <option value="<?= $a['request_status']; ?>">Tersedia</option>
                                    <?php } elseif ($a['request_status'] == 4) { ?>
                                        <option value="<?= $a['request_status']; ?>">Perubahan Jadwal</option>
                                    <?php } ?>

                                    <option value="" disabled>--</option>
                                    <option value="0">Permintaan</option>
                                    <option value="1">Sudah Dipesan</option>
                                    <option value="2">Pembatalan</option>
                                    <option value="3">Tersedia</option>
                                    <option value="4">Perubahan Jadwal</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="remark_status" class="col-sm-3 col-form-label">Keterangan Status</label>
                            <div class="col-sm-5">
                                <textarea class="form-control form-control-user" name="remark_status" id="remark_status" placeholder="Describe Agenda here..."><?= $a['remark_status']; ?></textarea>
                                <?= form_error('remark_status', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-danger">Confirm!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Upload Undangan -->

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
                        <p>Are you sure want to delete <b><?= $meeting_subtype; ?> ?</b></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Confirm!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Delete -->


<!-- Jquery Area -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $(':submit').prop('disabled',true);
    $('#files').keyup(function(){
        $(':submit').prop('disabled', this.value == "" ? true : false);     
    })
});  
</script> -->