<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<title>모두다짐</title>
	
	
	<script>
	jQuery(document).ready(function($) {
		var followFlag = true;
		
		
		$( window ).resize( function() {
			if($(window).width()<970 && followFlag){
				$('.follow *').hide();
				followFlag = false;
			}else if($(window).width()>970 && !followFlag){
				$('.follow *').show();
				followFlag = true;
			}
		});	
	$(window)
	.scroll(
			function() {
				if ($(window).scrollTop() + 200 < ($(document).height() - $(window).height())) {
					$('.follow').attr('style',('padding-top :'+ $(window).scrollTop()+'px') );
				}
			})
			
		});
	
	$(function(){
		
		 //3]AJAX사용-JSON데이타로 응답받기       
		$('#rr').click(function(){
			$.ajax({
				url:"<c:url value='/Ajax/AjaxJson.do'/>",
				data:{id:'rr'},//안줘도 돌아감 게시판구분용으로  window.onload 백그라운드 진행
				dataType:'json',
				success:function(data){
					var option="";
					$.each(data,function(key,value){
						option+="<h2>"+value+"</h2>";
					});
					$('#hell').html(option);
					$('#1num').css("background-color", 'white');
					$('#2num').css("background-color", 'black');
					$('#3num').css("background-color", 'white');
				}
			});
		});
		
	});
	
	
	</script>
	<style>
.button {
	background-color: black;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
li.active{
background-color: black;
}

a.aa:hover {
	text-decoration: underline;
	font-weight: bold;
	color: blue;
	font-style: normal;
}

a:link {
	color: black;
	text-decoration: none;
}
</style>
	<style type="text/css">
</style>

	</head>
	<body>
	<img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
	
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-2 follow" style="padding-top:100px;">
		<!-- 카루셀 -->
		<div id="carousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel" data-slide-to="0" class="active"></li>
				<li data-target="#carousel" data-slide-to="1"></li>
				<li data-target="#carousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/images/11.jpg" alt="바1" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item">
					<img src="resources/images/22.jpg" alt="바2" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
					<div class="item">
					<img src="resources/images/33.jpg" alt="바3" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
				...
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel"
				role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		</div>
		<!-- 카루셀1 -->
		
		<div class="col-md-8">
		<div class="col-md-1"></div>
			<div class="col-md-10">
			<div id="header_box">
					<div class="bbs_title">
						<p>글적용되는곳</p>
					</div>
					<div class="desc">글적는곳</div>
					<div class="side">사이드 적는곳</div>
				</div>


					
						
					
					
					 
					
				
				<div class="row">
					<div class="col-md-12">
					<ul class="nav nav-pills">
					<li id="1num" style="background-color: black; border-style:solid; "><a href="<c:url value='/freeboard.do?id=fr'/>">자유게시판</a></li>
					<li id="2num" style="background-color: white;border-style: groove; "><a id="rr" href="#">루틴 공유</a></li>
					<li id="3num" style="background-color: white;border-style: solid;"><a id="an" href="<c:url value='/freeboard.do?id=an'/>">익명게시판</a></li>
					</ul>
						<table id="hell" class="table table-bordered table-hover text-center" style="color:black; font-family:sans-serif;" id="tab">
						<thead >			
							<tr class="ub-content"style="text-size:15px;  border-bottom-style:solid; border-bottom-color: black; border-top-style: solid; border-top-color: black">
								<th class="col-md-1 text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="col-md-2 text-center">작성자</th>
								<th class="col-md-2 text-center">작성일</th>
								<th class="col-md-1 text-center">조회수</th>
								<th class="col-md-1 text-center">추천</th>
							</tr>
								
										<tr class="hoo">
											<td><span class="blink" style="font-family: Fantasy">HOT</span></td>
												<td class="text-left"><a class="aa" href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자
														루틴 추천해준다</a></td>
												<td>다짐하자</td>
												<td>20-05-15</td>
												<td>27</td>
												<td>5</td>
											</tr>
											
											<tr class="hoo">
												<td><span class="blink" style="font-family: Fantasy">HOT</span></td>
												<td class="text-left"><a class="aa"
													href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">프로틴 가성비 TOP 10</a></td>
												<td>프로틴중독자</td>
												<td>20-05-10</td>
												<td>88</td>
												<td>45</td>
											</tr>
									<tr class="hoo">
										<td>1</td>
										<td class="text-left"><a class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>2</td>
										<td class="text-left"><a class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>3</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">오늘밤도 치킨이지</a></td>
										<td>치킨먹자</td>
										<td>20-05-18</td>
										<td>30</td>
										<td>1</td>
									</tr>
									<tr class="hoo">
										<td>4</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>5</td>
										<td class="text-left"><a class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>6</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a  class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									
									</thead>
						</table>
						<ul class="nav nav-pills">
					<li class="active" style="background-color: white"><a href="<c:url value='/freeboard.do?id=dd'/>">자유게시판</a></li>
					<li style="background-color: white"><a href="<c:url value='/freeboard.do?id=ru'/>">루틴 공유</a></li>
					<li style="background-color: white"><a href="<c:url value='/freeboard.do?id=an'/>">익명게시판</a></li>
					<li style="float: right"><a href="<c:url value='/Dataroom/Write.jsp?id=${session.id}'/>" class="btn btn-success">글쓰기</a></li>
				</ul>
					</div>
				
				</div>
				
			<div class="row">
					<div style="font-size: 20px; font-style: oblique;" class="col-md-12 text-center">1 | 2 | 3 | 4 | 5</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			</div>
			
		<!-- 카루셀 -->
		<div class="col-md-2 follow" style="padding-top:100px;">
		<div id="carousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel2" data-slide-to="3" class="active"></li>
				<li data-target="#carousel2" data-slide-to="4"></li>
				<li data-target="#carousel2" data-slide-to="5"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/images/44.jpg" alt="바4" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item">
					<img src="resources/images/55.jpg" alt="바5" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
					<div class="item">
					<img src="resources/images/66.jpg" alt="바6" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
				...
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel2" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel2"
				role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		</div>
		</div><!-- row -->
		<!-- 카루셀 -->
		
		
		
		
		
		
			
			</div>
	

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js' />"></script>
	<!-- Bootstrap -->
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<!-- Waypoints -->
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js' />"></script>
	<!-- Stellar Parallax -->
	<script src="<c:url value='/resources/js/jquery.stellar.min.js' />"></script>
	<!-- Flexslider -->
	<script src="<c:url value='/resources/js/jquery.flexslider-min.js' />"></script>
	<!-- Owl carousel -->
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<!-- Magnific Popup -->
	<script src="<c:url value='/resources/js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='/resources/js/magnific-popup-options.js' />"></script>
	<!-- Counters -->
	<script src="<c:url value='/resources/js/jquery.countTo.js' />"></script>
	<!-- Main -->
	<script src="<c:url value='/resources/js/main.js' />"></script>

	</body>
</html>




