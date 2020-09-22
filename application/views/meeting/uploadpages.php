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

                <!-- DataTales Example -->
                <div class="card shadow-none mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary float-left">Zoho API</h6>
                    </div>
                    <div class="card-body">
                        <p class="text-muted">Silahkan Klik tombol <strong>Connect!</strong> agar terhubung dengan Zoho Form</p>
                        <hr>
                        <ul class="chec-radio">
                            <!-- Radio Button Here -->
                            <li class="pz">
                                <label class="radio-inline">
                                    <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="create">
                                    <div class="avail text-primary">
                                        Menggunakan <strong>ZOHO FORM BUILDER</strong>
                                    </div>
                                </label>
                            </li>
                            <li class="pz">
                                <label class="radio-inline">
                                    <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="maintenance">
                                    <div class="avail text-primary">
                                        Pengelolaan <strong>FORM</strong>
                                    </div>
                                </label>
                            </li>
                            <li class="pz">
                                <label class="radio-inline">
                                    <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="submissions">
                                    <div class="avail text-primary">
                                        Lihat Data <strong>FORM SUBMISSIONS</strong>
                                    </div>
                                </label>
                            </li>
                            <li class="pz">
                                <label class="radio-inline">
                                    <input type="radio" id="pro-chx-residential" name="zoomid" class="pro-chx" value="reports">
                                    <div class="avail text-primary">
                                        Pengelolaan <strong>REPORTS</strong>
                                    </div>
                                </label>
                            </li>
                        </ul>
                        <br>
                        <button type="submit" name="btnGo" class="btn btn-success" id="btnZoho" disabled><i class="fas fa-arrow-alt-circle-right"></i> Connect!</button>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#btnZoho').click(function() {
            // var radioValue = jQuery('input:radio:checked').val();
            // console.log('Clicked : ' + radioValue);
            var radioValue = jQuery('input:radio:checked').val();
            if (radioValue == 'create') {
                window.location.href = '<?= base_url('zoho/createform'); ?>';

            }
            if (radioValue == 'maintenance') {
                window.location.href = '<?= base_url('zoho/manageform'); ?>';
            }
            if (radioValue == 'submissions') {
                window.location.href = '<?= base_url('zoho/submissionsform'); ?>';
            }
            if (radioValue == 'reports') {
                window.location.href = '<?= base_url('zoho/reportsform'); ?>';
            }
        })
    })
</script>