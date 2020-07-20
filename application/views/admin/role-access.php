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

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('messages'); ?>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div class="float-left"><a href="<?= base_url('admin/role'); ?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-chevron-left"></i> Previous</a></div>
                        <h6 class="m-0 font-weight-bold text-primary float-right">This is table role for [ <?= $role['role']; ?> ]</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Menu Name</th>
                                        <th class="text-center w-20">Menu Access</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($menu as $m) : ?>
                                        <tr>
                                            <td><?= $m['menu']; ?></td>
                                            <td class="text-center w-20">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" <?= check_access($role['id'], $m['id']); ?> data-role="<?= $role['id']; ?>" data-menu="<?= $m['id']; ?>">
                                                </div>
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