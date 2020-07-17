    <!-- Bootstrap core JavaScript-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

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