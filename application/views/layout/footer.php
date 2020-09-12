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
           <div class="modal fade" id="logoutModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">
                       <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">Yakin ingin keluar?</h5>
                           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">×</span>
                           </button>
                       </div>
                       <div class="modal-body">Pilih "Keluar" untuk mengakhiri sesi anda.</div>
                       <div class="modal-footer">
                           <button class="btn btn-secondary" type="button" data-dismiss="modal">Batal</button>
                           <a class="btn btn-danger" href="<?= base_url('/auth/logout'); ?>">Keluar</a>
                       </div>
                   </div>
               </div>
           </div>

           <!-- Bootstrap core JavaScript-->
           <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
           <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
           <script src="<?= base_url('assets/'); ?>js/tagsinput.js"></script>
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

           <!-- Tinymce Scripts -->
           <script src="<?= base_url('assets/'); ?>vendor/tinymce/tinymce.min.js"></script>

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

               $('#meetingStatus').on('hidden.bs.modal', function() {
                   location.reload();
               })

               $('#type_id').on('change', function() {
                   if (this.value === '1') {
                       $("#other_online_id").hide();
                       $("#zoom_id").show();
                   } else {
                       $("#other_online_id").hide();
                       $("#zoom_id").hide();
                   }
               });

               $('#meeting_subtype').on('change', function() {
                   if (this.value !== '1') {
                       $("#other_online_id").show();
                       $("#zoom_id").hide();
                   }
                   if (this.value === '5' || this.value === '6' || this.value === '7' || this.value === '8') {
                       $("#other_online_id").hide();
                       $("#zoom_id").hide();
                   }
                   if (this.value === '1') {
                       $("#other_online_id").hide();
                       $("#zoom_id").show();
                   }
               });

               $("#yourBox").click(function() {
                   if ($(this).is(":checked")) {
                       $("#onlineId").removeAttr("disabled");
                       $("#onlineId").focus();
                   } else {
                       $("#onlineId").attr("disabled", "disabled");
                   }
               });

               $("#confirmStatus").click(function() {
                   if ($(this).is(":checked")) {
                       $('button[type=submit]').attr('disabled', false);
                   } else {
                       $('button[type=submit]').attr('disabled', true);
                   }
               });

               $("#changeZoom").click(function() {
                   if ($(this).is(":checked")) {
                       $('button[type=submit]').attr('disabled', false);
                   } else {
                       $('button[type=submit]').attr('disabled', true);
                   }
               });

               $("#deleteMeeting").click(function() {
                   if ($(this).is(":checked")) {
                       $('button[type=submit]').attr('disabled', false);
                   } else {
                       $('button[type=submit]').attr('disabled', true);
                   }
               });

               $(".dissable").attr("disabled", "disabled");
               $("#type_id").on("change", function() {
                   if ($(this).val() === "2") {
                       $(".dissable").attr("disabled", "disabled");
                   } else {
                       $(".dissable").removeAttr("disabled");
                   }
               });

               var maxchars = 1000;
               $('#texta').on('keyup', function(e) {
                   var textarea_value = $("#texta").val();
                   var keyCode = e.which;
                   $(this).val($(this).val().substring(0, maxchars));
                   var tlength = $(this).val().length;
                   remain = maxchars - parseInt(tlength);
                   $('#remain').text(remain);
                   if (textarea_value != '' && keyCode != 32 && keyCode != 8) {
                       $('button[type=submit]').attr('disabled', false);
                   } else {
                       $('button[type=submit]').attr('disabled', true);
                   }
               });

               tinymce.init({
                   selector: '#default',
                   height: 400,
                   forced_root_block: "",
                   force_br_newlines: true,
                   force_p_newlines: false,
                   theme: 'modern',
                   plugins: [
                       'autolink lists link image charmap print preview hr anchor pagebreak',
                       'searchreplace wordcount visualblocks visualchars code fullscreen',
                       'insertdatetime media nonbreaking save table contextmenu directionality',
                       'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
                   ],
                   toolbar1: 'undo redo | insert | styleselect table | bold italic | hr alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media ',
                   toolbar2: 'print preview | forecolor backcolor emoticons | fontselect | fontsizeselect | codesample code fullscreen',
                   templates: [{
                           title: 'Test template 1',
                           content: ''
                       },
                       {
                           title: 'Test template 2',
                           content: ''
                       }
                   ],
                   content_css: [
                       '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                       '//www.tinymce.com/css/codepen.min.css'
                   ],
                   setup: function(ed) {
                       ed.on('change', function(e) {
                           console.log('the content ' + ed.getContent());
                           $("textarea").text(ed.getContent());
                       });
                   }
               });

               $("#btnSave").click(function(e) {
                   e.preventDefault();

                   var typeId = $("#type_id").val();
                   var subTypeId = $("#meeting_subtype").val();
                   var zoomId = $("input[name='zoomid']:checked").val();
                   var otherId = $("#onlineId").val();
                   var participantsName = $("#participants_name").val();
                   var narasumberRapat = $("#speakers_name").val();
                   var agenda = $("textarea[name='agenda']").val();
                   //    var agenda = $('textarea#agenda').val();
                   var startDate = $("input[name='start_date']").val();
                   var endDate = $("input[name='start_date']").val();
                   var startTime = $("input[name='start_time']").val();
                   var endTime = $("input[name='end_time']").val();

                   var dataJson = {
                       meeting_subtype: subTypeId,
                       zoomid: zoomId,
                       other_online_id: otherId,
                       participants_name: participantsName,
                       speakers_name: narasumberRapat,
                       agenda: agenda,
                       start_date: startDate,
                       end_date: startDate,
                       start_time: startTime,
                       end_time: endTime,
                   };

                   console.log(dataJson);

                   $.ajax({
                       url: "<?php echo base_url(); ?>" + "meeting/store_meeting",
                       method: "POST",
                       fileElementId: 'files',
                       data: dataJson,
                       dataType: "JSON",
                       async: true,
                       cache: false,
                       //    beforeSend: function() {},
                       success: function(data) {
                           if (data.error) {
                               $('#btnSave').attr('disabled', true);
                               if (data.agenda_error != '') {
                                   $('#agenda_error').html(data.agenda_error);
                               } else {
                                   $('#agenda_error').html('');
                               }
                               if (data.participants_name_error != '') {
                                   $('#participants_name_error').html(data.participants_name_error);
                               } else {
                                   $('#participants_name_error').html('');
                               }
                               if (data.speakers_name_error != '') {
                                   $('#speakers_name_error').html(data.speakers_name_error);
                               } else {
                                   $('#speakers_name_error').html('');
                               }
                               if (data.start_date_error != '') {
                                   $('#start_date_error').html(data.start_date_error);
                               } else {
                                   $('#start_date_error').html('');
                               }
                               if (data.start_time_error != '') {
                                   $('#start_time_error').html(data.start_time_error);
                               } else {
                                   $('#start_time_error').html('');
                               }
                               if (data.end_time_error != '') {
                                   $('#end_time_error').html(data.end_time_error);
                               } else {
                                   $('#end_time_error').html('');
                               }

                               if ($('input[name=participants_name]').val() == '') {
                                   $('input[name=participants_name]').change(function() {
                                       if ($('input[name=participants_name]').val() == '') {
                                           $('button[type=submit]').attr('disabled', true);
                                       } else {
                                           $('button[type=submit]').attr('disabled', false);
                                       }
                                   })
                                   $('button[type=submit]').attr('disabled', true);
                               }
                           }
                           if (data.success) {
                               $('#success_message').html(data.success);
                               setTimeout(function() {
                                   location.reload(true);
                               }, 3000);
                               var timeleft = 5;
                               var downloadTimer = setInterval(function() {
                                   if (timeleft <= 0) {
                                       clearInterval(downloadTimer);
                                       document.getElementById("countdown").innerHTML = "Finished";
                                   } else {
                                       document.getElementById("countdown").innerHTML = "Form ini akan tutup dalam " + timeleft + " detik...";
                                   }
                                   timeleft -= 1;
                               }, 1000);
                               $('#btnSave').attr('disabled', true);
                           }
                       }
                   });
                   return false;
               });
               $('#batal, .close').click(function() {
                   location.reload();
               });
           </script>
           </body>

           </html>