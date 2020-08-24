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
                                    <h1 class="h4 text-gray-500 mb-4">Forgot Password</h1>
                                    <?= $this->session->flashdata('messages'); ?>
                                </div>
                                <form class="user" method="POST" action="<?= base_url('auth/forgotPassword'); ?>">
                                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                                    <div class="form-group">
                                        <input type="text" name="email" class="form-control form-control-user" id="email" value="<?= set_value('email'); ?>" placeholder="Email Address">
                                        <?= form_error('email', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        <i class="fa fa-lock"></i> Reset Password
                                    </button>
                                </form>
                                <hr class="sidebar-divider">
                                <div class="text-center">
                                    <a class="small" href="<?= base_url('auth') ?>">Back to Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

</div>