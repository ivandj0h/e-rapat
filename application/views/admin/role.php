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

                <!-- Alert if Error occurred-->
                <?= form_error('menu', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>', '</div>'); ?>

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('message'); ?>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary float-right">Data Menu</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <a href="#" class="btn btn-success btn-icon-split mb-4" data-toggle="modal" data-target="#newModalRole">
                                <span class="icon text-white-50">
                                    <i class="fas fa-file"></i>
                                </span>
                                <span class="text">Add New Role</span>
                            </a>
                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Role Name</th>
                                        <th class="text-center w-20">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($role as $r) : ?>
                                        <tr>
                                            <td><?= $r['role']; ?></td>
                                            <td class="text-center w-20">
                                                <a href="<?= base_url('admin/roleaccess/') . $r['id']; ?>">
                                                    <h6><span class="badge badge-dark"><i class="fas fa-lock"></i> access</span></h6>
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
<div class="modal fade" id="newModalRole" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="newModalRoleLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newModalRoleLabel">Add New Role</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('admin/role'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="role" name="role" placeholder="Enter Role...">
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