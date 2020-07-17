    <!-- Bootstrap core JavaScript-->
    <script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
    <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<?= base_url('assets/'); ?>js/sb-admin-2.js"></script>

    <!-- scripts -->
    <script>
        $(".alert-success").fadeTo(1500, 500).slideUp(500, function() {
            $(".alert-success").slideUp(500);
        });
        $(".alert-danger").fadeTo(1500, 500).slideUp(500, function() {
            $(".alert-danger").slideUp(500);
        });
    </script>
    </body>

    </html>