<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- jQuery -->
<link href="//db.onlinewebfonts.com/c/0265b98b68ecf1b3d801b5df4dc155e7?family=icomoon" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js' />"></script>

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
	
<script>
function isLogin(){
	$.ajax({
		url:"<c:url value='/LoginCkeck.do'/>",
		type:'get',
		dataType:'text',
		data:$('#loginckeck').val(),
		success:function(data){
			var msg = data;
			if(msg == "NotLogin"){
				alert('로그인후 이용하세요');
			}
			else{
				window.location.href = "<c:url value='/MyPage.do'/>";
			}
			
		},
		error:function(data){
			console.log('에러:',data.responseText);
		}
	});	
}
	
	/*
	$('#MyButton').on('click',function(){
		
		$.ajax({
			url:"<c:url value='/LoginCkeck.do'/>",
			type:'get',
			dataType:'text',
			data:$('#loginckeck').val(),
			success:function(data){
				var msg = data;
				if(msg == "NotLogin"){
					//window.location.href = "<c:url value='/home.do'/>";
					alert('로그인후 이용하세요');
				}
				else{
					$('#msg').html(data);
				}
				
			},
			error:function(data){
				console.log('에러:',data.responseText);
			}
		});
	});
	*/

	
</script>
<body>
	<header id="siteTop">
		<tiles:insertAttribute name="siteTop"/>
		
	</header>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation"  >
			<div class="top-menu">
				<div class="container" >
					<div class="row">

						<div class="col-md-2">
							<div id="colorlib-logo"><a href="<c:url value='/'/>">SIX-ONE</a></div>
						</div>
						<div class="col-md-10 text-right menu-1">
							<ul >
								<li class="active"><a href="<c:url value='/home.do'/>">홈</a></li>
								<li class="has-dropdown">
									<a href="<c:url value='/exercise.do'/>">운동</a>
									<ul class="dropdown">
										<li><a href="<c:url value='/exercise.do'/>">운동</a></li>
										<li><a href="#">운동1</a></li>
										<li><a href="#">Muscle Classes</a></li>
										<li><a href="#">Fitness Classes</a></li>
										<li><a href="#">Body Building</a></li>
									</ul>
								</li>
								<li><a href="<c:url value='/schedule.do'/>">스케쥴</a></li>
								<li><a href="<c:url value='/TimeLine.do'/>">타임라인</a></li>
								<li><a href="<c:url value='/freeboard.do'/>">게시판</a></li>
								<li><a href="javascript:isLogin();" id="MyButton">마이</a></li>
								<c:if test="${empty sessionScope.LoginSuccess}" var="flag">
								<li><a href="#" data-toggle="modal" data-target="#myModal" class="MyMenu">로그인</a></li>
								<input type="hidden" id="loginckeck" value="ok">
								</c:if>
								<c:if test="${not flag }">
								<li><a href="<c:url value="Logout.do"/>">로그아웃</a></li>
								<input type="hidden" id="loginckeck" value="no">
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>

	<div id="bbooddyy">
		<tiles:insertAttribute name="content"/>
	</div>
 
	<footer id="siteBottom">
		<tiles:insertAttribute name="siteBottom"/>
	</footer>
	</div>
		<!-- Bootstrap -->
	
</body>

<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->


</html>