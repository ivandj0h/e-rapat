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
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#deptAdd">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Add New Department</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Data Department</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Department Name</th>
                                        <th class="text-center w-20">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($dept as $d) : ?>
                                        <tr>
                                            <td class="text-left"><?= $d['department_name']; ?></td>
                                            <td class="text-center">
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#deptEdit<?= $d['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Edit</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#deptDel<?= $d['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Delete</span>
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

<!-- Start of Modal Add -->
<div class="modal fade" id="deptAdd" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="deptAddMenuLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deptAddMenuLabel">Add New Department</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('admin/adddepartment'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="department_name" name="department_name" placeholder="Enter Department...">
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
foreach ($dept as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="deptEdit<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="menuAdd">Edit Department</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('admin/editdepartment'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <input type="text" name="department_name" class="form-control form-control-user" id="department_name" value="<?= $a['department_name']; ?>" placeholder="department_name">
                                <?= form_error('department_name', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Update!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Delete -->
<?php
foreach ($dept as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="deptDel<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('admin/deletedepartment'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to delete <b><?= $a['department_name']; ?> ?</b></p>
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