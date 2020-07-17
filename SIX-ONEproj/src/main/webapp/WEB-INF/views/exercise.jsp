<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baec786c99350c041ef35a31dcf9afcf&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/exerciseCSS.css'/>" >
<script src="<c:url value='/resources/js/exerciseJS.js'/>"></script>
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
			<div class="col-md-3 col-sm-3 animate-box" data-toggle="modal"data-target="#mapModal">
			
				<div class="trainers-entry">
					<div class="trainer-img"
						style="background-image: url(https://images.unsplash.com/photo-1578874691223-64558a3ca096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80)">
					</div>
					<div class="desc">
						<h3>가까운 헬스장 찾기</h3>
						<span>현재 위치를 바탕으로<br/>
						가까운 헬스장을 찾습니다</span>
					</div>
				</div>
			</div>



<div class="col-md-3 col-sm-3 animate-box">

	<div class="trainers-entry" id="health"  >

		<div class="trainer-img" id="healthimg" style="background-image: url(https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BBfc6b6/_h400_w284_m1_bwhite.jpg)">
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


<div class="col-md-3 col-sm-3 animate-box">
   <a href="<c:url value='/food.do'/>">
      <div class="trainers-entry">
         <div class="trainer-img"
            style="background-image: url(https://cdn.pixabay.com/photo/2016/04/15/17/20/bread-and-butter-1331452_960_720.jpg)">
         </div>
         <div class="desc">
            <h3>내가 먹은 칼로리 계산하기</h3>
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
		<option value="1">수면</option>
		<option value="3">달리기</option>
		<option value="1.5">플랭크</option>
		<option value="2">철봉매달리기</option>
		<option value="3.5">줄넘기</option>
		<option value="4.5">2단줄넘기</option>
		<option value="3">걷기(시속 3km)</option>
		<option value="3.5">걷기(시속 4km)</option>
		<option value="4">걷기(시속 5~6.4km)</option>
		<option value="6">조깅(시속 6.5~7km)</option>
		<option value="10">달리기(시속 8km)</option>
		<option value="8">사이클(시속 15km)</option>
		<option value="12">사이클(시속 20km)</option>
		<option value="4">볼링</option>
		<option value="10">줄넘기</option>
		<option value="8">계단 오르기</option>
		<option value="5">훌라우프</option>
		<option value="8">스쿼트(버티기)</option>
		<option value="2.5">스트레칭,요가</option>
		<option value="7">축구</option>
		<option value="6">국민체조</option>
		<option value="7">수영</option>
		<option value="7">버피테스트</option>
		<option value="7.5">등산</option>
		<option value="7">실내자전거</option>
	</select><br/>
	<input type="text" placeholder="몸무게를 입력" id="kg" style="border: 1px solid #767676; width: 150px; height: 35px; margin-top: 15px;" />
	<input type="text" placeholder="운동시간 입력(분)" id="m" style="border: 1px solid #767676; width: 150px; height: 35px;"/>분
	<div class="wrap" style="display: inline;">
  <button class="button" id="btn"  style=" width: 70px; font-size: 15px;">확인</button>
	</div><br/>
	<span style="color: red;" id="kclavalue"></span>
		</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 칼로리 계산 모달창  -->
<div class="col-md-3 col-sm-3 animate-box">
	<!--칼로리 계산기랑 연결-->
		<div class="trainers-entry" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#kcalmodal">
			<div class="trainer-img"
				style="background-image: url(https://health.chosun.com/site/data/img_dir/2019/04/29/2019042900839_0.jpg)"></div>
			<div class="desc">
				<h3>운동 칼로리 계산하기</h3>
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
		console.log('마우스 오보')
	}).on('mouseout',function(){
		$('#img1').css('display','none')
		$('#img2').css('display','none')
		console.log('마우스 아웃')
		
	});
	$('#img1').click(function(){
		openWin = window.open('https://sixone-squrt-counter.netlify.app/', "namegym", "width=925, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes,  top=200, left=500" );  
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
</script>
</html>

