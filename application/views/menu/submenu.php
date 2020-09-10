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
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#addSubMenu">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Tambah SubMenu</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data SubMenu</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="freeRoom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">No</th>
                                        <th class="text-center w-20">Nama Menu Utama</th>
                                        <th class="text-center w-20">Nama SubMenu</th>
                                        <th class="text-center w-20">Nama URL</th>
                                        <th class="text-center w-20">Name Icon</th>
                                        <th class="text-center w-20">Status</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($subMenu as $sm) : ?>
                                        <tr>
                                            <td class="text-center"><?= $i++; ?></td>
                                            <td><?= $sm['menu']; ?></td>
                                            <td><?= $sm['title']; ?></td>
                                            <td><small>e-meeting</small>/<strong><?= $sm['url']; ?></strong></td>
                                            <td><?= $sm['icon']; ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($sm['is_active'] == 1) { ?>
                                                    <span class="badge badge-success">Aktif</span>
                                                <?php } elseif ($sm['is_active'] == 0) { ?>
                                                    <span class="badge badge-danger">Non Aktif</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center">
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#editSubMenu<?= $sm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Ubah Data</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#deleteSubMenu<?= $sm['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Hapus Data</span>
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
<div class="modal fade" id="addSubMenu" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="addSubMenu" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSubMenu">Tambah SubMenu Baru</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('menu/submenu'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Masukan Nama SubMenu...">
                    </div>
                    <div class="form-group">
                        <select name="menu_id" id="menu_id" class="form-control">
                            <option value="">-- Pilih Menu --</option>
                            <?php foreach ($menu as $m) : ?>
                                <option value="<?= $m['id']; ?>"><?= $m['menu']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="url" name="url" placeholder="Enter SubMenu url...">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="icon" name="icon" placeholder="Enter SubMenu icon...">
                    </div>
                    Apakah anda ingin mengaktifkan SubMenu ini? <br>
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
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Tambah Data SubMenu</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Add -->

<!-- Start of Modal Edit -->
<?php
foreach ($subMenu as $s) :
    $id = $s['id'];
?>
    <div class="modal fade" id="editSubMenu<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="editSubMenu" aria-hidden="true">

        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editSubMenu">Ubah Data Menu</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('menu/updatesubmenu'); ?>" method="POST">
                    <input type="hidden" name="id" value="<?= $s['id']; ?>">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" class="form-control" id="title" name="title" value="<?= $s['title']; ?>">
                        </div>
                        <div class="form-group">
                            <select class="custom-select mr-sm-2" select name="menu_id" id="menu_id">
                                <option value="<?= $s['menu_id']; ?>"><?= $s['menu']; ?></option>
                                <option disabled>--</option>
                                <?php foreach ($menu as $d) : ?>
                                    <option value="<?= $d['id']; ?>"><?= $d['menu']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="url" name="url" value="<?= $s['url']; ?>">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="icon" name="icon" value="<?= $s['icon']; ?>">
                        </div>
                        <div class="form-group">
                            <select class="custom-select mr-sm-2" select name="is_active" id="is_active">
                                <option value="<?= $s['is_active']; ?>"><?= $s['is_active'] ? 'Active' : 'Not Active'; ?></option>
                                <option disabled>--</option>
                                <option value="1">Aktif</option>
                                <option value="0">Tidak Aktif</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Ubah Data SubMenu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Delete -->
<?php
foreach ($subMenu as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="deleteSubMenu<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editSubDepartment">Hapus Data SubMenu</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('menu/deletesubmenu/' . $id); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Apakah anda yakin ingin menghapus SubMenu <b><?= $a['title']; ?> ?</b></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Hapus Data Menu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Delete -->