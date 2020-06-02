
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
    events:function(fetchInfo, successCallback, failureCallback){
    	
        $.ajax({
          type: "get",
          url: "/sixone/schedule.read",
          data: {
            // 실제 사용시, 날짜를 전달해 일정기간 데이터만 받아오기를 권장
          },
          dataType:'json',
          success: function (response) {
        	  successCallback(response);
          },
          error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
				console.log('에러:',error);
			
			}
        });
       
      }
    
    ,
    // 선택시
    select: function(selectionInfo){
      
      addEvent(selectionInfo,calendar);
      
    },
    // 이벤트 클릭시
    eventClick: function(info){

      editEvent(info.event,calendar);

    },
    // 이벤트 드랍시
    eventDrop: function(eventDropInfo){
    	var start = moment(eventDropInfo.event.start).format('YYYY-MM-DD');
    	var end = moment(eventDropInfo.event.end-1).format('YYYY-MM-DD');
    	var calendarNo = eventDropInfo.event.extendedProps.calendarNo;
      $.ajax({
        type: "get",
        url: "/sixone/schedule.update",
        data: {
          "calendarNo":calendarNo,"start":start,"end":end
        },
        success: function (response) {
        	if(response == 1){
        		alert('일정이 변경되었습니다');
        	}
        }
      });
    },
    // 이벤트 가져올때
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
    // 이벤트 리사이즈
    eventResize: function(eventResizeInfo){
		var start = moment(eventResizeInfo.event.start).format('YYYY-MM-DD');
		var end = moment(eventResizeInfo.event.end-1).format('YYYY-MM-DD');
		var calendarNo = eventResizeInfo.event.extendedProps.calendarNo;
		$.ajax({
	        type: "get",
	        url: "/sixone/schedule.update",
	        data: {
	          "calendarNo":calendarNo,"start":start,"end":end
	        },
	        success: function (response) {
	        	if(response == 1){
	        		alert('일정이 변경되었습니다');
	        	}
	        }
	      });
    }
    
    
  });
  calendar.render();

