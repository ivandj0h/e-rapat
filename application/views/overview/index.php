<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <div class="container-fluid">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-md-6">
                        <!-- Start of DataTales -->
                        <div class="card shadow-none mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary float-right">Todays Meeting</h6>
                            </div>
                            <!-- <div class="card-body"> -->
                            <!-- <div class="col-md-12"> -->
                            <ul class="list-group list-group-flush">
                                <?php $i = 1; ?>
                                <?php foreach ($overview as $m) : ?>

                                    <li class="list-group-item">
                                        <div class="accordion" id="accordion<?= $i; ?>">
                                            <div class="card shadow">
                                                <div class="card-body" id="heading<?= $i; ?>">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="p-2 bd-highlight"><strong><?= date("d-m-Y", strtotime($m['date_issues'])); ?></strong></div>
                                                        <div class="p-2 bd-highlight"><strong><?= $m['start_time']; ?></strong></div>
                                                        <div class="p-2 bd-highlight"><strong><?= $m['end_time']; ?></strong></div>
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
                                                                            <a href="#" class="float-right"><?= $m['department_name']; ?></a>
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
                            <!-- </div> -->
                            <!-- </div> -->
                        </div>
                        <!-- End of DataTables -->
                    </div>
                    <div class="col-sm-9 col-md-6">
                        <!-- Start of DataTales -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary float-right">Available Meeting Rooms</h6>
                            </div>
                            <div class="card-body">
                                <div class="col-md-12">
                                    <table class="table" id="freeRoom" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th class="text-center w-20">Meeting Room</th>
                                                <th class="text-center w-20">Start</th>
                                                <th class="text-center w-20">End</th>
                                                <th class="text-center w-20">Status</th>
                                                <th class="text-center w-20">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($freeroom as $a) : ?>
                                                <tr>
                                                    <td class="text-left"><?= $a['place_name']; ?></td>
                                                    <td><?= $a['start_time']; ?></td>
                                                    <td><?= $a['end_time']; ?></td>
                                                    <td class="text-center">
                                                        <?php
                                                        if ($a['request_status'] == 3) { ?>
                                                            <span class="badge badge-success">Open</span>
                                                        <?php } ?>
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="badge badge-primary" href="#meetingEdit<?= $a['id']; ?>" style="cursor:pointer;margin:2px;" data-toggle="modal" data-target="#addMeeting"><i class="fas fa-fw fa-file "></i> Create</a>
                                                    </td>
                                                </tr>

                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- End of DataTables -->
                    </div>
                </div>
            </div>
        </div>

        <!-- Content Row -->
    </div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->