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
            <div class="col-md-12">
                Hello <?= greetings(); ?> <strong><?= $profiles['name']; ?></strong>, Selamat datang di Dashboard Aplikasi <strong>e-rapat</strong>.
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="card mb-3 d-flex">
                        <div class="card-header">
                            Daftar Rapat hari ini.
                        </div>
                        <div class="card-body flex-fill">
                            <input class="form-control" id="myInput" type="text" placeholder="Cari Data Rapat...">
                            <hr class="sidebar-divider mt-3">
                            <table class="table table-bordered table-hover table-responsive">
                                <thead>
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
                    <div class="card mb-3 d-flex">
                        <div class="card-header">
                            List Rapat berdasarkan Status
                        </div>
                        <div class="card-body flex-fill">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <a href="#" class="list-group-item list-group-item-action">Requested
                                        <span class="badge badge-primary badge-pill float-right">12</span>
                                    </a>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <a href="#" class="list-group-item list-group-item-action">Booked
                                        <span class="badge badge-danger badge-pill float-right">50</span>
                                    </a>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <a href="#" class="list-group-item list-group-item-action">Canceled
                                        <span class="badge badge-secondary badge-pill float-right">99</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->