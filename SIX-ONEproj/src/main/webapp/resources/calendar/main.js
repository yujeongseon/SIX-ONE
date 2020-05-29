
  var Calendar = FullCalendar.Calendar;
  var Draggable = FullCalendarInteraction.Draggable

  /* initialize the external events
  -----------------------------------------------------------------*/

  var containerEl = document.getElementById('external-events-list');
  new Draggable(containerEl, {
    itemSelector: '.fc-event',
    eventData: function(eventEl) {
      return {
        title: eventEl.innerText.trim()
      }
    }
  });

  //// the individual way to do it
  // var containerEl = document.getElementById('external-events-list');
  // var eventEls = Array.prototype.slice.call(
  //   containerEl.querySelectorAll('.fc-event')
  // );
  // eventEls.forEach(function(eventEl) {
  //   new Draggable(eventEl, {
  //     eventData: {
  //       title: eventEl.innerText.trim(),
  //     }
  //   });
  // });

  /* initialize the calendar
  -----------------------------------------------------------------*/

  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [ 'interaction', 'dayGrid', 'list' ],
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    editable: true,
    droppable: true, // this allows things to be dropped onto the calendar
    selectable: true,
    allDayDefault :true,
    select: function(selectionInfo){
      
      addEvent(selectionInfo,calendar);
    },
    eventClick: function(info){

      editEvent(info.event,calendar);

    },
    eventDrop: function(eventDropInfo){
      $.ajax({
        type: "get",
        url: "",
        data: {
          //...
        },
        success: function (response) {
          alert('일정이 변경되었습니다');
        }
      });
    },
    eventReceive:function(info){
        info.event.setEnd(moment(info.event.start).add(7,'days').format('YYYY-MM-DD'));
      },
    drop: function(){
      $.ajax({
        type: "get",
        url: "",
        data: {
          //...
        },
        success: function (response) {
          alert('루틴이 추가되었습니다');
        }
      });
    },
    eventResize: function(){
      $.ajax({
        type: "get",
        url: "",
        data: {
          //...
        },
        success: function (response) {
          alert('일정이 변경되었습니다');
        }
      });

    }
    
  });
  calendar.render();

