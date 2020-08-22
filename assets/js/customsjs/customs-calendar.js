var newEvent;
var editEvent;

$(document).ready(function () {
  $("#calendar").fullCalendar({
    eventRender: function (event, element, view) {
      var startTimeEventInfo = moment(event.start).format("HH:mm");
      var endTimeEventInfo = moment(event.end).format("HH:mm");
      var displayEventDate;

      if (event.allDay == false) {
        displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
      } else {
        displayEventDate = "All Day";
      }

      if (event.calendar == "Online") {
        element.popover({
          title:
            '<div class="popoverTitleCalendar" style="background-color:' +
            event.backgroundColor +
            "; color:" +
            event.textColor +
            '">Media Rapat : ' +
            event.calendar +
            "</div>",
          content:
            '<div class="popoverInfoCalendar">' +
            "<p><strong>Nama Bagian :</strong> " +
            event.title +
            "</p>" +
            "<p><strong>Media Rapat :</strong> " +
            event.calendar +
            "</p>" +
            "<p><strong>Zoom ID :</strong> " +
            event.zoomid +
            "</p>" +
            "<p><strong>Nama Pembicara :</strong> " +
            event.speakers_name +
            "</p>" +
            "<p><strong>Nama Pimpinan Rapat :</strong> " +
            event.members_name +
            "</p>" +
            "<p><strong>Waktu Rapat :</strong> " +
            displayEventDate +
            "</p>" +
            '<div class="popoverDescCalendar"><strong>Agenda Rapat :</strong> ' +
            event.agenda +
            "</div>" +
            "</div>",
          delay: {
            show: "800",
            hide: "50",
          },
          trigger: "hover",
          placement: "top",
          html: true,
          container: "body",
        });
      } else {
        // console.log(event.calendar);
        element.popover({
          title:
            '<div class="popoverTitleCalendar" style="background-color:' +
            event.backgroundColor +
            "; color:" +
            event.textColor +
            '">Media Rapat : ' +
            event.calendar +
            "</div>",
          content:
            '<div class="popoverInfoCalendar">' +
            "<p><strong>Nama Bagian :</strong> " +
            event.title +
            "</p>" +
            "<p><strong>Media Rapat :</strong> " +
            event.calendar +
            "</p>" +
            "<p><strong>Tempat Rapat :</strong> " +
            event.location +
            "</p>" +
            "<p><strong>Nama Pembicara :</strong> " +
            event.speakers_name +
            "</p>" +
            "<p><strong>Nama Pimpinan Rapat :</strong> " +
            event.members_name +
            "</p>" +
            "<p><strong>Waktu Rapat :</strong> " +
            displayEventDate +
            "</p>" +
            '<div class="popoverDescCalendar"><strong>Agenda Rapat :</strong> ' +
            event.agenda +
            "</div>" +
            "</div>",
          delay: {
            show: "800",
            hide: "50",
          },
          trigger: "hover",
          placement: "top",
          html: true,
          container: "body",
        });
      }

      if (event.media == "Online") {
        element.css("background-color", "#28a745");
      }
      if (event.media == "Offline") {
        element.css("background-color", "#dc3545");
      }

      var show_media,
        show_type = true,
        show_calendar = true;

      var media = $("input:checkbox.filter:checked")
        .map(function () {
          return $(this).val();
        })
        .get();
      var types = $("#type_filter").val();
      var calendars = $("#calendar_filter").val();

      show_media = media.indexOf(event.media) >= 0;

      if (types && types.length > 0) {
        if (types[0] == "all") {
          show_type = true;
        } else {
          show_type = types.indexOf(event.type) >= 0;
        }
      }

      if (calendars && calendars.length > 0) {
        if (calendars[0] == "all") {
          show_calendar = true;
        } else {
          show_calendar = calendars.indexOf(event.calendar) >= 0;
        }
      }

      return show_media && show_type && show_calendar;
    },
    customButtons: {
      printButton: {
        icon: "print",
        click: function () {
          window.print();
        },
      },
    },
    header: {
      left: "today, prevYear, nextYear, printButton",
      center: "prev, title, next",
      right: "month,agendaWeek,agendaDay,listWeek",
    },
    views: {
      month: {
        columnFormat: "dddd",
      },
      agendaWeek: {
        columnFormat: "ddd D/M",
        eventLimit: false,
      },
      agendaDay: {
        columnFormat: "dddd",
        eventLimit: false,
      },
      listWeek: {
        columnFormat: "",
      },
    },

    loading: function (bool) {
      //alert('events are being rendered');
    },
    eventAfterAllRender: function (view) {
      if (view.name == "month") {
        $(".fc-time").hide();
        $(".fc-content").css("height", "auto");
      }
    },
    eventLimitClick: function (cellInfo, event) {},
    eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
      $(".popover.fade.top").remove();
    },
    eventDragStart: function (event, jsEvent, ui, view) {
      var draggedEventIsAllDay;
      draggedEventIsAllDay = event.allDay;
    },
    eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
      $(".popover.fade.top").remove();
    },
    unselect: function (jsEvent, view) {
      //$(".dropNewEvent").hide();
    },
    dayClick: function (startDate, jsEvent, view) {
      //var today = moment();
      //var startDate;
      //if(view.name == "month"){
      //  startDate.set({ hours: today.hours(), minute: today.minutes() });
      //  alert('Clicked on: ' + startDate.format());
      //}
    },
    select: function (startDate, endDate, jsEvent, view) {
      var today = moment();
      var startDate;
      var endDate;

      if (view.name == "month") {
        startDate.set({ hours: today.hours(), minute: today.minutes() });
        startDate = moment(startDate).format("ddd DD MMM YYYY HH:mm");
        endDate = moment(endDate).subtract("days", 1);
        endDate.set({ hours: today.hours() + 1, minute: today.minutes() });
        endDate = moment(endDate).format("ddd DD MMM YYYY HH:mm");
      } else {
        startDate = moment(startDate).format("ddd DD MMM YYYY HH:mm");
        endDate = moment(endDate).format("ddd DD MMM YYYY HH:mm");
      }

      var $contextMenu = $("#contextMenu");

      var HTMLContent =
        '<ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu" style="display:block;position:static;margin-bottom:5px;">' +
        '<li style="padding:15px; color:red"> Maaf, Anda Tidak Diperbolehkan untuk Membuat Rapat Di area ini!</li>' +
        '<li class="divider"></li>' +
        '<li><a tabindex="-1" href="#">Tutup</a></li>' +
        "</ul>";

      $(".fc-body").unbind("click");
      $(".fc-body").on("click", "td", function (e) {
        document.getElementById("contextMenu").innerHTML = HTMLContent;

        $contextMenu.addClass("contextOpened");
        $contextMenu.css({
          display: "block",
          left: e.pageX,
          top: e.pageY,
        });
        return false;
      });

      $contextMenu.on("click", "a", function (e) {
        e.preventDefault();
        $contextMenu.removeClass("contextOpened");
        $contextMenu.hide();
      });

      $("body").on("click", function () {
        $contextMenu.hide();
        $contextMenu.removeClass("contextOpened");
      });

      //newEvent(startDate, endDate);
    },
    eventClick: function (event, jsEvent, view) {
      editEvent(event);
    },
    locale: "ID",
    timezone: "local",
    nextDayThreshold: "09:00:00",
    allDaySlot: true,
    displayEventTime: true,
    displayEventEnd: true,
    firstDay: 1,
    weekNumbers: false,
    selectable: true,
    weekNumberCalculation: "ISO",
    eventLimit: true,
    eventLimitClick: "week", //popover
    navLinks: true,
    defaultDate: new Date(),
    timeFormat: "HH:mm",
    defaultTimedEventDuration: "01:00:00",
    editable: true,
    minTime: "07:00:00",
    maxTime: "18:00:00",
    slotLabelFormat: "HH:mm",
    weekends: true,
    nowIndicator: true,
    dayPopoverFormat: "dddd DD/MM",
    longPressDelay: 0,
    eventLongPressDelay: 0,
    selectLongPressDelay: 0,

    events: [
      {
        _id: 1,
        title: "Bagian Keuangan dan Perlengkapan",
        media: "Online",
        zoomid: "7177717448",
        speakers_name: "Nama Pembicara",
        members_name: "Nama Pimpinan Rapat",
        agenda: "Lorem ipsum dolor sit incid idunt ut Lorem ipsum sit.",
        sub_department_name: "Bagian Keuangan dan Perlengkapan",
        start: "2020-08-06T09:30",
        end: "2020-08-06T10:00",
        // start: "14:30",
        // start: "2020-08-06",
        // end: "15:30",
        // end: "2020-08-06",
        type: "2",
        calendar: "Online",
        className: "colorAppointment",
        username: "Administrator",
        location: "-",
        backgroundColor: "#28a745",
        textColor: "#ffffff",
        allDay: false,
      },
      {
        _id: 2,
        title: "Bidang Kepegawaian",
        media: "Offline",
        zoomid: "-",
        speakers_name: "Nama Pembicara",
        members_name: "Nama Pimpinan Rapat",
        agenda:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        sub_department_name: "Bidang Kepegawaian",
        start: "2020-08-06T14:30",
        // start: "14:30",
        // start: "2020-08-06",
        end: "2020-08-06T15:30",
        // end: "15:30",
        // end: "2020-08-06",
        type: "4",
        calendar: "Offline",
        className: "colorAppointment",
        username: "Administrator",
        location: "Ruangan Rapat Garuda",
        backgroundColor: "#dc3545",
        textColor: "#ffffff",
        allDay: false,
      },
    ],
  });

  $(".filter").on("change", function () {
    $("#calendar").fullCalendar("rerenderEvents");
  });

  $("#type_filter").select2({
    placeholder: "Filter Types",
    allowClear: true,
  });

  $("#calendar_filter").select2({
    placeholder: "Filter Calendars",
    allowClear: true,
  });

  $("#starts-at, #ends-at").datetimepicker({
    format: "ddd DD MMM YYYY HH:mm",
  });

  //var minDate = moment().subtract(0, 'days').millisecond(0).second(0).minute(0).hour(0);

  $(" #editStartDate, #editEndDate").datetimepicker({
    format: "ddd DD MMM YYYY HH:mm",
    //minDate: minDate
  });

  //CREATE NEW EVENT CALENDAR

  newEvent = function (start, end, eventType) {
    var colorEventyType;

    if (eventType == "2") {
      colorEventyType = "colorAppointment";
    } else if (eventType == "3") {
      colorEventyType = "colorCheck-in";
    } else if (eventType == "4") {
      colorEventyType = "colorCheckout";
    } else if (eventType == "5") {
      colorEventyType = "colorInventory";
    } else if (eventType == "6") {
      colorEventyType = "colorValuation";
    } else if (eventType == "7") {
      colorEventyType = "colorViewing";
    }

    $("#contextMenu").hide();
    $(".eventType").text(eventType);
    $("input#title").val("");
    $("#starts-at").val(start);
    $("#ends-at").val(end);
    $("#newEventModal").modal("show");

    var statusAllDay;
    var endDay;

    $(".allDayNewEvent").on("change", function () {
      if ($(this).is(":checked")) {
        statusAllDay = true;
        var endDay = $("#ends-at").prop("disabled", true);
      } else {
        statusAllDay = false;
        var endDay = $("#ends-at").prop("disabled", false);
      }
    });
  };

  //EDIT EVENT CALENDAR

  editEvent = function (event, element, view) {
    $(".popover.fade.top").remove();
    $(element).popover("hide");

    //$(".dropdown").hide().css("visibility", "hidden");

    if (event.allDay == true) {
      $("#editEventModal").find("#editEndDate").attr("disabled", true);
      $("#editEventModal").find("#editEndDate").val("");
      $(".allDayEdit").prop("checked", true);
    } else {
      $("#editEventModal").find("#editEndDate").attr("disabled", false);
      $("#editEventModal")
        .find("#editEndDate")
        .val(event.end.format("ddd DD MMM YYYY HH:mm"));
      $(".allDayEdit").prop("checked", false);
    }

    $(".allDayEdit").on("change", function () {
      if ($(this).is(":checked")) {
        $("#editEventModal").find("#editEndDate").attr("disabled", true);
        $("#editEventModal").find("#editEndDate").val("");
        $(".allDayEdit").prop("checked", true);
      } else {
        $("#editEventModal").find("#editEndDate").attr("disabled", false);
        $(".allDayEdit").prop("checked", false);
      }
    });

    $("#editTitle").val(event.title);
    $("#editStartDate").val(event.start.format("dd MMM YYYY HH:mm"));
    $("#edit-calendar-type").val(event.calendar);
    $("#edit-event-desc").val(event.description);
    $(".eventName").text(event.title);
    $(".eventDate").text(event.start.format("DD-MM-YYYY"));
    $(".eventHourStart").text(event.start.format("HH:mm"));
    $(".eventHourEnd").text(event.end.format("HH:mm"));
    $("#editEventModal").modal("show");
    $("#updateEvent").unbind();
    $("#updateEvent").on("click", function () {
      var statusAllDay;
      if ($(".allDayEdit").is(":checked")) {
        statusAllDay = true;
      } else {
        statusAllDay = false;
      }
      var title = $("input#editTitle").val();
      var startDate = $("input#editStartDate").val();
      var endDate = $("input#editEndDate").val();
      var calendar = $("#edit-calendar-type").val();
      var description = $("#edit-event-desc").val();
      $("#editEventModal").modal("hide");
      var eventData;
      if (title) {
        event.title = title;
        event.start = startDate;
        event.end = endDate;
        event.calendar = calendar;
        event.description = description;
        event.allDay = statusAllDay;
        $("#calendar").fullCalendar("updateEvent", event);
      } else {
        alert("Title can't be blank. Please try again.");
      }
    });

    $("#deleteEvent").on("click", function () {
      $("#deleteEvent").unbind();
      if (event._id.includes("_fc")) {
        $("#calendar").fullCalendar("removeEvents", [event._id]);
      } else {
        $("#calendar").fullCalendar("removeEvents", [event._id]);
      }
      $("#editEventModal").modal("hide");
    });
  };

  //SET DEFAULT VIEW CALENDAR

  var defaultCalendarView = $("#calendar_view").val();

  if (defaultCalendarView == "month") {
    $("#calendar").fullCalendar("changeView", "month");
  } else if (defaultCalendarView == "agendaWeek") {
    $("#calendar").fullCalendar("changeView", "agendaWeek");
  } else if (defaultCalendarView == "agendaDay") {
    $("#calendar").fullCalendar("changeView", "agendaDay");
  } else if (defaultCalendarView == "listWeek") {
    $("#calendar").fullCalendar("changeView", "listWeek");
  }

  $("#calendar_view").on("change", function () {
    var defaultCalendarView = $("#calendar_view").val();
    $("#calendar").fullCalendar("changeView", defaultCalendarView);
  });

  //SET MIN TIME AGENDA

  $("#calendar_start_time").on("change", function () {
    var minTimeAgendaView = $(this).val();
    $("#calendar").fullCalendar("option", { minTime: minTimeAgendaView });
  });

  //SET MAX TIME AGENDA

  $("#calendar_end_time").on("change", function () {
    var maxTimeAgendaView = $(this).val();
    $("#calendar").fullCalendar("option", { maxTime: maxTimeAgendaView });
  });

  //SHOW - HIDE WEEKENDS

  var activeInactiveWeekends = false;
  checkCalendarWeekends();

  $(".showHideWeekend").on("change", function () {
    checkCalendarWeekends();
  });

  function checkCalendarWeekends() {
    if ($(".showHideWeekend").is(":checked")) {
      activeInactiveWeekends = true;
      $("#calendar").fullCalendar("option", {
        weekends: activeInactiveWeekends,
      });
    } else {
      activeInactiveWeekends = false;
      $("#calendar").fullCalendar("option", {
        weekends: activeInactiveWeekends,
      });
    }
  }

  //CREATE NEW CALENDAR AND APPEND

  $("#addCustomCalendar").on("click", function () {
    var newCalendarName = $("#inputCustomCalendar").val();
    $("#calendar_filter, #calendar-type, #edit-calendar-type").append(
      $("<option>", {
        value: newCalendarName,
        text: newCalendarName,
      })
    );
    $("#inputCustomCalendar").val("");
  });
});
