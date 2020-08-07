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

                    <div class="alert alert-danger alert-dismissible fade show col-md-12" role="alert">
                        <h4 class="alert-heading">Error!</h4>
                        <hr>
                        <?= validation_errors(); ?>
                    </div>
                <?php endif; ?>

                <!-- Alert if Success saving data to DB -->
                <?= $this->session->flashdata('messages'); ?>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <a href="#" class="btn btn-success btn-icon-split" data-toggle="modal" data-target="#typeAdd">
                            <span class="icon text-white-50">
                                <i class="fas fa-file"></i>
                            </span>
                            <span class="text">Add New Media Meeting</span>
                        </a>
                        <h6 class="m-0 font-weight-bold text-primary float-right">Data Media Meeting</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-condensed table-hover" id="freeRoom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="text-center w-5">No</th>
                                        <th class="text-center w-20">Media Meeting</th>
                                        <th class="text-center w-20">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach ($type as $t) : ?>
                                        <tr>
                                            <td class="text-center"><?= $i++; ?></td>
                                            <td class="text-left"><?= $t['meeting_type']; ?></td>
                                            <td class="text-center">
                                                <span class="badge badge-dark" data-toggle="modal" data-target="#typeEdit<?= $t['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-marker"></i> Edit</span>
                                                <span class="badge badge-danger" data-toggle="modal" data-target="#typeDel<?= $t['id']; ?>" style="cursor:pointer"><i class="fas fa-fw fa-trash"></i> Delete</span>
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
<div class="modal fade" id="typeAdd" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="typeAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="typeAddLabel">Add New Media Type</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('type/addtype'); ?>" method="POST">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="meeting_type" name="meeting_type" placeholder="Enter Media Type...">
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

<!-- Start of Modal Edit -->
<?php
foreach ($type as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="typeEdit<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="typeEdit">Edit Media Type</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('type/edittype'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <input type="text" name="meeting_type" class="form-control form-control-user" id="meeting_type" value="<?= $a['meeting_type']; ?>" placeholder="Edit Media Type...">
                                <?= form_error('meeting_type', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Update!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Edit -->

<!-- Start of Modal Delete -->
<?php
foreach ($type as $a) :
    $id = $a['id'];
?>
    <div class="modal fade" id="typeDel<?= $id; ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<?= base_url('type/deletetype'); ?>" method="POST">
                    <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" style="display: none">
                    <div class="modal-body">
                        <p>Are you sure want to delete <b><?= $a['meeting_type']; ?> ?</b></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $id; ?>">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Confirm!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<!-- End of Modal Delete -->