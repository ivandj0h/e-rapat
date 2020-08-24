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
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#addSubMediaType">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Tambah Data SubMedia</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data SubMedia</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="freeRoom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">No</th>
                                        <th class="text-center w-20">Nama Media</th>
                                        <th class="text-center w-20">Nama SubMedia</th>
                                        <th class="text-center w-20">Status</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($subtype as $sm) : ?>
                                        <tr>
                                            <td class="text-center"><?= $i++; ?></td>
                                            <td class="text-center"><?= $sm['meeting_type']; ?></td>
                                            <td><strong><?= $sm['meeting_subtype']; ?></strong></td>
                                            <td class="text-center">
                                                <?php
                                                if ($sm['is_active'] == 1) { ?>
                                                    <span class="badge badge-success">Aktif</span>
                                                <?php } elseif ($sm['is_active'] == 0) { ?>
                                                    <span class="badge badge-danger">Tidak Aktif</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center">
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#editSubMediaType<?= $sm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Edit</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#deleteSubMediaType<?= $sm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Delete</span>
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
<div class="modal fade" id="addSubMediaType" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="addSubMediaType" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSubMediaType">Tambah Data SubMedia</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('type/subtype'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="meeting_subtype" name="meeting_subtype" placeholder="Tambah Data SubMedia..." autocomplete="off">
                    </div>
                    <div class="form-group">
                        <select name="type_id" id="type_id" class="form-control">
                            <option value="">-- Pilih Nama Media --</option>
                            <?php foreach ($type as $m) : ?>
                                <option value="<?= $m['id']; ?>"><?= $m['meeting_type']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    Apakah anda ingin mengaktifkan SubMedia? <br>
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Tambah Data</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Add -->

<!-- Start of Modal Edit -->
<?php
foreach ($subtype as $s) :
    $id = $s['id'];
?>
    <div class="modal fade" id="editSubMediaType<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="editSubMediaType" aria-hidden="true">

        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editSubMediaType">Edit SubMedia Type</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('type/updatesubtype'); ?>" method="POST">
                    <input type="hidden" name="id" value="<?= $s['id']; ?>">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" class="form-control" id="meeting_subtype" name="meeting_subtype" value="<?= $s['meeting_subtype']; ?>" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <select class="custom-select mr-sm-2" select name="type_id" id="type_id">
                                <option value="<?= $s['type_id']; ?>"><?= $s['meeting_type']; ?></option>
                                <option disabled>--</option>
                                <?php foreach ($type as $d) : ?>
                                    <option value="<?= $d['id']; ?>"><?= $d['meeting_type']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="custom-select mr-sm-2" select name="is_active" id="is_active">
                                <option value="<?= $s['is_active']; ?>"><?= $s['is_active'] ? 'Aktif' : 'Tidak Aktif'; ?></option>
                                <option disabled>--</option>
                                <option value="1">Aktif</option>
                                <option value="0">Tidak Aktif</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary">Ubah Data</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->


<!-- Start of Modal Delete -->
<?php
foreach ($subtype as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="deleteSubMediaType<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('type/deletesubtype/' . $id); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Apakah anda yakin ingin menghapus SubMedia Type <b><?= $a['meeting_subtype']; ?> ?</b></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-danger">Hapus Data</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Delete -->