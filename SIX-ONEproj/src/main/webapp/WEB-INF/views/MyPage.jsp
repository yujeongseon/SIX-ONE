<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/MyPage.css'/>" > 

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/resources/js/MyPageScroll.js'/>"></script>
<script>
	//웹소켓 객체 저자용
	var wsocket;
	//닉네임 저장용
	var nickname;
	$(function() {
		//입장버튼 클릭시 서버와 연결된 웹소켓 클라이언트 생성
		$('#enterBtn').one('click',function(){
			console.log("ws://192.168.0.60:8080<c:url value='/chat-ws.do'/>");
			wsocket = new WebSocket("ws://192.168.0.60:8080<c:url value='/chat-ws.do'/>");
			//서버와 연결된 소켓에 이벤트 등록
			wsocket.onopen = open;
			wsocket.onclose = function(){
				appendmMessage("연결이 끊어졌어요");
			};
			wsocket.addEventListener('message',receiveMessage);
			
		});
		
		//퇴장버튼 클릭시
		$('#exitBtn').one('click',function(){
			wsocket.send('msg'+nickname+'가(이) 퇴장 했어요');
			wsocket.close();
		});
		
		//전송버튼 클릭시
		$('#sendBtn').click(function(){
			sendMessage();
		});
		
		//메시지 입력후 전송 버튼 클릭이 아닌 엔터키 처리]
		$('#message').on('keypress',function(e){
			
			console.log("e.keyCode:%s,e.which:%s",e.keyCode,e.which);
			var keyValue = e.keyCode ? e.keyCode : e.which;
			if(keyValue == 13) {//엔터
				sendMessage();
			}
		});
		
		
		
	});
	//함수 정의 서버에 연결되었을때 호출되는 콜백함수
	var open = function(){
		//서버로 연결한 사람의정보 전송
		//사용자가 입력한 닉네임 저장
		nickname = $('#nickname').val();
		wsocket.send('msg:'+nickname+'가(이) 입장했어요');
		appendmMessage('연결되었습니다');
	};
	//메시지를 div태그에 뿌려주기위한함수
	var appendmMessage = function(msg){
		//메시지 출력
		$('#chatMessage').append(msg+"<br/>");
		
	};
	//서버에서 메시지를 받을때마다 호출되는 함수
	var receiveMessage = function(e){
		//서버로부터 받은 데이터는 이벤트객체 data속성에 저장되어있다.
		var receiveData = e.data;
		if(receiveData.substring(0,4) == 'msg:') {
			//서버로부터 받은 메시지를 msg:부분을 제외하고 
			//div에 출력
			appendmMessage(receiveData.substring(4));
		}
	};
	//서버로 메시지 전송하는 함수
	function sendMessage(){
		//서버로 메시지 전송
		wsocket.send('msg:'+nickname+':'+$('#message').val());
		appendmMessage($('#message').val());
		//기존 메시지 지우기
		$('#message').val('');
		//포커스 주기
		$('#message').focus();
	}
	
	
</script>
<!-- 시작 -->
<aside id="colorlib-hero">
	<div class="flexslider">
		<ul class="slides">
			<li style="background-image: url(resources/images/img_bg_1.jpg);">
		<div class="overlay"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
					<div class="slider-text-inner text-center">
						<h1>This is a Lifestyle<br />There is no Finish Line</h1>
						<p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동확인하기</a></p>
					</div>
				</div>
			</div>
		</div>
	</li>
	<li style="background-image: url(resources/images/img_bg_5.png);">
		<div class="overlay"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
					<div class="slider-text-inner text-center">
						<h1>Don't Stop When it Hurts,<br /> Stop When You're Done</h1>
						<p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
					</div>
				</div>
			</div>
		</div>
	</li>
	<li style="background-image: url(resources/images/img_bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
					<div class="slider-text-inner text-center">
						<h1>Stop Wishing, <br />Start Doing</h1><p>
							<a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
					</div>
				</div>
			</div>
		</div>
	</li>
	<li style="background-image: url(resources/images/img_bg_4.jpg);">
				<div class="overlay"></div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
							<div class="slider-text-inner text-center">
								<h1>Working Out is a Reward <br />not a Punishment</h1><p>
									<a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</aside>


