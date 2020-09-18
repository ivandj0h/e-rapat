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
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#addAccount">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Tambah Data Akun</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Tabel Data Akun</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">

                            <table class="table table-striped table-condensed table-hover" id="freeRoom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-5">No</th>
                                        <th class="text-center w-20">Foto</th>
                                        <th class="text-center w-20">Zoom Id</th>
                                        <th class="text-center w-20">Nama Lengkap</th>
                                        <th class="text-center w-20">Email</th>
                                        <th class="text-center w-20">Role</th>
                                        <th class="text-center w-20">Sekretariat</th>
                                        <th class="text-center w-20">Bagian</th>
                                        <th class="text-center w-20">Aktif</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($account as $a) : ?>
                                        <tr>
                                            <td class="text-center"><?= $i++; ?></td>
                                            <td class="text-center"><img src="<?= base_url('assets/img/profile/') ?><?= $a['image']; ?>" class="rounded mx-auto d-block" width="30"></td>
                                            <td><?= $a['zoomid']; ?></td>
                                            <td><?= $a['name']; ?></td>
                                            <td><?= $a['email']; ?></td>
                                            <td class="text-center">

                                                <?php if ($a['role'] == 'Admin') {
                                                    echo '<span class="badge badge-danger">Admin</span>';
                                                } elseif ($a['role'] == 'User') {
                                                    echo '<span class="badge badge-success">User</span>';
                                                } else {
                                                    echo '<span class="badge badge-primary">' . $a['role'] . '</span>';
                                                } ?>

                                            </td>
                                            <td><?= $a['department_name']; ?></td>
                                            <td><?= $a['sub_department_name']; ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($a['is_active'] == 1) { ?>
                                                    <span class="badge badge-success">Active</span>
                                                <?php } elseif ($a['is_active'] == 0) { ?>
                                                    <span class="badge badge-danger">Not Active</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center">
                                                <span class="badge badge-success" data-toggle="modal" data-target="#resetAccountPass<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-eraser"></i> Reset Password</span>
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#editAccount<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Ubah Data</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#deleteAccount<?= $a['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Hapus Data</span>
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
<div class="modal fade" id="addAccount" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="addAccount" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAccount">Tambah Data Akun</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('admin/addaccount'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="zoomid" name="zoomid" value="<?= set_value('zoomid'); ?>" placeholder="Zoom Id">
                        <?= form_error('zoomid', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" value="<?= set_value('name'); ?>" placeholder="Full Name">
                        <?= form_error('name', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <input type="text" name="email" class="form-control form-control-user" id="email" value="<?= set_value('email'); ?>" placeholder="Email Address">
                        <?= form_error('email', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <select name="sub_department_id" id="sub_department_id" class="form-control">
                            <option value="">-- Pilih Nama Bagian --</option>
                            <?php foreach ($subdept as $d) : ?>
                                <option value="<?= $d['id']; ?>"><?= $d['sub_department_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="custom-select mr-sm-2" select name="role_id" id="role_id">
                            <option value="">-- Pilih Hak Akses --</option>
                            <?php foreach ($roles as $r) : ?>
                                <option value="<?= $r['id']; ?>"><?= $r['role']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    Apakah anda ingin mengaktifkan Akun ini? <br>
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
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Tambah Data Akun</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Add -->

<!-- Start of Modal Edit -->
<?php
foreach ($account as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="editAccount<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="editAccount" aria-hidden="true">

        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addAccount">Ubah Data Akun</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('admin/updateaccount'); ?>" method="POST">
                    <input type="hidden" name="id" value="<?= $a['id']; ?>">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group row">
                            <div class="col-sm-3">
                                <img src="<?= base_url('assets/img/profile/') . $a['image']; ?>" class="img-thumbnail">
                            </div>
                            <div class="col-sm-9">
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Email</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="email" name="email" value="<?= $a['email']; ?>" disabled>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="zoomid" class="col-form-label">Zoom Id</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="zoomid" name="zoomid" value="<?= $a['zoomid']; ?>">
                                        <?= form_error('zoomid', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Nama Lengkap</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="name" name="name" value="<?= $a['name']; ?>">
                                        <?= form_error('name', '<small class="text-danger">', '</small>'); ?>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Nama Bagian</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="custom-select mr-sm-2" select name="sub_department_id" id="sub_department_id">
                                            <option value="<?= $a['sub_department_id']; ?>"><?= $a['sub_department_name']; ?></option>
                                            <option disabled>-- Select Bagian --</option>
                                            <?php foreach ($subdept as $d) : ?>
                                                <option value="<?= $d['id']; ?>"><?= $d['sub_department_name']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Hak Akses Akun</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="custom-select mr-sm-2" select name="role_id" id="role_id">
                                            <option value="<?= $a['role_id']; ?>"><?= $a['role']; ?></option>
                                            <option disabled>--</option>
                                            <?php foreach ($roles as $r) : ?>
                                                <option value="<?= $r['id']; ?>"><?= $r['role']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="name" class="col-form-label">Status Akun</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="custom-select mr-sm-2" select name="is_active" id="is_active">
                                            <option value="<?= $a['is_active']; ?>"><?= $a['is_active'] ? 'Aktif' : 'Tidak Aktif'; ?></option>
                                            <option disabled>--</option>
                                            <option value="1">Aktif</option>
                                            <option value="0">Tidak Aktif</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Ubah Data Akun</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Delete -->
<?php
foreach ($account as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="deleteAccount<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('admin/deleteaccount'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Yakin ingin menghapus <b><?= $a['name']; ?> ?</b></p>
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

<!-- Start of Modal Reset Account Password -->
<?php
foreach ($account as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="resetAccountPass<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('admin/forceresetpass'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Yakin ingin mereset Password <strong><?= $a['name']; ?> ?</strong></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" id="batal" data-dismiss="modal"><i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i> Keluar</button>
                        <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Reset Password!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Reset Account Password -->