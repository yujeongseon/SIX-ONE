<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
   <head>
	   <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <!-- 로그인폼 css링크 -->
	   <link rel="icon" type="image/png" href="<c:url value='/resources/LoginCSS/images/icons/favicon.ico'/>"/>
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>">
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/fonts/iconic/css/material-design-iconic-font.min.css'/>" >
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/vendor/animate/animate.css'/>">
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/vendor/css-hamburgers/hamburgers.min.css'/>">
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/vendor/animsition/css/animsition.min.css'/>" >
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/vendor/select2/select2.min.css'/>" >
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/css/util.css'/>" >
	   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/LoginCSS/css/main.css'/>" >  
		<!-- 로그인폼 css링크끝 -->
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
		
	   <title>SIX-ONE</title>  

<style>
h2{
	font-weight:bold;

}
.goMain {
	cursor: pointer;
	border:10px #013775 solid;
	margin-top:50px;

}





</style>


   </head>
   <body>
	   	<div class="text-center" >
	   		
	   		<div class="col-md-6 col-md-offset-3 goMain" onclick="goMain();">
	   			 <div>
                	<img src="<c:url value='resources/images/logo.png'/>" style="width:100%"/>
                </div>
   			
	   			<div style="margin-top:20px;">
		   			<span style="font-size:40px;font-weight:bold;">
		   				<img src="<c:url value='resources/images/warning.png'/>" style="width:70px"/>
		   				&nbsp;홈페이지 접속 차단
	   				</span>
   				</div>
   				
   				<h2><br/>회원님께서는 해당 사유에 의해 제재 되셨습니다</h2>
                <h2>제제 사유 :&nbsp;&nbsp; ${sessionScope.ban}</h2>
                <h2>자세한 사항은 아래 메일로 건의 해주시길 바랍니다</h2>
                <div class="row" style="margin-top:20px;">
                	<div class="col-md-8 col-md-offset-2">
		                <table class="table table-bordered">
		                	<tr>
			               		<td>IT지원센터</td>
			               		<td style="font-size:20px;">six_one@exercise.com</td>
		                	</tr>
		                	<tr>
			               		<td>관리자</td>
			               		<td style="font-size:20px;">subin@exercise.com</td>
		                	</tr>
		                	
		                </table>
	                </div>
                </div>
                <div class="row">
                	<div>
                		<p class="countdown" style="margin:0;" >
                			<b><font color='blue' size='66pt'>7</font></b><p style='font-size:25px'>초 후 메인 페이지로 이동 합니다.</p>
                		
                		</p>
                	
                	
                	</div>
                
                
                
                
                </div>
                
                
			</div>
   		</div>
   
   </body>

<script>

var count = 5;
var countdown = setInterval(function(){

 $("p.countdown").html("<b><font color='blue' size='66pt'>"+ (count+1) + "</font>"); 
   
    if (count == 0) {
        clearInterval(countdown);
        window.location.href = 'http://115.91.88.230:8081/sixone/';
    }
    count--;
}, 1000);

function goMain(){
	window.location.href = 'http://115.91.88.230:8081/sixone/';	
}







</script>













</html>