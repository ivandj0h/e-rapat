<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-lg-6">

            <div class="card o-hidden border-0 shadow-sm my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg">
                            <div class="p-5">
                                <div class="text-center">
                                    <a href="<?= base_url() ?>">
                                        <h1 class="h3 text-primary-900 mb-4"><i class="fa fa-calendar" aria-hidden="true"></i> E-RAPAT</h1>
                                    </a>
                                    <h1 class="h4 text-gray-500 mb-4">Control Panel</h1>
                                    <?= $this->session->flashdata('messages'); ?>
                                </div>
                                <form class="user" method="POST" action="<?= base_url('auth'); ?>">
                                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                                    <div class="form-group">
                                        <input type="text" name="email" class="form-control form-control-user" id="email" value="<?= set_value('email'); ?>" placeholder="Email Address" autocomplete="off">
                                        <?= form_error('email', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control form-control-user" id="password" placeholder="Password">
                                        <?= form_error('password', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        <i class="fa fa-lock"></i> Sign In
                                    </button>
                                </form>
                                <hr class="sidebar-divider">
                                <div class="copyright text-center text-secondary my-auto">
                                    <!-- <a class="small" href="<?= base_url('auth/forgotpassword') ?>">Forgot Password?</a> -->
                                    <span>Copyright &copy; e-rapat <?= date('Y'); ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>