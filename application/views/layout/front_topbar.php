<body>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 shadow-sm fixed-top">
        <h5 class="my-0 mr-md-auto font-weight-normal"><img src="<?= base_url('assets/img/transport.svg'); ?>" alt="" style="width:30px"> BADAN PENELITIAN DAN PENGEMBANGAN KEMENTRIAN PERHUBUNGAN</h5>
        <!-- <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark text-decoration-none" href="<?= base_url('beranda') ?>">Beranda</a>
            <a class="p-2 text-dark text-decoration-none" href="<?= base_url('dokumentasi') ?>">Dokumentasi</a>
        </nav> -->
        <a class="btn btn-outline-succes" href="<?= base_url('auth') ?>">
            <?php
            $sess_id = $this->session->userdata('email');
            if ($sess_id) {
                echo 'Beralih ke Cpanel ' . $user['name'];
            } else {
                echo '<i class="fas fa-fw fa-lock"></i> Sign In';
            }
            ?>
        </a>
    </div>