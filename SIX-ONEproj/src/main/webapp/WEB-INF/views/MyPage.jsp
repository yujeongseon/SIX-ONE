<%@page import="com.team.sixone.AesUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/MyPage.css'/>" >
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ChattingBox.css'/>" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/resources/js/MyPageScroll.js'/>"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
 
}

@media screen and (max-width: 800px) {
	.week div:last-child div:last-child {
		display: block;
		border-bottom: 1px solid;
		margin-bottom: 5px;
	}
	
	.thumbnail{
		display: flow-root;
	}
	
	
}


</style>
<script type="text/javascript">
$( function() {
    $( "#accordion" ).accordion({
      heightStyle: "content"
    });
  } );
   //프로필사진에 마우스 올리면 마우스포인터변경
   $(function(){
      $('#myprofile').on('mouseenter',function(){
         $('#myprofile').css('cursor', 'pointer');
      });   
   });
</script>
<script type="text/javascript">
$(function(){
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
       
       //월요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Msport<%=i%> = $('#Msport<%=i%>').val();
        var Mset<%=i%> = parseInt($('#Mset<%=i%>').val());
        var Mcount<%=i%> = parseInt($('#Mcount<%=i%>').val());
        var Mallcount<%=i%> = Mset<%=i%>*Mcount<%=i%>;
       <%}%>
       
       //화요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Tsport<%=i%> = $('#Tsport<%=i%>').val();
        var Tset<%=i%> = parseInt($('#Tset<%=i%>').val());
        var Tcount<%=i%> = parseInt($('#Tcount<%=i%>').val());
        var Tallcount<%=i%> = Tset<%=i%>*Tcount<%=i%>;
       <%}%>
       
       //수요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Wsport<%=i%> = $('#Wsport<%=i%>').val();
        var Wset<%=i%> = parseInt($('#Wset<%=i%>').val());
        var Wcount<%=i%> = parseInt($('#Wcount<%=i%>').val());
        var Wallcount<%=i%> = Wset<%=i%>*Wcount<%=i%>;
       <%}%>
       
       //목요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Thsport<%=i%> = $('#Thsport<%=i%>').val();
        var Thset<%=i%> = parseInt($('#Thset<%=i%>').val());
        var Thcount<%=i%> = parseInt($('#Thcount<%=i%>').val());
        var Thallcount<%=i%> = Thset<%=i%>*Thcount<%=i%>;
       <%}%>
       
       //금요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Fsport<%=i%> = $('#Fsport<%=i%>').val();
        var Fset<%=i%> = parseInt($('#Fset<%=i%>').val());
        var Fcount<%=i%> = parseInt($('#Fcount<%=i%>').val());
        var Fallcount<%=i%> = Fset<%=i%>*Fcount<%=i%>;
       <%}%>
      
       //토요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Ssport<%=i%> = $('#Ssport<%=i%>').val();
        var Sset<%=i%> = parseInt($('#Sset<%=i%>').val());
        var Scount<%=i%> = parseInt($('#Scount<%=i%>').val());
        var Sallcount<%=i%> = Sset<%=i%>*Scount<%=i%>;
       <%}%>
       
       //일요일 운동이름,세트갯수,세트당갯수,총갯수
       <%for(int i=0; i <= 9; i++) {%>
       var Sunsport<%=i%> = $('#Sunsport<%=i%>').val();
        var Sunset<%=i%> = parseInt($('#Sunset<%=i%>').val());
        var Suncount<%=i%> = parseInt($('#Suncount<%=i%>').val());
        var Sunallcount<%=i%> = Sunset<%=i%>*Suncount<%=i%>;
       <%}%>
       
       test0 = new Array(11);
       test0 [0] = 1;
       
       test1 = new Array(11);
       test1 [0] = 2;
       
       test2 = new Array(11);
       test2 [0] = 3;
       
       test3 = new Array(11);
       test3 [0] = 4;
       
       test4 = new Array(11);
       test4 [0] = 5;
       
       test5 = new Array(11);
       test5 [0] = 6;
       
       test6 = new Array(11);
       test6 [0] = 7;
       
      //////////////////////////월요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>   
      if(Msport<%=y%> == flag) {
         test0 [<%=i%>+1] = Mallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      ////////화요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>
      if(Tsport<%=y%> == flag) {
         test1 [<%=i%>+1] = Tallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      /////수요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>
      if(Wsport<%=y%> == flag) {
         test2 [<%=i%>+1] = Wallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      ////목요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>
      if(Thsport<%=y%> == flag) {
         test3 [<%=i%>+1] = Thallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      ////금요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>
      if(Fsport<%=y%> == flag) {
         test4 [<%=i%>+1] = Fallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      ////토요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>
      if(Ssport<%=y%> == flag) {
         test5 [<%=i%>+1] = Sallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      ////일요일 각 운동의 총갯수 저장
      <%for(int i = 0; i <= 9; i++){%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      var flag = exercisename<%=i%>;
      <%for(int y = 0; y <= 9; y++){%>
      if(Sunsport<%=y%> == flag) {
         test6 [<%=i%>+1] = Sunallcount<%=y%>;
      }
      <%}%>
      <%}%>
      
      ///배열에 각 요일별 각각의 운동 총 횟수 넣어주는곳
      <%for(int i = 0; i <=10; i++) {%>
      <%for(int y = 0; y <= 6; y++){%>
         if(test<%=y%>[<%=i%>] == null) {
            test<%=y%>[<%=i%>] = 0;
         }
         <%}%>
      <%}%>
      
      //운동이름 글자수 줄이고 ...으로 표시(글자수5~6 이상 가면 깨져서)
      <%for(int i = 0; i <= 9; i ++) {%>
      var exercisename<%=i%> = $('#exercisename<%=i%>').val();
      if(typeof exercisename<%=i%> != "undefined") {
      if(exercisename<%=i%>.length >= 5) {
          exercisename<%=i%> = exercisename<%=i%>.substring(0,4);
          exercisename<%=i%> = exercisename<%=i%>.concat("...");
       }
      }
      <%}%>
      var data = new google.visualization.DataTable();
      data.addColumn('number', '이번주 근력 운동 루틴'); //그래프 타이틀
      
      <%for(int i = 0; i <= 9; i++) {%>
      data.addColumn('number', exercisename<%=i%>); //운동 컬럼
      <%}%>
      
      data.addRows([
         test0,
          test1,
          test2,
          test3,
          test4,
          test5,
          test6
      ]);
      var options = {
        chart: {
          title: '',
          subtitle: ''
        },
        width: '100%',
        height: 400,
        legend: {'position': 'bottom'},
        axes: {
          x: {
            0: {side: 'top'}
          }
        }
      };
      var chart = new google.charts.Line(document.getElementById('line_top_x'));
      chart.draw(data, google.charts.Line.convertOptions(options));
      $(window).resize(function(){
         chart.draw(data, google.charts.Line.convertOptions(options));
      });
      
    }
});
</script>
<!-- 시작 -->
<style>
#rRtitle{
   color: black;
   font-size:25px;
   font-weight:400;
   display: block;
   text-align: center;
   margin-bottom: 30px;
}
</style>
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
      <div class="row animate-box"
         style="margin: auto auto auto auto; height: 10%; width: 70%;">
         <div class="slider-text" style="margin-top: 30px;">
            <div class="row">
               <div class="thumbnail">
                  <c:forEach items="${list}" var="item" varStatus="loop">
                     <img id="myprofile" class=img-circle
                        style="margin: 0 auto; height: 150px; width: 150px; margin-top: 50px; margin-bottom: 10px;"
                        src="resources/Profile/${item.profile}" alt="..."
                        onerror="this.src='resources/images/profile.jpg'"
                        data-toggle="modal" data-target="#ProfileModal">
                  </c:forEach>
                  <div class="caption">
                     <c:forEach items="${list}" var="item">
                        <h3 style="text-align: center;">${item.name}</h3>
                        <input type="hidden" id="username" value="${item.name}">
                     </c:forEach>
                     <hr style="color: black;">

                  </div>
               </div>


               <div class="thumbnail" id="QRcode">
                
                     <img 
                        src="https://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=kosmo://intro?id=${qrcode }" alt="QR">
                 
                  <div class="caption">

                        <h3 style="text-align: center;">QR 로그인</h3>
                   
                     <hr style="color: black;">

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


   <div class="col-md-9">
      <div class="animate-box"
         style="margin: 30px auto auto auto; width: 90%;">
         <ul class="nav nav-tabs" style="margin-bottom: -30px;">
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#qwe" id="myinformation">나의기록</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#asd">내정보</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#zxc">나의식단</a></li>
         </ul>

         <div class="tab-content">
            <div class="tab-pane fade" id="qwe">
               <div class="animate-box"
                  style="margin: 30px auto auto auto; width: 100%;">
                  <div class="panel panel-danger">
                     <div class="panel-body">
                        <c:forEach items="${list}" var="item">
                           <span style="color: black;" class="glyphicon glyphicon-user">
                              ${item.name}님의운동기록</span>
                        </c:forEach>
                     </div>

                     <div class="panel-footer">
                        <div id="line_top_x"></div>
                        <hr/>
                        <div class="panel-body">
                           <div>
                        <span id="rRtitle">
                           ${list[0].name}님과 비슷한 회원이 구독중인 운동 루틴<br/>
                        </span>
                        <p style="paddind:10px">※ 회원님의 키, 몸무게, 운동목표, 성별을 종합하여 루틴을 추천해드립니다</p>
                        <div id="rRbody">
                           <span id="rRname" style="color: black;font-size:25px">
                           </span>
                           <span id="rRno" style="visibility: hidden;"></span>
                           <button id="rRsub" onclick="subscribe();" style="float:right;">
                              <span class="glyphicon glyphicon-thumbs-up" style="color: black;">구독하기</span>
                           </button>
                           <button id="rRsubC" onclick="subscribeCancel();" style="float:right;display: none;">
                              <span class="glyphicon glyphicon-thumbs-down" style="color: black;">구독취소</span>
                           </button>
                        </div>
                     </div>
                     
                     <div id="recommendRoutine">
                        <div class="col-md-1 week">
                           <div>1일차</div>
                           <div id="rRdays1"></div>
                        </div>
                        
                        <div class="col-md-1 week">
                           <div>2일차</div>
                           <div id="rRdays2"></div>
                        </div>
                        
                        <div class="col-md-1 week">
                           <div>3일차</div>
                           <div id="rRdays3"></div>
                        </div>
                        
                        <div class="col-md-1 week">
                           <div>4일차</div>
                           <div id="rRdays4"></div>
                        </div>
                        
                        <div class="col-md-1 week">
                           <div>5일차</div>
                           <div id="rRdays5"></div>
                        </div>
                        
                        <div class="col-md-1 week">
                           <div>6일차</div>
                           <div id="rRdays6"></div>
                        </div>
                        
                        <div class="col-md-1 week">
                           <div>7일차</div>
                           <div id="rRdays7"></div>
                        </div>
                        
                     </div>
                  
                  
                  </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="tab-pane fade" id="asd">
               <div class="animate-box"
                  style="margin: 30px auto auto auto; width: 100%;">
                  <div class="panel panel-danger">
                     <div class="panel-body">
                        <c:forEach items="${list}" var="item">
                           <span style="color: black;" class="glyphicon glyphicon-user">
                              ${item.name}님의최근정보현황</span>
                        </c:forEach>
                     </div>

                     <div class="panel-footer">
                        <c:forEach items="${list}" var="item">
                           <span style="color: black; width: 280;"
                              class="glyphicon glyphicon-scale"> ${item.name}님의현재몸무게-<span
                              id="weight">${item.weight}</span>kg
                           </span>
                           <div style="display: inline-block;">
                              <button id="kgup" style="color: black;">▲</button>
                              <button id="kgdown" style="color: black;">▼</button>
                              <form style="display: inline;"
                                 action="<c:url value='/weightUpdate.do'/>">
                                 <input type="hidden" name="weight" value="${item.weight}" id="weightid" /> <input type="hidden" name="userid" value="${item.id}" />
                                <div class="wrap" style="display: inline;">
                        </div>
                              </form>
                           </div>
                        </c:forEach>

                     </div>

                     <div class="panel-footer">
                        <c:forEach items="${list}" var="item">
                           <span style="color: black;" class="glyphicon glyphicon-heart"
                              id="target"> ${item.name }님의BMI-</span>
                        </c:forEach>
                        <div class="progress" style="margin-top: 10px;">
                           <div class="progress-bar progress-bar-success"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="25" style="width: 25%;">저체중(0~18.4)</div>

                           <div class="progress-bar" role="progressbar" aria-valuenow="90"
                              aria-valuemin="0" aria-valuemax="25" style="width: 25%;">정상(18.5~24.8)</div>
                           <div class="progress-bar progress-bar-warning"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="25" style="width: 25%;">과체중(24.9~29.8)</div>
                           <div class="progress-bar progress-bar-danger"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="25" style="width: 25%;">과체중</div>
                        </div>
                        <!-- progress -->
                     </div>
                     <div class="panel-footer">
                        <c:forEach items="${list}" var="item">
                           <span style="color: black;" class="glyphicon glyphicon-link"
                              id="calor"> ${item.name}님의체지방률-</span>
                        </c:forEach>
                        <div class="progress" style="margin-top: 10px;">
                           <div class="progress-bar progress-bar-success"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="20" style="width: 20%;">저체중(0~18.5)</div>
                           <div class="progress-bar" role="progressbar" aria-valuenow="90"
                              aria-valuemin="0" aria-valuemax="20" style="width: 20%;">표준(18.6~22.9)</div>
                           <div class="progress-bar progress-bar-info" role="progressbar"
                              aria-valuenow="90" aria-valuemin="0" aria-valuemax="20"
                              style="width: 20%;">과체중(23~24.9)</div>
                           <div class="progress-bar progress-bar-warning"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="20" style="width: 20%;">중도비만(25~29.9)</div>
                           <div class="progress-bar progress-bar-danger"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="20" style="width: 20%;">고도비만</div>
                        </div>
                        <!-- progress -->
                     </div>


                     <div class="panel-footer">
                        <c:forEach items="${list}" var="item" varStatus="loop">
                           <span style="color: black;"
                              class="glyphicon glyphicon-piggy-bank" id="Beman">
                              ${item.name}님의비만도-</span>
                        </c:forEach>
                        <div class="progress" style="margin-top: 10px;">
                           <div class="progress-bar progress-bar-success"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="20" style="width: 20%;">체중미달(94이하)</div>
                           <div class="progress-bar" role="progressbar" aria-valuenow="90"
                              aria-valuemin="0" aria-valuemax="20" style="width: 20%;">정상(95~119)</div>
                           <div class="progress-bar progress-bar-info" role="progressbar"
                              aria-valuenow="90" aria-valuemin="0" aria-valuemax="20"
                              style="width: 20%;">경도비만(120~129)</div>
                           <div class="progress-bar progress-bar-warning"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="20" style="width: 20%;">중도비만(130~149)</div>
                           <div class="progress-bar progress-bar-danger"
                              role="progressbar" aria-valuenow="90" aria-valuemin="0"
                              aria-valuemax="20" style="width: 20%;">고도비만(150이상)</div>
                        </div>
                        <!-- progress -->
                     </div>

                     <div class="panel-footer">
                        <c:forEach items="${list}" var="item" varStatus="loop">
                           <span style="color: black;" class="glyphicon glyphicon-apple"
                              id="daesalyang"> ${item.name}님의기초대사량-</span>
                        </c:forEach>
                        <table style="margin-top: 13px; width: 100%;" id="tb">
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



            <div class="tab-pane fade" id="zxc">
               <div class="animate-box"
                  style="margin: 30px auto auto auto; width: 100%;">
                  <div class="panel panel-danger">
                     <div class="panel-body">
                        <c:forEach items="${list}" var="item" varStatus="loop">
                           <span style="color: black;" class="glyphicon glyphicon-cutlery">
                              ${item.name}님의식단리스트</span><input id="datepicker" style="text-align: center" disabled>
                        </c:forEach>
                     </div>
                     <div class="panel-footer" id="pf">
                        <c:if test="${not empty food }" var="flag">
                           <c:forEach items="${food}" var="item" begin="1" end="1">
                              <fmt:parseDate var="data" value="${item.foodDate}"
                                 pattern="yyyy-MM-dd" />
                              <fmt:formatDate value="${data}" pattern="yyyy-MM-dd"
                                 var="data" />
                              <h3 style="text-align: center; display: inline-block;" id="h3">
                                 <c:out value="${data}" />
                                 식단표
                              </h3>
                              <a href="<c:url value='/foodreset.do'/>" class="myButton">초기화</a>
                           </c:forEach>
                           <div id="accordion" style="margin-top: -15px;">
                              <h3>아침식단</h3>
                              <div>
                                 <ul style="margin-left: -60px; list-style: disc;" id="b">
                                    <c:forEach items="${food}" var="item">
                                       <c:if test="${item.foodWhen == 'b'}">
                                          <c:set value="${item.foodKcal}" var="bkc" />
                                          <c:set value="${bkc+bkcal}" var="bkcal" />
                                          <li style="font-weight: bold;"id ="morning">●&nbsp;&nbsp;${item.foodName} - ${item.foodKcal}kcal</li>
                                       </c:if>
                                    </c:forEach>
                                    <fmt:parseNumber var="bkcal" integerOnly="true"
                                       value="${bkcal}" />
                                    <li style="font-weight: bold;">●&nbsp;&nbsp;아침식단 총 칼로리 - <c:out value="${bkcal}" />kcal
                                    </li>
                                 </ul>
                              </div>
                              <h3>점심식단</h3>
                              <div>
                                 <ul style="margin-left: -60px; list-style: disc;" id="l">
                                    <c:forEach items="${food}" var="item">
                                       <c:if test="${item.foodWhen == 'l'}">
                                          <c:set value="${item.foodKcal}" var="lkc" />
                                          <c:set value="${lkc+lkcal}" var="lkcal" />
                                          <li style="font-weight: bold;">●&nbsp;&nbsp;${item.foodName}
                                             - ${item.foodKcal}kcal</li>
                                       </c:if>
                                    </c:forEach>
                                    <fmt:parseNumber var="lkcal" integerOnly="true"
                                       value="${lkcal}" />
                                    <li style="font-weight: bold;">●&nbsp;&nbsp;점심식단 총 칼로리
                                       - <c:out value="${lkcal}" />kcal
                                    </li>
                                 </ul>
                              </div>
                              <h3>저녁식단</h3>
                              <div>
                                 <ul style="margin-left: -60px; list-style: disc;" id="d">
                                    <c:forEach items="${food}" var="item">
                                       <c:if test="${item.foodWhen == 'd'}">
                                          <c:set value="${item.foodKcal}" var="dkc" />
                                          <c:set value="${dkc+dkcal}" var="dkcal" />
                                          <li style="font-weight: bold;">●&nbsp;&nbsp;${item.foodName}
                                             - ${item.foodKcal}kcal</li>
                                       </c:if>
                                    </c:forEach>
                                    <fmt:parseNumber var="dkcal" integerOnly="true"
                                       value="${dkcal}" />
                                    <li style="font-weight: bold;">●&nbsp;&nbsp;저녁식단 총 칼로리
                                       - <c:out value="${dkcal}" />kcal
                                    </li>
                                 </ul>
                              </div>
                              <h3>총 식단 칼로리</h3>
                              <div>
                                 <ul style="margin-left: -60px; list-style: disc;" id ="t">
                                    <c:forEach items="${food}" var="item">
                                       <c:set value="${item.foodKcal}" var="kc" />
                                       <c:set value="${kc+kcal}" var="kcal" />
                                       <li style="font-weight: bold;">●&nbsp;&nbsp;${item.foodName}
                                          - ${item.foodKcal}kcal</li>
                                    </c:forEach>
                                    <fmt:parseNumber var="kcal" integerOnly="true"
                                       value="${kcal}" />
                                    <li style="font-weight: bold;">●&nbsp;&nbsp;총 칼로리 - <c:out
                                          value="${kcal}" />kcal
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </c:if>

                        <c:if test="${not flag}">
                           <h3
                              style="text-align: center; padding-top: 25px; color: #DCDCDC" id="h3h3">아직
                              식단이 없습니다</h3>

                        </c:if>



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
      </div>
   </div>
</div>
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
         <div class="modal-body" style="overflow: hidden;">
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


 <c:forEach items="${graphs}" var="item" varStatus="status">
                     <c:set var="day" value="${item.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day" />
                        <c:if test="${day eq '월' and item.exercisepartials != '유산소'}">
                           <input type="hidden" value="${item.exercisename}" id="Msport${status.index}"/>
                           <input type="hidden" value="${item.setcount}" id="Mset${status.index}"/>
                           <input type="hidden" value="${item.count}" id="Mcount${status.index}"/>
                        </c:if>
                  </c:forEach>
                  
                  <c:forEach items="${graphs}" var="item2" varStatus="status2">
                     <c:set var="day" value="${item2.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day2" />
                        <c:if test="${day2 eq '화' and item.exercisepartials != '유산소'}"> 
                           <input type="hidden" value="${item2.exercisename}" id="Tsport${status2.index %3}"/>
                           <input type="hidden" value="${item2.setcount}" id="Tset${status2.index%3}"/>
                           <input type="hidden" value="${item2.count}" id="Tcount${status2.index%3}"/>
                        </c:if>
                        
                  </c:forEach>
                  <c:forEach items="${graphs}" var="item2" varStatus="status2">
                     <c:set var="day" value="${item2.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day2" />
                        <c:if test="${day2 eq '수' and item.exercisepartials != '유산소'}"> 
                           <input type="hidden" value="${item2.exercisename}" id="Wsport${status2.index %3}"/>
                           <input type="hidden" value="${item2.setcount}" id="Wset${status2.index%3}"/>
                           <input type="hidden" value="${item2.count}" id="Wcount${status2.index%3}"/>
                        </c:if>
                        
                  </c:forEach>
                  <c:forEach items="${graphs}" var="item2" varStatus="status2">
                     <c:set var="day" value="${item2.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day2" />
                        <c:if test="${day2 eq '목' and item.exercisepartials != '유산소'}"> 
                           <input type="hidden" value="${item2.exercisename}" id="Thsport${status2.index %3}"/>
                           <input type="hidden" value="${item2.setcount}" id="Thset${status2.index%3}"/>
                           <input type="hidden" value="${item2.count}" id="Thcount${status2.index%3}"/>
                        </c:if>
                        
                  </c:forEach>
                  <c:forEach items="${graphs}" var="item2" varStatus="status2">
                     <c:set var="day" value="${item2.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day2" />
                        <c:if test="${day2 eq '금' and item.exercisepartials != '유산소'}"> 
                           <input type="hidden" value="${item2.exercisename}" id="Fsport${status2.index %3}"/>
                           <input type="hidden" value="${item2.setcount}" id="Fset${status2.index%3}"/>
                           <input type="hidden" value="${item2.count}" id="Fcount${status2.index%3}"/>
                        </c:if>
                        
                  </c:forEach>
                  <c:forEach items="${graphs}" var="item2" varStatus="status2">
                     <c:set var="day" value="${item2.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day2" />
                        <c:if test="${day2 eq '토' and item.exercisepartials != '유산소'}"> 
                           <input type="hidden" value="${item2.exercisename}" id="Ssport${status2.index %3}"/>
                           <input type="hidden" value="${item2.setcount}" id="Sset${status2.index%3}"/>
                           <input type="hidden" value="${item2.count}" id="Scount${status2.index%3}"/>
                        </c:if>
                        
                  </c:forEach>
                  <c:forEach items="${graphs}" var="item2" varStatus="status2">
                     <c:set var="day" value="${item2.playat }" />
                     <fmt:formatDate value="${day}" pattern="E" var="day2" />
                        <c:if test="${day2 eq '일' and item.exercisepartials != '유산소'}"> 
                           <input type="hidden" value="${item2.exercisename}" id="Sunsport${status2.index %3}"/>
                           <input type="hidden" value="${item2.setcount}" id="Sunset${status2.index%3}"/>
                           <input type="hidden" value="${item2.count}" id="Suncount${status2.index%3}"/>
                        </c:if>
                  </c:forEach>
                  
                  <!-- 그래프 컬럼 이름 -->
                  <c:forEach items="${exename}" var="exename" varStatus="loop">
                     <input  type="hidden" value="${exename.exercisename}"  id="exercisename${loop.index}"/>
                  </c:forEach>
                  <!-- 그래프 컬럼 이름 -->
<!-- 그래프에 넣어줄 값 저장작업-->

                  
<script>
   // 추천 루틴
   window.onload=function(){
      
      $.ajax({
         type : "get",
         url : "http://115.91.88.230:8282/ajax",
         data : {
            "id" : "${list[0].id}",
            "height" : "${list[0].height}",
            "weight" : "${list[0].weight}",
            "gender" : "${list[0].gender}",
            "goal" : "${list[0].goal}"
            
         },
         success : function(response) {
            if(response['recommend']==null){
               console.log('null');
               $('#rRbody').html('<h2>일치하는 데이타가 없습니다.</h2>');
               $('#rRbody').prop('style','text-align:center');
               $('#recommendRoutine').prop('style','display:none');
            }
            else{
               
            
               $('#rRname').html(response['recommend'][0][1]);
               $('#rRno').html(response['recommend'][0][0]);
               
               
               $.each(response['recommend'],function(index,item){
                  var sql = '<div class="entry-forth">'
                  sql += '<p class="icon"><span><img src="'+item[6]+'" style="width:80px;"></img></span></p>'
                  sql += '<p class="time"><span>'+item[2]+'회 / '+item[3]+'세트</span></p>'
                  sql += '<p class="trainer"><span>'+item[5]+'</span></p>'
                  
                  if(item[4]==1){
                     $('#rRdays1').html($('#rRdays1').html()+sql);
                  }
                  else if(item[4]==2){
                     $('#rRdays2').html($('#rRdays2').html()+sql);
                  }
                  else if(item[4]==3){
                     $('#rRdays3').html($('#rRdays3').html()+sql);
                  }
                  else if(item[4]==4){
                     $('#rRdays4').html($('#rRdays4').html()+sql);
                  }
                  else if(item[4]==5){
                     $('#rRdays5').html($('#rRdays5').html()+sql);
                  }
                  else if(item[4]==6){
                     $('#rRdays6').html($('#rRdays6').html()+sql);
                  }
                  else{
                     $('#rRdays7').html($('#rRdays7').html()+sql);
                  }
                  
               })
            }
         }
      });
   
   }
   
   // 구독버튼
   function subscribe(){
      
      var id = '${list[0].id}'
      var no = $('#rRno').html()
      $('#rRsub').prop('style','display:none');
      $('#rRsubC').prop('style','display:inline;float:right');
      
      $.ajax({
            url:"<c:url value='/Ajax/gudok.do'/>",
            dataType:'text',
            data:{no:no,id:id},
            success:function(data){
                     
                  alert("구독되었습니다")
            },
            error:function(request,error){
               console.log('상태코드:',request.status);
               console.log('서버로부터 받은 HTML데이타:',request.responseText);
               console.log('에러:',error);
            }
      });
   }
   
   // 구독 취소버튼
   function subscribeCancel(){
      var id = '${list[0].id}'
      var no = $('#rRno').html()
      $('#rRsubC').prop('style','display:none');
      $('#rRsub').prop('style','display:inline;float:right');
      
      $.ajax({
            url:"<c:url value='/Ajax/gudNO.do'/>",
            dataType:'text',
            data:{no:no,id:id},
            success:function(data){
                  id.innerHTML="구독";
                  alert("구독이 취소되었습니다")
            },
            error:function(request,error){
               console.log('상태코드:',request.status);
               console.log('서버로부터 받은 HTML데이타:',request.responseText);
               console.log('에러:',error);
            }
      });
      
   }
   
   $(function(){

      $(document).ready(function () {
    	  
    	
         if($(window).width()<970){
            $('#QRcode').hide();
         }else if($(window).width()>970){
            $('#QRcode').show();
         }
    	  
    	  $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .4) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); });

      
      $("#myinformation").trigger("click");
      
      
      
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
         
         
         

         // 18.5 미만   저체중
         // 18.6 ~ 22.9   표준
         // 23.0 ~ 24.9   과체중
         // 25.0 ~ 29.9   중도비만
         // 30.0 이상   고도비만
         //남성 체지방량kg = (1.10 x 본인체중kg) - (128 x (본인체중kg ÷ 본인키cm))
         //여성 체지방량kg = (1.07 x 본인체중kg) - (128 x (본인체중kg ÷ 본인키cm))
         //var fatResult = (1.07 * weight) - (128 * (weight / heightCM)).toFixed(2);   // 여자
         var fatResult = (1.10 * weight) - (128 * (weight / heightCM)).toFixed(2);  //남자
         fatResult = parseFloat(fatResult);
         fatResult = fatResult.toFixed(2);
         if(fatResult <= 18.5) {
            $('#calor').after('<span class="label label-success" id="CResult"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
            $('#fatResult').html(fatResult);
         }
         else if(fatResult <= 22.9) {
            $('#calor').after('<span class="label label-primary" id="CResult"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
            $('#fatResult').html(fatResult);
         }
         else if(fatResult <= 24.9) {
            $('#calor').after('<span class="label label-info" id="CResult"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
            $('#fatResult').html(fatResult);
         }
         else if(fatResult <= 29.9) {
            $('#calor').after('<span class="label label-warning" id="CResult"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
            $('#fatResult').html(fatResult);
         }
         else{
            $('#calor').after('<span class="label label-danger" id="CResult"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
            $('#fatResult').html(fatResult);
         }
         
         
         
         
         //var fatResult = fatResult.toFixed(2);
         
         
         
         // 17.0 이하   저체중   20.0 이하   저체중
         // 17.1 ~ 22.9   표준   20.1 ~ 26.9   표준
         //23.0 ~ 27.9   과체중   27.0 ~ 32.9   과체중
         // 28.0 ~ 37.9   중도비만   33.0 ~ 42.9   중도비만
         // 38.0 이상      고도비만   43.0 이상      고도비만



         //비만도
         //표준체중(남) = (신장 - 100) * 0.9
         //표준체중(여) = (신장 - 105) * 0.9
         //비만도 = (실제체중 / 표준체중) * 100
         var ratioResult = ((weight / ((heightCM - 100) * 0.9)) * 100).toFixed(2); //남자
         //var ratioResult = ((weight / ((heightCM - 105) * 0.9)) * 100).toFixed(2); // 여자
         ratioResult = parseFloat(ratioResult);
         ratioResult = ratioResult.toFixed(2);
         
         if(ratioResult <= 94) {
            $('#Beman').after('<span class="label label-success" id="ratio"><span id="ratioResult" style="font-weight: bold;"></span></span>');
            $('#ratioResult').html(ratioResult);
         }
         else if(ratioResult <= 119) {
            console.log(ratioResult);
            $('#Beman').after('<span class="label label-primary" id="ratio"><span id="ratioResult" style="font-weight: bold;"></span></span>');
            $('#ratioResult').html(ratioResult);
         }
         else if(ratioResult <= 129) {
            $('#Beman').after('<span class="label label-info" id="ratio"><span id="ratioResult" style="font-weight: bold;"></span></span>');
            $('#ratioResult').html(ratioResult);
         }
         else if(ratioResult <= 149) {
            $('#Beman').after('<span class="label label-warning" id="ratio"><span id="ratioResult" style="font-weight: bold;"></span></span>');
            $('#ratioResult').html(ratioResult);
         }
         else{
            $('#Beman').after('<span class="label label-danger"><span id="ratioResult" style="font-weight: bold;"></span></span>');
            $('#ratioResult').html(ratioResult);
         }

         // 90 ~ 110%   저체중
         // 110 ~ 119 %   표준
         // 120 ~ 129%   과체중
         // 130 ~ 149%   중도비만
         // 150%   고도비만

         //기초대사량
         //남자 = 66.47+(13.75 x 체중)+(5 x 키) - (6.76 x 나이)
         //여자 = 655.1+(9.56 x 체중)+(1.85 x 키) - (4.68 x 나이)
         var kcalResult = (66.47 +(13.75 * weight) + (5 * heightCM) - (6.76 * age)).toFixed(2);//남자
         //var kcalResult = (655.1 +(9.56 * weight) + (1.85 * heightCM) - (4.68 * age)).toFixed(2); //여자
         kcalResult = parseFloat(kcalResult);
         kcalResult = kcalResult.toFixed(2);
         
         $('#daesalyang').after('<span class="label label-primary" id="Result"><span id="kcalResult" style="font-weight: bold;"></span>kcal</span>');
         $('#kcalResult').html(kcalResult);
            
         

         //      남자                   여자
         // 나이   평균 기초대사량             나이   평균 기초대사량
         // 20 ~ 29세   1728 ± 368.2 ㎉      20 ~ 29세   1311.5 ± 233.0 ㎉
         // 30 ~ 49세   1669.5 ± 302.1 ㎉   30 ~ 49세   1316.8 ± 225.9 ㎉
         // 50세 이상   1493.8 ± 315.3 ㎉   50세 이상   1252.5 ± 228.6 ㎉   
         
         
         $(function(){
            $('#tb').hide();
            $('#Result').on('mouseenter',function(){
               $('#tb').show();
            });
            
            $('#Result').on('mouseleave',function(){
               $('#tb').hide();
            });
            
            $('#tb').hide();
            $('#daesalyang').on('mouseenter',function(){
               $('#tb').show();
            });
            
            $('#daesalyang').on('mouseleave',function(){
               $('#tb').hide();
            });
            
         });
         
         
         
         
         $('#kgup').on('click',function(){
            var weight = $('#weight').html();
            var Intweight = parseFloat(weight);
            var aa = $('#weight').html(Intweight + 1);
            $.ajax({
               url:"<c:url value='/kgUpdate.do'/>",
               type:'get',
               data:{weight:Intweight},
               dataType:'json',
               success:function(data){
                  $.each(data,function(key,value){
                     $('#weight').val(value);
                     var weight = Intweight;
                     var heightCM = 172;
                     var age = 24;
                     var heightM = heightCM * 0.01;
                     ///BMI
                     var bmiResult = (value / (heightM * heightM)).toFixed(2);
                     bmiResult = parseFloat(bmiResult);
                     var bmiResult = bmiResult.toFixed(2);
                     if(bmiResult <= 18.5) {
                        $('#bmi').attr('class','label label-success');
                        $('#bmiResult').html(bmiResult);
                     }
                     else if(bmiResult <= 24.8) {
                        $('#bmi').attr('class','label label-primary');
                        $('#bmiResult').html(bmiResult);
                     }
                     else if(bmiResult <= 29.8) {
                        $('#bmi').attr('class','label label-warning');
                        $('#bmiResult').html(bmiResult);
                     }
                     else {
                        $('#bmi').attr('class','label label-danger');
                        $('#bmiResult').html(bmiResult);
                     }
                     
                     //체지방률
                     var fatResult = (1.10 * value) - (128 * (value / heightCM)).toFixed(2);  //남자
                     fatResult = parseFloat(fatResult);
                     fatResult = fatResult.toFixed(2);
                     if(fatResult <= 18.5) {
                        $('#CResult').attr('class','label label-success');
                        $('#fatResult').html(fatResult);
                     }
                     else if(fatResult <= 22.9) {
                        $('#CResult').attr('class','label label-primary');
                        $('#fatResult').html(fatResult);
                     }
                     else if(fatResult <= 24.9) {
                        $('#CResult').attr('class','label label-info');
                        $('#fatResult').html(fatResult);
                     }
                     else if(fatResult <= 29.9) {
                        $('#CResult').attr('class','label label-warning');
                        $('#fatResult').html(fatResult);
                     }
                     else{
                        $('#CResult').attr('class','label label-danger');
                        $('#fatResult').html(fatResult);
                     }
                     
                     
                     var ratioResult = ((value / ((heightCM - 100) * 0.9)) * 100).toFixed(2); //남자
                     //var ratioResult = ((weight / ((heightCM - 105) * 0.9)) * 100).toFixed(2); // 여자
                     ratioResult = parseFloat(ratioResult);
                     ratioResult = ratioResult.toFixed(2);
                     
                     if(ratioResult <= 94) {
                        $('#ratio').attr('class','label label-success');
                        $('#ratioResult').html(ratioResult);
                     }
                     else if(ratioResult <= 119) {
                        $('#ratio').attr('class','label label-primary');
                        $('#ratioResult').html(ratioResult);
                     }
                     else if(ratioResult <= 129) {
                        $('#ratio').attr('class','label label-info');
                        $('#ratioResult').html(ratioResult);
                     }
                     else if(ratioResult <= 149) {
                        $('#ratio').attr('class','label label-warning');
                        $('#ratioResult').html(ratioResult);
                     }
                     else{
                        $('#ratio').attr('class','label label-danger');
                        $('#ratioResult').html(ratioResult);
                     }
                     
                     var kcalResult = (66.47 +(13.75 * value) + (5 * heightCM) - (6.76 * age)).toFixed(2);//남자
                     //var kcalResult = (655.1 +(9.56 * weight) + (1.85 * heightCM) - (4.68 * age)).toFixed(2); //여자
                     kcalResult = parseFloat(kcalResult);
                     kcalResult = kcalResult.toFixed(2);
                     
                     
                     $('#kcalResult').html(kcalResult);
                     
                     
                  });
               },
               error:function(data){}
            });
            
         });
         
         
         
         $('#kgdown').on('click',function(){
            var weight = $('#weight').html();
            var Intweight = parseFloat(weight);
            var aa = $('#weight').html(Intweight - 1);
            $.ajax({
               url:"<c:url value='/kgDown.do'/>",
               type:'get',
               data:{weight:Intweight},
               dataType:'json',
               success:function(data){
                  $.each(data,function(key,value){
                     $('#weight').val(value);
                     var weight = Intweight;
                     var heightCM = 172;
                     var age = 24;
                     var heightM = heightCM * 0.01;
                     ///BMI
                     var bmiResult = (value / (heightM * heightM)).toFixed(2);
                     bmiResult = parseFloat(bmiResult);
                     var bmiResult = bmiResult.toFixed(2);
                     if(bmiResult <= 18.5) {
                        $('#bmi').attr('class','label label-success');
                        $('#bmiResult').html(bmiResult);
                     }
                     else if(bmiResult <= 24.8) {
                        $('#bmi').attr('class','label label-primary');
                        $('#bmiResult').html(bmiResult);
                     }
                     else if(bmiResult <= 29.8) {
                        $('#bmi').attr('class','label label-warning');
                        $('#bmiResult').html(bmiResult);
                     }
                     else {
                        $('#bmi').attr('class','label label-danger');
                        $('#bmiResult').html(bmiResult);
                     }
                     
                     //체지방률
                     var fatResult = (1.10 * value) - (128 * (value / heightCM)).toFixed(2);  //남자
                     fatResult = parseFloat(fatResult);
                     fatResult = fatResult.toFixed(2);
                     if(fatResult <= 18.5) {
                        $('#CResult').attr('class','label label-success');
                        $('#fatResult').html(fatResult);
                     }
                     else if(fatResult <= 22.9) {
                        $('#CResult').attr('class','label label-primary');
                        $('#fatResult').html(fatResult);
                     }
                     else if(fatResult <= 24.9) {
                        $('#CResult').attr('class','label label-info');
                        $('#fatResult').html(fatResult);
                     }
                     else if(fatResult <= 29.9) {
                        $('#CResult').attr('class','label label-warning');
                        $('#fatResult').html(fatResult);
                     }
                     else{
                        $('#CResult').attr('class','label label-danger');
                        $('#fatResult').html(fatResult);
                     }
                     
                     
                     var ratioResult = ((value / ((heightCM - 100) * 0.9)) * 100).toFixed(2); //남자
                     //var ratioResult = ((weight / ((heightCM - 105) * 0.9)) * 100).toFixed(2); // 여자
                     ratioResult = parseFloat(ratioResult);
                     ratioResult = ratioResult.toFixed(2);
                     
                     if(ratioResult <= 94) {
                        $('#ratio').attr('class','label label-success');
                        $('#ratioResult').html(ratioResult);
                     }
                     else if(ratioResult <= 119) {
                        $('#ratio').attr('class','label label-primary');
                        $('#ratioResult').html(ratioResult);
                     }
                     else if(ratioResult <= 129) {
                        $('#ratio').attr('class','label label-info');
                        $('#ratioResult').html(ratioResult);
                     }
                     else if(ratioResult <= 149) {
                        $('#ratio').attr('class','label label-warning');
                        $('#ratioResult').html(ratioResult);
                     }
                     else{
                        $('#ratio').attr('class','label label-danger');
                        $('#ratioResult').html(ratioResult);
                     }
                     
                     var kcalResult = (66.47 +(13.75 * value) + (5 * heightCM) - (6.76 * age)).toFixed(2);//남자
                     //var kcalResult = (655.1 +(9.56 * weight) + (1.85 * heightCM) - (4.68 * age)).toFixed(2); //여자
                     kcalResult = parseFloat(kcalResult);
                     kcalResult = kcalResult.toFixed(2);
                     
                     
                     $('#kcalResult').html(kcalResult);
                     
                     
                  });
               },
               error:function(data){}
            });
            
         });
            
   
   
   
   
   // 데이트 피커
      $( "#datepicker" ).datepicker({
         showOn: "button",
         buttonImage: "resources/images/calendar-icon.png",
         buttonImageOnly: true,
         showButtonPanel: true,
         buttonText: "Select date",
         onSelect:function(dateText) {  
         $.ajax({
            url:"<c:url value='/fooddate.do'/>",
            type:'get',
            dataType:'json',
            data:{dateText:dateText},
            success:function(data){
               $('#h3').html(dateText+' 식단표');
               $('#b ').html("");
               $('#l ').html("");
               $('#d ').html("");
               $('#t ').html("");
               var a = 0, b=0, c=0;
            
            
               $.each(data,function(key,value){
                        if(value['foodWhen'] == 'b') {
                           $('#b').append("<li><b>●&nbsp;&nbsp;"+value['foodName']+" - "+value['foodKcal']+"kcal</b></li>\r\n");
                           a = a+parseInt(value['foodKcal']);
                           $('#t').append("<li><b>●&nbsp;&nbsp;"+value['foodName']+" - "+value['foodKcal']+"kcal</b></li>\r\n");
                        }else if(value['foodWhen'] == 'l') {
                           $('#l').append("<li><b>●&nbsp;&nbsp;"+value['foodName']+" - "+value['foodKcal']+"kcal</b></li>\r\n");
                           b = a+parseInt(value['foodKcal']);
                           $('#t').append("<li><b>●&nbsp;&nbsp;"+value['foodName']+" - "+value['foodKcal']+"kcal</b></li>\r\n");
                        }else if(value['foodWhen'] == 'd') {
                           $('#d').append("<li><b>●&nbsp;&nbsp;"+value['foodName']+" - "+value['foodKcal']+"kcal</b></li>\r\n");
                           c = a+parseInt(value['foodKcal']);
                           $('#t').append("<li><b>●&nbsp;&nbsp;"+value['foodName']+" - "+value['foodKcal']+"kcal</b></li>\r\n");
                        }
                       
               });//////each
                $('#b').append('<li style="font-weight: bold;">●&nbsp;&nbsp;아침식단 총 칼로리 - '+a+'kcal</li>');
                $('#l').append('<li style="font-weight: bold;">●&nbsp;&nbsp;점심식단 총 칼로리 - '+b+'kcal</li>');
                $('#d').append('<li style="font-weight: bold;">●&nbsp;&nbsp;저녁식단 총 칼로리 - '+c+'kcal</li>');
                
                $('#t').append('<li style="font-weight: bold;">●&nbsp;&nbsp;저녁식단 총 칼로리 - '+(a+b+c)+'kcal</li>');
            },
            error:function(){
               alert('에러 010-8457-0048로 카톡 주세요.');
            }
         });
             
             
         }
    });
   $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");
   $( "#datepicker" ).datepicker('setDate', new Date());

</script>      

</html>