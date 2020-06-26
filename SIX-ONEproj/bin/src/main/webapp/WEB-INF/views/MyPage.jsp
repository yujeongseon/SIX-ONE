<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/MyPage.css'/>" > 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ChattingBox.css'/>" > 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/resources/js/MyPageScroll.js'/>"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script>
var wsocket;//웹소켓 객체 저장용
var nickname; //내 닉네임 저장용
var Opponentnickname;//상대 닉네임 저장용
var imgsrc;//상대방 이미지 경로 저장용
function ChattingList(el){
		if($(el).css("background-color") != "rgb(236, 236, 237)") {
			$('.ChattingList').css("background-color","white");
			$(el).css("background-color","#ECECED");
			imgsrc = $(el).children("img").attr('src');
			nickname = $('#username').val();
			Opponentnickname = $(el).children("span").html();
			$(el).children("span").attr('id','true');
			$('#enterBtn').attr("disabled",false); 
			$('#enterBtn').attr("class","btn btn-warning");
			
		}
		else{
			$(el).css("background-color","white");
			$('#enterBtn').attr("disabled",true);
			$('#enterBtn').attr("class","btn btn-secondary");
		}	
}//////////ChattingList	
	$(function() {
		$('#enterBtn').attr("disabled",true); 
		$('#enterBtn').attr("class","btn btn-secondary");
		//입장버튼 클릭시 서버와 연결된 웹소켓 클라이언트 생성
		$('#enterBtn').on('click',function(){ ////채팅할 상대 지정후 확인버튼 눌렀을때
			$('#NewChatting').modal("hide");
			$('#ChattingModal').modal("show");
			//console.log("ws://localhost:8080<c:url value='/chat-ws.do'/>");
			wsocket = new WebSocket("ws://localhost:8080<c:url value='/chat-ws.do'/>");
			//서버와 연결된 소켓에 이벤트 등록
			wsocket.onopen = open;
			wsocket.onclose = function(){
				appendmMessage("연결이 끊어졌어요");
			};
			wsocket.addEventListener('message',receiveMessage);
			$('.listbox').append(
			"<div class='panel-footer' style='height:120px;' data-toggle='modal' data-target='#ChattingModal'>"+
			"<img class=img-circle style='margin: 0 auto; height: 70px; width: 40px; margin-top: 5px; margin-bottom: 10px;' class='media-object' src='"+imgsrc+"' alt='...' onerror='this.src='resources/images/profile.jpg''>"+				
			"<span style='color: black; font-weight:bold; position: relative; left:10px; bottom:19px;'>"+Opponentnickname+"</span>"+
			"<span class='label label-danger'style='position: relative; bottom:21px; left:10px;'>3</span><br/>"+
			"<span style='position: relative; left:53px; bottom:48px;'></span><br/>"+
			"<span style='position: relative; left:53px; bottom:45px;'>2020-10-10 오후10:30</span>"+"</div>");
		});
		
		//퇴장버튼 클릭시
		$('#exitBtn').one('click',function(){
			wsocket.send('msg'+nickname+'가(이) 퇴장 했어요');
			wsocket.close();
		});
		
		//전송버튼 클릭시
		$('#sendBtn').click(function(){
			sendMessage();
			$('#sendBtn').attr("disabled",true);
			$('#sendBtn').attr("class","btn btn-secondary");
		});
		
		//메시지 입력후 전송 버튼 클릭이 아닌 엔터키 처리]
		
		$('#message').on('keypress',function(e){
			//console.log("e.keyCode:%s,e.which:%s",e.keyCode,e.which);
			
			var keyValue = e.keyCode ? e.keyCode : e.which;
			if(keyValue == 13 && $('#sendBtn').attr("disabled") != "disabled") {//엔터	
				sendMessage();
				$('#sendBtn').attr("disabled",true);
				$('#sendBtn').attr("class","btn btn-secondary");
			}
			  
			
		});
		
		$('#ChattingModal').on('hidden.bs.modal', function () {
			  $('body').removeAttr("style");
			})
			
		
		$('#ChattingModal').on('show.bs.modal', function(e){
		$('#message').focus();
		$('#sendBtn').attr("class","btn btn-secondary");
		$('#sendBtn').attr("disabled",true);
			});	
			
	
		
			$('#message').on('input',function(){
				if($('#message').val() == ''){
					$('#sendBtn').attr("disabled",true);
					$('#sendBtn').attr("class","btn btn-secondary");
				}
				else{
					$('#sendBtn').attr("disabled",false);
					$('#sendBtn').attr("class","btn btn-warning");
				}
				});	
			
		
			
	});
	

	//함수 정의 서버에 연결되었을때 호출되는 콜백함수
	var open = function(){
		//서버로 연결한 사람의정보 전송
		//사용자가 입력한 닉네임 저장
		//wsocket.send('msg:'+nickname+'가(이) 입장했어요');
		//appendmMessage(Opponentnickname+'님과의 채팅방');
	};
	//메시지를 div태그에 뿌려주기위한함수
	var appendmMessage = function(msg){
		//메시지 출력
		MsgSplit = msg.split(':');
		if(MsgSplit[0] === Opponentnickname) {//상대가 보냈을때 메시지 출력창
			$('#chatMessage').append("<div class='yourbox'>"+msg+"</div><br/>");
			
		}
		if(MsgSplit[0] === nickname){ //내가 보냈을때 메시지 출력창
				$('#chatMessage').append("<div class='arrow_box'>"+MsgSplit[1]+"</div><br/><br/>");
		}

		
		$('#chatMessage')//스크롤바 자동으로 아래로 내려가게하기
        .stop()
        .animate({ scrollTop: $('#chatMessage')[0].scrollHeight }, 300);
		
		
		
	};
	//서버에서 메시지를 받을때마다 호출되는 함수
	var receiveMessage = function(e){
		//서버로부터 받은 데이터는 이벤트객체 data속성에 저장되어있다.
		var receiveData = e.data;
		if(receiveData.substring(0,4) == 'msg:') {///상대방 메시지 뿌려주는곳
			//서버로부터 받은 메시지를 msg:부분을 제외하고 
			//div에 출력
			appendmMessage(receiveData.substring(4));
			 $('#chatMessage')
	            .stop()
	            .animate({ scrollTop: $('#chatMessage')[0].scrollHeight }, 300);
		}
	};
	//서버로 메시지 전송하는 함수
	function sendMessage(){////나의메시지 뿌려주는곳
		//서버로 메시지 전송
		wsocket.send('msg:'+nickname+':'+$('#message').val());  //콘솔에 나오는 메시지
		appendmMessage(nickname+':'+$('#message').val());
		//기존 메시지 지우기
		$('#message').val('');
		//포커스 주기
		$('#message').focus();
	}
