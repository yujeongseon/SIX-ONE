<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- jQuery -->
<link href="//db.onlinewebfonts.com/c/0265b98b68ecf1b3d801b5df4dc155e7?family=icomoon" rel="stylesheet" type="text/css"/>
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
							<div id="colorlib-logo"><a style="font-size: 1.0em" href="<c:url value='/'/>">SIX-ONE</a></div>
						</div>
						<div class="col-md-10 text-right menu-1">
							<ul >
								<li id="nav-home"><a href="<c:url value='/'/>">홈</a></li>
								<li id="nav-exercise" class="has-dropdown">
									<a href="<c:url value='/exercise.do'/>">운동</a>
									<ul class="dropdown">
										<li><a href="<c:url value='/exercise.do'/>">운동</a></li>
										<li><a href="#">운동1</a></li>
										<li><a href="#">Muscle Classes</a></li>
										<li><a href="#">Fitness Classes</a></li>
										<li><a href="#">Body Building</a></li>
									</ul>
								</li>
								<li id="nav-schedule"><a href="<c:url value='/schedule.do'/>">스케쥴</a></li>
								<li id="nav-timeline"><a href="<c:url value='/TimeLine.do'/>">타임라인</a></li>
								<li id="nav-freeboard"><a href="<c:url value='/freeboard.do'/>">게시판</a></li>
								<li id="nav-blog"><a href="<c:url value='/blog.do'/>">Blog</a></li>
								<li><a href="#" data-toggle="modal" data-target="#myModal" id="MyMenu">마이</a></li>
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
	<script>
		if(location.pathname.indexOf('exercise') != -1){
			$('#nav-exercise').addClass('active');
		}
		else if(location.pathname.indexOf('schedule') != -1){
			$('#nav-schedule').addClass('active');
		}
		else if(location.pathname.indexOf('TimeLine') != -1){
			$('#nav-timeline').addClass('active');
		}
		else if(location.pathname.indexOf('freeboard') != -1){
			$('#nav-freeboard').addClass('active');
		}
		else{
			$('#nav-home').addClass('active');
		}
	</script>
</body>
</html>