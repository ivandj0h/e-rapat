<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"><?= $title; ?></h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
        </div>

        <!-- Start Content Table -->
        <div class="row form-heigt">
            <div class="col-lg-12">

                <!-- Check for error using form validation -->
                <!-- Alert if Error occurred-->
                <?php if (validation_errors()) : ?>

                    <div class="alert alert-danger alert-dismissible fade show col-md-6" role="alert">
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
                        <h6 class="m-0 font-weight-bold text-primary float-right">Data Meeting</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <a href="meeting/create" class="btn btn-success btn-icon-split mb-4">
                                <span class="icon text-white-50">
                                    <i class="fas fa-file"></i>
                                </span>
                                <span class="text">Add New Meeting</span>
                            </a>
                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Meeting Room</th>
                                        <th class="text-center w-20">Meeting Date</th>
                                        <th class="text-center w-20">Start</th>
                                        <th class="text-center w-20">End</th>
                                        <th class="text-center w-20">Agenda</th>
                                        <th class="text-center w-20">Department</th>
                                        <th class="text-center w-20">Requested</th>
                                        <th class="text-center w-20">Status</th>
                                        <th class="text-center w-20">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($meeting as $a) : ?>
                                        <tr>
                                            <td class="text-left"><?= $a['place_name']; ?></td>
                                            <td class="text-center"><?= date("d-m-Y", strtotime($a['date_issues'])); ?>
                                            </td>
                                            <td class="text-center"><?= $a['start_time']; ?></td>
                                            <td class="text-center"><?= $a['end_time']; ?></td>
                                            <td><?= $a['agenda']; ?></td>
                                            <td><?= $a['department_name']; ?></td>
                                            <td><?= $a['name']; ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($a['request_status'] == 0) { ?>
                                                    <span class="badge badge-primary">Requested</span>
                                                <?php } elseif ($a['request_status'] == 1) { ?>
                                                    <span class="badge badge-danger">Booked</span>
                                                <?php } elseif ($a['request_status'] == 2) { ?>
                                                    <span class="badge badge-secondary">Canceled</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center" style="display: flex; justify-content: space-between;">
                                                <span class="badge badge-primary" data-toggle="modal" data-target="#meetingStatus<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-calendar-check"></i> Change Status</span>
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#meetingEdit<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Edit</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#meetingDel<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Delete</span>
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

<!-- =============================================================================================== -->

<!-- Start of Modal Edit -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $place_name = $a['place_name'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingEdit<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('meeting/updatestatus'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to Change Status of <b><?= $place_name; ?> ?</b></p>
                        <div class="form-group row">
                            <label for="place_id" class="col-sm-3 col-form-label">Status name : </label>
                            <div class="col-sm-5">
                                <select name="request_status" id="request_status" class="form-control">

                                    <?php
                                    if ($a['request_status'] == 0) { ?>
                                        <option value="<?= $a['request_status']; ?>">Requested</option>
                                    <?php } elseif ($a['request_status'] == 1) { ?>
                                        <option value="<?= $a['request_status']; ?>">Booked</option>
                                    <?php } elseif ($a['request_status'] == 2) { ?>
                                        <option value="<?= $a['request_status']; ?>">Canceled</option>
                                    <?php } ?>

                                    <option value="0">Requested</option>
                                    <option value="1">Booked</option>
                                    <option value="2">Canceled</option>
                                </select>
                            </div>
                        </div>
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
<!-- End of Modal Edit -->

<!-- Start of Modal Change Status -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $place_name = $a['place_name'];
    $request_status = $a['request_status'];
?>
    <div class="modal fade" id="meetingStatus<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('meeting/updatestatus'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to Change Status of <b><?= $place_name; ?> ?</b></p>
                        <div class="form-group row">
                            <label for="place_id" class="col-sm-3 col-form-label">Status name : </label>
                            <div class="col-sm-5">
                                <select name="request_status" id="request_status" class="form-control">

                                    <?php
                                    if ($a['request_status'] == 0) { ?>
                                        <option value="<?= $a['request_status']; ?>">Requested</option>
                                    <?php } elseif ($a['request_status'] == 1) { ?>
                                        <option value="<?= $a['request_status']; ?>">Booked</option>
                                    <?php } elseif ($a['request_status'] == 2) { ?>
                                        <option value="<?= $a['request_status']; ?>">Canceled</option>
                                    <?php } ?>

                                    <option value="0">Requested</option>
                                    <option value="1">Booked</option>
                                    <option value="2">Canceled</option>
                                </select>
                            </div>
                        </div>
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
<!-- End of Modal Change Status -->

<!-- Start of Modal Delete -->
<?php
foreach ($meeting as $a) :
    $id = $a['id'];
    $place_name = $a['place_name'];
?>
    <div class="modal fade" id="meetingDel<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('meeting/delete'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to delete <b><?= $place_name; ?> ?</b></p>
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