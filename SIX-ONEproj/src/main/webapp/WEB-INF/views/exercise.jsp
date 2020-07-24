<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baec786c99350c041ef35a31dcf9afcf&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/exerciseCSS.css'/>" >
<%-- <script src="<c:url value='/resources/js/exerciseJS.js'/>"></script> --%>
<script>
/*! Respond.js v1.4.2: min/max-width media query polyfill * Copyright 2013 Scott Jehl
 * Licensed under https://github.com/scottjehl/Respond/blob/master/LICENSE-MIT
 *  */
$(function(){
      var exercisename = $('#selected option:checked').text();
   
   $('#btn').click(function(){
      var exercisename = $('#selected option:checked').text();
      var exercise = $('#selected').val();
      var intexercise = parseFloat(exercise);
      var kg = $('#kg').val();
      var intkg = parseInt(kg);
      var m = $('#m').val();
      var intm = parseInt(m);
      var kcal = 0;
      if(!exercise) {
         $('#kclavalue').html("운동을 선택 하세요.");
         return;
      }
      
      
      if(isNaN(kg)) {
         $('#kclavalue').html("몸무게는 숫자만 입력하세요");
         return;
      }
      else if(isNaN(m)) {
         $('#kclavalue').html("운동시간은 숫자만 입력하세요");
         return;
      }
   
      else if(kg == '') {
         $('#kclavalue').html("몸무게를 입력하세요");
         return;
      }
      else if(m == '') {
         $('#kclavalue').html("운동할 시간을 정해주세요");
         return;
      }
      else if(intkg == "Nan") {
         $('#kclavalue').html("몸무게는 숫자만 입력하세요");
         return;
         }
      
      switch (intexercise) {
      case 0.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         
         
         break;
      case 1: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         if($('#kclavalue').html() === "" ){
            console.log('zz');
            $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         else {
            $('#kclavalue2').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         break;
      case 1.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         if($('#kclavalue').html() === "" ){
            console.log('zz');
            $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         else {
            $('#kclavalue2').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         break;
      case 2: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         if($('#kclavalue').html() === "" ){
            console.log('zz');
            $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         else {
            $('#kclavalue2').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         break;
      case 2.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         if($('#kclavalue').html() === "" ){
            console.log('zz');
            $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         else {
            $('#kclavalue2').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         break;
      case 3:
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 3.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         if($('#kclavalue').html() === "" ){
            console.log('zz');
            $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         else {
            $('#kclavalue2').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         break;
      case 4: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         if($('#kclavalue').html() === "" ){
            console.log('zz');
            $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         else {
            $('#kclavalue2').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         }
         break;
      case 4.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;   
      case 5.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 6: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 6.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 7: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 7.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 8: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 8.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 9: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 9.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 10: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 10.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 11: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 11.5: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      case 12: 
         kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
         $('#kclavalue').html(exercisename+"의 "+m+"분 칼로리 소모량은 "+kcal+"kcal 입니다.");
         break;
      }
      
   });
});
</script>
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
.videoName {
   display: block;
   color: black;
}
.desc {
   height:180px;
}
#sixtube_loading div { /*로딩 이미지*/
   position: fixed;
   top:45%;
   left:45%;
   /*margin-left: -21px;
   margin-top: -21px;*/
   z-index: 9999;
}
.display_none{
   display: none;
}

.hiddenImage{
   visibility: hidden;
}
#sixtube_loading{
   position: fixed;
   top:0;
   width:100%;
   height:100%;
   background-color:red;
   z-index: 8888;
   background-color: rgba(128, 128, 128,0.2);
}
.classname {
   -moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
   -webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
   box-shadow:inset 0px 1px 0px 0px #97c4fe;
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0) );
   background:-moz-linear-gradient( center top, #3d94f6 5%, #1e62d0 100% );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0');
   background-color:#3d94f6;
   -webkit-border-top-left-radius:16px;
   -moz-border-radius-topleft:16px;
   border-top-left-radius:16px;
   -webkit-border-top-right-radius:16px;
   -moz-border-radius-topright:16px;
   border-top-right-radius:16px;
   -webkit-border-bottom-right-radius:16px;
   -moz-border-radius-bottomright:16px;
   border-bottom-right-radius:16px;
   -webkit-border-bottom-left-radius:16px;
   -moz-border-radius-bottomleft:16px;
   border-bottom-left-radius:16px;
text-indent:0;
   display:inline-block;
   color:#ffffff;
   font-family:Arial;
   font-size:15px;
   font-weight:bold;
   font-style:normal;
height:37px;
   line-height:37px;
width:86px;
   text-decoration:none;
   text-align:center;
   text-shadow:0px 1px 0px #1570cd;
}.classname:hover {
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
   background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
   background-color:#1e62d0;
}.classname:active {
   position:relative;
   top:1px;
}

</style>
<aside id="colorlib-hero">
   <div class="flexslider">
      <ul class="slides">
         <li style="background-image: url(resources/images/img_bg_2.jpg);">
            <div class="overlay"></div>
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
                     <div class="slider-text-inner text-center">
                        <h1>운동 & 보충제</h1>
                        <h2>
                           <span><a href="<c:url value='/'/>">Home</a> | <a
                              href="#Exercise" class="scroll" style="color: white">바로가기</a></span>
                        </h2>
                     </div>
                  </div>
               </div>
            </div>
         </li>
      </ul>
   </div>
</aside>


<div class="colorlib-trainers">
   <div class="container">
      <div class="row">
      
         <div class="col-md-10 col-md-offset-1 text-center">
            <!-- 워드 클라우드 -->
            <img id="proteinMain" src="<c:url value="/resources/images/protein_word_cloud.png"/>"style="margin-bottom: 30px;width:100%;" alt=""/>
         
         </div>
         <div
            class="col-md-12 text-center colorlib-heading animate-box">
            <h2 id="Exercise" style="font-size: 3em;">
               물방울이 바위를 뚫을 수 있는 이유는<br/> 
               힘이 아니라 <span style="font-weight: bold;color: #f50057;font-size: 1.2em;">'꾸준함'</span>에 있다
            </h2>
         
         </div>
      </div>
      <div class="row">
         <!--실내운동 연결 -->
         <div class="col-md-2 col-sm-2 col-md-offset-1 animate-box" data-toggle="modal"data-target="#mapModal">
         
            <div class="trainers-entry">
               <div class="trainer-img"
                  style="background-image: url(https://images.unsplash.com/photo-1578874691223-64558a3ca096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80)">
               </div>
               <div class="desc">
                  <h3>헬스장 찾기</h3>
                  <span>현재 위치를 바탕으로<br/>
                  가까운 헬스장을 찾습니다</span>
               </div>
            </div>
         </div>



<div class="col-md-2 col-sm-2 animate-box">

   <div class="trainers-entry" id="health"  >

      <div class="trainer-img" id="healthimg" style="background-image: url(https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BBfc6b6/_h400_w284_m1_bwhite.jpg)">
         <div id='img1' style="height: 50%; background-color: #F0F0F0;display:none" >
            <span style="color: red;"> 스쿼트</span>
            <img src="resources/images/sqart.png" style="height:80%" >
         </div>
         <div id='img2' style="height: 50%; background-color: gray;display:none">
            <span style="color: red;"> 런지</span>
            <img src="resources/images/Lunge.png" style="height:85%">
         </div>
         
      </div>
      <div class="desc">
         <h3>실내 운동</h3>
         <span>실내에서도 간단하게 운동할수 있습니다
         </span>
      </div>


   </div>
</div>
<!-- 스쿼트 모달 
<div class="modal fade" id="squrtModal" tabindex="-1" role="dialog" > 
  <div class="modal-dialog modal-lg" style="width: 60%; height: 100%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">SQURT</h4>
      </div>
      <div class="modal-body">
        <iframe src="https://jovial-galileo-7ec103.netlify.app/" style="width:100%; height:600px"> </iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">저장하기</button>
      </div>
    </div>
  </div>
</div> -->


<div class="col-md-2 col-sm-2 animate-box">
   <a href="#;" onclick="youtubeClick()">
      <div class="trainers-entry">
         <div class="trainer-img"
            style="background-image: url(resources/images/search_exercise.png)">
         </div>
         <div class="desc">
            <h3>운동 검색하기</h3>
            <span style="color:rgb(128,128,128);">운동 자세를 검색해보세요.</span>
         </div>
      </div>
      
   </a>

</div>



<div class="col-md-2 col-sm-2 animate-box">
   <a href="<c:url value='/food.do'/>">
      <div class="trainers-entry">
         <div class="trainer-img"
            style="background-image: url(https://cdn.pixabay.com/photo/2016/04/15/17/20/bread-and-butter-1331452_960_720.jpg)">
         </div>
         <div class="desc">
            <h3>내가 먹은 <br/>칼로리 계산하기</h3>
            <span>내가 오늘 먹은 음식의 칼로리를 간단하게 계산할 수 있습니다.</span>
         </div>
      </div>
      
   </a>

</div>




<!-- Modal -->
<div class="modal fade" id="mapModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="width: 90%; height: 100%">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">헬스장 확인하기</h4>
         </div>
         <div class="modal-body">

            <div class="map_wrap">

               <div id="map"
                  style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>


            </div>
            <div id="menu_wrap" class="bg_white col-md-2" style="opacity: 0.9">
               <div class="option">
                  <div>
                     <form onsubmit="searchPlaces(); return false;">
                        찾을 지역 : <input onclick="clearse();" type="text" value="가산동" id="keyword" size="10" style="font-size:1.0em;opacity: 0.9">
                        <button type="submit">검색하기</button>
                     </form>
                  </div>
               </div>
               <hr>
               <ul id="placesList"></ul>
               <div id="pagination"></div>
            </div>

            <script>
               function clearse() {
                  this.value="";
               }
            
            
               $("#mapModal").on('shown.bs.modal', function() {
                  // id 속성값이 myModal인 element 에 지도를 표시하는 로직
                  setTimeout(function() {
                     map.relayout();
                  }, 1);
               });
               
               
               /*
                * 
                <div class="col-md-3 col-sm-3 animate-box"><div class="trainers-entry" id="health" data-toggle="modal" data-target="#mapModal"><div class="trainer-img" style="background-image: url(https://images.unsplash.com/photo-1578874691223-64558a3ca096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80)"></div><div class="desc"><h3>가까운 헬스장 찾기</h3><span>현재 위치를 바탕으로 </br>가까운 헬스장을 찾습니다</span></div></div></div>
                */
               // 마커를 담을 배열입니다
               var markers = [];
               var url;
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
               mapOption = {
                  center : new kakao.maps.LatLng(37.4801661, 126.8822284), // 지도의 중심좌표
                  //14124587.0606613,4506247.3661922
                  //,
                  level : 5
               // 지도의 확대 레벨
               };

               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption);

               // 장소 검색 객체를 생성합니다
               var ps = new kakao.maps.services.Places();

               // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
               var infowindow = new kakao.maps.InfoWindow({
                  zIndex : 1
               });

               // 키워드로 장소를 검색합니다
               searchPlaces();

               // 키워드 검색을 요청하는 함수입니다
               function searchPlaces() {

                  var keyword = document.getElementById('keyword').value
                        + '헬스';

                  if (!keyword.replace(/^\s+|\s+$/g, '')) {
                     alert('키워드를 입력해주세요!');
                     return false;
                  }

                  // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                  ps.keywordSearch(keyword, placesSearchCB);
               }

               // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
               function placesSearchCB(data, status, pagination) {
                  if (status === kakao.maps.services.Status.OK) {

                     // 정상적으로 검색이 완료됐으면
                     // 검색 목록과 마커를 표출합니다
                     displayPlaces(data);

                     // 페이지 번호를 표출합니다
                     displayPagination(pagination);

                  } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                     alert('검색 결과가 존재하지 않습니다.');
                     return;

                  } else if (status === kakao.maps.services.Status.ERROR) {

                     alert('검색 결과 중 오류가 발생했습니다.');
                     return;

                  }
               }

               // 검색 결과 목록과 마커를 표출하는 함수입니다
               function displayPlaces(places) {

                  var listEl = document.getElementById('placesList'), menuEl = document
                        .getElementById('menu_wrap'), fragment = document
                        .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

                  // 검색 결과 목록에 추가된 항목들을 제거합니다
                  removeAllChildNods(listEl);

                  // 지도에 표시되고 있는 마커를 제거합니다
                  removeMarker();
                  for (var i = 0; i < places.length; i++) {
                     // 마커를 생성하고 지도에 표시합니다
                     url = places[i].place_url;
                     
                     var placePosition = new kakao.maps.LatLng(
                           places[i].y, places[i].x), marker = addMarker(
                           placePosition, i, places[i].place_url), itemEl = getListItem(i,
                           places[i]); // 검색 결과 항목 Element를 생성합니다
                     
                     var namegym = places[i].place_name;
                     
                     // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                     // LatLngBounds 객체에 좌표를 추가합니다
                     //bounds.extend(placePosition);

                     // 마커와 검색결과 항목에 mouseover 했을때
                     // 해당 장소에 인포윈도우에 장소명을 표시합니다
                     // mouseout 했을 때는 인포윈도우를 닫습니다
                     (function(marker, title) {
                        kakao.maps.event.addListener(marker,
                              'mouseover', function() {
                                 //  map.setCenter(marker.position);
                                 displayInfowindow(marker, title);
                              //   map.panTo(placePosition);
                              });
                        
                        //url받아오기 - 마지막거만됨 ㅇ
                        

                        kakao.maps.event.addListener(marker,
                              'mouseout', function() {
                                 infowindow.close();
                              });

                        itemEl.onmouseover = function() {
                           //map.setCenter(marker.position);
                           displayInfowindow(marker, title);
                           console.log('아이템마우스오버' + title);
                           
                        };

                        itemEl.onmouseout = function() {
                           infowindow.close();
                        };
                     })(marker, places[i].place_name);
            
                     fragment.appendChild(itemEl);
                  }
                  

                  // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
                  listEl.appendChild(fragment);
                  menuEl.scrollTop = 0;

                  // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                  var moveLatLon = new kakao.maps.LatLng(places[0].y,
                        places[0].x);

                  // 지도 중심을 부드럽게 이동시킵니다
                  // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다

                  map.panTo(moveLatLon);
               }

               // 검색결과 항목을 Element로 반환하는 함수입니다
               function getListItem(index, places) {

                  var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
                        + (index + 1)
                        + '"></span>'
                        + '<div class="info">'
                        + '   <h5>'
                        + places.place_name + '</h5>';

                  if (places.road_address_name) {
                     itemStr += '    <span>' + places.road_address_name
                           + '</span>'
                           + '   <span class="jibun gray">'
                           + places.address_name + '</span>';
                  } else {
                     itemStr += '    <span>' + places.address_name
                           + '</span>';
                  }

                  itemStr += '  <span class="tel">' + places.phone
                        + '</span>' + '</div>';

                  el.innerHTML = itemStr;
                  el.className = 'item';

                  return el;
               }

               // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
               function addMarker(position, idx, title, url) {
                  var url = this.url;
                  var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                  imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
                  imgOptions = {
                     spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                     spriteOrigin : new kakao.maps.Point(0,
                           (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                     offset : new kakao.maps.Point(13, 37)
                  // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                  }, markerImage = new kakao.maps.MarkerImage(imageSrc,
                        imageSize, imgOptions), marker = new kakao.maps.Marker(
                        {
                           position : position, // 마커의 위치
                           image : markerImage
                        });
                  kakao.maps.event.addListener(marker,
                        'click', function() {
                           //  map.setCenter(marker.position);
                           window.open(url, "namegym", "width=925, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes,  top=200, left=500" );  
                           
                           setTimeout(function() {
                              win = window.open(url, "namegym", "width=925, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes,  top=200, left=500");  
                              win.document.body.innerHTML = '<img src ="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png">'
                           }, 30);console.log(url);
                        });

                  marker.setMap(map); // 지도 위에 마커를 표출합니다
                  markers.push(marker); // 배열에 생성된 마커를 추가합니다

                  return marker;
               }

               // 지도 위에 표시되고 있는 마커를 모두 제거합니다
               function removeMarker() {
                  for (var i = 0; i < markers.length; i++) {
                     markers[i].setMap(null);
                  }
                  markers = [];
               }

               // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
               function displayPagination(pagination) {
                  var paginationEl = document
                        .getElementById('pagination'), fragment = document
                        .createDocumentFragment(), i;

                  // 기존에 추가된 페이지번호를 삭제합니다
                  while (paginationEl.hasChildNodes()) {
                     paginationEl.removeChild(paginationEl.lastChild);
                  }

                  for (i = 1; i <= pagination.last; i++) {
                     var el = document.createElement('a');
                     el.href = "#";
                     el.innerHTML = i;

                     if (i === pagination.current) {
                        el.className = 'on';
                     } else {
                        el.onclick = (function(i) {
                           return function() {
                              pagination.gotoPage(i);
                           }
                        })(i);
                     }

                     fragment.appendChild(el);
                  }
                  paginationEl.appendChild(fragment);
               }

               // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
               // 인포윈도우에 장소명을 표시합니다
               function displayInfowindow(marker, title) {
                  var content = '<div style="padding:5px;z-index:1;">'
                        + title + '</br></div>';

                  infowindow.setContent(content);
                  infowindow.open(map, marker);
               }

               // 검색결과 목록의 자식 Element를 제거하는 함수입니다
               function removeAllChildNods(el) {
                  while (el.hasChildNodes()) {
                     el.removeChild(el.lastChild);
                  }
               }
            </script>

         </div>

      </div>
   </div>
</div>

<!-- 모달끝 -->
<!-- 칼로리 계산 모달창  -->
<div class="modal fade" id="kcalmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
               <h4 class="modal-title" id="myModalLabel">칼로리 계산</h4>
         </div>
      <div class="modal-body">
         <select id="selected" size="6" style="width: 80%;">
      <option id="수면" value="1">수면</option>
      <option id="달리기" value="3">달리기</option>
      <option id="플랭크" value="1.5">플랭크</option>
      <option id="철봉매달리기" value="2">철봉매달리기</option>
      <option id="줄넘기" value="3.5">줄넘기</option>
      <option id="2단줄넘기" value="4.5">2단줄넘기</option>
      <option id="걷기(시속 3km)" value="3">걷기(시속 3km)</option>
      <option id="걷기(시속 4km)" value="3.5">걷기(시속 4km)</option>
      <option id="" value="4">걷기(시속 5~6.4km)</option>
      <option id="" value="6">조깅(시속 6.5~7km)</option>
      <option id="" value="10">달리기(시속 8km)</option>
      <option id="" value="8">사이클(시속 15km)</option>
      <option id="" value="12">사이클(시속 20km)</option>
      <option id="" value="4">볼링</option>
      <option id="" value="10">줄넘기</option>
      <option id="" value="8">계단 오르기</option>
      <option id="" value="5">훌라후프</option>
      <option id="" value="8">스쿼트(버티기)</option>
      <option id="" value="2.5">스트레칭,요가</option>
      <option id="" value="7">축구</option>
      <option id="" value="6">국민체조</option>
      <option id="" value="7">수영</option>
      <option id="" value="7">버피테스트</option>
      <option id="" value="7.5">등산</option>
      <option id="" value="7">실내자전거</option>
   </select><br/>
   <input type="text" placeholder="몸무게를 입력" id="kg" style="border: 1px solid #767676; width: 150px; height: 35px; margin-top: 15px;" />kg&nbsp;
   <input type="text" placeholder="운동시간 입력(분)" id="m" style="border: 1px solid #767676; width: 150px; height: 35px;"/>분
   <div class="wrap" style="display: inline;">
  <button class="classname" id="btn">확인</button>
   </div><br/>
   <span style="color: red;" id="kclavalue"></span><br/>
   <span style="color: red;" id="kclavalue2"></span>
      </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>
<!-- 칼로리 계산 모달창  -->
<div class="col-md-2 col-sm-2 animate-box">
   <!--칼로리 계산기랑 연결-->
      <div class="trainers-entry" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#kcalmodal">
         <div class="trainer-img"
            style="background-image: url(https://health.chosun.com/site/data/img_dir/2019/04/29/2019042900839_0.jpg)"></div>
         <div class="desc">
            <h3>운동 칼로리 <br/>계산하기</h3>
            <span>운동 후 칼로리를 얼마나 소비하는지 간단하게 계산할 수 있습니다.</span>
         </div>
      </div>
   

</div>
</div><!-- row -->

</div>
</div>


<!-- 보충제 시작 -->
<div class="colorlib-blog">
   <div class="container">
      <div class="row" style="margin-bottom: 100px">
         <div class="col-md-12 text-center">
            <h2 style="font-size:3em; font-weight: bold">"운동은 끝나고 먹는것 까지가 운동이다"</h2>
         </div>
      </div>
      
      <div class="row">
         <div class="col-md-12 text-center" style="margin-bottom: 30px">
            <h2><b style="color: #f50057; font-size: 65px;">단백질</b>보충제/쉐이크</h2>
            <h3>근육성장의 3요소중 근육을 보강을 가져다 주는 역활을 하는 보충제!</h3>
         </div>
         <!-- 단백질 쉐이크 -->
         
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[0].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[0].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank1.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[0].proteinName }</span>
                  <h2><a href="blog.html">￦${list[0].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[1].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[1].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank2.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[1].proteinName }</span>
                  <h2><a href="blog.html">￦${list[1].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[2].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[2].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank3.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[2].proteinName }</span>
                  <h2><a href="blog.html">￦${list[2].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[3].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[3].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank4.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[3].proteinName }</span>
                  <h2><a href="blog.html">￦${list[3].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[4].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[4].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank5.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[4].proteinName }</span>
                  <h2><a href="blog.html">￦${list[4].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[5].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[5].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank6.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[5].proteinName }</span>
                  <h2><a href="blog.html">￦${list[5].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
      </div> <!-- row -->
      
      <hr>
      
      <!-- 다이어트 쉐이크 -->
      <div class="row">
         <div class="col-md-12 text-center" style="margin-bottom: 30px">
            <h2><b style="color: #f50057; font-size: 65px;">다이어트</b>보조제</h2>
            <h3>지방을 컷트해주는 효과적인 다이어트 방법!</h3>
         </div>
         
         
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[6].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[6].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank1.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[6].proteinName }</span> 
                  <h2><a href="blog.html">￦${list[6].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[7].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[7].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank2.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[7].proteinName }</span>
                  <h2><a href="blog.html">￦${list[7].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[8].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[8].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank3.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[8].proteinName }</span> 
                  <h2><a href="blog.html">￦${list[8].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[9].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[9].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank4.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[9].proteinName }</span> 
                  <h2><a href="blog.html">￦${list[9].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[10].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[10].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank5.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[10].proteinName }</span> 
                  <h2><a href="blog.html">￦${list[10].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
         <div class="col-md-4 animate-box">
            <article class="article-entry">
               <a href="${list[11].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[11].proteinImage}');">
                  <img src="<c:url value='/resources/images/btn_rank6.png'/>"/>
               </a>
               <div class="desc">
                  <p class="admin"><span>${list[11].proteinName }</span>
                  <h2><a href="blog.html">￦${list[11].proteinPrice }</a></h2>
                  <p>바로가기</p>
               </div>
            </article>
         </div>
      </div> <!-- row -->
   </div><!-- container -->
   
   <!-- modal start -->
   <div class="modal fade" id="youtubeModal" role="dialog">
      <div class="modal-dialog" style="width: 80%;">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">
                  <span>×</span>
               </button>
               <h3 class="modal-title" id="myModalLabel" style="color:black;font-weight:bold;font-size:2em;">Six<span style="color:white;background-color:red;border-radius: 20%">&nbsp;Tube&nbsp;</span></h3>
            </div>
            <div class="modal-body" style="min-height: 500px;">
            
               <div class="form-inline">
                    <div class="form-group">
                      <label for="searchExercise">운동</label>
                      <input type="text" class="form-control" id="searchExercise" onkeydown="javascript: if(event.keyCode == 13) {searchYoutube();}">
                   </div>
                 
                    <button class="btn btn-default" onclick="searchYoutube();">검색하기</button>
               </div>
               
               <fieldset style="border: 1px solid black;padding-bottom:30px;">
                  <legend style="border-bottom: none;text-align: center;width:auto;">검색하신 동영상</legend>
                  <div class="col-md-12" id="searchResult">
                     <div class="col-md-2 text-center">
                        
                     </div>
                  </div>
                  <hr/>
                  <div class="col-md-12 text-center" id="selectVideo" style="margin-top: 30px;">
                  
                  </div>
               
               </fieldset>
            
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>
   <!-- modal end -->
   
   <div id="sixtube_loading" class="display_none">
      <div><img src="<c:url value='/resources/images/sixtube_loading.gif'/>"/></div>
   </div>
   
</div>


<!-- 보충제 끝 -->

<input type="text" id="idsend" />
<script>
   jQuery(document).ready(function($) {

      $(".scroll").click(function(event) {
         event.preventDefault();
         $('html,body').animate({
            scrollTop : $(this.hash).offset().top
         }, 500);
      });
      

   });
   
   var page = 1;
   
   $('#mapSer').click(function(event) {
      console.log('asfd12323df2213');
   });
   
   function geos(){
      console.log("sd1");
   };

   /*  $(window).scroll(function () {
      
                 console.log($(window).scrollTop(), $(document).height(), $(window).height());
      //페이징 해서 저장
         if (page < 10) {
             if ($(window).scrollTop()+800 > ($(document).height() - $(window).height()) ) {
          
                 $(".appendd").append('<div class="animate-bos"><div class="col-md-5 col-md-offset-2 trainers-entry"><div class="trainer-img" style="background-image: url(images/classes-'+page+'.jpg); height:600px"></div><div class="desc"><h3>'+page+'번 게시물 아이디 들어갈곳</h3><span>'+page++ +'번 내용 </br>들어갈 곳</span></div></div></div></div>');
             }
         

         } else if(page==10){
             $(".appendd").append('<div class="col-md-8 col-md-offset-2 trainers-entry"><h2>페이지의 끝입니다</h2></div></div>');
         page++
         
         
         }
     
   });*/
   var health = document.getElementById('health');
   var healthimg = document.getElementById('healthimg');
   var modal = document.getElementById('mapModal');
   
   $('#health').on('mouseover',function(e){
      /*
      e.stopPropagtion;
      $('#healthimg').html('')
      $('#healthimg').append('<div class="aaa" style="height: 50%; background-color: #F0F0F0" ><span style="color: red;"> 해야하는나중에함</span><img src="resources/images/marker_.png" ></div><div style="height: 50%; background-color: gray;"><span style="color: red;"> 지도 검색</span><img src="resources/images/mapimg.png"></div>')
      $('.aaa').on('click',function(){
         
         
         console.log('aaaaaaaaaaaaaaaa')});
      */
      $('#img1').css('display','')
      $('#img2').css('display','')
   }).on('mouseout',function(){
      $('#img1').css('display','none')
      $('#img2').css('display','none')
      
   });
   $('#img1').click(function(){
      openWin = window.open('https://sixone-squrt-final.netlify.app', "namegym", "width=925, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes,  top=200, left=500" );  
   //https://sixone-flank.netlify.app
      

   })
   $('#img2').click(function(){
      openWin = window.open('https://sixone-runge.netlify.app', "namegym", "width=925, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes,  top=200, left=500" );  
   })
   /*
   health
         .addEventListener(
               'mouseover',
               function() {
                  //healthimg.innerHTML = '<div onclick="console.log(\'마우스오버:innerhtml\');" style="height: 50%; background-color: #F0F0F0" ><span style="color: red;"> 해야하는나중에함</span><img src="resources/images/marker_.png" ></div><div style="height: 50%; background-color: gray;"><span style="color: red;"> 지도 검색</span><img src="resources/images/mapimg.png">'+'</div>';
               
                  //healthimg.innerHTML = '<div style="height: 50%; background-color: #F0F0F0" >111111</div>'
                  //healthimg.innerHTML='<div id="aaa" style="height: 50%; background-color: #F0F0F0" ><span style="color: red;"> 해야하는나중에함</span><img src="resources/images/marker_.png" ></div><div style="height: 50%; background-color: gray;"><span style="color: red;"> 지도 검색</span><img src="resources/images/mapimg.png"></div>'

                  $('#healthimg').html('')
                  $('#healthimg').append('<div id="aaa" style="height: 50%; background-color: #F0F0F0" ><span style="color: red;"> 해야하는나중에함</span><img src="resources/images/marker_.png" ></div><div style="height: 50%; background-color: gray;"><span style="color: red;"> 지도 검색</span><img src="resources/images/mapimg.png"></div>')
                  
                  $('#aaa').on('click',function(){console.log('aaaaaaaaaaaaaaaa')});
               });
   */
   /*
   //  list.getElementsByClassName("child")[0].innerHTML = count;
   health
         .addEventListener(
               'mouseout',
               function() {
                  //healthimg.innerHTML = ''
                  console.log('마우스 아웃:')
                  
                  
                  //healthimg.innerHTML = '<div class="trainer-img" id="healthimg" style="background-image: url(https://images.unsplash.com/photo-1578874691223-64558a3ca096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80)"></div>';
               });*/
               
   //유튜브
   function youtubeClick(){
      $('#youtubeModal').modal('show');
      $('#searchExercise').val('');
      $('#selectVideo').html('');
   }
   
   // 유튜브 검색
   function searchYoutube(){
      word = $('#searchExercise').val();
      $('#selectVideo').html('');
      
      $.ajax({
           type: "get",
           url: "http://115.91.88.230:8282/searchYoutube",
           data: {
               'word': word,             
            },
           success: function(response){
              var sql = '<img src="'+response['videoHref'][0]+'"/>'  
              var sql = '';              
              for(var i=0;i < response['videoName'].length;i++){      
                    sql += '<a href="#;" onclick="showVideo(\''+response['videoHref'][i]+'\');">';
                    sql += '<div class="col-md-3 text-center">';           
                 sql += '<img src="'+response['videoImg'][i]+'" alt="이미지입니다"/>'
                 sql += '<span class="videoName">'+response['videoName'][i]+'</span>'
                 sql += '</div></a>'
                 
              }
              $('#searchResult').html(sql);
           
           },
           beforeSend: function () {
              $('#sixtube_loading').removeClass('display_none');
           },
           complete: function () {
              $('#sixtube_loading').addClass('display_none');
          },
           error:function(request,error){
               console.log('상태코드:',request.status);
               console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
               console.log('에러:',error);
         }
      });
   }
   
   function showVideo(video){
      console.log(video);
      var sql = '<iframe width="60%" src="'+video+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="min-height:500px"></iframe>'      
      $('#selectVideo').html(sql);
   }
               
</script>
</html>