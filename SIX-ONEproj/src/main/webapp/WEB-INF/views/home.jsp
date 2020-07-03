<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.entry-forth .icon img{
		width:100px;
	
	
	}


</style>


		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(resources/images/img_bg_1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>This is a Lifestyle<br/>There is no Finish Line</h1>
				   					<p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(resources/images/img_bg_5.png);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Don't Stop When it Hurts,<br/> Stop When You're Done</h1>
				   					<p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(resources/images/img_bg_3.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Stop Wishing, <br/>Start Doing</h1>
				   					<p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(resources/images/img_bg_4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Working Out is a Reward <br/>not a Punishment</h1>
				   					<p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>	
			  	</ul>
		  	</div>
		</aside>
		<div id="colorlib-intro">
			<div class="container">
				<div class="row">
					<div class="col-md-12 intro-wrap animate-box">
						<div class="intro-flex">
						
							<div class="one-third intro-img" style="background-image: url(resources/images/intro-img-1.jpg)">
								<div class="desc">
									<h3>운동</h3>
									<a href="<c:url value='/exercise.do'/>"><span class="price text-center">확인하기<br></span></a>
								</div>
							</div>
							<div class="one-third intro-img" style="background-image: url(resources/images/intro-img-2.jpg)">
								<div class="desc">
									<h3>스케쥴</h3>
									<a href="#;" onclick="javascript:isLogin(this);"><span class="price text-center">확인하기<br></span></a>
								</div>
							</div>
							<div class="one-third intro-img" style="background-image: url(resources/images/intro-img-3.jpg)">
								<div class="desc">
									<h3>칼로리 계산</h3>
									<a href="<c:url value='/food.do'/>"><span class="price text-center">확인하기<br></span></a>
								</div>
							</div>
						</div>
		         </div>
				</div>
			</div>
		</div>

		



		<div id="colorlib-schedule" class="colorlib-light-grey">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
						<h2>인기있는 루틴</h2>
						<p>가장 많은 사람이 구독한 루틴으로 운동을 시작해보세요</p>
					</div>
				</div>
				
				
				<div class="best-member">
					<img src="<c:url value='/resources/images/trainer-4.jpg'/>"/>
					<span>${bestRoutine[0].id } | ${bestRoutine[0].routineName }</span>
				</div>


				<div class="row">
					<div class="schedule text-center animate-box">
						<div class="col-md-12">
							<div class="routine" >
								<div class="col-md-1 week">
									<div>1일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 1 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>
								<div class="col-md-1 week">
									<div>2일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 2 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>
								<div class="col-md-1 week">
									<div>3일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 3 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>
								<div class="col-md-1 week">
									<div>4일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 4 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>
								<div class="col-md-1 week">
									<div>5일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 5 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>
								<div class="col-md-1 week">
									<div>6일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 6 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>
								<div class="col-md-1 week">
									<div>7일차</div>
									<c:forEach items="${bestRoutine }" var="list">
										<c:if test="${list.routineDays == 7 }">
											<div class="entry-forth">
												<p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
												<p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
												<p class="trainer"><span>${list.exerciseName }</span></p>
											</div>
										</c:if>	
									</c:forEach>
								</div>									
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<div id="colorlib-testimony" class="testimony-img" style="background-image: url(resources/images/img_bg_4.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="colorlib-trainers">
				<div class="container member">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
							<h2>이달의 명예회원</h2>
							<p>한달동안 가장 많이 달성한 회원</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 col-sm-3 animate-box">
							<div class="trainers-entry">
								<div class="trainer-img" style="background-image: url(resources/images/trainer-1.jpg)"></div>
								<div class="desc">
									<h3>회원 아이디</h3>
									<span>Body Building Trainer</span>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-3 animate-box">
							<div class="trainers-entry">
								<div class="trainer-img" style="background-image: url(resources/images/trainer-2.jpg)"></div>
								<div class="desc">
									<h3>회원 아이디</h3>
									<span>Body Building Trainer</span>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-3 animate-box">
							<div class="trainers-entry">
								<div class="trainer-img" style="background-image: url(resources/images/trainer-3.jpg)"></div>
								<div class="desc">
									<h3>회원 아이디</h3>
									<span>Body Building Trainer</span>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-3 animate-box">
							<div class="trainers-entry">
								<div class="trainer-img" style="background-image: url(resources/images/trainer-4.jpg)"></div>
								<div class="desc">
									<h3>회원 아이디</h3>
									<span>Body Building Trainer</span>
								</div>
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
						<h2>인기있는 피드</h2>
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
								<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
