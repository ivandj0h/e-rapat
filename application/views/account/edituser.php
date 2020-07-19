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
        </div>

        <div class="row">
            <div class="col-lg-6">
                <?= $this->session->flashdata('messages'); ?>
            </div>
        </div>
        <div class="row form-heigt">
            <div class="col-lg-8">
                <form action="<?= base_url('account/updateuser'); ?>" method="POST">
                    <input type="hidden" name="id" value="<?= $edit_acc['id']; ?>">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <img src="<?= base_url('assets/img/profile/') . $edit_acc['image']; ?>" class="img-thumbnail">

                        </div>
                        <div class="col-sm-9">
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label for="name" class="col-form-label">Email</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="email" name="email" value="<?= $edit_acc['email']; ?>" readonly>
                                </div>
                                <div class="col-sm-2">

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label for="name" class="col-form-label">Full Name</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="email" name="name" value="<?= $edit_acc['name']; ?>">
                                    <?= form_error('name', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label for="name" class="col-form-label">Department Name</label>
                                </div>
                                <div class="col-sm-7">
                                    <select class="custom-select mr-sm-2" select name="department_id" id="department_id">
                                        <option value="<?= $edit_acc['department_id']; ?>">-- <?= $edit_acc['department_name']; ?> --</option>
                                        <option disabled>--</option>
                                        <?php foreach ($department as $d) : ?>
                                            <option value="<?= $d['id']; ?>">-- <?= $d['department_name']; ?> --</option>
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
                                        <option value="<?= $edit_acc['role_id']; ?>">-- <?= $edit_acc['role']; ?> --</option>
                                        <option disabled>--</option>
                                        <option value="1">-- Admin --</option>
                                        <option value="2">-- User --</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <label for="name" class="col-form-label">Status Account</label>
                                </div>
                                <div class="col-sm-7">
                                    <select class="custom-select mr-sm-2" select name="is_active" id="is_active">
                                        <option value="<?= $edit_acc['is_active']; ?>">-- <?= $edit_acc['is_active'] ? 'Active' : 'Not Active'; ?> --</option>
                                        <option disabled>--</option>
                                        <option value="1">-- Active --</option>
                                        <option value="0">-- Not Active --</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group row col-sm-12">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-success"><i class="fas fa-check"></i> Update!</button>
                            <a href="<?= base_url('account'); ?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-2 ml-2"><i class="fas fa-chevron-left"></i> Previous</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- Content Row -->
    </div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->