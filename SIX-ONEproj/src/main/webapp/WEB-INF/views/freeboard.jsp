<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<script>
	
	</script>
	<style>
	a.aa:hover{ 
	text-decoration:underline; 
	}
	
	tr.hoo:hover{
	background-color: #E6E6E6;
	}
	
	
	</style>

	<body>
	<img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
		
	<div class="colorlib-loader"></div>

	<div id="page">
		
			<div class="overlay"></div>
			<div class="colorlib-trainers">
			<div style="background-image: url(resources/images/img_bg_5.png);">
				<div class="container">

		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-pills">
					<li class="active" style="background-color: white"><a id="fr"  href="<c:url value='/freeboard.do?id=fr'/>">자유게시판</a></li>
					<li style="background-color: white"><a id="ru" href="#">루틴 공유</a></li>
					<li style="background-color: white"><a id="an" href="<c:url value='/freeboard.do?id=an'/>">익명게시판</a></li>
				</ul>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered table-hover text-center" style="color : black; font-family:sans-serif; background-color: white;" id="tab">
						<thead>			
							<tr class="ub-content"style="text-size:15px; border-bottom-style:solid; border-bottom-color: black; border-top-style: solid; border-top-color: black">
								<th class="col-md-1 text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="col-md-2 text-center">작성자</th>
								<th class="col-md-1 text-center">작성일</th>
								<th class="col-md-1 text-center">조회수</th>
								<th class="col-md-1 text-center">추천</th>
							</tr>
								
										<tr class="hoo">
											<td><span class="blink" style="font-family: Fantasy">HOT</span></td>
												<td class="text-left"><a class="aa" style="color:black;" href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자
														루틴 추천해준다</a></td>
												<td>다짐하자</td>
												<td>20-05-15</td>
												<td>27</td>
												<td>5</td>
											</tr>
											
											<tr class="hoo">
												<td><span class="blink" style="font-family: Fantasy">HOT</span></td>
												<td class="text-left"><a style="color:black;" class="aa"
													href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">프로틴 가성비 TOP 10</a></td>
												<td>프로틴중독자</td>
												<td>20-05-10</td>
												<td>88</td>
												<td>45</td>
											</tr>
									<tr class="hoo">
										<td>1</td>
										<td class="text-left"><a style="color:black;" class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>2</td>
										<td class="text-left"><a style="color:black;" class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>3</td>
										<td class="text-left"><a style="color:black;" class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">오늘밤도 치킨이지</a></td>
										<td>치킨먹자</td>
										<td>20-05-18</td>
										<td>30</td>
										<td>1</td>
									</tr>
									<tr class="hoo">
										<td>4</td>
										<td class="text-left"><a style="color:black;" class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>5</td>
										<td class="text-left"><a style="color:black;" class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>6</td>
										<td class="text-left"><a style="color:black;" class="aa"
											href="<c:url value='/DataRoom/View.work?no=${item.no}&nowPage=${nowPage}'/>">초보자 루틴 추천해준다</a></td>
										<td>다짐하자</td>
										<td>20-05-15</td>
										<td>27</td>
										<td>5</td>
									</tr>
									<tr class="hoo">
										<td>7</td>
										<td class="text-left"><a style="color:black;" class="aa"
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
					<div class="col-md-12 text-center">1 | 2 | 3 | 4 | 5</div>
				</div>
			</div>
		</div>
		
				
			</div>
			</div>
			</div>
		
		





		<div class="colorlib-blog colorlib-light-grey">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
						<h2>인기있는 타임라인</h2>
						<p>소중한 운동 일상을 여러 사람들과 공유하세요</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="blog.html" class="blog-img" style="background-image: url(resources/images/blog-1.jpg);">
								<p class="meta"><span class="day">18</span><span class="month">Apr</span></p>
							</a>
							<div class="desc">
								<p class="admin"><span>Posted by:</span> <span>Noah Henderson</span></p>
								<h2><a href="blog.html">Need workout motivation?</a></h2>
								<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="blog.html" class="blog-img" style="background-image: url(resources/images/blog-2.jpg);">
								<p class="meta"><span class="day">18</span><span class="month">Apr</span></p>
							</a>
							<div class="desc">
								<p class="admin"><span>Posted by:</span> <span>Noah Henderson</span></p>
								<h2><a href="blog.html">Need workout motivation?</a></h2>
								<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="blog.html" class="blog-img" style="background-image: url(resources/images/blog-3.jpg);">
								<p class="meta"><span class="day">18</span><span class="month">Apr</span></p>
							</a>
							<div class="desc">
								<p class="admin"><span>Posted by:</span> <span>Noah Henderson</span></p>
								<h2><a href="blog.html">Need workout motivation?</a></h2>
								<p>Even the all-powerful Pointing hass no control about the blind texts it is an almost unorthographic life</p>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	