<div class="col-md-10 col-md-offset-1 col-md" style="height: 10%;">
	<div class="col-md-3">
		<div class="row animate-box" style="margin: auto auto auto auto; height: 10%; width: 70%;">
	<div class="slider-text" style="margin-top: 30px;">
		<div class="row" >
			<div class="thumbnail">
				<img class=img-circle
					style="margin: 0 auto; height: 150px; width: 150px; margin-top: 50px; margin-bottom: 10px;"
					src="resources/images/멸치.png" alt="..."
					onerror="this.src='resources/images/profile.jpg'">
				<div class="caption">
				<c:forEach items="${list}" var="item" varStatus="loop">
					<h3 style="text-align: center;">${item.name}</h3>
					</c:forEach>
					<hr style="color: black;">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="col-md-9">
	<div class="animate-box"style="margin: 30px auto auto auto; width: 90%;">
	<ul class="nav nav-tabs" style="margin-bottom: -30px;">
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#qwe" id="myinformation">내정보</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#asd">채팅 <span class="badge badge-primary" style="color: white;">8</span></a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"href="#zxc">문의사항</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade" id="qwe">
			<div class="animate-box" style="margin: 30px auto auto auto; width: 100%;">
				<div class="panel panel-danger">
					<div class="panel-body">
					<c:forEach items="${list}" var="item" varStatus="loop">
						<span style="color: black;" class="glyphicon glyphicon-user"> ${item.name}의최근정보현황</span>
						</c:forEach>
					</div>
					
					<div class="panel-footer">
					<c:forEach items="${list}" var="item" varStatus="loop">
							<span style="color: black; width: 280px;" class="glyphicon glyphicon-scale"> ${item.name}님의현재몸무게-<span id ="weight" ><fmt:formatNumber value="${item.weight}" pattern="0.5"/></span>kg</span>
							<div style="display: inline-block;">
							<button id="kgup" style="color: black;">▲</button>
							<button id="kgdown" style="color: black;">▼</button>
							<form style="display: inline;" action="<c:url value='/weightUpdate.do'/>">
							<input type="hidden" name="weight" value="${item.weight}" id="weightid"/>
							<input type="hidden" name="userid" value="${item.id}"/>
							<button type="submit" class="btn btn-warning">수정</button>
							</form>			
							</div>
							</c:forEach>
							
					</div>
					
					<div class="panel-footer">
					<c:forEach items="${list}" var="item" varStatus="loop">
						<span style="color: black;" class="glyphicon glyphicon-heart" id="target"> ${item.name }님의BMI-</span>
						</c:forEach>
						<div class="progress" style="margin-top: 10px;">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" 
							aria-valuemax="25" style="width: 25%;">저체중(0~18.4)</div>
							
							<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="25" style="width: 25%;">정상(18.5~24.8)</div>
							<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="25" style="width: 25%;">과체중(24.9~29.8)</div>
							<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="25" style="width: 25%;">과체중</div>
						</div>
						<!-- progress -->
					</div>
					<div class="panel-footer">
					<c:forEach items="${list}" var="item" varStatus="loop">
						<span style="color: black;" class="glyphicon glyphicon-ok" id="calor"> ${item.name}님의체지방률-</span>
						</c:forEach>
						<div class="progress" style="margin-top: 10px;">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">저체중(0~18.5)</div>
							<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">표준(18.6~22.9)</div>
							<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">과체중(23~24.9)</div>
							<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="90" aria-valuemin="0"aria-valuemax="20" style="width: 20%;">중도비만(25~29.9)</div>
							<div class="progress-bar progress-bar-danger"role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">고도비만</div>
						</div>
						<!-- progress -->
					</div>


					<div class="panel-footer">
					<c:forEach items="${list}" var="item" varStatus="loop">
						<span style="color: black;" class="glyphicon glyphicon-ok" id="Beman"> ${item.name}님의비만도-</span>
						</c:forEach>
						<div class="progress" style="margin-top: 10px;">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">체중미달(94이하)</div>
							<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">정상(95~119)</div>
							<div class="progress-bar progress-bar-info" role="progressbar"aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">경도비만(120~129)</div>
							<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">중도비만(130~149)</div>
							<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="20" style="width: 20%;">고도비만(150이상)</div>
						</div>
						<!-- progress -->
					</div>

					<div class="panel-footer">
					<c:forEach items="${list}" var="item" varStatus="loop">
						<span style="color: black;" class="glyphicon glyphicon-ok" id="daesalyang"> ${item.name}님의기초대사량-</span>
					</c:forEach>
						<table style="margin-top: 13px;">
							<tr>
								<th colspan="2">남성</th>
								<th colspan="2">여성</th>
							</tr>
							<tr>
								<th>나이</th>
								<th>평균 기초대사량</th>
								<th>나이</th>
								<th>평균 기초대사량</th>
							</tr>
							<tr>
								<td>20 ~ 29세</td>
								<td>1728 ± 368.2kcal</td>
								<td>20 ~ 29세</td>
								<td>1311.5 ± 233.0kcal</td>
							</tr>
							<tr>
								<td>30 ~ 49세</td>
								<td>1669.5 ± 302.1kcal</td>
								<td>30 ~ 49세</td>
								<td>1316.8 ± 225.9kcal</td>
							</tr>
							<tr>
								<td>50세 이상</td>
								<td>1493.8 ± 315.3kcal</td>
								<td>50세 이상</td>
								<td>1252.5 ± 228.6kcal</td>
							</tr>

						</table>
					</div>


				</div>
			</div>
		</div>

		<div class="tab-pane fade" id="asd">
			<div class="animate-box" style="margin: 30px auto auto auto; width: 100%;">
				<div class="panel panel-danger">
					<div class="panel-body">
					<c:forEach items="${list}" var="item" varStatus="loop">
						<span style="color: black;" class="glyphicon glyphicon-comment"> ${item.name}님의채팅리스트</span>
						<input type="hidden" value="${item.name}" id="ChattingID" />
						</c:forEach>
					</div>
					
					
					
					
					
					<div class="panel-footer">
						<span style="color: black;" class="glyphicon glyphicon-plus">
						<a href="#" style="color: black; font-size: 1.0em" data-toggle="modal" data-target="#NewChatting"> 새로운채팅</a>
						</span>
					</div>
					

					<div class="box"style="overflow-y:scroll;height: 250px;">
					
					<!-- 채팅리스트 하나도 없을때 
					<h3 style="text-align: center; padding-top: 110px; color: #DCDCDC">채팅방이 없습니다</h3>
					 -->
					 
				<div class="panel-footer" style="height:110px;" data-toggle="modal" data-target="#ChattingModal">
						 <img class=img-circle style="margin: 0 auto; height: 70px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="..." onerror="this.src='resources/images/profile.jpg'">				
						<span style="color: black; font-weight:bold; position: relative; left:10px; bottom:19px;">나길동</span>
						<span class="label label-danger"style="position: relative; bottom:21px; left:10px;">3</span><br/>
						<span style="position: relative; left:53px; bottom:48px;">dd</span><br/>
						<span style="position: relative; left:53px; bottom:45px;">2020-10-10 오후10:30</span>		
					</div>
					
					
					<div class="panel-footer" style="height:110px;" data-toggle="modal" data-target="#ChattingModal">
						 <img class=img-circle style="margin: 0 auto; height: 70px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="..." onerror="this.src='resources/images/profile.jpg'">				
						<span style="color: black; font-weight:bold; position: relative; left:10px; bottom:19px;">나길동</span>
						<span class="label label-danger"style="position: relative; bottom:21px; left:10px;">3</span><br/>
						<span style="position: relative; left:53px; bottom:48px;">dd</span><br/>
						<span style="position: relative; left:53px; bottom:45px;">2020-10-10 오후10:30</span>		
					</div>
					
					<div class="panel-footer" style="height:110px;" data-toggle="modal" data-target="#ChattingModal">
						 <img class=img-circle style="margin: 0 auto; height: 70px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="..." onerror="this.src='resources/images/profile.jpg'">				
						<span style="color: black; font-weight:bold; position: relative; left:10px; bottom:19px;">나길동</span>
						<span class="label label-danger"style="position: relative; bottom:21px; left:10px;">3</span><br/>
						<span style="position: relative; left:53px; bottom:48px;">dd</span><br/>
						<span style="position: relative; left:53px; bottom:45px;">2020-10-10 오후10:30</span>		
					</div>
					
					<div class="panel-footer" style="height:110px;" data-toggle="modal" data-target="#ChattingModal">
						 <img class=img-circle style="margin: 0 auto; height: 70px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="..." onerror="this.src='resources/images/profile.jpg'">				
						<span style="color: black; font-weight:bold; position: relative; left:10px; bottom:19px;">나길동</span>
						<span class="label label-danger"style="position: relative; bottom:21px; left:10px;">3</span><br/>
						<span style="position: relative; left:53px; bottom:48px;">dd</span><br/>
						<span style="position: relative; left:53px; bottom:45px;">2020-10-10 오후10:30</span>		
					</div>
					
					<div class="panel-footer" style="height:110px;" data-toggle="modal" data-target="#ChattingModal">
						 <img class=img-circle style="margin: 0 auto; height: 70px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="..." onerror="this.src='resources/images/profile.jpg'">				
						<span style="color: black; font-weight:bold; position: relative; left:10px; bottom:19px;">나길동</span>
						<span class="label label-danger"style="position: relative; bottom:21px; left:10px;">3</span><br/>
						<span style="position: relative; left:53px; bottom:48px;">dd</span><br/>
						<span style="position: relative; left:53px; bottom:45px;">2020-10-10 오후10:30</span>		
					</div>
					
					
				
					
				</div><!-- 스크롤바 다이브 -->

			</div>
		</div>

			</div>
			<div class="tab-pane fade" id="zxc">
			<div class="animate-box"style="margin: 30px auto auto auto; width: 100%;">
				<div class="panel panel-danger">
					<div class="panel-body">
						<span style="color: black;" class="glyphicon glyphicon-user">집가고ㅓ싶다</span>
					</div>
					<div class="panel-footer">
						<span style="color: black;" class="glyphicon glyphicon-scale">헤헿에ㅔ헤@@-<span class="label label-danger">62kg</span>
								</span>
							</div>
						</div>
					</div>
				</div>
		</div>

	</div>
