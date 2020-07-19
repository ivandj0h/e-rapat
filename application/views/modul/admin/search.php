        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="contents">

                <!-- Start Breadcumb -->
                <div class="breadcrumb"></div>
                <!-- End of Breadcumb -->

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between">
                    <h1 class="h3 mb-0 text-gray-800"><?= $title; ?></h1>
                </div>
                <!-- Content Row -->
            </div>
            <!-- <div class="col-md-12 mb-3"> -->
            <hr class="sidebar-divider my-3">
            <!-- </div> -->
            <div class="row">
                <div class="col">
                    <div class="card mb-3 shadow">
                        <div class="card-header">
                            Hello <?= greetings(); ?> <strong><?= $profiles['name']; ?></strong>, Selamat datang di Dashboard Aplikasi <strong>e-rapat</strong>.
                        </div>
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <div class="card-body">
                                    <div class="row h-100 justify-content-center align-items-center">
                                        <form class="form-inline" action="<?= base_url('admin/search'); ?>" method="POST">
                                            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                                            <input type="date" class="form-control mb-2 mr-sm-2" name="date_issues" id="date_issues">
                                            <select class="form-control mb-2 mr-sm-2" name="place_id" required>
                                                <option value="">Pilih Lokasi</option>
                                                <?php foreach ($place as $p) : ?>
                                                    <option value="<?= $p['id']; ?>"><?= $p['place_name']; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <button type="submit" class="btn btn-success mb-2">Cek Ketersediaan</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

            <div class="container">
                <div class="row justify-content-center form-heigt">
                    <div class="col-md-6">
                        <ul class="list-group list-group-flush">
                            <?php $i = 1; ?>
                            <?php foreach ($meeting as $m) : ?>

                                <li class="list-group-item">
                                    <div class="accordion" id="accordion<?= $i; ?>">
                                        <div class="card shadow">
                                            <div class="card-body" id="heading<?= $i; ?>">
                                                <div class="d-flex justify-content-between">
                                                    <div class="p-2 bd-highlight"><strong><?= date("d-m-Y", strtotime($m['date_issues'])); ?></strong></div>
                                                    <div class="p-2 bd-highlight"><strong><?= $m['department_name']; ?></strong></div>
                                                    <div class="p-2 bd-highlight"><strong><?= $m['department_name']; ?></strong></div>
                                                    <div class="p-2 bd-highlight"><strong><?= $m['place_name']; ?></strong></div>
                                                    <div class="p-2 bd-highlight">
                                                        <?php
                                                        if ($m['request_status'] == 0) { ?>
                                                            <span class="badge badge-primary">Requested</span>
                                                        <?php } elseif ($m['request_status'] == 1) { ?>
                                                            <span class="badge badge-danger">Booked</span>
                                                        <?php } elseif ($m['request_status'] == 2) { ?>
                                                            <span class="badge badge-secondary">Canceled</span>
                                                        <?php } ?>
                                                    </div>
                                                    <div class="p-2 bd-highlight">
                                                        <i class="fas fa-angle-double-down pointer-link" data-toggle="collapse" data-target="#collapseOne<?= $i; ?>"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="sidebar-divider mb-0">
                                            <div id="collapseOne<?= $i; ?>" class="collapse mt-0 mb-3" aria-labelledby="heading<?= $i; ?>" data-parent="#accordion<?= $i; ?>">
                                                <div class="card-body">
                                                    <!-- TimeLine -->
                                                    <div class="container mt-5 mb-5">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <h4>Detail Rapat</h4>
                                                                <ul class="timeline">
                                                                    <li>
                                                                        <!-- <strong>//date('H:i:s', strtotime($m['start_time'] . ' + 30 minutes')); //</strong> -->
                                                                        <strong><?= $m['start_time']; ?></strong>
                                                                        <a href="#" class="float-right"><?= date("d-m-Y", strtotime($m['date_issues'])); ?></a>
                                                                        <p><?= $m['agenda']; ?></p>
                                                                        <?php
                                                                        if ($m['request_status'] == 0) { ?>
                                                                            <span class="badge badge-primary">Requested</span>
                                                                        <?php } elseif ($m['request_status'] == 1) { ?>
                                                                            <span class="badge badge-danger">Booked</span>
                                                                        <?php } elseif ($m['request_status'] == 2) { ?>
                                                                            <span class="badge badge-secondary">Canceled</span>
                                                                        <?php } ?>
                                                                        <span class="badge badge-success"><?= $m['name']; ?></span>
                                                                        <?php
                                                                        if ($m['files_upload'] == '') { ?>
                                                                            <span class="badge badge-danger">No File</span>
                                                                        <?php } else { ?>
                                                                            <span class="badge badge-danger"><?= $m['files_upload']; ?></span>
                                                                        <?php } ?>
                                                                    </li>
                                                                    <li>
                                                                        <strong><?= $m['end_time']; ?></strong>
                                                                        <a href="#" class="float-right"><?= date("d-m-Y", strtotime($m['date_issues'])); ?></a>
                                                                        <p><?= $m['agenda']; ?></p>
                                                                        <?php
                                                                        if ($m['request_status'] == 0) { ?>
                                                                            <span class="badge badge-primary">Requested</span>
                                                                        <?php } elseif ($m['request_status'] == 1) { ?>
                                                                            <span class="badge badge-danger">Booked</span>
                                                                        <?php } elseif ($m['request_status'] == 2) { ?>
                                                                            <span class="badge badge-secondary">Canceled</span>
                                                                        <?php } ?>
                                                                        <span class="badge badge-success"><?= $m['name']; ?></span>
                                                                        <?php
                                                                        if ($m['files_upload'] == '') { ?>
                                                                            <span class="badge badge-danger">No File</span>
                                                                        <?php } else { ?>
                                                                            <span class="badge badge-danger"><?= $m['files_upload']; ?></span>
                                                                        <?php } ?>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- End of TimeLine -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <?php $i++; ?>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->