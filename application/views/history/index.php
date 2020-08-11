<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="contents">

        <!-- Start Breadcumb -->
        <div class="breadcrumb"></div>
        <!-- End of Breadcumb -->

        <!-- Start Content Table -->
        <div class="row">
            <div class="col-lg-12">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <?= form_open('history'); ?>
                        <div class="col">
                            <input type="text" id="start_date" name="from_date" class="border" placeholder="From" autocomplete="off">
                            <input type="text" id="end_date" name="to_date" class="border" placeholder="To" autocomplete="off">
                            <button type="submit" class="btn btn-success button-sharp"><i class="fas fa-fw fa-search"></i> Search Meeting</button>
                            <?= form_error('from_date', '<small class="text-danger">', '</small>'); ?>
                            <h6 class="m-0 font-weight-bold text-primary float-right">Data History</h6>
                        </div>
                        <?= form_close(); ?>
                    </div>
                </div>
                <div class="card-body">
                    <div class="col-lg-12">
                        <table class="table table-striped table-condensed" id="meeting" cellspacing="0" style="width:100%">
                            <thead>
                                <tr>
                                    <th class="text-center w-20">Media Meeting</th>
                                    <th class="text-center w-20">Meeting Date</th>
                                    <th class="text-center w-20">Speakers</th>
                                    <th class="text-center w-20">Participants</th>
                                    <th class="text-center w-20">Start</th>
                                    <th class="text-center w-20">End</th>
                                    <th class="text-center w-20">Agenda</th>
                                    <th class="text-center w-20">Department</th>
                                    <th class="text-center w-20">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($meeting_user as $a) : ?>
                                    <tr>
                                        <td class="text-left"><?= $a['meeting_subtype']; ?></td>
                                        <td class="text-center"><?= date("d-m-Y", strtotime($a['start_date'])); ?></td>
                                        <td><?= $a['speakers_name']; ?></td>
                                        <td><?= $a['members_name']; ?></td>
                                        <td class="text-center"><?= $a['start_time']; ?></td>
                                        <td class="text-center"><?= $a['end_time']; ?></td>
                                        <td><?= word_limiter($a['agenda'], 5); ?></td>
                                        <td><?= $a['department_name']; ?></td>
                                        <td class="text-center action mx-2">
                                            <a class="badge badge-success" href="<?= base_url('meeting/detailsmeeting/' . $a['unique_code']); ?>" style="cursor:pointer;margin:2px;"><i class="fas fa-fw fa-search "></i> Details</a>
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