</div>
</div>
</div>





<!-- 새로운채팅창만들기 모달 -->
<div class="modal fade" id="NewChatting" tabindex="-1" role="dialog"aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">대화상대 검색</h4>
			</div>
			<div class="modal-body">
			<span class="glyphicon glyphicon-search"></span>
			<input type="text"placeholder="아이디  입력" name="search" style="width: 40%; height: 33px; border: 1px solid #E6E6FA;"/>
			<button class="btn btn-warning">검색</button>
			<hr>
			<div class="box" style="overflow-y:scroll;height: 180px;">
			
			
			<div class="ChattingList">
			
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="...">
			<span>김길동</span>
			
			</div>
			
			<div class="ChattingList">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="...">
			<span>김길동</span>
			</div>
			
			<div class="ChattingList">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="...">
			<span>김길동</span>
			</div>
			
			<div class="ChattingList">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="...">
			<span>김길동</span>
			</div>
			
			
			</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" id="enterBtn">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 새로운채팅창만들기 모달 끝 -->



<!-- 기존 채팅창 모달 -->
<div class="modal fade" id="ChattingModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">000님과의 채팅방</h4>
			</div>
			<div class="modal-body">
			<form>
			<div class="form-group">
						<div id="chatArea" style="background-color: #B2C7D9">
							<div id="chatMessage" style="height: 300px; border: 1px #B2C7D9 solid; overflow: auto"></div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-10">
							<input class="form-control" type="text" id="message" />
						</div>
					</div>
					<input class="btn btn-warning" type="button" id="sendBtn" value="전송">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 기존 채팅창 모달 끝 -->

<script>
$(function(){
	/*
	$('.ChattingList').mouseover(function(){
		 $('.ChattingList').css("background-color","#F0F8FF");
	});

	$('.ChattingList').mouseleave(function(){
		 $('.ChattingList').css("background-color","white");
	});
	
	
	$('.ChattingList').on('click',function(){
		if($('.ChattingList').css("background-color") != "rgb(240, 248, 255)") {
			$('.ChattingList').css("background-color","#F0F9F9");
		
		}
		else {
			$('.ChattingList').css("background-color","white");
		}
		
		
	});
	*/
	
});
</script>
<script src="<c:url value='/resources/js/MyPageBMI.js'/>"></script>
</html>