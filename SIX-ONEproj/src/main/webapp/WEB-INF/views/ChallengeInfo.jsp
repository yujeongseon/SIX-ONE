<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<style>
		.item > img {
			height: 30%; 
			width: 100%;
		}
		.my-circle{
			border: 3px solid black;
			border-radius: 50%;
			height: 100px;
			margin: 30px;
			line-height: 90px;
			text-align: center;
		}
		.info-font{
			font-size: 1.8em;
			color: black;
			font-weight: bold; 
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
											<h2><span><a href="index.html">Home</a> | <a href="index.html">챌린지</a> | <a href="#Exercise" class="scroll" style="color:white">바로가기</a></span></h2>
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
						<img src="<c:url value='resources/images/do5.jpg'/>" style="height: 500px; width: 100%" alt="...">
					</div> <!-- row -->
				</div>
			</div>
			
			
			<div class="container">
				<div class="row">
					<h2>하루 스쿼트 500개 챌린지</h2>
					<h3>만든사람 아이디 : kim</h3>
				</div> <!-- row -->
			</div> <!-- container -->
			
			<div class="container ">
				<div class="row col-md-offset-3">
					<div class="col-md-2 my-circle"><span class="info-font">4</span> 주</div>
					<div class="col-md-2 my-circle">주 <span class="info-font" >4</span> 회</div>
					<div class="col-md-2 my-circle"><span class="info-font">맨몸</span></div>
				</div> <!-- row -->
			</div> <!-- container -->
	
	
	
	
	
	</body>

	<script>
		



	</script>
</html>

