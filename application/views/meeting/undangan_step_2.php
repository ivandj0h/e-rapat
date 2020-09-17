    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="contents">

            <!-- Start Breadcumb -->
            <div class="breadcrumb"></div>
            <!-- End of Breadcumb -->

            <!-- Start Content Table -->
            <div class="row">
                <div class="col-md-10">
                    <div class="card shadow-none mb-4">
                        <div class="card-header py-3">
                            <div class="float-left">
                                <h6 class="m-0 font-weight-bold text-primary float-right">Upload Undangan</h6>
                            </div>
                            <h6 class="m-0 font-weight-bold text-primary float-right">SOHO FORM</h6>
                        </div>
                        <div class="card-body">
                            <?php
                            foreach ($meeting as $a) :
                                $id = $a['id'];
                            ?>
                                <?= form_open_multipart('meeting/uploadabsensi'); ?>
                                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                                <div class="modal-body">
                                    <div class="form-group row">
                                        <label for="upload" class="col-sm-2 col-form-label">Nama Bagian</label>
                                        <div class="col-sm-10">
                                            <div class="custom-file">
                                                <strong><?= $a['sub_department_name']; ?></strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="upload" class="col-sm-2 col-form-label">Agenda Rapat</label>
                                        <div class="col-sm-10">
                                            <div class="custom-file">
                                                <strong><?= word_limiter($a['agenda'], 100); ?></strong>
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
                                    <input type="hidden" name="zoomid" value="<?= $a['zoomid']; ?>">
                                    <a href="<?= base_url('meeting'); ?>" class="btn btn-secondary"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Batal</a>
                                    <button type="submit" class="btn btn-primary" disabled><i class="fas fa-arrow-alt-circle-up"></i> Unggah Berkas Absensi!</button>
                                </div>
                                </form>
                        </div>
                    </div>
                <?php endforeach; ?>
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

    <script script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
    </script>
    <script>
        $("#changeZoom").click(function() {
            if ($(this).is(":checked")) {
                $('button[type=submit]').attr('disabled', false);
            } else {
                $('button[type=submit]').attr('disabled', true);
            }
        });
    </script>