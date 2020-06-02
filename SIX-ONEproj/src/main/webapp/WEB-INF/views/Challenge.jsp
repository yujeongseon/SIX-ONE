<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<style>
		.item > img {
			height: 500px; 
			width: 100%;
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
											<h1>챌린지</h1>
											<h2><span><a href="index.html">Home</a> | <a href="#Exercise" class="scroll" style="color:white">바로가기</a></span></h2>
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
						<div class="col-md-10 col-md-offset-1 text-center animate-box">
							<div class="about-wrap">
								<div class="heading-2">
									<h2 style="font-size:3em">"BREAK ME DOWN TO BUILD ME UP"</h2>
								</div>
								<p style="font-size:2em">"원하는 몸을 만들기 위해 지금의 몸을 부수자"
									<br/>매주 바뀌는 챌린지를 통해  당신의 한계에 도전하세요
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			
			<div class="container">
				<div id="challenge-carousel" class="carousel slide" data-ride="carousel" >
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#challenge-carousel" data-slide-to="0" class="active"></li>
				    <li data-target="#challenge-carousel" data-slide-to="1"></li>
				    <li data-target="#challenge-carousel" data-slide-to="2"></li>
				  </ol>
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" >
				    <div class="item active">
				      <a href="javascript:moveToInfo()"><img src="<c:url value='resources/images/do5.jpg'/>" style="height: 500px; width: 100%" alt="..."></a>
				      <div class="carousel-caption">
				       	초급자
				      </div>
				    </div>
				    <div class="item">
				      <a href="#"><img src="<c:url value='resources/images/do6.jpg'/>" style="height: 500px; width: 100%" alt="..."></a>
				      <div class="carousel-caption">
				      	중급자
			      	  </div>
				    </div>
				    <div class="item">
				      <a href="#"><img src="<c:url value='resources/images/do7.jpg'/>" style="height: 500px; width: 100%" alt="..."></a>
				      <div class="carousel-caption">
				      	숙련자
			      	  </div>
				    </div>
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#challenge-carousel" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#challenge-carousel" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>

				<div class="row">
					현재 달성중인 거
				
				
				
				
					ㄴㅇㄴ
					
					ㄴㅇ
				
				</div>
			</div> <!-- container -->
			

	
	</body>

	<script>
		function moveToInfo(){
			
			location.replace("<c:url value='/challengeInfo.do'/>");
			
		}

	</script>
</html>

