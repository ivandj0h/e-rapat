<div class="col-lg-10 mt-3" style="float:none;margin:auto;overflow: auto;padding-top: 50px;">

    <div class="row">
        <div class="col-lg-12 mb-3">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="<?= base_url('history'); ?>">Pembaruan Rapat</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url('history/searchdept'); ?>" style="color: black;">Penjelajahan Rapat</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url('history/searchdept'); ?>" style="color: black;">Tentang Rapat</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="jumbotron">
        <h1 class="display-4">Tentang!</h1>
        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
        <hr class="my-4">

        <p class="lead">
            <?php
            $sess_id = $this->session->userdata('email');
            if ($sess_id) {
                echo 'Anda Login Sebagai <strong>' . $user['name'] . '</strong>';
            } else {
                echo 'Maaf, Anda harus Login terlebih Dahulu untuk Membuat Rapat <br />'; ?>
                <a class="btn btn-primary btn-lg" href="<?= base_url('auth') ?>">Login</a>
            <?php
            }
            ?>
            </a>
        </p>
    </div>
</div>