<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<link href='<c:url value="/resources/calendar/core_main.css"/>' rel='stylesheet' />
	<link href='<c:url value="/resources/calendar/daygrid_main.css"/>' rel='stylesheet' />
	<link href='<c:url value="/resources/calendar/list_main.css"/>' rel='stylesheet' />
	<!--추가한것-->
	<link href='<c:url value="/resources/calendar/bootstrap_datetimepicker.min.css"/>' rel='stylesheet'/>
	
	<style>
   #external-events {
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #1a252f;
    text-align: left;
  } 

  #external-events h4 {
    font-size: 30px;
    margin-top: 0;
    padding-top: 1em;
    color: white;
  }

  #external-events .fc-event {
    margin: 10px 0;
    background-color: white;
    border: 1px solid white;
    cursor: pointer;
    color: black;
    height: 40px;
    line-height:40px;
  }
  
  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: red;
  }

 #calendar{
 margin-top:30px;
 
 }
 #header-toolbar{
  background-color:red;
 }
  
 #calendar.today{
   background: #DF691A;
 }
 .fc-content{
 	font-size:15px;
 	color:white;
 	padding: 5px;
 }
 .fc-body .fc-event{
 	border : none; 
 	border-radius: 0;
 }
 .fc-day-grid-event{
 	margin: 0;
 	margin-top: 1px;
 }
 .btn-primary{
 	background-color:#69caf7;
 	border:#69caf7;
 }
  .error{
  	color: red;
  
  }
 tr:first-child > td > .fc-day-grid-event {
    margin-top: 0px;
}
  
 #uesKcal {
	text-align: left;
	color: red;
 
 }
  
 .entry-forth .icon img{
 	width:90px;
 }
 
  @media screen and (max-width: 900px) {
  
 	.week > div > div{
 		display: block;	
 	}
  
 }
 
  
}
  
  
  
  

