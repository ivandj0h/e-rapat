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

                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <h4 class="alert-heading">Error!</h4>
                        <hr>
                        <?= validation_errors(); ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <?php endif; ?>

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('messages'); ?>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary float-right">Data Account</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <a href="#" class="btn btn-success btn-icon-split mb-4" data-toggle="modal" data-target="#newModalAccount">
                                <span class="icon text-white-50">
                                    <i class="fas fa-file"></i>
                                </span>
                                <span class="text">Add New Account</span>
                            </a>
                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Image</th>
                                        <th class="text-center w-20">Full Name</th>
                                        <th class="text-center w-20">Email</th>
                                        <th class="text-center w-20">Role</th>
                                        <th class="text-center w-20">Department</th>
                                        <th class="text-center w-20">Active</th>
                                        <th class="text-center w-20">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($account as $a) : ?>
                                        <tr>
                                            <td class="text-center"><img src="<?= base_url('assets/img/profile/') ?><?= $a['image']; ?>" class="rounded mx-auto d-block" width="30"></td>
                                            <td><?= $a['name']; ?></td>
                                            <td><?= $a['email']; ?></td>
                                            <td class="text-center">

                                                <?php if ($a['role'] == 'Admin') {
                                                    echo '<span class="badge badge-secondary">Admin</span>';
                                                } else {
                                                    echo '<span class="badge badge-primary">User</span>';
                                                } ?>

                                            </td>
                                            <td><?= $a['department_name']; ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($a['is_active'] == 1) { ?>
                                                    <span class="badge badge-success">Active</span>
                                                <?php } elseif ($a['is_active'] == 0) { ?>
                                                    <span class="badge badge-danger">Not Active</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center">
                                                <a href="<?= base_url('account/edituser/') . $a['id']; ?>">
                                                    <i class="fas fa-file-alt"></i>
                                                </a>

                                                <a href="<?= base_url('account/delete/') . $a['id']; ?>" onClick="return confirm('Delete This account?')">
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
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


<!-- Start Modal -->

<!-- Modal -->
<div class="modal fade" id="newModalAccount" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="newModalAccount" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newModalSubMenuLabel">Add New Account</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('account/registration'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" value="<?= set_value('name'); ?>" placeholder="Full Name">
                        <?= form_error('name', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <input type="text" name="email" class="form-control form-control-user" id="email" value="<?= set_value('email'); ?>" placeholder="Email Address">
                        <?= form_error('email', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <select name="department_id" id="department_id" class="form-control">
                            <option value="">-- Select Department --</option>
                            <?php foreach ($department as $d) : ?>
                                <option value="<?= $d['id']; ?>">-- <?= $d['department_name']; ?> --</option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    Do you want to Activate this Account? <br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="is_active1" value="1" checked>
                        <label class="form-check-label" for="is_active1">Active</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="is_active2" value="0">
                        <label class="form-check-label" for="is_active2">Not Active</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal -->