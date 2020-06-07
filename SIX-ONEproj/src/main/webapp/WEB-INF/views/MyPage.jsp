<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	text-align: center;
	color: black;
}

th {
	background-color: #bbdefb;
}

td {
	background-color: #e3f2fd;
}
.modal-dialog{ 
overflow-y: initial !important;
}

.modal-body{ 
height: 100%; overflow-y: auto; 
}

#ui-id-2{
height: 350%;
}




</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  } );
</script>
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


<div class="col-md-10 col-md-offset-1">
	<div class="col-md-3">
		<div class="row animate-box" style="margin: auto auto auto auto; height: 10%; width: 70%;">
	<div class="slider-text" style="margin-top: 60px;">
		<div class="row">
			<div class="thumbnail">
				<img class=img-circle
					style="margin: 0 auto; height: 150px; width: 150px; margin-top: 50px; margin-bottom: 10px;"
					src="resources/images/정연.jpg" alt="resources/images/profile.jpg"
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
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#asd">쪽지함 <span class="badge badge-primary" style="color: white;">8</span></a></li>
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
					
					<div class="panel-footer" >
					<c:forEach items="${list}" var="item" varStatus="loop">
							<span style="color: black;" class="glyphicon glyphicon-scale"> ${item.name}님의현재몸무게-<span id ="weight" >		
							<fmt:formatNumber value="${item.weight}" pattern="0.5"/></span>kg</span>
							<button id="kgup" style="color: black;">▲</button>
							<button id="kgdown" style="color: black;">▼</button>	
							<form style="width: 30px;" action="<c:url value='/weightUpdate.do'/>">
							<input type="hidden" name="weight" value="${item.weight}" id="weightid"/>
							<input type="hidden" name="userid" value="${item.id}"/>
							<button type="submit" class="btn btn-warning">수정</button>
							</form>
							
							</c:forEach>
					</div><!--  -->
					
					
					
					
					
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
						<span style="color: black;" class="glyphicon glyphicon-cutlery" id="calor"> ${item.name}님의체지방률-</span>
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
						<span style="color: black;" class="glyphicon glyphicon-envelope"> ${item.name}님의쪽지함</span>
						</c:forEach>
					</div>
					<div class="panel-footer">
						<span style="color: black;" class="glyphicon glyphicon-bed">
						<a href="#" style="color: black; font-size: 1.0em" data-toggle="modal" data-target="#mailModal"> 받은쪽지목록</a><span class="label label-success">2</span>
						</span>
					</div>
					<div class="panel-footer">
						<span style="color: black;" class="glyphicon glyphicon-send">
						 <a href="#" style="color: black; font-size: 1.0em" data-toggle="modal" data-target="#mymailModal"> 보낸쪽지목록</a><span class="label label-info">4</span>
						</span>
					</div>
				</div>
			</div>
		</div>

		<div class="tab-pane fade" id="zxc">
			<div class="animate-box"style="margin: 30px auto auto auto; width: 100%;">
				<div class="panel panel-danger">
					<div class="panel-body">
						<span style="color: black;" class="glyphicon glyphicon-user">김길동님의최근정보현황</span>
					</div>
					<div class="panel-footer">
						<span style="color: black;" class="glyphicon glyphicon-scale">김길동님의현재몸무게-<span class="label label-danger">62kg</span>
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
</div>



		
		<!-- 모달 영역 -->
		<div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">김길동님의 쪽지함</h4>
					</div>
					<div class="modal-body">
					<!-- 
					<div class="panel panel-default">
						  <div class="panel-heading">안녕하세요 김길동님<a href="#" style="color: black;"><div class="glyphicon glyphicon-ok"></div></a></div>
						  <div class="panel-body">
						    <p><div class="media">
				  <div class="media-left media-middle">
				    
				      <img style="margin: 0 auto; height: 150px; width: 150px; margin-top: 5px; margin-bottom: 10px;" class="media-object" src="resources/images/정연.jpg" alt="...">
				    <span style="color: black;">leexae0729<span>님</span></span>
				    <span style="color: black;">2020-06-06</span>
				  </div>
				  <div class="media-body">
				    <h4 class="media-heading">오늘밤 외로워요..저랑 같이 등근육 조질까요?^^</h4>
				  </div>
					</div></p>
						  </div>
						  <table class="table">
						  </table>
						</div> 
						 -->
				<div id="accordion">
				
				<h3 style="margin: auto auto auto auto;">안녕하세요 김길동님</h3>
				<div style="width: 100%;">
				   <img class=img-circle style="height: 150px; width: 150px; display: inline-block;" onerror="this.src='resources/images/profile.jpg'" class="media-object" src="resources/images/정연.jpg" alt="...">
					<div style="margin-top: 20px;">
						안녕하시닞요dlfjwlasdkfsdhfsdhflsdhdsfsdf
						sdfjklsdfjhkosldfhsdlfhdsfsfldsfhs
					</div>
				</div>
				
				<h3>안녕하세요 김길동님</h3>
				<div style="width: 100%;">
				   <img class=img-circle style="height: 150px; width: 150px; display: inline-block;" onerror="this.src='resources/images/profile.jpg'" class="media-object" src="resources/images/정연.jpg" alt="...">
					<div style="margin-top: 20px;">
						안녕하시닞요dlfjwlasdkfsdhfsdhflsdhdsfsdf
						sdfjklsdfjhkosldfhsdlfhdsfsfldsfhs
					</div>
				</div>
				
				<h3>안녕하세요 김길동님</h3>
				<div style="width: 100%;">
				   <img class=img-circle style="height: 150px; width: 150px; display: inline-block;" onerror="this.src='resources/images/profile.jpg'" class="media-object" src="resources/images/정연.jpg" alt="...">
					<div style="margin-top: 20px;">
						안녕하시닞요dlfjwlasdkfsdhfsdhflsdhdsfsdf
						sdfjklsdfjhkosldfhsdlfhdsfsfldsfhs
					</div>
				</div>
				<h3>안녕하세요 김길동님</h3>
				<div style="width: 100%;">
				   <img class=img-circle style="height: 150px; width: 150px; display: inline-block;" onerror="this.src='resources/images/profile.jpg'" class="media-object" src="resources/images/정연.jpg" alt="...">
					<div style="margin-top: 20px;">
						안녕하시닞요dlfjwlasdkfsdhfsdhflsdhdsfsdf
						sdfjklsdfjhkosldfhsdlfhdsfsfldsfhs
					</div>
				</div>
				<h3>안녕하세요 김길동님</h3>
				<div style="width: 100%;">
				   <img class=img-circle style="height: 150px; width: 150px; display: inline-block;" onerror="this.src='resources/images/profile.jpg'" class="media-object" src="resources/images/정연.jpg" alt="...">
					<div style="margin-top: 20px;">
						안녕하시닞요dlfjwlasdkfsdhfsdhflsdhdsfsdf
						sdfjklsdfjhkosldfhsdlfhdsfsfldsfhs
					</div>
				</div>
				
				</div>	<!-- 아코디언 끝 -->	
						
						
						
  				
						
					</div> <!-- 모달 바디 -->
					
				</div>
			</div>
		</div>



