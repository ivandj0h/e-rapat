<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Start Page Contents -->

    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Page Heading -->
        <?= $this->session->flashdata('messages'); ?>

        <div class="row">
            <div class="col">
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="card-header">
                        Hello <strong><?= $user['name']; ?></strong>, Here is your profile data.
                    </div>
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="<?= base_url('assets/img/profile/') . $user['image']; ?>" class="card-img p-2">

                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><strong><?= $user['name']; ?></strong></h5>
                                <hr class="sidebar-divider d-none d-md-block">
                                <p class="card-text">Login Name : <strong><?= $user['email']; ?></strong></p>
                                <p class="card-text">Department Name : <strong><?= $user['department_name']; ?></strong></p>
                                <p class="card-text">Role Access : <strong><?= $user['role']; ?></strong></p>
                                <p class="card-text">Status Access :
                                    <?php
                                    if ($user['is_active'] == 1) { ?>
                                        <span class="badge badge-success">Active</span>
                                    <?php } elseif ($user['is_active'] == 0) { ?>
                                        <span class="badge badge-danger">Not Active</span>
                                    <?php } ?>
                                </p>
                                <p class="card-text"><small class="text-muted">Date Joined : <strong><?= date('d F Y', $user['date_created']); ?></small></strong></p>
                                <p class="card-text"><small class="text-muted">Last Updated : <strong><?= date('d F Y', $user['date_updated']); ?></small></strong></p>
                                <a href="<?= base_url('user/edit/'); ?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-2 ml-2"><i class="fas fa-edit fa-sm text-white-50"></i> Edit Profile</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card ml-4">
                    <div class="card-header">
                        Hello <strong><?= $user['name']; ?></strong>, Here you can change your password.
                    </div>
                    <div class="card-body">
                        <form class="user" method="POST" action="<?= base_url('user/changepassword'); ?>">
                            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                            <div class="form-group">
                                <div class="col mt-3">
                                    <input type="password" name="password1" class="form-control form-control-user" id="password1" placeholder="Password">
                                    <?= form_error('password1', '<small class="text-danger">', '</small>'); ?>
                                </div>
                                <div class="col mt-3">
                                    <input type="password" name="password2" class="form-control form-control-user" id="password2" placeholder="Repeat Password">
                                </div>
                                <div class="col mt-3">
                                    <button type="submit" class="btn btn-success  mb-4" value="<?= $user['id']; ?>">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Page Contents -->

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->