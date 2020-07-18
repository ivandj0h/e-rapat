           <!-- Footer -->
           <footer class="footer bg-white">
               <div class="container my-auto">
                   <div class="copyright text-center my-auto">
                       <span>Copyright &copy; e-rapat <?= date('Y'); ?></span>
                   </div>
               </div>
           </footer>
           <!-- End of Footer -->

           </div>
           <!-- End of Content Wrapper -->

           </div>
           <!-- End of Page Wrapper -->

           <!-- Scroll to Top Button-->
           <a class="scroll-to-top rounded" href="#page-top">
               <i class="fas fa-angle-up"></i>
           </a>

           <!-- Logout Modal-->
           <div class="modal fade" id="logoutModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">
                       <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">Yakin ingin keluar?</h5>
                           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">×</span>
                           </button>
                       </div>
                       <div class="modal-body">Klik tombol <strong>Keluar</strong> di bawah ini jika Anda yakin untuk mengakhiri sesi Anda saat ini.</div>
                       <div class="modal-footer">
                           <button class="btn btn-secondary" type="button" data-dismiss="modal">Batal</button>
                           <a class="btn btn-danger" href="<?= base_url('/auth/logout'); ?>">Keluar</a>
                       </div>
                   </div>
               </div>
           </div>

           <!-- Bootstrap core JavaScript-->
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.js"></script>

           <!-- Core plugin JavaScript-->
           <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

           <!-- Custom scripts for all pages-->
           <script src="<?= base_url('assets/js/sb-admin-2.js'); ?>"></script>

           <!-- Moment -->
           <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>

           <!-- Datatables plugins core script-->
           <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/dataTables.bootstrap4.min.js"></script>

           <!-- Datatables plugins custom script -->
           <script src="<?= base_url('assets/js/demo/datatables-demo.js'); ?>"></script>


           <script>
               // upload user profile
               $('.custom-file-input').on('change', function() {
                   let fileName = $(this).val().split('\\').pop();
                   $(this).next('.custom-file-label').addClass('selected').html(fileName);
               });

               // alert
               $(".alert-success").fadeTo(1000, 500).slideUp(500, function() {
                   $(".alert-success").slideUp(500);
               });

               $(".alert-danger").fadeTo(1000, 500).slideUp(500, function() {
                   $(".alert-danger").slideUp(500);
               });

               // Searching
               $("#myInput").on("keyup", function() {
                   var value = $(this).val().toLowerCase();
                   $("#myTable tr").filter(function() {
                       $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                   });
               });

               // change menu access for checkbox
               var csrfName = '<?php echo $this->security->get_csrf_token_name(); ?>',
                   csrfHash = '<?php echo $this->security->get_csrf_hash(); ?>';
               $('.form-check-input').on('click', function() {
                   const menuId = $(this).data('menu');
                   const roleId = $(this).data('role');
                   var dataJson = {
                       [csrfName]: csrfHash,
                       menuId: menuId,
                       roleId: roleId
                   };
                   $.ajax({
                       url: "<?= base_url('admin/changeaccess'); ?>",
                       type: 'post',
                       data: dataJson,
                       success: function() {
                           document.location.href = "<?= base_url('admin/roleaccess/'); ?>" + roleId;
                       }
                   });
               });
           </script>
           </body>

           </html>