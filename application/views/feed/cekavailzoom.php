<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <div class="row">
            <div class="col-lg-12 mb-5">
                <!-- Nav pills -->
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link " href="<?= base_url('feed/pembaharuan'); ?>">Pembaharuan</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<?= base_url('feed/cekzoom'); ?>">Cek Ketersediaan Akun Zoom</a>
                        <!-- </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= base_url('feed/penjelajahan'); ?>">Penjelajahan</a>
                    </li> -->
                </ul>
            </div>
        </div>

        <!-- Start Content Table -->
        <div class="row">
            <div class="col-lg-12">
                <!-- DataTales Example -->
                <div class="card shadow-none mb-4">
                    <div class="card-header py-3">
                        <div class="col">
                            <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data Zoom Hari ini</h6>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="col-lg-12">
                            <table class="table table-striped table-condensed" id="meeting" cellspacing="0" style="width:100%">
                                <thead>
                                    <tr>
                                        <th class="text-center w-40">ZoomID</th>
                                        <th class="text-center w-20">Nama Pemilik Zoom</th>
                                        <th class="text-center w-20">Zoom ID dipakai Oleh</th>
                                        <th class="text-center w-20">Mulai Pukul</th>
                                        <th class="text-center w-20">Berakhir Pukul</th>
                                        <th class="text-center w-20">Status Zoom ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($zoom as $a) :

                                        $currenttime = date("H:i:s");
                                        $starttime = date($a['start_time']);
                                        $endtime = date($a['end_time']);

                                        $endtime = $endtime <= $starttime ? $endtime + 2400 : $endtime;

                                    ?>
                                        <tr>
                                            <td class="text-center">
                                                <strong><?= $a['zoom_id']; ?></strong>
                                            </td>
                                            <td class="text-center">
                                                <span><?= $a['pemilik_zoom']; ?></span>
                                            </td>
                                            <td class="text-center">
                                                <strong><?= $a['pemakai_zoom']; ?></strong>
                                            </td>
                                            <td class="text-center">
                                                <?= date("H:i", strtotime($a['start_time'])); ?>
                                            </td>
                                            <td class="text-center">
                                                <?= date("H:i", strtotime($a['end_time'])); ?>
                                            </td>
                                            <td class="text-center">
                                                <?php
                                                if (($currenttime >= $starttime) && ($currenttime <= $endtime) && ($a['status'] == 1)) { ?>
                                                    <button type="button" class="btn btn-danger" disabled><i class="fas fa-microphone-alt-slash"></i> Dipakai</button>
                                                <?php
                                                } else if ($a['user_id'] == 20 || $a['user_id'] == 21) { ?>
                                                    <button type="button" class="btn btn-secondary" disabled><i class="fas fa-microphone-alt"></i> Terbatas</button>
                                                <?php
                                                } else if ($a['status'] == 0) { ?>
                                                    <button type="button" class="btn btn-success" disabled><i class="fas fa-microphone-alt"></i> Tersedia</button>
                                                <?php } else { ?>
                                                    <button type="button" class="btn btn-success" disabled><i class="fas fa-microphone-alt"></i> Tersedia</button>
                                                <?php }
                                                ?>
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