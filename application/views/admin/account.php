<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Start Content Table -->
        <div class="row">
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
                            <a href="#" class="btn btn-success btn-icon-split mb-4" data-toggle="modal" data-target="#addAccount">
                                <span class="icon text-white-50">
                                    <i class="fas fa-file"></i>
                                </span>
                                <span class="text">Add New Account</span>
                            </a>
                            <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
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
                                                <span class="badge badge-success" data-toggle="modal" data-target="#resetAccountPass<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-eraser"></i> Reset Password</span>
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#editAccount<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Edit</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#deleteAccount<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Delete</span>
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
<div class="modal fade" id="addAccount" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="addAccount" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAccount">Add New Account</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('admin/addaccount'); ?>" method="POST">
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
                                <option value="<?= $d['id']; ?>"><?= $d['department_name']; ?></option>
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
<!-- End of Modal Add -->

<!-- Start of Modal Edit -->
<?php
foreach ($account as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="editAccount<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="editAccount" aria-hidden="true">

        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addAccount">Edit Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('admin/updateaccount'); ?>" method="POST">
                    <input type="hidden" name="id" value="<?= $a['id']; ?>">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">

                        <div class="form-group row">
                            <div class="col-sm-3">
                                <img src="<?= base_url('assets/img/profile/') . $a['image']; ?>" class="img-thumbnail">

                            </div>
                            <div class="col-sm-9">
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Email</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="email" name="email" value="<?= $a['email']; ?>">
                                    </div>
                                    <div class="col-sm-2">

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Full Name</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="email" name="name" value="<?= $a['name']; ?>">
                                        <?= form_error('name', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Department Name</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="custom-select mr-sm-2" select name="department_id" id="department_id">
                                            <option value="<?= $a['department_id']; ?>"><?= $a['department_name']; ?></option>
                                            <option disabled>-- Select Department --</option>
                                            <?php foreach ($department as $d) : ?>
                                                <option value="<?= $d['id']; ?>"><?= $d['department_name']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Role Account</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="custom-select mr-sm-2" select name="role_id" id="role_id">
                                            <option value="<?= $a['role_id']; ?>"><?= $a['role']; ?></option>
                                            <option disabled>--</option>
                                            <option value="1">Admin</option>
                                            <option value="2">User</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Status Account</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="custom-select mr-sm-2" select name="is_active" id="is_active">
                                            <option value="<?= $a['is_active']; ?>"><?= $a['is_active'] ? 'Active' : 'Not Active'; ?></option>
                                            <option disabled>--</option>
                                            <option value="1">Active</option>
                                            <option value="0">Not Active</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Delete -->
<?php
foreach ($account as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="deleteAccount<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('admin/deleteaccount'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to delete <b><?= $a['name']; ?> ?</b></p>
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

<!-- Start of Modal Reset Account Password -->
<?php
foreach ($account as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="resetAccountPass<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('admin/forceresetpass'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to Reset Password for <strong><?= $a['name']; ?> ?</strong></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-success">Confirm!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Reset Account Password -->