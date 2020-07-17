        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="contents">

                <!-- Start Breadcumb -->
                <div class="breadcrumb"></div>
                <!-- End of Breadcumb -->

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800"><?= $title; ?></h1>
                </div>
                <!-- Content Row -->
            </div>
            <div class="col-md-12 mb-3">
                Hello <?= greetings(); ?> <strong><?= $profiles['name']; ?></strong>, Selamat datang di Dashboard Aplikasi <strong>e-rapat</strong>.
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="card shadow mb-3 d-flex">
                        <div class="card-header">
                            Daftar Rapat hari ini, <strong><?= get_date_today(); ?></strong>
                        </div>
                        <div class="card-body flex-fill">
                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th>Department</th>
                                        <th>Lokasi Rapat</th>
                                        <th>Agenda Rapat</th>
                                        <th>Mulai</th>
                                        <th>Selesai</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                    <?php foreach ($dashboard as $d) : ?>
                                        <tr>
                                            <td><?= $d['department_name']; ?></td>
                                            <td><?= $d['place_name']; ?></td>
                                            <td><?= $d['agenda']; ?></td>
                                            <td><?= $d['start_time']; ?></td>
                                            <td><?= $d['end_time']; ?></td>
                                            <td>
                                                <?php
                                                if ($d['request_status'] == 0) { ?>
                                                    <span class="badge badge-primary">Requested</span>
                                                <?php } elseif ($d['request_status'] == 1) { ?>
                                                    <span class="badge badge-danger">Booked</span>
                                                <?php } elseif ($d['request_status'] == 2) { ?>
                                                    <span class="badge badge-secondary">Canceled</span>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow mb-3 d-flex">
                        <div class="card-header">
                            List Rapat berdasarkan Status
                        </div>
                        <div class="card-body flex-fill">
                            <ul class="list-group">
                                <?php foreach ($status as $s) : ?>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <?php
                                        if ($s['request_status'] == 0) { ?>
                                            <a href="#" class="list-group-item list-group-item-action"><span class="badge badge-primary">Requested</span>
                                                <span class="badge badge-primary badge-pill float-right"><?= $s['total_meeting']; ?></span>
                                            </a>
                                        <?php } elseif ($s['request_status'] == 1) { ?>
                                            <a href="#" class="list-group-item list-group-item-action"><span class="badge badge-danger">Booked</span>
                                                <span class="badge badge-primary badge-pill float-right"><?= $s['total_meeting']; ?></span>
                                            </a>
                                        <?php } elseif ($s['request_status'] == 2) { ?>
                                            <a href="#" class="list-group-item list-group-item-action"><span class="badge badge-secondary">Canceled</span>
                                                <span class="badge badge-primary badge-pill float-right"><?= $s['total_meeting']; ?></span>
                                            </a>
                                        <?php } ?>

                                    </li>
                                <?php endforeach; ?>
                                <!-- <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <a href="#" class="list-group-item list-group-item-action">Booked
                                        <span class="badge badge-danger badge-pill float-right">50</span>
                                    </a>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <a href="#" class="list-group-item list-group-item-action">Canceled
                                        <span class="badge badge-secondary badge-pill float-right">99</span>
                                    </a>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->