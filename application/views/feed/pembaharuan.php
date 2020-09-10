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
                        <a class="nav-link active" href="<?= base_url('feed/pembaharuan'); ?>">Pembaharuan</a>
                    </li>
                    <!-- <li class="nav-item">
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
                        <?= form_open('history'); ?>
                        <div class="col">
                            <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#findZoomId">
                                <span class="icon text-white-50">
                                    <i class="fas fa-fw fa-search"></i>
                                </span>
                                <span class="text">Cek Google Zoom ID Hari ini</span>
                            </a>
                            <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data Rapat Hari ini</h6>
                        </div>
                        <?= form_close(); ?>
                    </div>
                    <div class="card-body">
                        <div class="col-lg-12">
                            <table class="table table-striped table-condensed" id="meeting" cellspacing="0" style="width:100%">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Tanggal</th>
                                        <th class="text-center w-20">Mulai</th>
                                        <th class="text-center w-20">Akhir</th>
                                        <th class="text-center w-20">Nama Bidang</th>
                                        <th class="text-center w-20">Tipe Rapat</th>
                                        <th class="text-center w-20">Media</th>
                                        <th class="text-center w-20">Pimpinan</th>
                                        <th class="text-center w-20">Agenda</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($meeting_updates as $a) : ?>
                                        <tr>
                                            <td class="text-center"><?= date("d-m-Y", strtotime($a['start_date'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['start_time'])); ?></td>
                                            <td class="text-center"><?= date("H:i", strtotime($a['end_time'])); ?></td>
                                            <td class="text-left"><?= $a['sub_department_name']; ?></td>
                                            <td class="text-left">
                                                <?php
                                                if ($a['type_id'] == '1') { ?>
                                                    <span class="badge badge-success"><strong> Online</strong></span>
                                                <?php } else { ?>
                                                    <span class="badge badge-danger"><strong> Offline</strong></span>
                                                <?php }
                                                ?>
                                            </td>
                                            <td class="text-left"><?= $a['meeting_subtype']; ?></td>
                                            <td class="text-left"><?= $a['members_name']; ?></td>
                                            <td><?= word_limiter($a['agenda'], 15); ?></td>
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

<!-- Start of Modal Find ZoomID Today -->

<div class="modal fade" id="findZoomId" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="findZoomId" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <h5 class="modal-title" id="findZoomId">Daftar Zoom ID yang terpakai hari ini</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="col-lg-12">
                    <table class="table table-condensed" id="meeting" cellspacing="0" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-center w-40">ZoomID</th>
                                <th class="text-center w-20">Nama Pemilik Zoom</th>
                                <th class="text-center w-20">Zoom ID dipakai Oleh</th>
                                <th class="text-center w-20">Sejak Pukul</th>
                                <th class="text-center w-20">Berakhir Pukul</th>
                                <th class="text-center w-20">Status Zoom ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($zoom as $a) : ?>
                                <tr>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            <span class="text-success"><?= $a['zoom_id']; ?></span>
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= $a['zoom_id']; ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-left">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            <span class="text-success"><?= $a['sub_department_name']; ?></span>
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= $a['sub_department_name']; ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            -
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= $a['pemakai_zoom']; ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            -
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= date("H:i", strtotime($a['start_time'])); ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            -
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= date("H:i", strtotime($a['end_time'])); ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        $current = strtotime(date("Y-m-d"));
                                        $date    = strtotime($a['date_activated']);

                                        if ($a['status'] == '1' && $date == $current) { ?>
                                            <button type="button" class="btn btn-danger" disabled><i class="fas fa-microphone-alt-slash"></i> Dipakai</button>
                                        <?php } else if ($a['user_id'] == 20 || $a['user_id'] == 21) { ?>
                                            <button type="button" class="btn btn-secondary" disabled><i class="fas fa-microphone-alt"></i> Terbatas</button>
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
            <div class="modal-footer" style="border-top: none;">
                <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
            </div>
        </div>
    </div>
</div>

<!-- End of Modal Find ZoomID Today -->


<!-- Start of Modal Find ZoomID PerHour -->

<div class="modal fade" id="findZoomIdHour" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="findZoomIdHour" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <h5 class="modal-title" id="findZoomIdHour">Daftar Zoom ID yang terpakai PerJam</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="col-lg-12">
                    <table class="table table-condensed" id="meeting" cellspacing="0" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-center w-40">ZoomID</th>
                                <th class="text-center w-20">Nama Pemilik Zoom</th>
                                <th class="text-center w-20">Zoom ID dipakai Oleh</th>
                                <th class="text-center w-20">Sejak Pukul</th>
                                <th class="text-center w-20">Berakhir Pukul</th>
                                <th class="text-center w-20">Status Zoom ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($zoom as $a) : ?>
                                <tr>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            <span class="text-success"><?= $a['zoom_id']; ?></span>
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= $a['zoom_id']; ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-left">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            <span class="text-success"><?= $a['sub_department_name']; ?></span>
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= $a['sub_department_name']; ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            -
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= $a['pemakai_zoom']; ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            -
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= date("H:i", strtotime($a['start_time'])); ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($a['status'] == 0) { ?>
                                            -
                                        <?php } else { ?>
                                            <span class="text-danger"><strong><?= date("H:i", strtotime($a['end_time'])); ?></strong></span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        $current = strtotime(date("Y-m-d"));
                                        $date    = strtotime($a['date_activated']);

                                        if ($a['status'] == '1' && $date == $current) { ?>
                                            <button type="button" class="btn btn-danger" disabled><i class="fas fa-microphone-alt-slash"></i> Dipakai</button>
                                        <?php } else if ($a['user_id'] == 20 || $a['user_id'] == 21) { ?>
                                            <button type="button" class="btn btn-secondary" disabled><i class="fas fa-microphone-alt"></i> Terbatas</button>
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
            <div class="modal-footer" style="border-top: none;">
                <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
            </div>
        </div>
    </div>
</div>

<!-- End of Modal Find ZoomID PerHour -->