<div class="modal fade" id="mymailModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">김길동님의 보낸 쪽지 목록</h4>
			</div>
			<div class="modal-body">
			<div class="col-md-12">
		 
			<table>
				<tr><th style="width: 80px; height:20px;">아이디</th><th style="width: 100px;">제목</th><th style="width: 200px;">내용</th><th>날짜</th><th>확인</th></tr>
				<tr><td>이길동</td><td>안녕하세요</td><td>잘지니셨나요ㄹ</td><td>2020-06-07</td><td>o</td></tr>
				<tr><td>박길동</td><td>길동아</td><td>잘지니셨ㄴㅇ</td><td>2020-06-07</td><td>o</td></tr>
				<tr><td>가길동</td><td>뭐하요요</td><td>잘지니셨나ㅇㄴㄹ</td><td>2020-06-07</td><td>o</td></tr>
			</table>
			
					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>


<script>
	

$(function(){
	
	 
	
	$(document).ready(function () { $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .4) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); });

	
	$("#myinformation").trigger("click");
	
	
	$('#kgup').on('click',function(){
		var weight = $('#weight').html();
		var Intweight = parseFloat(weight);
		var aa = $('#weight').html(Intweight + 0.5);
		$('#weightid').val(Intweight + 0.5);
		
	});
		

	$('#kgdown').on('click',function(){
		var weight = $('#weight').html();
		var Intweight = parseFloat(weight);
		var aa = $('#weight').html(Intweight - 0.5);
		$('#weightid').val(Intweight - 0.5);
	});
	
});
		
