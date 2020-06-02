<%@page import="com.team.sixone.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<img src="resources/images/black.jpg"
	style="width: 100%; height: 100px;" />
<%
DAO dao = new DAO(request.getSession().getServletContext());
String[] images;
if(request.getParameter("search")!=null){
	//뭔가 검색했을때
	images = dao.SearchTest();
}else{
	images = dao.test();
}
	
%>

<script>

//이미지 올리기전 미리보기
function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		img.setAttribute("style", "width:100%;height:100%"); 
		document.querySelector("#image_container").innerHTML = "";
		document.querySelector("#image_container").appendChild(img); 
		}; 
	reader.readAsDataURL(event.target.files[0]);
}


function isSaved(event){ //세이브 체크박스
	 if($("input:checkbox[name='saveRadio']").is(":checked")){
		 console.log('체크');
	 }else{
			document.querySelector("#image_container").innerHTML = "";
			$("#imgform")[0].reset();
	 }

}

</script>
<!--  본문 -->
<div class="col-md-3 col-md-offset-2 trainers-entry follow"
	style="padding-top: 100px; width: 250px; background-color: aqua;">
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary " data-toggle="modal"
		data-target="#wirteModal">글 작성하기</button>
		

	<!-- Modal -->
	<div class="modal fade" id="wirteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">글 작성하기</h4>
				</div>
				<div class="modal-body">
					<!-- 글작성 폼 -->
					
					<div class="form-group">
					<form action="<c:url value='/upload.do'/>" enctype="multipart/form-data" method="POST" id="imgform">
						<div id="image_container"></div>
						<label for="exampleInputFile">사진 업로드</label> <input type="file"
							id="image" name="image" onchange="setThumbnail(event);">
						<p class="help-block">이미지 파일만 업로드 가능합니다</p>
					
					
						<div class="form-group">
							<label for="exampleInputEmail1">내용</label>
							<textarea class="form-control" id="inscontent" rows="4" placeholder="내용 입력"></textarea>
						</div>
					
					<div class="checkbox">
					<label> <input type="checkbox" name="saveRadio" checked="checked"> 내용 임시 저장하기
					</label>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-default"/>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="isSaved();">취소하기</button>
				</div>
					<!-- 글작성 폼 끝 -->
					</form>
				</div>
				
				
				</div>
				
			</div>
		</div>
	</div>

	<!-- 모달끝 -->
	<button type="button" class="btn btn-default  btn-block">어쩌고저쩌고</button>



	<form class="form-inline" style="padding-top: 5px" method="GET">
		<div class="form-group">
			<label class="sr-only" for="searchtxt">검색하기</label> 
			<input type="text" class="form-control" id="searchtxt" placeholder="검색..." name="search" style="width: 85%; height: 33px;"/> 
			
			<input type="submit" value="" style="width:27px; height:27px; padding-left:5px; background-image:url(resources/images/icon_search.png);background-size:27px 27px; background-color:white"></input>

		</div>
	</form>
	<p style="color: gray;">실시간 인기 검색어 </p>

</div>




<div class="col-md-6  appendd" style="padding-top: 10px;">
	<div class="animate-box">
		<div class="trainers-entry">
			<div class="trainer-img"
				style="background-image: url('<%=images[0]%>'); height: 600px"></div>
			<div class="desc">
				<h3>처음 로딩된 게시물 아이디</h3>
				<span> 내용 </br>들어갈 곳
				</span>
			</div>
		</div>

	</div>
</div>
</div>




</div>

<div class="gototop js-top">
	<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>



<script>




jQuery(document).ready(function($) {

	var images = Array();
	//자바코드로 배열받은거 => JS배열로 변환
	<%for (int i = 0; i < images.length; i++) {%>
		images[<%=i%>] = '<%=images[i]%>';
<%}%>
	var page = 1;
						var followFlag = true;

						//화면 크기 줄일때 오른쪽 메뉴 삭제, 늘리면 다시 추가
						$(window).resize(function() {
							if ($(window).width() < 970 && followFlag) {
								//	$('.follow *').remove();
								$('.follow *').hide();
								followFlag = false;
							} else if ($(window).width() > 970 && !followFlag) {
								$('.follow *').show();
								//$('.follow').append('<img src="${aaa }" style="width: 100%; height: 500px;" /><p style="color: black;">대충 따라오는 메뉴</p>');
								followFlag = true;
							}
						});
						//클릭할때 사진보여줄예정(SelectOne)
						$('.appendd').click(function() {
							console.log($(this).attr());

						});

						$(window)
								.scroll(
										function() {
									
											//스크롤 따라오는 좌측메뉴 $(window).scrollTop()+30'px' 넣으면 왠진 모르겟는데 애가 미쳐돌아감
											if (($(window).scrollTop() + 500 < ($(document).height() - $(window).height()))
													&& $('.follow').is(":visible")) {$('.follow').attr(
																'style',
																('padding-top :'
																		+ ($(
																				window)
																				.scrollTop() + 100) + 'px; width: 250px'));
											}

											console.log($(window).scrollTop(),
													$(document).height(), $(
															window).height());
											//페이징 해서 붙이기
											if (page <
<%=images.length%>
	) {
												if ($(window).scrollTop() + 800 > ($(
														document).height() - $(
														window).height())) {

													$(".appendd")
															//카루셀도..대응시켜야..하는p
															.append(
																	'<div class="animate-bos"><div class="trainers-entry"><div class="trainer-img" style="background-image: url('
																			+ images[(page)]
																			+ '); height:600px"></div><div class="desc"><h3>'
																			+ page
																			+ '번 게시물 아이디 들어갈곳</h3><span>'
																			+ page++
																			+ '번 내용 </br>들어갈 곳</span></div></div></div></div>');
												}

											} else if (page ==
<%=images.length%>
	) { // 로딩이 끝났을때, 실제 DB연동에서는 page == images.size()-1
												$(".appendd")
														.append(
																'<div class="trainers-entry"><h2>　</h2><h2>페이지의 끝입니다</h2></div></div>');
												page++

											}

										});
					});
</script>
</html>

