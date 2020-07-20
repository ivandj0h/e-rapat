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
           <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">
                       <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">×</span>
                           </button>
                       </div>
                       <div class="modal-body">Select "Logout" you are ready to end your current session.</div>
                       <div class="modal-footer">
                           <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                           <a class="btn btn-danger" href="<?= base_url('/auth/logout'); ?>">Logout</a>
                       </div>
                   </div>
               </div>
           </div>

           <!-- Bootstrap core JavaScript-->
           <script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
           <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

           <!-- Core plugin JavaScript-->
           <script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

           <!-- Custom scripts for all pages-->
           <script src="<?= base_url('assets/'); ?>js/sb-admin-2.js"></script>

           <!-- Page level plugins -->
           <script src="<?= base_url('assets/'); ?>vendor/datatables/jquery.dataTables.js"></script>
           <script src="<?= base_url('assets/'); ?>vendor/datatables/dataTables.bootstrap4.js"></script>

           <!-- Calendar -->
           <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>
           <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script> -->
           <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script> -->
           <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script> -->
           <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> -->

           <!-- Page level custom scripts -->
           <script src="<?= base_url('assets/'); ?>js/demo/datatables-demo.js"></script>
           <!-- <script src="<?= base_url('assets/'); ?>js/calendar.js"></script> -->


           <script>
               // upload user profile
               $('.custom-file-input').on('change', function() {
                   let fileName = $(this).val().split('\\').pop();
                   $(this).next('.custom-file-label').addClass('selected').html(fileName);
               });

               $(".alert-success").fadeTo(2000, 500).slideUp(500, function() {
                   $(".alert-success").slideUp(500);
               });

               $(".alert-warning").fadeTo(3000, 500).slideUp(500, function() {
                   $(".alert-warning").slideUp(500);
               });

               $(".alert-danger").fadeTo(2000, 500).slideUp(500, function() {
                   $(".alert-danger").slideUp(500);
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