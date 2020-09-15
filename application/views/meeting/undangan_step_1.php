<?php
foreach ($meeting as $a) :
    // $unique = $a['unique_code'];
    $id = $a['id'];
?>
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
                            <div class="float-left"><a href="<?= base_url('meeting'); ?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-chevron-left"></i> Previous</a></div>
                            <h6 class="m-0 font-weight-bold text-primary float-right">Details Meeting</h6>
                        </div>
                        <div class="card-body">
                            <?= choose_undangan($a); ?>
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
<?php endforeach; ?>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    jQuery(document).ready(function() {
        jQuery('#btnGo').click(function() {
            var radioValue = jQuery('input:radio:checked').val();
            if (radioValue == 'soho') {
                window.location.href = '<?= base_url('meeting/fase2/' . $id); ?>';
            }
            if (radioValue == 'erapat') {
                window.location.href = 'https://facebook.com';
            }
        })
    })
</script>