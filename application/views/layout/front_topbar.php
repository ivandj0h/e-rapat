<body>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow fixed-top">
        <h5 class="my-0 mr-md-auto font-weight-normal"><a href=""><i class="fas fa-calendar-alt"></i> <?= $title; ?></a></h5>
        <!-- <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark text-decoration-none" href="<?= base_url('beranda') ?>">Beranda</a>
            <a class="p-2 text-dark text-decoration-none" href="<?= base_url('berita') ?>">Berita</a>
        </nav> -->
        <a class="btn btn-primary" href="<?= base_url('auth') ?>">
            <?php
            $sess_id = $this->session->userdata('email');
            if ($sess_id) {
                echo 'Beralih ke Cpanel ' . $user['name'];
            } else {
                echo 'Login';
            }
            ?>
        </a>
    </div>