</script>
<!-- 시작 -->
<script>
$(function(){
	$('#myprofile').mouseover(function(){
		$('#myprofile').css('cursor', 'pointer');
	})
	$('#myprofile').on('click',function(){
		
	});
});



</script>


<aside id="colorlib-hero">
	<div class="flexslider">
		<ul class="slides">
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
			<c:forEach items="${list}" var="item" varStatus="loop">
				<img id="myprofile"class=img-circle 
				style="margin: 0 auto; height: 150px; width: 150px; margin-top: 50px; margin-bottom: 10px;"
				src="resources/Profile/${item.profile}" alt="..." onerror="this.src='resources/images/profile.jpg'"
				data-toggle="modal" data-target="#ProfileModal">
			</c:forEach>
				<div class="caption">
				<c:forEach items="${list}" var="item" >
					<h3 style="text-align: center;">${item.name}</h3>
					<input type="hidden" id="username" value="${item.name}">
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
						<span style="color: black;" class="glyphicon glyphicon-user"> ${item.name}님의최근정보현황</span>
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
						<table style="margin-top: 13px;" id="tb">
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
					

					<div class="listbox"style="overflow-y:scroll;height: 250px;">
					
					 <!--  
					<h3 style="text-align: center; padding-top: 110px; color: #DCDCDC">채팅방이 없습니다</h3>
					 -->
					
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
						<span style="color: black;" class="glyphicon glyphicon-scale">헤헿에ㅔ헤@@-<span class="label label-danger">62kg</span></span>
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
			
			<div class="ChattingList" style="cursor:pointer;"  onclick="javascript:ChattingList(this);">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/붉은부리큰제비갈매기.jpg" alt="...">
			<span style="color:black;" id="LEE">이길동</span>
			</div>
			
			<div class="ChattingList" style="cursor:pointer;"  onclick="javascript:ChattingList(this);">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/텍사스영양땅다람쥐.jpg" alt="...">
			<span style="color:black;" id="PARK">박길동</span>
			</div>
			
			<div class="ChattingList" style="cursor:pointer;"  onclick="javascript:ChattingList(this);">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/노란이마딱다구리.jpg" alt="...">
			<span style="color:black;" id='KIM"'>김길동</span>
			</div>
			
			<div class="ChattingList" style="cursor:pointer;"  onclick="javascript:ChattingList(this);">
			<img class=img-circle style="margin: 0 auto; height: 40px; width: 40px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/꼬부기.jpg" alt="...">
			<span style="color:black;">나</span>
			</div>
			
			<c:forEach items="${list}" var="item" varStatus="loop">
				<input type="hidden" value="${item.id}" id="myid"/>
			</c:forEach>
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
				<h4 class="modal-title" id="ChatName">채팅방</h4>
			</div>
			<form onsubmit="return false">
			<div class="modal-body" id="chatMessage" style="height: 300px;background-color: #B2C7D9;color:black; overflow-x:hidden"></div>
			<div class="modal-footer">
				<div class="form-group">
					<div class="col-sm-10">
						<input class="form-control" type="text" id="message" style="display: inline;"/>
					</div>
					<input class="btn btn-warning" type="button" id="sendBtn" value="전송" style="width: 70px; margin-top: 5px; margin-right: 10px;">
				</div>
					
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 기존 채팅창 모달 끝 -->




<!-- 프로필사진 눌렀을때 나오는 모달 -->
<div class="modal fade" id="ProfileModal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<c:forEach items="${list}" var="item" varStatus="loop">
				<h4 class="modal-title" id="myModalLabel">${item.name}님의 프로필사진</h4>
				</c:forEach>
			</div>
			<div class="modal-body">
			<c:forEach items="${list}" var="item" varStatus="loop">
				<img style="width: 100%; height: 100%;"src="resources/Profile/${item.profile}" alt="..." onerror="this.src='resources/images/profile.jpg'">
			</c:forEach>
			</div>
			<div class="modal-footer">
			<form enctype = "multipart/form-data" method="post" action="<c:url value='ProfileUpdate.do'/>">
			<c:forEach items="${list}" var="item" varStatus="loop">
				<input type="hidden" name="id" value="${item.id}">
			</c:forEach>
				<input type="file" id="file" name="file" style="display: inline; width: 30%;"/>
				<button type="submit"class="btn btn-success">프로필변경</button>
			</form>
			</div>
		</div>
	</div>
</div>
<!-- 프로필사진 눌렀을때 나오는 모달 끝-->

<script src="<c:url value='/resources/js/MyPageBMI.js'/>"></script>
</html>