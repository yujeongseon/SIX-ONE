<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<div class="col-md-8 col-md-offset-2 row-pb-md animate-box">
							<iframe width="100%" height="430" src="https://www.youtube.com/embed/8VtkpMGw0hw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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
						<div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
							<h2 id="Exercise">물방울이 바위를 뚫을 수 있는 이유는 </br>힘이 아니라바로 꾸준함에 있다</h2>
							<p>낙숫물이 바위를 뚫듯 꾸준함을 이길 수 있는 것은 없습니다. 무언가 포기하는 마음이 생길 때 이 말을 떠올려 보면 좋을 것 같습니다. 행복한 하루 되세요</p>
						</div>
					</div>
					<div class="row">
						<!--실내운동 연결 -->
						<a href="https://www.msn.com/ko-kr/health/strength">
							<div class="col-md-3 col-sm-3 animate-box">

								<div class="trainers-entry">
									<div class="trainer-img" style="background-image: url(https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BBfc6b6/_h400_w284_m1_bwhite.jpg)"></div>
									<div class="desc">
										<h3>실내 운동</h3>
						</a>
						<span>실내에서도 간단하게 운동할수 있습니다</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-3 animate-box">
				<div class="trainers-entry">
					<div class="trainer-img" style="background-image: url(https://cdn.pixabay.com/photo/2016/03/26/22/47/blur-1281675_960_720.jpg)"></div>
					<div class="desc">
						<h3>야외운동</h3>
						<span>신선한 공기를 마시며 운동해보세요　</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-3 animate-box">
				<div class="trainers-entry">
					<div class="trainer-img" style="background-image: url(https://images.unsplash.com/photo-1578874691223-64558a3ca096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80)"></div>
					<div class="desc">
						<h3>가까운 헬스장 찾기</h3>
						<span>현재 위치를 바탕으로 </br>가까운 헬스장을 찾습니다</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-3 animate-box">
				<!--칼로리 계산기랑 연결-->
				<a href="http://u-health.dobong.go.kr/hcal/nutrition.asp">
					<div class="trainers-entry">
						<div class="trainer-img" style="background-image: url(https://cdn.pixabay.com/photo/2016/04/15/17/20/bread-and-butter-1331452_960_720.jpg)"></div>
						<div class="desc">
							<h3>칼로리 계산하기 </h3>
							<span>칼로리를 얼마나 소비하는지 간단하게 계산할 수 있습니다.</span>
						</div>
					</div>
				</a>

			</div>
		</div>
		</div>
	
		</div>

	
	</body>

	<script>
		
jQuery(document).ready(function($) {

        $(".scroll").click(function(event){            
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        });

});
</script>
</html>

