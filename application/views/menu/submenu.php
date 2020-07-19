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
                        <h6 class="m-0 font-weight-bold text-primary float-right">Data SubMenu</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <a href="#" class="btn btn-success btn-icon-split mb-4" data-toggle="modal" data-target="#newModalSubMenu">
                                <span class="icon text-white-50">
                                    <i class="fas fa-file"></i>
                                </span>
                                <span class="text">Add New SubMenu</span>
                            </a>
                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-20">Parent Menu ID</th>
                                        <th class="text-center w-20">Parent Menu Name</th>
                                        <th class="text-center w-20">SubMenu Name</th>
                                        <th class="text-center w-20">Url Name</th>
                                        <th class="text-center w-20">Icon Name</th>
                                        <th class="text-center w-20">Active</th>
                                        <th class="text-center w-20">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($subMenu as $sm) : ?>
                                        <tr>
                                            <td class="text-center"><?= $sm['menu_id']; ?></td>
                                            <td><?= $sm['menu']; ?></td>
                                            <td><?= $sm['title']; ?></td>
                                            <td><small>e-meeting</small>/<strong><?= $sm['url']; ?></strong></td>
                                            <td><?= $sm['icon']; ?></td>
                                            <td class="text-center">
                                                <?php
                                                if ($sm['is_active'] == 1) { ?>
                                                    <span class="badge badge-success">Active</span>
                                                <?php } elseif ($sm['is_active'] == 0) { ?>
                                                    <span class="badge badge-danger">Not Active</span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-center">
                                                <a href=""><span class="badge badge-primary"><i class="fas fa-pen-square"></i> edit</span></a>
                                                <a href=""><span class="badge badge-danger"><i class="fas fa-trash-alt"></i> delete</span></a>
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

<!-- =============================================================================================== -->

<!-- Start of Modal Add -->
<div class="modal fade" id="newModalSubMenu" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="newModalSubMenuLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newModalSubMenuLabel">Add New SubMenu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('menu/submenu'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter SubMenu Name...">
                    </div>
                    <div class="form-group">
                        <select name="menu_id" id="menu_id" class="form-control">
                            <option value="">-- Select Menu --</option>
                            <?php foreach ($menu as $m) : ?>
                                <option value="<?= $m['id']; ?>">-- <?= $m['menu']; ?> --</option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="url" name="url" placeholder="Enter SubMenu url...">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="icon" name="icon" placeholder="Enter SubMenu icon...">
                    </div>
                    Do you want to Activate this menu? <br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="is_active1" value="1" checked>
                        <label class="form-check-label" for="is_active1">Active</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="is_active2" value="0">
                        <label class="form-check-label" for="is_active2">Not Active</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Add -->