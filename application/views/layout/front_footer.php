<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/script.js"></script> -->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/min/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script>
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      initialView: 'dayGridMonth',
      themeSystem: "bootstrap4",
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,listWeek'
      },
      eventColor: '#0062cc',
      events: [{
          "id": "1",
          "title": "administrator",
          "sub_department_id": "4",
          "sub_department_name": "Bagian Kepegawaian",
          "meeting_subtype": "Google Duo",
          "start_time": "17:00:00",
          "end_time": "18:00:00",
          "start": "2020-08-11",
          "end": "2020-08-11"
        },
        {
          "id": "2",
          "title": "administrator",
          "sub_department_id": "4",
          "sub_department_name": "Bagian Kepegawaian",
          "meeting_subtype": "Ruangan Meeting Kedua",
          "start_time": "10:00:00",
          "end_time": "11:00:00",
          "start": "2020-08-11",
          "end": "2020-08-11"
        },
        {
          "id": "3",
          "title": "Admin Keuangan",
          "sub_department_id": "2",
          "sub_department_name": "Bagian Keuangan dan Perlengkapan",
          "meeting_subtype": "Google Zoom",
          "start_time": "13:00:00",
          "end_time": "14:00:00",
          "start": "2020-08-12",
          "end": "2020-08-12"
        },
        {
          "id": "4",
          "title": "Admin Keuangan",
          "sub_department_id": "2",
          "sub_department_name": "Bagian Keuangan dan Perlengkapan",
          "meeting_subtype": "Google Zoom",
          "start_time": "15:00:00",
          "end_time": "16:00:00",
          "start": "2020-08-12",
          "end": "2020-08-12"
        },
        {
          "id": "5",
          "title": "Admin Humas",
          "sub_department_id": "5",
          "sub_department_name": "Bagian Data Humas dan Publikasi",
          "meeting_subtype": "Microsoft Skype",
          "start_time": "13:00:00",
          "end_time": "14:00:00",
          "start": "2020-08-12",
          "end": "2020-08-12"
        },
        {
          "id": "6",
          "title": "Admin Humas",
          "sub_department_id": "5",
          "sub_department_name": "Bagian Data Humas dan Publikasi",
          "meeting_subtype": "Google Zoom",
          "start_time": "16:00:00",
          "end_time": "17:00:00",
          "start": "2020-08-13",
          "end": "2020-08-13"
        },
        {
          "id": "7",
          "title": "administrator",
          "sub_department_id": "4",
          "sub_department_name": "Bagian Kepegawaian",
          "meeting_subtype": "Ruangan Meeting Kedua",
          "start_time": "14:00:00",
          "end_time": "15:00:00",
          "start": "2020-08-13",
          "end": "2020-08-14"
        }
      ],

      eventRender: function eventRender(event, element, view) {
        return ['all', event.sub_department_id].indexOf($('#subdepartment').val()) >= 0
      }
    });

    $('#subdepartment').on('change', function() {
      $('#calendar').fullCalendar('rerenderEvents');
    });
  });
</script>

</body>

</html>