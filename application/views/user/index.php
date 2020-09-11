<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Start Page Contents -->

    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Page Heading -->
        <?= $this->session->flashdata('messages'); ?>

        <div class="row row-height-sm">
            <div class="col">
                <div class="card shadow-none mb-3">
                    <div class="card-header">
                        Hello <label id="lblGreetings"></label> <strong><?= $user['name']; ?></strong>, <br />Selamat Datang di Aplikasi e-rapat, berikut ini adalah Profil anda
                    </div>
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="<?= base_url('assets/img/profile/') . $user['image']; ?>" class="card-img p-2">

                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><strong><?= $user['name']; ?></strong></h5>
                                <hr class="sidebar-divider d-none d-md-block">
                                <p class="card-text">Email : <strong><?= $user['email']; ?></strong></p>
                                <p class="card-text">Sekretariat : <strong><?= $user['department_name']; ?></strong></p>
                                <p class="card-text">Bagian : <strong><?= $user['sub_department_name']; ?></strong></p>
                                <p class="card-text">Hak Akses : <strong><?= $user['role']; ?></strong></p>
                                <p class="card-text">Status :
                                    <?php
                                    if ($user['is_active'] == 1) { ?>
                                        <span class="badge badge-success">Aktif</span>
                                    <?php } elseif ($user['is_active'] == 0) { ?>
                                        <span class="badge badge-danger">Not Active</span>
                                    <?php } ?>
                                </p>
                                <p class="card-text"><small class="text-muted">Zoom ID : <strong><?= $user['zoomid']; ?></strong></p>
                                <a href="<?= base_url('user/edit/'); ?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm p-2 ml-2"><i class="fas fa-edit fa-sm text-white-50"></i> Ubah Data Profil</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-none ml-4">
                    <div class="card-header">
                        Hello <strong><?= $user['name']; ?></strong>, Anda dapat merubah Password anda disini.
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

<script>
    var myDate = new Date();
    var hrs = myDate.getHours();

    var greet;

    if (hrs < 12)
        greet = 'Selamat Pagi ';
    else if (hrs >= 12 && hrs <= 15)
        greet = 'Selamat Siang ';
    else if (hrs >= 15 && hrs <= 18)
        greet = 'Selamat Sore ';
    else if (hrs >= 18 && hrs <= 24)
        greet = 'Selamat Malam';

    document.getElementById('lblGreetings').innerHTML =
        '<b>' + greet + '</b> ';
</script>