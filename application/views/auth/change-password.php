<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-lg-6">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h3 text-primary-900 mb-4"><i class="fa fa-calendar" aria-hidden="true"></i> E-MEETING</h1>
                                    <h1 class="h4 text-gray-500">Change Password for</h1>
                                    <strong class="mb-4"><?= $this->session->userdata('reset_email'); ?></strong>
                                    <?= $this->session->flashdata('messages'); ?>
                                </div>
                                <form class="user" method="POST" action="<?= base_url('auth/changepassword'); ?>">
                                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                                    <div class="form-group">
                                        <input type="password" name="password1" class="form-control form-control-user" id="password1" placeholder="Enter new password...">
                                        <?= form_error('password1', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password2" class="form-control form-control-user" id="password2" placeholder="Repeat password...">
                                        <?= form_error('password2', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        <i class="fa fa-lock"></i> Change Password
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

</div>