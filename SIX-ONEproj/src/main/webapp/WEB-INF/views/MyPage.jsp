<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/MyPage.css'/>" >
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ChattingBox.css'/>" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/resources/js/MyPageScroll.js'/>"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
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
   
      var data = new google.visualization.DataTable();
      data.addColumn('number', '이번주 운동 루틴');
      data.addColumn('number', $('#exercisename1').val());
      data.addColumn('number', $('#exercisename2').val());
      data.addColumn('number', $('#exercisename3').val());
      /*
      var Mday1 = $('#Mday1').val();
      var Tday1 = $('#Tday1').val();
      var Wday1 = $('#Wday1').val();
      var Thday1 = $('#Thday1').val();
      var Fday1 = $('#Fday1').val();
      var Sday1 = $('#Sday1').val();
      var Sunday1 = $('#Sunday1').val();
      
      var Mday2 = $('#Mday2').val();
      var Tday2 = $('#Tday2').val();
      var Wday2 = $('#Wday2').val();
      var Thday2 = $('#Thday2').val();
      var Fday2 = $('#Fday2').val();
      var Sday2 = $('#Sday2').val();
      var Sunday2 = $('#Sunday2').val();
      
      var Mday3 = $('#Mday3').val();
      var Tday3 = $('#Tday3').val();
      var Wday3 = $('#Wday3').val();
      var Thday3 = $('#Thday3').val();
      var Fday3 = $('#Fday3').val();
      var Sday3 = $('#Sday3').val();
      var Sunday3 = $('#Sunday3').val();
      
      var MPushUp = $('#MPushUp').val();
      var TPushUp = $('#TPushUp').val();
      var WPushUp = $('#WPushUp').val();
      var ThPushUp = $('#ThPushUp').val();
      var FPushUp = $('#FPushUp').val();
      var SPushUp = $('#SPushUp').val();
      var SunPushUp = $('#SunPushUp').val();
      
      var MSquat = $('#MSquat').val();
      var TSquat = $('#TSquat').val();
      var WSquat = $('#WSquat').val();
      var ThSquat = $('#ThSquat').val();
      var FSquat = $('#FSquat').val();
      var SSquat = $('#SSquat').val();
      var SunSquat = $('#SunSquat').val();
      
      var MRenzi = $('#MRenzi').val();
      var TRenzi = $('#TRenzi').val();
      var WRenzi = $('#WRenzi').val();
      var ThRenzi = $('#ThRenzi').val();
      var FRenzi = $('#FRenzi').val();
      var SRenzi = $('#SRenzi').val();
      var SunRenzi = $('#SunRenzi').val();
      */
      var MPushUpcount = parseInt($('#MPushUpcount').val());
      var TPushUpcount = parseInt($('#TPushUpcount').val());
      var WPushUpcount = parseInt($('#WPushUpcount').val());
      var ThPushUpcount = parseInt($('#ThPushUpcount').val());
      var FPushUpcount = parseInt($('#FPushUpcount').val());
      var SPushUpcount = parseInt($('#SPushUpcount').val());
      var SunPushUpcount = parseInt($('#SunPushUpcount').val());
      
      if(isNaN(MPushUpcount)){
         MPushUpcount = 0;
      }
      if(isNaN(TPushUpcount)){
         TPushUpcount = 0;
      }
      if(isNaN(WPushUpcount)){
         WPushUpcount = 0;
      }
      if(isNaN(ThPushUpcount)){
         ThPushUpcount = 0;
      }
      if(isNaN(FPushUpcount)){
         FPushUpcount = 0;
      }
      if(isNaN(SPushUpcount)){
         SPushUpcount = 0;
      }
      if(isNaN(SunPushUpcount)){
         SunPushUpcount = 0;
      }
      
      var MSquatcount = parseInt($('#MSquatcount').val());
      var TSquatcount = parseInt($('#TSquatcount').val());
      var WSquatcount = parseInt($('#WSquatcount').val());
      var ThSquatcount = parseInt($('#ThSquatcount').val());
      var FSquatcount = parseInt($('#FSquatcount').val());
      var SSquatcount = parseInt($('#SSquatcount').val());
      var SunSquatcount = parseInt($('#SunSquatcount').val());
      
      if(isNaN(MSquatcount)){
         MSquatcount = 0;
      }
      if(isNaN(TSquatcount)){
         TSquatcount = 0;
      }
      if(isNaN(WSquatcount)){
         WSquatcount = 0;
      }
      if(isNaN(ThSquatcount)){
         ThSquatcount = 0;
      }
      if(isNaN(FSquatcount)){
         FSquatcount = 0;
      }
      if(isNaN(SSquatcount)){
         SSquatcount = 0;
      }
      if(isNaN(SunSquatcount)){
         SunSquatcount = 0;
      }
      
      var MRenzicount = parseInt($('#MRenzicount').val());
      var TRenzicount = parseInt($('#TRenzicount').val());
      var WRenzicount = parseInt($('#WRenzicount').val());
      var ThRenzicount = parseInt($('#ThRenzicount').val());
      var FRenzicount = parseInt($('#FRenzicount').val());
      var SRenzicount = parseInt($('#SRenzicount').val());
      var SunRenzicount = parseInt($('#SunRenzicount').val());
      
      if(isNaN(MRenzicount)){
         MRenzicount = 0;
      }
      if(isNaN(TRenzicount)){
         TRenzicount = 0;
      }
      if(isNaN(WRenzicount)){
         WRenzicount = 0;
      }
      if(isNaN(ThRenzicount)){
         ThRenzicount = 0;
      }
      if(isNaN(FRenzicount)){
         FRenzicount = 0;
      }
      if(isNaN(SRenzicount)){
         SRenzicount = 0;
      }
      if(isNaN(SunRenzicount)){
         SunRenzicount = 0;
      }
      
      
      
      data.addRows([
        [1, MPushUpcount, MSquatcount,MRenzicount],
        [2, TPushUpcount, TSquatcount, TRenzicount],
        [3, WPushUpcount, WSquatcount, WRenzicount],
        [4, ThPushUpcount, ThSquatcount, ThRenzicount],
        [5, FPushUpcount, FSquatcount, FRenzicount],
        [6, SPushUpcount, SSquatcount, SRenzicount],
        [7, SunPushUpcount, SunSquatcount, SunRenzicount]
      ]);

      var options = {
        chart: {
          title: '',
          subtitle: ''
        },
        width: '100%',
        height: 400,
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
                           <span style="color: black; width: 280px;"
                              class="glyphicon glyphicon-scale"> ${item.name}님의현재몸무게-<span
                              id="weight">${item.weight}</span>kg
                           </span>
                           <div style="display: inline-block;">
                              <button id="kgup" style="color: black;">▲</button>
                              <button id="kgdown" style="color: black;">▼</button>
                              <form style="display: inline;"
                                 action="<c:url value='/weightUpdate.do'/>">
                                 <input type="hidden" name="weight" value="${item.weight}"
                                    id="weightid" /> <input type="hidden" name="userid"
                                    value="${item.id}" />
                                 <button type="submit" class="btn btn-warning">수정</button>
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
                              ${item.name}님의식단리스트</span>
                        </c:forEach>
                     </div>
                     <div class="panel-footer">
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
                                          <li style="font-weight: bold;">●&nbsp;&nbsp;${item.foodName}
                                             - ${item.foodKcal}kcal</li>
                                       </c:if>
                                    </c:forEach>
                                    <fmt:parseNumber var="bkcal" integerOnly="true"
                                       value="${bkcal}" />
                                    <li style="font-weight: bold;">●&nbsp;&nbsp;아침식단 총 칼로리
                                       - <c:out value="${bkcal}" />kcal
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
                                 <ul style="margin-left: -60px; list-style: disc;">
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
                              style="text-align: center; padding-top: 25px; color: #DCDCDC">아직
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


<!-- 그래프에 뿌려줄값 저장하는 작업 -->
                  <c:forEach items="${graphs}" var="item">
                     <c:if test="${item.exercisename == '팔굽혀펴기'}">
                        <input type="hidden" value="${item.exercisename}" id="exercisename1"/>
                        <c:set var="Mday" value="${item.playat }" />
                        <fmt:formatDate value="${Mday}" pattern="E" var="Mday" />
                        
                        <c:if test="${Mday == '월' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Mday1"/>
                           <input type="hidden" value="${item.exercisename}" id="MPushUp"/>
                           <input type="hidden" value="${item.count}" id="MPushUpcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '화' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Tday1"/>
                           <input type="hidden" value="${item.exercisename}" id="TPushUp"/>
                           <input type="hidden" value="${item.count}" id="TPushUpcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '수' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Wday1"/>
                           <input type="hidden" value="${item.exercisename}" id="WPushUp"/>
                           <input type="hidden" value="${item.count}" id="WPushUpcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '목' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Thday1"/>
                           <input type="hidden" value="${item.exercisename}" id="ThPushUp"/>
                           <input type="hidden" value="${item.count}" id="ThPushUpcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '금' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Fday1"/>
                           <input type="hidden" value="${item.exercisename}" id="FPushUp"/>
                           <input type="hidden" value="${item.count}" id="FPushUpcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '토' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Sday1"/>
                           <input type="hidden" value="${item.exercisename}" id="SPushUp"/>
                           <input type="hidden" value="${item.count}" id="SPushUpcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '일' and item.exercisename == '팔굽혀펴기'}">
                           <input type="hidden" value="${Mday}" id="Sunday1"/>
                           <input type="hidden" value="${item.exercisename}" id="SunPushUp"/>
                           <input type="hidden" value="${item.count}" id="SunPushUpcount"/>
                        </c:if>            
                     </c:if>
                  </c:forEach>
                  
                  
                  <c:forEach items="${graphs}" var="item">
                     <c:if test="${item.exercisename == '스쿼트'}">
                        <input type="hidden" value="${item.exercisename}" id="exercisename2"/>
                        <c:set var="Mday" value="${item.playat }" />
                        <fmt:formatDate value="${Mday}" pattern="E" var="Mday" />
                        
                        <c:if test="${Mday == '월' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Mday2"/>
                           <input type="hidden" value="${item.exercisename}" id="MSquat"/>
                           <input type="hidden" value="${item.count}" id="MSquatcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '화' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Tday2"/>
                           <input type="hidden" value="${item.exercisename}" id="TSquat"/>
                           <input type="hidden" value="${item.count}" id="TSquatcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '수' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Wday2"/>
                           <input type="hidden" value="${item.exercisename}" id="WSquat"/>
                           <input type="hidden" value="${item.count}" id="WSquatcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '목' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Thday2"/>
                           <input type="hidden" value="${item.exercisename}" id="ThSquat"/>
                           <input type="hidden" value="${item.count}" id="ThSquatcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '금' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Fday2"/>
                           <input type="hidden" value="${item.exercisename}" id="FSquat"/>
                           <input type="hidden" value="${item.count}" id="FSquatcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '토' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Sday2"/>
                           <input type="hidden" value="${item.exercisename}" id="SSquat"/>
                           <input type="hidden" value="${item.count}" id="SSquatcount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '일' and item.exercisename == '스쿼트'}">
                           <input type="hidden" value="${Mday}" id="Sunday2"/>
                           <input type="hidden" value="${item.exercisename}" id="SunSquat"/>
                           <input type="hidden" value="${item.count}" id="SunSquatcount"/>
                        </c:if>            
                     </c:if>
                  </c:forEach>
                  
                  
                  <c:forEach items="${graphs}" var="item">
                     <c:if test="${item.exercisename == '런지'}">
                     <input type="hidden" value="${item.exercisename}" id="exercisename3"/>
                        <c:set var="Mday" value="${item.playat }" />
                        <fmt:formatDate value="${Mday}" pattern="E" var="Mday" />
                        
                        <c:if test="${Mday == '월' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Mday3"/>
                           <input type="hidden" value="${item.exercisename}" id="MRenzi"/>
                           <input type="hidden" value="${item.count}" id="MRenzicount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '화' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Tday3"/>
                           <input type="hidden" value="${item.exercisename}" id="TRenzi"/>
                           <input type="hidden" value="${item.count}" id="TRenzicount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '수' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Wday3"/>
                           <input type="hidden" value="${item.exercisename}" id="WRenzi"/>
                           <input type="hidden" value="${item.count}" id="WRenzicount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '목' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Thday3"/>
                           <input type="hidden" value="${item.exercisename}" id="ThRenzi"/>
                           <input type="hidden" value="${item.count}" id="ThRenzicount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '금' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Fday3"/>
                           <input type="hidden" value="${item.exercisename}" id="FRenzi"/>
                           <input type="hidden" value="${item.count}" id="FRenzicount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '토' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Sday3"/>
                           <input type="hidden" value="${item.exercisename}" id="SRenzi"/>
                           <input type="hidden" value="${item.count}" id="SRenzicount"/>
                        </c:if>
                        
                        <c:if test="${Mday == '일' and item.exercisename == '런지'}">
                           <input type="hidden" value="${Mday}" id="Sunday3"/>
                           <input type="hidden" value="${item.exercisename}" id="SunRenzi"/>
                           <input type="hidden" value="${item.count}" id="SunRenzicount"/>
                        </c:if>            
                     </c:if>
                  </c:forEach>
                  
<script>
	// 추천 루틴
	window.onload=function(){
		
		$.ajax({
			type : "get",
			url : "http://127.0.0.1:8282/ajax",
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
	
	
	
	

</script>      
                  
               
<!-- 그래프에 뿌려줄값 저장하는 작업 -->
<script src="<c:url value='/resources/js/MyPageKcal.js'/>"></script>
</html>