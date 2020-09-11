<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <div class="row">
            <div class="col-lg-12 mb-3">
                <!-- Nav pills -->
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="<?= base_url('history'); ?>">Berdasarkan Rentang Tanggal</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<?= base_url('history/searchdept'); ?>">Berdasarkan Esalon 2</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Start Content Table -->
        <div class="row">
            <div class="col-lg-12">
                <!-- DataTales Example -->
                <div class="card noborder mb-4">
                    <div class="card-header py-3">
                        <?= form_open('history/searchdept'); ?>

                        <div class="form-group row">
                            <div class="col-sm-5">
                                <select name="department_id" id="department_id" class="form-control">
                                    <option value="">-- Pilih --</option>
                                    <?php $i = 1; ?>
                                    <?php foreach ($dept as $p) : ?>
                                        <option value="<?= $p['id']; ?>"><?= $i++; ?>. <?= $p['department_name']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-success button-sharp"><i class="fas fa-fw fa-search"></i> Search Meeting</button>
                            <?= form_error('department_id', '<small class="text-danger d-inline-flex p-2">', '</small>'); ?>
                        </div>

                        <?= form_close(); ?>
                    </div>
                    <div class="card-body">
                        <div class="col-lg-12">
                            <table class="table table-striped table-condensed" id="meeting" cellspacing="0" style="width:100%">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Tanggal</th>
                                        <th class="text-center w-20">Mulai</th>
                                        <th class="text-center w-20">Akhir</th>
                                        <th class="text-center w-20">Nama Bidang</th>
                                        <th class="text-center w-20">Tipe Rapat</th>
                                        <th class="text-center w-20">Media</th>
                                        <th class="text-center w-20">Pimpinan</th>
                                        <th class="text-center w-20">Agenda</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($meeting_admin as $a) : ?>
                                        <tr>
                                            <td class="text-center"><?= date("d-m-Y", strtotime($a['start_date'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['start_time'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['end_time'])); ?></td>
                                            <td class="text-left"><?= $a['sub_department_name']; ?></td>
                                            <td class="text-left">
                                                <?php
                                                if ($a['type_id'] == '1') { ?>
                                                    <span class="badge badge-success"><strong> Online</strong></span>
                                                <?php } else { ?>
                                                    <span class="badge badge-danger"><strong> Offline</strong></span>
                                                <?php }
                                                ?>
                                            </td>
                                            <td class="text-left"><?= $a['meeting_subtype']; ?></td>
                                            <td class="text-left"><?= $a['members_name']; ?></td>
                                            <td><?= word_limiter($a['agenda'], 15); ?></td>
                                            <td class="text-center action mx-2">
                                                <span class="badge badge-success" data-toggle="modal" data-target="#meetingDetail<?= $a['id']; ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-search"></i> Detail Rapat</span>
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


        <!-- Content Row -->
    </div>

    <br /><br /><br />

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Start of Modal Detail -->
<?php
foreach ($meeting_admin as $a) :
    $id = $a['id'];
    $meeting_subtype = $a['meeting_subtype'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingDetail<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header mb-2">
                    <h6 class="modal-title" id="addMeeting"> Detail Rapat <strong><?= $a['sub_department_name']; ?></strong></h6>
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