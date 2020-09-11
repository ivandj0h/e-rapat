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

                <!-- Check for error using form validation -->
                <!-- Alert if Error occurred-->
                <?php if (validation_errors()) : ?>

                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <h4 class="alert-heading">Error!</h4>
                        <hr>
                        <?= validation_errors(); ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <?php endif; ?>

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('messages'); ?>

                <!-- DataTales Example -->
                <div class="card shadow-none mb-4">
                    <div class="card-header py-3">
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#addZoom">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Tambah Zoom ID</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data Master Zoom</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="freeRoom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">No</th>
                                        <th class="text-center w-20">Nama Zoom ID</th>
                                        <th class="text-center w-20">Nama Pemilik Zoom ID</th>
                                        <th class="text-center w-20">Status</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($zoom as $zm) : ?>
                                        <tr>
                                            <td class="text-center"><?= $i++; ?></td>
                                            <td class="text-center"><span class="text-primary"><strong><?= $zm['zoom_id']; ?></strong></span></td>
                                            <td><?= $zm['pemilik_zoom']; ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($zm['is_active'] == 1) { ?>
                                                    <span class="badge badge-success">Aktif</span>
                                                <?php } elseif ($zm['is_active'] == 0) { ?>
                                                    <span class="badge badge-danger">Non Aktif</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center">
                                                <?php
                                                if ($zm['status'] == 1) { ?>
                                                    <span class="badge badge-success" data-toggle="modal" data-target="#resetZoom<?= $zm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-eraser"></i> Sedang Online</span>
                                                <?php } else { ?>
                                                    <span class="badge badge-danger" data-toggle="modal" data-target="#resetZoom<?= $zm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-eraser"></i> Sedang Offline</span>
                                                <?php } ?>

                                                <span class="badge badge-dark" data-toggle="modal" data-target="#editZoom<?= $zm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Ubah</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#deleteZoom<?= $zm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Hapus</span>
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

<!-- Start of Modal Add -->
<div class="modal fade" id="addZoom" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="addZoom" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addZoom">Tambah Zoom ID</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('zoom/index'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="zoom_id" name="zoom_id" placeholder="Masukan Zoom ID...">
                    </div>
                    <div class="form-group">
                        <select name="user_id" id="user_id" class="form-control">
                            <option value="">-- Pilih User --</option>
                            <?php foreach ($users as $usr) : ?>
                                <option value="<?= $usr['id']; ?>"><?= $usr['name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="is_active1" value="1" checked>
                        <label class="form-check-label" for="is_active1">Aktif</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="is_active2" value="0">
                        <label class="form-check-label" for="is_active2">Tidak Aktif</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Buat Zoom ID</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Add -->

<!-- Start of Modal Edit -->
<?php
foreach ($zoom as $zm) :
    $id = $zm['id'];
?>
    <div class="modal fade" id="editZoom<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="editZoom" aria-hidden="true">

        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editZoom">Ubah Zoom ID</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('zoom/updatezoom'); ?>" method="POST">
                    <input type="hidden" name="id" value="<?= $zm['zoom_id']; ?>">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" class="form-control" id="zoom_id" name="zoom_id" value="<?= $zm['zoom_id']; ?>">
                        </div>
                        <div class="form-group">
                            <select class="custom-select mr-sm-2" select name="user_id" id="user_id">
                                <option value="<?= $zm['user_id']; ?>"><?= $zm['pemilik_zoom']; ?></option>
                                <option disabled>--</option>
                                <?php foreach ($users as $usr) : ?>
                                    <option value="<?= $usr['id']; ?>"><?= $usr['name']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        Apakah Anda ingin Merubah Status Zoom ID ini? <br>
                        <div class="form-group">
                            <select class="custom-select mr-sm-2" select name="is_active" id="is_active">
                                <option value="<?= $zm['is_active']; ?>"><?= $zm['is_active'] ? 'Aktif' : 'Tidak Aktif'; ?></option>
                                <option disabled>--</option>
                                <option value="1">Active</option>
                                <option value="0">Not Active</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Ubah Zoom ID</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Delete -->
<?php
foreach ($zoom as $zm) :
    $id = $zm['id'];
?>
    <div class="modal fade" id="deleteZoom<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('zoom/deletezoom/' . $id); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Apakah anda yakin ingin menghapus Zoom ID <b><?= $zm['zoom_id']; ?> ?</b></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Hapus Zoom ID</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Delete -->

<!-- Start of Modal Reset Online/Offline Status ZoomID -->
<?php
foreach ($zoom as $zm) :
    $id = $zm['id'];
?>
    <div class="modal fade" id="resetZoom<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('zoom/resetzoom'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Yakin ingin mereset ZoomID <strong><?= $zm['zoom_id']; ?> ?</strong></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Reset Sekarang!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Reset Online/Offline Status ZoomID -->