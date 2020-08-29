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
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-backdrop="static" data-target="#addMeeting">
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
                                        <th class="text-center w-20">Pimpinan</th>
                                        <th class="text-center w-20">Agenda</th>
                                        <th class="text-center w-20">File Upload</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($meeting as $a) : ?>
                                        <tr>
                                            <td class="text-center"><?= date("d-m-Y", strtotime($a['start_date'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['start_time'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['end_time'])); ?></td>
                                            <td class="text-center"><?= $a['sub_department_name']; ?></td>
                                            <td class="text-left"><?= $a['meeting_subtype']; ?>
                                            <td class="text-center"><?= $a['members_name']; ?></td>
                                            <td class="text-justify"><?= word_limiter($a['agenda'], 5); ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($a['request_status'] == '1') {
                                                    status_all_cancel_upload($a);
                                                } else {
                                                    if (!empty($a['files_upload']) && !empty($a['files_upload1']) && !empty($a['files_upload2'])) {
                                                        status_all_upload($a);
                                                    } elseif (!empty($a['files_upload']) && empty($a['files_upload1']) && empty($a['files_upload2'])) {
                                                        status_undangan_upload($a);
                                                    } elseif (!empty($a['files_upload']) && !empty($a['files_upload1']) && empty($a['files_upload2'])) {
                                                        status_notulen_upload($a);
                                                    } else {
                                                        status_no_upload($a);
                                                    }
                                                }
                                                ?>
                                            </td>
                                            <td class="text-center action mx-2">
                                                <?php
                                                $date_now = date("Y-m-d");
                                                if ($date_now <= $a['start_date']) {
                                                    if ($a['type_id'] == '1') {
                                                        status_meeting_online($a);
                                                    } else {
                                                        status_meeting_offline($a);
                                                    }
                                                } else {
                                                    status_meeting_expired($a);
                                                }
                                                ?>
                                                <a class="badge badge-success" href="<?= base_url('meeting/detailsmeeting/' . $a['unique_code']); ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-search "></i> Detail Rapat</a>
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
<div class="modal fade" id="addMeeting" tabindex="-1" role="dialog" aria-labelledby="addMeeting" aria-hidden="true">
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
                <?= show_add_meeting(); ?>
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
    $remark_status = $a['remark_status'];
?>
    <div class="modal fade" id="meetingStatus<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addMeeting">Status Rapat</h5>
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
                    <div class="modal-footer">
                        <div class="actions">

                            <input type="hidden" name="id" value="<?= $id; ?>">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</button>
                            <button type="submit" class="btn btn-success" disabled><i class="fas fa-file"></i> Ubah Status</button>
                        </div>
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

<!-- Start of Modal Disabled Create Meeting -->
<div class="modal fade" id="noMeeting" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="noMeeting" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="noMeeting">Buat Rapat Baru</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-danger">Maaf Anda tidak dapat membuat meeting</p>
            </div>
            <div class="modal-footer">
                <input type="hidden" name="id" value="<?= $id; ?>">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>
<!-- End of Modal Disabled Create Meeting -->



<!-- Jquery Area -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('input[type=file]').change(function() {
            if ($('input[type=file]').val() == '') {
                $('button').attr('disabled', true)
            } else {
                $('button').attr('disabled', false);
            }
        })

        $('#addMeeting').on('hidden.bs.modal', function() {
            location.reload();
        })
        $('#meetingStatus').on('hidden.bs.modal', function() {
            location.reload();
        })


        $("#yourBox").click(function() {
            if ($(this).is(":checked")) {
                $("#onlineId").removeAttr("disabled");
                $("#onlineId").focus();
            } else {
                $("#onlineId").attr("disabled", "disabled");
            }
        });

        $(".dissable").attr("disabled", "disabled");
        $("#type_id").on("change", function() {
            if ($(this).val() === "2") {
                $(".dissable").attr("disabled", "disabled");
            } else {
                $(".dissable").removeAttr("disabled");
            }
        });

        var maxchars = 1000;
        $('#texta').on('keyup', function(e) {
            var textarea_value = $("#texta").val();
            var keyCode = e.which;
            $(this).val($(this).val().substring(0, maxchars));
            var tlength = $(this).val().length;
            remain = maxchars - parseInt(tlength);
            $('#remain').text(remain);
            if (textarea_value != '' && keyCode != 32 && keyCode != 8) {
                $('button[type=submit]').attr('disabled', false);
            } else {
                $('button[type=submit]').attr('disabled', true);
            }
        });
    });

    function myFunction() {
        document.getElementById("start_date").disabled = true;
    }
</script>