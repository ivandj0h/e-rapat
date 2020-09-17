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
                <div class="col-md-12">
                    <div class="card shadow-none mb-4">
                        <div class="card-header py-3">
                            <div class="float-left">
                                <h6 class="m-0 font-weight-bold text-primary float-right">PILIH METODE</h6>
                            </div>
                            <h6 class="m-0 font-weight-bold text-primary float-right">LANGKAH PERTAMA</h6>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">Silahkan Pilih salah satu metode untuk Pengelolaan Absensi Rapat</p>
                            <hr>
                            <ul class="chec-radio">
                                <!-- Radio Button Here -->
                                <li class="pz">
                                    <label class="radio-inline">
                                        <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="soho">
                                        <div class="avail text-primary">
                                            Menggunakan <strong>SOHO FORM</strong>
                                        </div>
                                    </label>
                                </li>
                                <li class="pz">
                                    <label class="radio-inline">
                                        <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="erapat">
                                        <div class="avail text-primary">
                                            Menggunakan <strong>E-RAPAT FORM</strong>
                                        </div>
                                    </label>
                                </li>
                            </ul>
                            <br>
                            <button type="submit" name="btnGo" class="btn btn-primary" id="btnGo"><i class="fas fa-arrow-alt-circle-right"></i> Selanjutnya</button>

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
                window.location.href = '<?= base_url('meeting/soho/' . $id); ?>';
            }
            if (radioValue == 'erapat') {
                window.location.href = '<?= base_url('meeting/erapat/' . $id); ?>';
            }
        })
    })
</script>