    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="contents">

            <!-- Start Breadcumb -->
            <div class="breadcrumb"></div>
            <!-- End of Breadcumb -->

            <!-- Start Content Table -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow-none mb-4">
                        <div class="card-header py-3">
                            <div class="float-left">
                                <h6 class="m-0 font-weight-bold text-primary float-right">Upload Undangan</h6>
                            </div>
                            <h6 class="m-0 font-weight-bold text-primary float-right">SOHO FORM</h6>
                        </div>
                        <div class="card-body">
                            <?php $id = $rapat->id; ?>
                            <?= form_open_multipart('meeting/uploadabsensi'); ?>
                            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                            <div class="modal-body">

                                <div class="form-group row">
                                    <label for="upload" class="col-sm-2 col-form-label">Nama Bagian</label>
                                    <div class="col-sm-10">
                                        <div class="custom-file">
                                            <strong><?= $rapat->sub_department_name; ?></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="upload" class="col-sm-2 col-form-label">Agenda Rapat</label>
                                    <div class="col-sm-10">
                                        <div class="custom-file">
                                            <strong><?= word_limiter($rapat->agenda, 100); ?></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="upload" class="col-sm-2 col-form-label">Berkas Absensi</label>
                                    <div class="col-sm-10">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="absensi" name="absensi">
                                            <label class="custom-file-label" for="image">Choose file</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="checkbox" class="col-sm-2 col-form-label">Akhiri Rapat</label>
                                    <div class="col-sm-10">
                                        <div class="custom-file">
                                            <input id="changeZoom" type="checkbox" name="changeZoom" value="1">
                                            <label for="changeZoom" class="text-danger">Centang box ini untuk mengakhiri Rapat (Pemakai Google Zoom)</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="id" value="<?= $id; ?>">
                                <input type="hidden" name="zoomid" value="<?= $rapat->zoomid; ?>">
                                <a href="<?= base_url('meeting'); ?>" class="btn btn-secondary"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</a>
                                <button type="submit" class="btn btn-primary" disabled><i class="fas fa-arrow-alt-circle-up"></i> Unggah Berkas Absensi!</button>
                            </div>
                            </form>
                        </div>
                    </div>
                    <!-- End of Modal Edit -->
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