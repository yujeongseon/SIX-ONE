
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
    eventLimit: 3,
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
        	  
        	  response.forEach(el=>{
        		  switch(el['exercisePartials']){
        		  	case '상체':
        		  		el.backgroundColor = '#d92027';
        		  		break;
        		  	case '하체':
        		  		el.backgroundColor = '#ff9234';
        		  		break;
					case '전신':
						el.backgroundColor = '#ffcd3c';
						break;
					case '유산소':
						el.backgroundColor = '#35d0ba';
						break;
					default:
						el.backgroundColor = '#10375c';
        		  }
        	  })
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
		$.ajax({
			type : "get",
			url : "/sixone/schedule.update",
			data : {
				"playNo" : eventDropInfo.event.id,
				"start" : start
			},
			success : function(response) {
				if (response == 1) {
					alert('일정이 변경되었습니다');
				}
			}
		});
    	
    },
    // 이벤트 가져올때
    eventReceive:function(info){
    	//여기서 루틴 ajax 요청
        info.event.setEnd(moment(info.event.start).add(7,'days').format('YYYY-MM-DD'));
    	console.log(info.event);
    	$.ajax({
            type: "get",
            url: "/sixone/scheduleRoutine.read",
            data: {
            	"routine":"routine"
            },
            success: function (response) {
            	
            	var jsonObj = JSON.parse(response);
            	console.log(jsonObj);
            	
            	for (var i in jsonObj){
            		console.log(jsonObj[i])
            		jsonObj[i].start = '2020-06-06';
            	}
            	
            	var jsonStr = JSON.stringify(jsonObj);

            	
            	
            	info.event = jsonStr;
            	
            	
            	
            	
            	console.log(info.event)
            }
          });
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
    	// 루틴이면 일정 변경 가능
    	if(eventResizeInfo.event.extendedProps.routineNo != null){
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
    	else{
			// 운동은 일정 변경 불가능
	    	alert('일정을 변경할 수 없습니다');
	    	eventResizeInfo.revert()
    	}
    	
    }
    
    
  });
  calendar.render();

