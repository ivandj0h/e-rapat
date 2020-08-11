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
           <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js"></script>
           <!-- Core plugin JavaScript-->
           <script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

           <!-- Custom scripts for all pages-->
           <script src="<?= base_url('assets/'); ?>js/sb-admin-2.js"></script>

           <!-- Page level plugins -->
           <script src="<?= base_url('assets/'); ?>vendor/datatables/jquery.dataTables.js"></script>
           <script src="<?= base_url('assets/'); ?>vendor/datatables/dataTables.buttons.min.js"></script>
           <script src="<?= base_url('assets/'); ?>js/pdfmake.min.js"></script>
           <script src="<?= base_url('assets/'); ?>js/vfs_fonts.js"></script>
           <script src="<?= base_url('assets/'); ?>js/buttons.html5.min.js"></script>
           <script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.print.min.js"></script>

           <!-- DateTime -->
           <script src="<?= base_url('assets/'); ?>vendor/datetimepicker/jquery.datetimepicker.full.min.js"></script>
           <script src="<?= base_url('assets/'); ?>js/moment.min.js"></script>

           <!-- Page level custom scripts -->
           <script src="<?= base_url('assets/'); ?>js/datatables/datatables-demo.js"></script>
           <script src="<?= base_url('assets/'); ?>js/datetime/datetime-demo.js"></script>

           <!-- Chart Scripts -->
           <script src="<?= base_url('assets/'); ?>vendor/chart.js/Chart.min.js"></script>
           <!-- <script src="<?= base_url('assets/'); ?>js/customsjs/chart-bar-demo.js"></script> -->

           <!-- Customs scripts -->
           <script src="<?= base_url('assets/'); ?>js/customsjs/customsjs-demo.js"></script>
           <script>
               // change menu access for checkbox
               var csrfName = "<?php echo $this->security->get_csrf_token_name(); ?>",
                   csrfHash = "<?php echo $this->security->get_csrf_hash(); ?>";
               $(".form-check-input").on("click", function() {
                   const menuId = $(this).data("menu");
                   const roleId = $(this).data("role");
                   var dataJson = {
                       [csrfName]: csrfHash,
                       menuId: menuId,
                       roleId: roleId,
                   };
                   $.ajax({
                       url: "<?= base_url('admin/changeaccess'); ?>",
                       type: "post",
                       data: dataJson,
                       success: function() {
                           document.location.href =
                               "<?= base_url('admin/roleaccess/'); ?>" + roleId;
                       },
                   });
               });

               //    Media types Add
               $("#type_id").change(function() {
                   var id_type = $("#type_id").val();
                   var csrfName = "<?php echo $this->security->get_csrf_token_name(); ?>",
                       csrfHash = "<?php echo $this->security->get_csrf_hash(); ?>";
                   var dataJson = {
                       [csrfName]: csrfHash,
                       id_type: id_type,
                   };
                   $.ajax({
                       url: "<?php echo base_url(); ?>meeting/get_media_meeting",
                       method: "POST",
                       data: dataJson,
                       async: false,
                       dataType: "json",
                       success: function(data) {
                           var html = "";
                           var i;

                           for (i = 0; i < data.length; i++) {
                               html +=
                                   "<option value=" +
                                   data[i].id +
                                   ">" +
                                   data[i].meeting_subtype +
                                   "</option>";
                           }
                           $("#meeting_subtype").html(html);
                       },
                   });

                   //    Media types Edit
                   $("#type_id2").change(function() {
                       var id_type = $("#type_id2").val();
                       var csrfName = "<?php echo $this->security->get_csrf_token_name(); ?>",
                           csrfHash = "<?php echo $this->security->get_csrf_hash(); ?>";
                       var dataJson = {
                           [csrfName]: csrfHash,
                           id_type: id_type,
                       };
                       $.ajax({
                           url: "<?php echo base_url(); ?>meeting/get_media_meeting",
                           method: "POST",
                           data: dataJson,
                           async: false,
                           dataType: "json",
                           success: function(data) {
                               var html = "";
                               var i;

                               for (i = 0; i < data.length; i++) {
                                   html +=
                                       "<option value=" +
                                       data[i].id +
                                       ">" +
                                       data[i].meeting_subtype +
                                       "</option>";
                               }
                               $("#meeting_subtype2").html(html);
                           },
                       });
                   });
               });

               $('.toast').toast('show');
           </script>
           </body>

           </html>