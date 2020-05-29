﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    background: #ccc;
    text-align: left;
  } 

  #external-events h4 {
    font-size: 30px;
    margin-top: 0;
    padding-top: 1em;
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
 	font-size:23px;
 	color:white;
 }
 .btn-primary{
 	background-color:#69caf7;
 	border:#69caf7;
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
			
				<div class="col-md-12">
					<div>
						<div id='external-events' >
							<h4>내가 구독한 운동</h4>
							<div id='external-events-list' >
								<div class='fc-event'>여름을 위한 팔운동 루틴</div>
								<div class='fc-event'>초콜릿 복근을 위한 복근운동</div>
								<div class='fc-event'>내가 구독한 운동</div>
								<div class='fc-event'>내가 구독한 운동</div>
								<div class='fc-event'>내가 구독한 운동</div>
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
                          <input class="form-control" type="text" name="edit-title" id="edit-title" required="required" />
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="edit-start">시작</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="edit-start" id="edit-start" />
                        </div>
                    </div>
                    <div class="form-group">
                      
                        <label class="col-sm-2 control-label" for="edit-end">끝</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="edit-end" id="edit-end" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        
                            <label class="col-sm-2 control-label" for="edit-color">운동종류</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="color" id="edit-color">
                                <option value="#D25565" style="color:#D25565;">상체</option>
                                <option value="#9775fa" style="color:#9775fa;">하체</option>
                                <option value="#ffa94d" style="color:#ffa94d;">전신</option>
                                <option value="#74c0fc" style="color:#74c0fc;">유산소</option>
                                <option value="#a9e34b" style="color:#a9e34b;">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        
                            <label class="col-sm-2 control-label" for="edit-desc">설명</label>
                        <div class="col-sm-10">
                            <textarea rows="4" cols="50" class="form-control" name="edit-desc"
                                id="edit-desc"></textarea>
                        </div>
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
	
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal2">
      <div class="modal-dialog" role="document" style="width:70%">
          <div class="modal-content" >
              
              <div class="modal-body">
                  <div class="row">
					<div class="schedule text-left animate-box">
						<div class="col-md-12 ">
						<span style="font-size:30px;" id="infoTitle">sssssssss</span>
							<div class="routine" >
								<div class="col-md-1 week">
									<div>월요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-arm"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>화요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>수요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>목요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>금요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>토요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>일요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
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
	$('.fc-event').on('mouseover',function(){
		var title = $(this).html();
		var callFunction = function(){
			
			$('#infoTitle').html(title);
			
			$('#eventModal2').modal('show');
			
		};
		timer = setTimeout(callFunction, 1000);
	  });
	  
	  
	$('.fc-event').on('mouseleave',function(){
	     clearTimeout(timer);
	     //$('#eventModal2').modal('hide');
	      
    });
	
	$('#eventModal2').on('click',function(){
		$(this).modal('hide');
		
	});
	
	
	
	</script>
	
	
</html>

