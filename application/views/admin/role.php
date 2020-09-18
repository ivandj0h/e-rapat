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

                <!-- Alert if Error occurred-->
                <?= form_error('menu', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>', '</div>'); ?>

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('message'); ?>

                <!-- DataTales Example -->
                <div class="card shadow-none mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary float-right">Pengaturan Hak Akses</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-condensed table-hover" id="freeRoom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-5">No</th>
                                        <th class="text-center w-20">Nama Hak Akses</th>
                                        <th class="text-center w-20">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($role as $r) : ?>
                                        <tr>
                                            <td class="text-center"><?= $i++; ?></td>
                                            <td><?= $r['role']; ?></td>
                                            <td class="text-center w-20">
                                                <a href="<?= base_url('admin/roleaccess/') . $r['id']; ?>">
                                                    <h6><span class="badge badge-dark"><i class="fas fa-lock"></i> access</span></h6>
                                                </a>
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