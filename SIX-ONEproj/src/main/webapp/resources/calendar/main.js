
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
    eventDurationEditable: false,
    contentHeight:"auto",
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
					case '기타':
						el.backgroundColor = '#10375c';
						break;
					default:
						el.backgroundColor = '#337ab7';
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
    	
    	if(info.event.extendedProps.routineNo == null){ //추가한 운동이면
    		editEvent(info.event,calendar);
    	}
    	else{ //추가한 루틴이면
    		//모달창 초기화
    		$('#routine-1day').html('');
			$('#routine-2day').html('');
			$('#routine-3day').html('');
			$('#routine-4day').html('');
			$('#routine-5day').html('');
			$('#routine-6day').html('');
			$('#routine-7day').html('');
			
			//구독번호 받기
			var subCalendarNo = info.event.extendedProps.subCalendarNo;
			$('#delete_btn').val(subCalendarNo);
			
			//루틴번호 받기
			var routineNo = info.event.extendedProps.routineNo;
			console.log(info.event.extendedProps);
			//ajax 로 루틴 받기
			$.ajax({
		        type: "get",
		        url: "/sixone/routine.read",
		        data: {
		        	'routineNo':routineNo
		        },
		        dataType:'json',
		        success: function(response){
		        	response.forEach(el => {
		        		
		        		var query = '<div class="entry-forth">';
			        	query += '<p class="icon"><span><img src="'+el.exerciseMotions+'"></img></span></p>';
			        	query += '<p class="time"><span>'+el.goalCount+'회/'+el.goalSet+'세트</span></p>';
			        	query += '<p class="trainer"><span>'+el.exerciseName+'</span></p>';
			        	query += '</div>';
		        		switch(el['routineDays']){
		        			case '1':
		        				$('#routine-1day').html($('#routine-1day').html()+query);
		        				break;
		        			case '2':
		        				$('#routine-2day').html($('#routine-2day').html()+query);
		        				break;
		        			case '3':
		        				$('#routine-3day').html($('#routine-3day').html()+query);
		        				break;
		        			case '4':
		        				$('#routine-4day').html($('#routine-4day').html()+query);
		        				break;
		        			case '5':
		        				$('#routine-5day').html($('#routine-5day').html()+query);
		        				break;
		        			case '6':
		        				$('#routine-6day').html($('#routine-6day').html()+query);
		        				break;
		        			case '7':
		        				$('#routine-7day').html($('#routine-7day').html()+query);
		        				break;
		        		
		        		}
		        		
		        	})
		        	
		        	/* var query = '<div class="entry-forth">';
		        	query += '<p class="icon"><span><i class="flaticon-arm"></i></span></p>';
		        	query += '<p class="time"><span>'+response[0].goalCount+'회/'+response[0].goalSet+'세트</span></p>';
		        	query += '<p class="trainer"><span>'+response[0].exerciseName+'</span></p>';
		        	query += '</div>'; */
						
		        	
		        },
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
				}
	      	});
			
			$('#infoTitle').html(info.event.title);
			$('#cancel_btn').hide();
			$('#delete_btn').show();
			$('#eventModal2').modal('show');
    		
    		
    	}

    },
    // 이벤트 드랍시
    eventDrop: function(eventDropInfo){
		var start = moment(eventDropInfo.event.start).format('YYYY-MM-DD');
		var routineNo = eventDropInfo.event.extendedProps.routineNo;
		var subCalendarNo = eventDropInfo.event.extendedProps.subCalendarNo;
		if(routineNo == null){ // 운동이면
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
		}
		else{ // 루틴이면
			$.ajax({
				type : "get",
				url : "/sixone/schedule.updateRoutine",
				data : {
					"subCalendarNo" : subCalendarNo,
					"start" : start
				},
				success : function(response) {
					if (response == 1) {
						alert('일정이 변경되었습니다');
					}
				}
			});
			
		}
		
    	
    },
    // 이벤트 가져올때 루틴 사이즈 늘려주는곳
    eventReceive:function(info){
        //info.event.setEnd(moment(info.event.start).add(7,'days').format('YYYY-MM-DD'));
    	//중복 이벤트 지우기
    	info.event.remove();
    	
    },
    // 드랍시 실제로 루틴 저장
    drop: function(dropInfo){
    	var start = dropInfo.dateStr
    	var subscribeNo = dropInfo.draggedEl.children[1].value
      $.ajax({
        type: "get",
        url: "/sixone/schedule.insertRoutine",
        data: {
          'subscribeNo':subscribeNo,
          'start':start
        },
        success: function (response) {
        	calendar.refetchEvents();
        	alert('루틴이 추가되었습니다');
          
          
        }
      });
    },
    // 이벤트 리사이즈
//    eventResize: function(eventResizeInfo){
//    	var start = moment(eventResizeInfo.event.start).format('YYYY-MM-DD');
//    	var end = moment(eventResizeInfo.event.end-1).format('YYYY-MM-DD');
//    	// 루틴이면 일정 변경 가능
//    	if(eventResizeInfo.event.extendedProps.routineNo != null){
//	      $.ajax({
//	        type: "get",
//	        url: "/sixone/schedule.update",
//	        data: {
//	          "calendarNo":calendarNo,"start":start,"end":end
//	        },
//	        success: function (response) {
//	        	if(response == 1){
//	        		alert('일정이 변경되었습니다');
//	        	}
//	        }
//	      });
//    	}
//    	else{
//			// 운동은 일정 변경 불가능
//	    	alert('일정을 변경할 수 없습니다');
//	    	eventResizeInfo.revert()
//    	}
//    	
//    }
    
    
  });
  calendar.render();

