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

        <!-- Start Content Table -->
        <div class="row form-heigt">
            <div class="col-md-10">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Add New Meeting</h6>
                    </div>
                    <div class="card-body">

                        <form action="<?= base_url('meeting/request'); ?>" method="POST">
                            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                            <div class="form-group row">
                                <label for="place_id" class="col-sm-2 col-form-label">Place name</label>
                                <div class="col-sm-5">
                                    <select name="place_id" id="place_id" class="form-control">
                                        <option value="">-- Select Place --</option>
                                        <?php foreach ($place as $p) : ?>
                                            <option value="<?= $p['id']; ?>">-- <?= $p['place_name']; ?> --</option>
                                        <?php endforeach; ?>
                                    </select>
                                    <?= form_error('place_id', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Agenda</label>
                                <div class="col-sm-10">
                                    <input type="text" name="agenda" class="form-control form-control-user" id="agenda" value="<?= set_value('agenda'); ?>" placeholder="Agenda">
                                    <?= form_error('agenda', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="date_issues" class="col-sm-2 col-form-label">Meeting Date</label>
                                <div class="col-sm-10">
                                    <input type="date" id="date_issues" name="date_issues" class="border">
                                    <?= form_error('Meeting Date', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="start_time" class="col-sm-2 col-form-label">Start Meeting</label>
                                <div class="col-sm-10">
                                    <input type="time" id="start_time" name="start_time" class="border">
                                    <?= form_error('Start Meeting', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="end_time" class="col-sm-2 col-form-label">End Meeting</label>
                                <div class="col-sm-10">
                                    <input type="time" id="end_time" name="end_time" class="border">
                                    <?= form_error('End Meeting', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success btn-user btn-block">
                                <i class="fa fa-calendar-alt"></i> Request Meeting
                            </button>
                        </form>


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