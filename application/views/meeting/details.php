<?php
foreach ($meeting as $a) :
    // $unique = $a['unique_code'];
    $id = $a['id'];
?>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="contents">

            <!-- Start Breadcumb -->
            <div class="breadcrumb"></div>
            <!-- End of Breadcumb -->

            <!-- Start Content Table -->
            <div class="row form-heigt">
                <div class="col-md-10">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <div class="float-left"><a href="<?= base_url('meeting'); ?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-chevron-left"></i> Previous</a></div>
                            <h6 class="m-0 font-weight-bold text-primary float-right">Details Meeting</h6>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="place_name" class="col-sm-2 col-form-label">Media Meeting</label>
                                <div class="col-sm-5">
                                    <strong><?= $a['meeting_subtype']; ?></strong>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Agenda</label>
                                <div class="col-sm-10">
                                    <strong><?= $a['agenda']; ?></strong>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Speaker</label>
                                <div class="col-sm-10">
                                    <ul class="list-group">
                                        <?php $i = 1; ?>
                                        <?php foreach ($speakers as $sp) : ?>
                                            <li class="list-group-item reset-border">
                                                <?= $i++; ?>. <strong><?= $sp; ?></strong>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Participants</label>
                                <div class="col-sm-10">
                                    <ul class="list-group">
                                        <?php $i = 1; ?>
                                        <?php foreach ($members as $mm) : ?>
                                            <li class="list-group-item reset-border">
                                                <?= $i++; ?>. <strong><?= $mm; ?></strong>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="date_issues" class="col-sm-2 col-form-label">Meeting Date</label>
                                <div class="col-sm-10">
                                    <strong><?= date("d-m-Y", strtotime($a['date_issues'])); ?></strong>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="start_time" class="col-sm-2 col-form-label">Start Meeting</label>
                                <div class="col-sm-10">
                                    <strong><?= $a['start_time']; ?></strong>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="end_time" class="col-sm-2 col-form-label">End Meeting</label>
                                <div class="col-sm-10">
                                    <strong><?= $a['end_time']; ?></strong>
                                </div>
                            </div>
                            <hr class="sidebar-divider mt-3">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">User Data</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">File Uploads</a>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <table class="table table-borderless mt-2">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-center">Requested By</th>
                                                <th scope="col" class="text-center">Department Name</th>
                                                <th scope="col" class="text-center">Requeste Date</th>
                                                <th scope="col" class="text-center">Requested Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center"><span class="badge badge-secondary"><?= $a['name']; ?></span></td>
                                                <td class="text-center"><span class="badge badge-success"><?= $a['department_name']; ?></span></td>
                                                <td class="text-center"><span class="badge badge-primary"><?= date("d-m-Y", strtotime($a['date_issues'])); ?></span></td>
                                                <td class="text-center">
                                                    <?php
                                                    if ($a['request_status'] == 0) { ?>
                                                        <span class="badge badge-primary">Requested</span>
                                                    <?php } elseif ($a['request_status'] == 1) { ?>
                                                        <span class="badge badge-danger">Booked</span>
                                                    <?php } elseif ($a['request_status'] == 2) { ?>
                                                        <span class="badge badge-secondary">Canceled</span>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <ul class="list-group list-group-flush mt-3">
                                        <?php
                                        if (empty($a['files_upload'])) {  ?>
                                            <li class="list-group-item">
                                                <span class="badge badge-danger">No files Uploaded</span>
                                            </li>
                                        <?php } else { ?>
                                            <li class="list-group-item">
                                                <a href="<?= base_url('meeting/meetingdownload/' . $a['files_upload']); ?>"><?= $a['files_upload']; ?></a>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Content Table -->

    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->
<?php endforeach; ?>