var weight = $('#weight').html();
var Intweight = parseFloat(weight);


		var weight = Intweight;
		var heightCM = 172;
		var age = 24;
		var heightM = heightCM * 0.01;
		


		// BMI 지수 = 체중 ÷ (키 x 키)
		var bmiResult = (weight / (heightM * heightM)).toFixed(2);
		bmiResult = parseFloat(bmiResult);
		var bmiResult = bmiResult.toFixed(2);
		if(bmiResult <= 18.5) {
			$('#target').after('<span class="label label-success" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		else if(bmiResult <= 24.8) {
			$('#target').after('<span class="label label-primary" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		else if(bmiResult <= 29.8) {
			$('#target').after('<span class="label label-warning" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		else {
			$('#target').after('<span class="label label-danger" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		
		
		

		// 18.5 미만	저체중
		// 18.6 ~ 22.9	표준
		// 23.0 ~ 24.9	과체중
		// 25.0 ~ 29.9	중도비만
		// 30.0 이상	고도비만
		//남성 체지방량kg = (1.10 x 본인체중kg) - (128 x (본인체중kg ÷ 본인키cm))
		//여성 체지방량kg = (1.07 x 본인체중kg) - (128 x (본인체중kg ÷ 본인키cm))
		//var fatResult = (1.07 * weight) - (128 * (weight / heightCM)).toFixed(2);   // 여자
		var fatResult = (1.10 * weight) - (128 * (weight / heightCM)).toFixed(2);  //남자
		fatResult = parseFloat(fatResult);
		fatResult = fatResult.toFixed(2);
		if(fatResult <= 18.5) {
			$('#calor').after('<span class="label label-success"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else if(fatResult <= 22.9) {
			$('#calor').after('<span class="label label-primary"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else if(fatResult <= 24.9) {
			$('#calor').after('<span class="label label-info"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else if(fatResult <= 29.9) {
			$('#calor').after('<span class="label label-warning"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else{
			$('#calor').after('<span class="label label-danger"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		
		
		
		
		//var fatResult = fatResult.toFixed(2);
		
		
		
		// 17.0 이하	저체중	20.0 이하	저체중
		// 17.1 ~ 22.9	표준	20.1 ~ 26.9	표준
		// 23.0 ~ 27.9	과체중	27.0 ~ 32.9	과체중
		// 28.0 ~ 37.9	중도비만	33.0 ~ 42.9	중도비만
		// 38.0 이상		고도비만	43.0 이상		고도비만



		//비만도
		//표준체중(남) = (신장 - 100) * 0.9
		//표준체중(여) = (신장 - 105) * 0.9
		//비만도 = (실제체중 / 표준체중) * 100
		var ratioResult = ((weight / ((heightCM - 100) * 0.9)) * 100).toFixed(2); //남자
		//var ratioResult = ((weight / ((heightCM - 105) * 0.9)) * 100).toFixed(2); // 여자
		ratioResult = parseFloat(ratioResult);
		ratioResult = ratioResult.toFixed(2);
		
		if(ratioResult <= 94) {
			$('#Beman').after('<span class="label label-success"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else if(ratioResult <= 119) {
			console.log(ratioResult);
			$('#Beman').after('<span class="label label-primary"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else if(ratioResult <= 129) {
			$('#Beman').after('<span class="label label-info"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else if(ratioResult <= 149) {
			$('#Beman').after('<span class="label label-warning"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else{
			$('#Beman').after('<span class="label label-danger"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}

		// 90 ~ 110%	저체중
		// 110 ~ 119 %	표준
		// 120 ~ 129%	과체중
		// 130 ~ 149%	중도비만
		// 150%	고도비만

		//기초대사량
		//남자 = 66.47+(13.75 x 체중)+(5 x 키) - (6.76 x 나이)
		//여자 = 655.1+(9.56 x 체중)+(1.85 x 키) - (4.68 x 나이)
		var kcalResult = (66.47 +(13.75 * weight) + (5 * heightCM) - (6.76 * age)).toFixed(2);//남자
		//var kcalResult = (655.1 +(9.56 * weight) + (1.85 * heightCM) - (4.68 * age)).toFixed(2); //여자
		kcalResult = parseFloat(kcalResult);
		kcalResult = kcalResult.toFixed(2);
		
			$('#daesalyang').after('<span class="label label-primary"><span id="kcalResult" style="font-weight: bold;"></span>kcal</span>');
			$('#kcalResult').html(kcalResult);
		
		

		//		남자 						여자
		// 나이	평균 기초대사량				 나이	평균 기초대사량
		// 20 ~ 29세	1728 ± 368.2 ㎉		20 ~ 29세	1311.5 ± 233.0 ㎉
		// 30 ~ 49세	1669.5 ± 302.1 ㎉	30 ~ 49세	1316.8 ± 225.9 ㎉
		// 50세 이상	1493.8 ± 315.3 ㎉	50세 이상	1252.5 ± 228.6 ㎉	




	</script>


</html>