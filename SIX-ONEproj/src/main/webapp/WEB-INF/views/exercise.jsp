<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baec786c99350c041ef35a31dcf9afcf&libraries=services"></script>


<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background: url(resources/images/gymimg.png) no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -0px;
}

#placesList .item .marker_2 {
	background-position: 0 -36px;
}

#placesList .item .marker_3 {
	background-position: 0 -73px
}

#placesList .item .marker_4 {
	background-position: 0 -110px;
}

#placesList .item .marker_5 {
	background-position: 0 -146px;
}

#placesList .item .marker_6 {
	background-position: 0 -182px;
}

#placesList .item .marker_7 {
	background-position: 0 -219px;
}

#placesList .item .marker_8 {
	background-position: 0 -255px;
}

#placesList .item .marker_9 {
	background-position: 0 -325px;
}
#placesList .item .marker_10 {
	background-position: 0 -358px;
}
#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
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
								<h1>운동하기</h1>
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

<div id="colorlib-about">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 row-pb-md animate-box">
				<iframe width="100%" height="430"
					src="https://www.youtube.com/embed/8VtkpMGw0hw" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>

				<!--<div class="video colorlib-video" style="background-image: url(images/img_bg_1.jpg);">
							<a href="https://vimeo.com/channels/staffpicks/93951774" class="popup-vimeo"><i class="icon-play3"></i></a>
							<div class="overlay"></div>
						</div>-->
			</div>
			<div class="col-md-10 col-md-offset-1 text-center animate-box">
				<div class="about-wrap">
					<div class="heading-2">
						<h2>실내, 야외, 헬스장 등 어디에서든지 운동할수 있습니다.</h2>
					</div>
					<p>집에서도 간단히 즐길수 있는 운동, 산책하듯이 즐길수 있는 운동, 가까운 헬스장을 안내해 드립니다.</p>
					<p>어쩌저쩌고</p>
					<p>어쩌저쩌고</p>
					<p>내용채우기용 끝</p>
					<!--p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p-->
				</div>
			</div>
		</div>
	</div>
</div>




<div class="colorlib-trainers">
	<div class="container">
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
				<h2 id="Exercise">
					물방울이 바위를 뚫을 수 있는 이유는 </br>힘이 아니라바로 꾸준함에 있다
				</h2>
				<p>낙숫물이 바위를 뚫듯 꾸준함을 이길 수 있는 것은 없습니다. 무언가 포기하는 마음이 생길 때 이 말을 떠올려
					보면 좋을 것 같습니다. 행복한 하루 되세요</p>
			</div>
		</div>
		<div class="row">
			<!--실내운동 연결 -->
			
				<div class="col-md-3 col-sm-3 animate-box" data-toggle="modal"
		data-target="#mapModal">

					<div class="trainers-entry">
						<div class="trainer-img"
							style="background-image: url(https://images.unsplash.com/photo-1578874691223-64558a3ca096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80)"></div>
						<div class="desc">
						
							<h3>가까운 헬스장 찾기</h3>
			<span>현재 위치를 바탕으로</br>
가까운 헬스장을 찾습니다</span>
		</div>
	</div>
</div>

<div class="col-md-3 col-sm-3 animate-box">
	<div class="trainers-entry">
		<div class="trainer-img"
			style="background-image: url(https://cdn.pixabay.com/photo/2016/03/26/22/47/blur-1281675_960_720.jpg)"></div>
		<div class="desc">
			<h3>야외운동</h3>
			<span>신선한 공기를 마시며 운동해보세요 </span>
		</div>
	</div>
</div>

<div class="col-md-3 col-sm-3 animate-box">

	<div class="trainers-entry" id="health"  >

		<div class="trainer-img" id="healthimg"
			style="background-image: url(https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BBfc6b6/_h400_w284_m1_bwhite.jpg)">
			<div id='img1' style="height: 50%; background-color: #F0F0F0;display:none" >
				<span style="color: red;"> 스쿼트</span>
				<img src="resources/images/sqart.png" >
			</div>
			<div id='img2' style="height: 50%; background-color: gray;display:none">
				<span style="color: red;"> 런지</span>
				<img src="resources/images/Lunge.png">
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
						console.log('모달나옴');
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
								console.log(places[i]);
							// 마커를 생성하고 지도에 표시합니다
							console.log(places);
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
										//	map.panTo(placePosition);
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




<div class="col-md-3 col-sm-3 animate-box">
	<!--칼로리 계산기랑 연결-->
	<a href="<c:url value='/food.do'/>">
		<div class="trainers-entry">
			<div class="trainer-img"
				style="background-image: url(https://cdn.pixabay.com/photo/2016/04/15/17/20/bread-and-butter-1331452_960_720.jpg)"></div>
			<div class="desc">
				<h3>칼로리 계산하기</h3>
				<span>칼로리를 얼마나 소비하는지 간단하게 계산할 수 있습니다.</span>
			</div>
		</div>
	</a>

</div>
</div>
</div>
</div>
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
		console.log('마우스 오보')
	}).on('mouseout',function(){
		$('#img1').css('display','none')
		$('#img2').css('display','none')
		console.log('마우스 아웃')
		
	});
	$('#img1').click(function(){
		openWin = window.open('https://elastic-pare-1dc9f1.netlify.app', "namegym", "width=925, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes,  top=200, left=500" );  
	
		
		openWin.document.myChildForm.idsend = "김성준";
		

	})
	$('#img2').click(function(){
		console.log('클릭 이벤트 런지')
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
</script>
</html>

