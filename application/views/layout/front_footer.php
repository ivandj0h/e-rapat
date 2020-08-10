  <!-- Bootstrap core JavaScript-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Customs scripts -->
  <script src="<?= base_url('assets/'); ?>js/customsjs/customsjs-demo.js"></script>

  <!-- Calendar -->
  <script src="<?= base_url('assets/'); ?>js/moment.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/google-calendar/main.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        footer: {
          left: 'prev,next today myCustomButton',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
      });
    });
  </script>
  </body>

  </html>