</style>
	<aside id="colorlib-hero">
		<div class="flexslider">
			<ul class="slides">
				<li style="background-image: url(resources/images/img_bg_5.png);">
					<div class="overlay"></div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
								<div class="slider-text-inner text-center">
									<h1>스케쥴</h1>
									<h2><span><a href="<c:url value='/'/>">Home</a> | <a href="#Exercise" class="scroll" style="color:white">바로가기</a></span></h2>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</aside>

	<div class="colorlib-classes">
		<div class="container">
			<div class="row">
				<!-- 내가 구독한 운동 -->
				<div class="col-md-12">
					<div>
						<div id='external-events' >
							<h4>내가 구독한 운동</h4>
							<div id='external-events-list' >
								<c:forEach items="${subList }" var="item">
									<div class='fc-event'>${item.routineName }
									<input type="hidden" value="${item.routineNo }"/>
									<input type="hidden" value="${item.subscribeNo }"/>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col-md-12">
					<div id='wrap'>				
						<div id='calendar'></div>
					</div>
				</div>
				
			</div>
		</div>	
	</div>
	
	<!-- 달력 클릭시 나오는 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                          aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body">
                  <div class="form-horizontal">

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="edit-title">운동명</label>
                      <div class="col-sm-10">
                          <!-- <input class="form-control" type="text" name="edit-title" id="edit-title" required="required" /> -->
                          <select class="form-control" name="edit-title" id="edit-title" required="required">
                          	<option value="" >운동을 선택하세요</option>
                          	<c:forEach items="${exerciseList}" var="item">
                                <option value="${item.exerciseName}" >${item.exerciseName}</option>
                                
                           	</c:forEach>
                           	<option value="add" >운동 추가하기</option>
                          </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="edit-count">운동횟수</label>
                      <div class="col-sm-4">
                          <input class="form-control" type="text" name="edit-count" id="edit-count" />
                      </div>
                      <label class="col-sm-2 control-label" for="edit-setcount">세트수</label>
                      <div class="col-sm-4">
                          <input class="form-control" type="text" name="edit-setcount" id="edit-setcount" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="edit-start">날짜</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="edit-start" id="edit-start" />
                        </div>
                    </div>
                    
                   
                   <div class="form-group">
                        
                         <label id="uesKcal" class="col-sm-12 control-label" >사용한 칼로리 900kcal</label>
                    </div>
                   
                </div>
              <div class="modal-footer modalBtnContainer-addEvent">
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary" id="save-event">저장</button>
              </div>
              <div class="modal-footer modalBtnContainer-modifyEvent">
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                  <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
              </div>
            </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
	<div id="colorlib-subscribe" class="subs-img" style="background-image: url(resources/images/img_bg_1.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
					<h2>구현 예정</h2>
					<p>구현할꺼 생각중</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6 col-md-offset-3">
					<div class="row">
						<div class="col-md-12">
						<form class="form-inline qbstp-header-subscribe">
							<div class="col-three-forth">
								<div class="form-group">
									<input type="text" class="form-control" id="email" placeholder="Enter your email">
								</div>
							</div>
							<div class="col-one-third">
								<div class="form-group">
									<button type="submit" class="btn btn-primary">Subscribe Now</button>
								</div>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 구독한 루틴 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal2">
      <div class="modal-dialog" role="document" style="width:70%">
          <div class="modal-content" >
              
              <div class="modal-body">
                  <div class="row">
					<div class="schedule text-left animate-box">
						<div class="col-md-12 ">
						<span style="font-size:30px;" id="infoTitle"></span>
						<button class="btn" id="cancel_btn" style="float: right;"onclick="javascript:cancelSubscribe()">구독취소</button>
						<button class="btn" id="delete_btn" style="float: right; display: none;"onclick="javascript:deleteSubscribe()">삭제</button>
						<input type="hidden" />	
							<div class="routine" >
								<div class="col-md-1 week">
									<div class="routine-header">1일차</div>
									<div id="routine-1day">
										
									</div>	
								</div>
			
								<div class="col-md-1 week">
									<div class="routine-header">2일차</div>
									<div id="routine-2day">
										
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div class="routine-header">3일차</div>
									<div id="routine-3day">
										
									</div>	
								</div>
			
								<div class="col-md-1 week">
									<div class="routine-header">4일차</div>
									<div id="routine-4day">
										
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div class="routine-header">5일차</div>
									<div id="routine-5day">
										
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div class="routine-header">6일차</div>
									<div id="routine-6day">
										
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div class="routine-header">7일차</div>
									<div id="routine-7day">
										
									</div>	
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
	
	<!-- 운동 추가하는 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="exerciseModal">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                          aria-hidden="true">&times;</span></button>
                  <h4 class="exemodal-title">운동추가</h4>
              </div>
              <div class="modal-body">
                  <div class="form-horizontal">

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="exe-name">운동명</label>
                      <div class="col-sm-10">
                          <input class="form-control" type="text" name="exe-name" id="exe-name" />
                          <span class="error" id="exe-name-error"></span>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="exe-part">운동부위</label>
                      <div class="col-sm-10">
                          <select class="form-control" id="exe-part">
                            <option value="" style="color: black">운동부위를 선택하세요</option>
                          	<option value="상체" style="color: #d92027">상체</option>
                          	<option value="하체" style="color: #ff9234">하체</option>
                          	<option value="전신" style="color: #ffcd3c">전신</option>
                          	<option value="유산소" style="color: #35d0ba">유산소</option>
                          	<option value="기타" style="color: #10375c">기타</option>
                          </select>
                          <span class="error" id="exe-part-error"></span>
                      </div>
                    </div>

                </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-danger" id="delete-exe">삭제</button>
                  <button type="button" class="btn btn-primary" id="save-exe">저장</button>
              </div>
            </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
	
	
	
	<script src='<c:url value="/resources/calendar/core_main.js"/>'></script>
	<script src='<c:url value="/resources/calendar/interaction_main.js"/>'></script>
	<script src='<c:url value="/resources/calendar/daygrid_main.js"/>'></script>
	<script src='<c:url value="/resources/calendar/list_main.js"/>'></script>
	
	<!--추가한것-->
	<script src="<c:url value="/resources/calendar/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/calendar/bootstrap_datetimepicker.min.js"/>"></script>
	
	
	
	<script src="<c:url value="/resources/calendar/addEvent.js"/>"></script>
	<script src="<c:url value="/resources/calendar/editEvent.js"/>"></script>
	<script src="<c:url value="/resources/calendar/etcSetting.js"/>"></script>
	<script src="<c:url value="/resources/calendar/main.js"/>"></script>
	
	<script>
	var timer;
	$('.fc-event').on('mouseover',function(){
		var title = $(this).html();
		var routineNo = $(this).children().first().val();
		var subscribeNo = $(this).children().eq(1).val();
		var callFunction = function(){
		
			//값 초기화
			$('#routine-1day').html('');
			$('#routine-2day').html('');
			$('#routine-3day').html('');
			$('#routine-4day').html('');
			$('#routine-5day').html('');
			$('#routine-6day').html('');
			$('#routine-7day').html('');
			
			$('#cancel_btn').val(subscribeNo);
			
			// 마우스 오버시
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
		        		
		        	});
		        	
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
				
			
			
			$('#infoTitle').html(title);
			$('#cancel_btn').show();
			$('#delete_btn').hide();
			
			$('#eventModal2').modal('show');
			
		};
		timer = setTimeout(callFunction, 1000);
	  });
	  
	  
	$('.fc-event').on('mouseleave',function(){
	     clearTimeout(timer);
	     //$('#eventModal2').modal('hide');
	      
    });
	
	$('#eventModal2').on('click',function(){
		//$(this).modal('hide');
		
	});
	$(window).scroll(function(){
		clearTimeout(timer);
	});
	
	$("#edit-title").change(function(){
		if($(this).val() == 'add'){
			$('#exerciseModal').modal('show');
			$(this).val("").prop("selected", true);
		}
	});
	
	// 운동 등록
	$("#save-exe").click(function(){
		var exerciseName = $('#exe-name').val();
		var exercisePartials = $('#exe-part option:selected').val();
		
		
		if(exerciseName == ''){
			$('#exe-name-error').html('운동명을 입력하세요');
			return;
		}
		else{
			$('#exe-name-error').html('');
		}
		
		if(exercisePartials == ''){
			$('#exe-part-error').html('운동 부위를 선택하세요');
			return;
		}
		else{
			$('#exe-part-error').html('');
		}
		
		var exerciseMotions = '';
		if(exercisePartials == '상체'){
			exerciseMotions = "<c:url value='/resources/images/up_exercise.png'/>"
		}
		else if(exercisePartials == '하체'){
			exerciseMotions = "<c:url value='/resources/images/low_exercise.png'/>"
		}
		else if(exercisePartials == '전신'){
			exerciseMotions = "<c:url value='/resources/images/whole_exercise.png'/>"
		}
		else if(exercisePartials == '유산소'){
			exerciseMotions = "<c:url value='/resources/images/aerobic_exercise.png'/>"
		}
		else{
			exerciseMotions = "<c:url value='/resources/images/etc_exercise.png'/>"
		}
		
		
		$.ajax({
	          type: "get",
	          url: "/sixone/exercise.insert",
	          data: {
	            "exerciseName":exerciseName,"exercisePartials":exercisePartials,"exerciseMotions":exerciseMotions
	          },
	          success: function (response) {
        	  	if(response == 1){
        	  		$('#exerciseModal').modal('hide');
          			alert('새로운 운동이 등록되었습니다');
          			$.ajax({
          		        type: "get",
          		        url: "/sixone/exercise.read",
          		        data: {
          		          
          		        },
          		        dataType:'json',
          		        success: addOption_,
          		        error:function(request,error){
          						console.log('상태코드:',request.status);
          						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
          						console.log('에러:',error);
          					
          					}
          		      });
	          	}
	          },
	          error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
					console.log('에러:',error);
				
				}
	        });
		
	
	});
	
	$.ajax({
        type: "get",
        url: "/sixone/exercise.read",
        data: {
          
        },
        dataType:'json',
        success: addOption_,
        error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
				console.log('에러:',error);
			
			}
      });
	
	// 운동 모달
	function addOption_(exerciseList) {
    	var htmlString = '<option value="" >운동을 선택하세요</option>';
    	$.each(exerciseList,function(index,element){
    		htmlString	+= '<option value="'+element.exerciseName+'" >'+element.exerciseName+'</option>';
    	});
   		htmlString += '<option value="add" >운동 추가하기</option>';
    	$('#edit-title').html(htmlString)
	  		
    }
	
	// 구독취소
	function cancelSubscribe(){
		subscribeNo = $('#cancel_btn').val();
		console.log(subscribeNo);
		if(confirm('달력에 추가된 루틴도 모두 지워집니다\r\n정말로 취소하시겠습니까?')){
			
			$.ajax({
		        type: "get",
		        url: "/sixone/subscribe.cancel",
		        data: {
		        	'subscribeNo':subscribeNo
		        },
		        success: function (response) {
		            alert('구독이 취소되었습니다');
		            location.replace("<c:url value='/schedule.do'/>");
		        },
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
					
					}
		      });
			
		}
		
		
	}
	
	// 구독삭제
	function deleteSubscribe(){
		subCalendarNo = $('#delete_btn').val()
		
		if(confirm('이 루틴을 달력에서 제거하시겠습니까?')){
			
			$.ajax({
		        type: "get",
		        url: "/sixone/schedule.deleteRoutine",
		        data: {
		        	'subCalendarNo':subCalendarNo
		        },
		        success: function (response) {
		            alert('삭제되었습니다');
		            calendar.refetchEvents();
		            $('#eventModal2').modal('hide');
		        },
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
					
					}
		      });
			
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
	
</html>

