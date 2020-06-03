<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<style>
		.my-info{
			margin: 17px;
		}
		
		.my-info:first-child{
			border-right: 2px dotted #1a252f;
		}
		.my-prograss{
			
		}
		
		span{
			font-size: 2em;
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
				<div class="row">
					<div class="col-md-12 text-center">
						<h2>이번주 챌린지</h2>
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
						<div class="text-left">
							<p style="font-size:1em">※챌린지는 한번에 하나만 진행 할 수 있습니다</p>
						</div>
					</div> <!-- col-md-10  -->
				</div> <!-- row  -->
				
				<div class="row" style="margin-top: 50px">
					<div class="col-md-12">
						<div class="col-md-4 my-info text-center">
							<div class="my-prograss">
								<span>챌린지 달성률</span>
								<div>
								<a href="#">
									<svg xmlns="http://www.w3.org/2000/svg" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
										<path fill-opacity="0" stroke-width="1" stroke="#bbb" d="M81.495,13.923c-11.368-5.261-26.234-0.311-31.489,11.032C44.74,13.612,29.879,8.657,18.511,13.923  C6.402,19.539,0.613,33.883,10.175,50.804c6.792,12.04,18.826,21.111,39.831,37.379c20.993-16.268,33.033-25.344,39.819-37.379  C99.387,33.883,93.598,19.539,81.495,13.923z"/>
										<path id="heart-path" fill-opacity="0" stroke-width="3" stroke="#ED6A5A" d="M81.495,13.923c-11.368-5.261-26.234-0.311-31.489,11.032C44.74,13.612,29.879,8.657,18.511,13.923  C6.402,19.539,0.613,33.883,10.175,50.804c6.792,12.04,18.826,21.111,39.831,37.379c20.993-16.268,33.033-25.344,39.819-37.379  C99.387,33.883,93.598,19.539,81.495,13.923z"/>
									</svg>
								</a>
									<span style="font-size:30px">60%</span>
								</div>
							</div>
						</div>
						
						<div class="col-md-7 my-info">
							<div >
								<span>완성한 챌린지</span>
								<div style="font-size: 0.7em;">
									<span >
										스쿼트 300개 챌린지
									</span>
								</div>
		
							</div>
						</div>
						
					</div>
					
					
				</div> <!-- row -->
				
			</div> <!-- container -->
			

	
	</body>
	<script src="https://rawgit.com/kimmobrunfeldt/progressbar.js/1.0.0/dist/progressbar.js"></script>
	<script>
		function moveToInfo(){
			
			location.href = "<c:url value='/challengeInfo.do'/>";
		}
		
		
		var bar = new ProgressBar.Path('#heart-path', {
			easing: 'easeInOut',
			duration: 2000
		});

		bar.set(0);
		//아래에 달성률 넣기
		bar.animate(0.6);  
		
		
		
		
		

	</script>
</html>

