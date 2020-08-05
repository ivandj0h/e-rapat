<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  <title><?= $title; ?></title>

  <!-- Bootstrap core CSS -->
  <link href="<?= base_url('assets/'); ?>css/bootstrap-4.5.min.css" rel="stylesheet" type="text/css">

  <!-- Favicons -->
  <link rel="shortcut icon" href="<?= base_url('assets/'); ?>img/calendar.svg">

  <!-- Calendar Plugin -->
  <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/'); ?>vendor/fullcalendar/fullcalendar.css">
  <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/'); ?>vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

  <!-- Custom fonts for this template-->
  <link href="<?= base_url('assets/'); ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="<?= base_url('assets/'); ?>css/front-customs.css" rel="stylesheet">
</head>

<body>
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow fixed-top">
    <h5 class="my-0 mr-md-auto font-weight-normal"><i class="fas fa-calendar-alt"></i> <?= $title; ?></h5>
    <nav class="my-2 my-md-0 mr-md-3">
      <a class="p-2 text-dark" href="<?= base_url('home') ?>">Home</a>
      <a class="p-2 text-dark" href="<?= base_url('about') ?>">About</a>
      <a class="p-2 text-dark" href="<?= base_url('calendar') ?>">Calendar</a>
    </nav>
    <a class="btn btn-primary" href="<?= base_url('auth') ?>">Login</a>
  </div>

  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

    <!-- Start of flash messages -->
    <?= $this->session->flashdata('messages'); ?>
    <!-- End of flash messages -->

  </div>

  <div class="container">
    <div id="calendarIO"></div>
  </div>

  <!-- <footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
      <div class="col-12 col-md">
        <small class="d-block mb-3 text-muted">Copyright &copy; e-rapat <?= date('Y'); ?></small>
      </div>
      <div class="col-6 col-md">
        <h5>Features</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Cool stuff</a></li>
          <li><a class="text-muted" href="#">Random feature</a></li>
          <li><a class="text-muted" href="#">Team feature</a></li>
          <li><a class="text-muted" href="#">Stuff for developers</a></li>
          <li><a class="text-muted" href="#">Another one</a></li>
          <li><a class="text-muted" href="#">Last time</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>Resources</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Resource</a></li>
          <li><a class="text-muted" href="#">Resource name</a></li>
          <li><a class="text-muted" href="#">Another resource</a></li>
          <li><a class="text-muted" href="#">Final resource</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>About</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Team</a></li>
          <li><a class="text-muted" href="#">Locations</a></li>
          <li><a class="text-muted" href="#">Privacy</a></li>
          <li><a class="text-muted" href="#">Terms</a></li>
        </ul>
      </div>
    </div>
  </footer> -->


  <!-- Bootstrap core JavaScript-->
  <script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
  <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Calendar Plugin -->
  <script type="text/javascript" src="<?= base_url('assets/'); ?>js/moment.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url() . 'assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js'; ?>"></script>
  <script type="text/javascript" src="<?php echo base_url() . 'assets/vendor/fullcalendar/fullcalendar.js'; ?>"></script>

  <!-- Customs scripts -->
  <script src="<?= base_url('assets/'); ?>js/customsjs/customsjs-demo.js"></script>
  <script type="text/javascript">
    var get_data = '<?php echo $get_data; ?>';
    var backend_url = '<?php echo base_url(); ?>';

    $(document).ready(function() {
      $('.date-picker').datepicker();
      $('#calendarIO').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,basicWeek,basicDay'
        },
        defaultDate: moment().format('YYYY-MM-DD'),
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        selectable: true,
        selectHelper: true,
        select: function(start, end) {
          $('#create_modal input[name=start_date]').val(moment(start).format('YYYY-MM-DD'));
          $('#create_modal input[name=end_date]').val(moment(end).format('YYYY-MM-DD'));
          $('#create_modal').modal('show');
          save();
          $('#calendarIO').fullCalendar('unselect');
        },
        eventDrop: function(event, delta, revertFunc) { // si changement de position
          editDropResize(event);
        },
        eventResize: function(event, dayDelta, minuteDelta, revertFunc) { // si changement de longueur
          editDropResize(event);
        },
        eventClick: function(event, element) {
          deteil(event);
          editData(event);
          deleteData(event);
        },
        events: JSON.parse(get_data)
      });
    });

    $(document).on('click', '.add_calendar', function() {
      $('#create_modal input[name=calendar_id]').val(0);
      $('#create_modal').modal('show');
    })

    $(document).on('submit', '#form_create', function() {

      var element = $(this);
      var eventData;
      $.ajax({
        url: backend_url + 'calendar/save',
        type: element.attr('method'),
        data: element.serialize(),
        dataType: 'JSON',
        beforeSend: function() {
          element.find('button[type=submit]').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i>');
        },
        success: function(data) {
          if (data.status) {
            eventData = {
              id: data.id,
              title: $('#create_modal input[name=title]').val(),
              description: $('#create_modal textarea[name=description]').val(),
              start: moment($('#create_modal input[name=start_date]').val()).format('YYYY-MM-DD HH:mm:ss'),
              end: moment($('#create_modal input[name=end_date]').val()).format('YYYY-MM-DD HH:mm:ss'),
              color: $('#create_modal select[name=color]').val()
            };
            $('#calendarIO').fullCalendar('renderEvent', eventData, true); // stick? = true
            $('#create_modal').modal('hide');
            element[0].reset();
            $('.notification').removeClass('alert-danger').addClass('alert-primary').find('p').html(data.notif);
          } else {
            element.find('.alert').css('display', 'block');
            element.find('.alert').html(data.notif);
          }
          element.find('button[type=submit]').html('Submit');
        },
        error: function(jqXHR, textStatus, errorThrown) {
          element.find('button[type=submit]').html('Submit');
          element.find('.alert').css('display', 'block');
          element.find('.alert').html('Wrong server, please save again');
        }
      });
      return false;
    })

    function editDropResize(event) {
      start = event.start.format('YYYY-MM-DD HH:mm:ss');
      if (event.end) {
        end = event.end.format('YYYY-MM-DD HH:mm:ss');
      } else {
        end = start;
      }

      $.ajax({
        url: backend_url + 'calendar/save',
        type: 'POST',
        data: 'calendar_id=' + event.id + '&title=' + event.title + '&start_date=' + start + '&end_date=' + end,
        dataType: 'JSON',
        beforeSend: function() {},
        success: function(data) {
          if (data.status) {
            $('.notification').removeClass('alert-danger').addClass('alert-primary').find('p').html('Data success update');
          } else {
            $('.notification').removeClass('alert-primary').addClass('alert-danger').find('p').html('Data cant update');
          }

        },
        error: function(jqXHR, textStatus, errorThrown) {
          $('.notification').removeClass('alert-primary').addClass('alert-danger').find('p').html('Wrong server, please save again');
        }
      });
    }

    function save() {
      $('#form_create').submit(function() {
        var element = $(this);
        var eventData;
        $.ajax({
          url: backend_url + 'calendar/save',
          type: element.attr('method'),
          data: element.serialize(),
          dataType: 'JSON',
          beforeSend: function() {
            element.find('button[type=submit]').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i>');
          },
          success: function(data) {
            if (data.status) {
              eventData = {
                id: data.id,
                title: $('#create_modal input[name=title]').val(),
                description: $('#create_modal textarea[name=description]').val(),
                start: moment($('#create_modal input[name=start_date]').val()).format('YYYY-MM-DD HH:mm:ss'),
                end: moment($('#create_modal input[name=end_date]').val()).format('YYYY-MM-DD HH:mm:ss'),
                color: $('#create_modal select[name=color]').val()
              };
              $('#calendarIO').fullCalendar('renderEvent', eventData, true); // stick? = true
              $('#create_modal').modal('hide');
              element[0].reset();
              $('.notification').removeClass('alert-danger').addClass('alert-primary').find('p').html(data.notif);
            } else {
              element.find('.alert').css('display', 'block');
              element.find('.alert').html(data.notif);
            }
            element.find('button[type=submit]').html('Submit');
          },
          error: function(jqXHR, textStatus, errorThrown) {
            element.find('button[type=submit]').html('Submit');
            element.find('.alert').css('display', 'block');
            element.find('.alert').html('Wrong server, please save again');
          }
        });
        return false;
      })
    }

    function deteil(event) {
      $('#create_modal input[name=calendar_id]').val(event.id);
      $('#create_modal input[name=start_date]').val(moment(event.start).format('YYYY-MM-DD'));
      $('#create_modal input[name=end_date]').val(moment(event.end).format('YYYY-MM-DD'));
      $('#create_modal input[name=title]').val(event.title);
      $('#create_modal input[name=description]').val(event.description);
      $('#create_modal select[name=color]').val(event.color);
      $('#create_modal .delete_calendar').show();
      $('#create_modal').modal('show');
    }

    function editData(event) {
      $('#form_create').submit(function() {
        var element = $(this);
        var eventData;
        $.ajax({
          url: backend_url + 'calendar/save',
          type: element.attr('method'),
          data: element.serialize(),
          dataType: 'JSON',
          beforeSend: function() {
            element.find('button[type=submit]').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i>');
          },
          success: function(data) {
            if (data.status) {
              event.title = $('#create_modal input[name=title]').val();
              event.description = $('#create_modal textarea[name=description]').val();
              event.start = moment($('#create_modal input[name=start_date]').val()).format('YYYY-MM-DD HH:mm:ss');
              event.end = moment($('#create_modal input[name=end_date]').val()).format('YYYY-MM-DD HH:mm:ss');
              event.color = $('#create_modal select[name=color]').val();
              $('#calendarIO').fullCalendar('updateEvent', event);

              $('#create_modal').modal('hide');
              element[0].reset();
              $('#create_modal input[name=calendar_id]').val(0)
              $('.notification').removeClass('alert-danger').addClass('alert-primary').find('p').html(data.notif);
            } else {
              element.find('.alert').css('display', 'block');
              element.find('.alert').html(data.notif);
            }
            element.find('button[type=submit]').html('Submit');
          },
          error: function(jqXHR, textStatus, errorThrown) {
            element.find('button[type=submit]').html('Submit');
            element.find('.alert').css('display', 'block');
            element.find('.alert').html('Wrong server, please save again');
          }
        });
        return false;
      })
    }

    function deleteData(event) {
      $('#create_modal .delete_calendar').click(function() {
        $.ajax({
          url: backend_url + 'calendar/delete',
          type: 'POST',
          data: 'id=' + event.id,
          dataType: 'JSON',
          beforeSend: function() {},
          success: function(data) {
            if (data.status) {
              $('#calendarIO').fullCalendar('removeEvents', event._id);
              $('#create_modal').modal('hide');
              $('#form_create')[0].reset();
              $('#create_modal input[name=calendar_id]').val(0)
              $('.notification').removeClass('alert-danger').addClass('alert-primary').find('p').html(data.notif);
            } else {
              $('#form_create').find('.alert').css('display', 'block');
              $('#form_create').find('.alert').html(data.notif);
            }
          },
          error: function(jqXHR, textStatus, errorThrown) {
            $('#form_create').find('.alert').css('display', 'block');
            $('#form_create').find('.alert').html('Wrong server, please save again');
          }
        });
      })
    }
  </script>
</body>

</html>