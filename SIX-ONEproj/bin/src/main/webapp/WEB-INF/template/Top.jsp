<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
    <script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 로그인폼 css링크끝 -->

   <title>SIX-ONE</title>
   
   <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900" rel="stylesheet">
   
   <%-- <c:url value='/resources/images/sumnail.png' /> --%>
   
   <!-- Animate.css -->
   <link rel="stylesheet" href="<c:url value='/resources/css/animate.css' />">
   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="<c:url value='/resources/css/icomoon.css' />">

<<<<<<< HEAD
<!--<link rel="stylesheet" type="text/css" href="<c:url value='/resources/MailCSS/css/util.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/MailCSS/css/main.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/MailCSS/vendor/select2/select2.min.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/MailCSS/vendor/animate/animate.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/resources/MailCSS/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>"/>
   <link rel="icon" type="image/png" href="<c:url value='/resources/MailCSS/images/icons/favicon.ico'/>"/>
     -->
   <title>SIX-ONE</title>
   
   <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900" rel="stylesheet">
   
   <%-- <c:url value='/resources/images/sumnail.png' /> --%>
   
   <!-- Animate.css -->
   <link rel="stylesheet" href="<c:url value='/resources/css/animate.css' />">
   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="<c:url value='/resources/css/icomoon.css' />">

=======
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
   <!-- Magnific Popup -->
   <link rel="stylesheet" href="<c:url value='/resources/css/magnific-popup.css' />">
 
   <!-- Flexslider  -->
   <link rel="stylesheet" href="<c:url value='/resources/css/flexslider.css' />">

   <!-- Owl Carousel -->
   <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css' />">
   <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css' />">
   
   <!-- Flaticons  -->
   <link rel="stylesheet" href="<c:url value='/resources/font/flaticon.css' />">

   <!-- Theme style  -->
   <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

   <!-- Modernizr JS -->
   <script src="<c:url value='/resources/js/modernizr-2.6.2.min.js' />"></script>
<<<<<<< HEAD
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->
   
<style>
   /*
   모달창 중앙 뜨기 건들 ㄴㄴ
   */
.modal {
   text-align: center;
}

@media screen and (min-width: 768px) {
   .modal:before {
      display: inline-block;
      vertical-align: middle;
      content: " ";
      height: 100%;
   }
}

.modal-dialog {
   display: inline-block;
   text-align: left;
   vertical-align: middle;
}

.modal-open {
   overflow: hidden;
}



</style>
=======
   <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->
   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/TopModal.css'/>" > 
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
<script>

$(function(){
<<<<<<< HEAD
=======
	

>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
   //768
   $('#myModal').on('show.bs.modal', function () {
      if($(window).width() <= 768){
      $('body').removeClass('overflow offcanvas');
         //$('a').removeClass('colorlib-nav-toggle');
      }
      
   });
   
   $('#myModal').on('shown.bs.modal', function () {
      $('#id').focus();
   });
   
   
   $('#myModal').on('hidden.bs.modal', function () {
      if($(window).width() <= 768){
      $('body').addClass('overflow offcanvas');
         
      }
   });
   
   
   
   // 선태씨가 한거
   /* $('#LoginButton').click(function(){
      $.ajax({
         url:"<c:url value='/Login.do'/>",
         type:'get',
         dataType:'text',
         data:$('#frm').serialize(),
         success:function(data){
            console.log(data);
            //$('#msg').html(data);
            var msg = data;
            if(msg == "로그인 성공"){
               window.location.href = "<c:url value='/home.do'/>";
            }
            else{
               $('#msg').html(data);
            }
            
         },
         error:function(data){
            console.log('에러:',data.responseText);
         }
      });
      
   }); */  
         
   });

</script>
<<<<<<< HEAD
 <script>
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
        alert("로그인 되었습니다.")
        $('#status').after('<button id="logout">로그아웃</button>');
      testAPI();
    } else {
      //document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
    }
  }
 
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
 
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '566752667542543',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v7.0' 
  });
 
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
 
  };
 
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
 
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me',{fields:'email,name'}, function(response) {
      console.log('Successful Name: ' + response.name);
      console.log('Successful Email: ' + response.email);
      
      //javascript형식 문자열 추가하기
      //document.getElementById('status').innerHTML =
        //'페이스북 로그인되었습니다. ' + response.name + '님!';
      
      //jQuery형 문자열 추가하기
      //$('#userInfo').html("이름 : "+response.name+" 메일 :"+response.email);
      
    });
  }
  
    $(document).on("click","#logout",function(){ 
        FB.logout(function(response) {
           // Person is now logged out
               alert("로그아웃 되었습니다.");
               location.reload();
        });
      });
</script> 
   </head>
   <!-- 모달 시작 -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
   
      <div class="modal-content">
      
         <div class="modal-header">
         </div>
         
         <div class="modal-body">
         <form  id="frm">
         <input type="hidden" id ="locationUrl">
         <div class="form-group wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                  <span class="label-input100">아이디</span>
                  <input class="input100" type="text" name="id" id = "id"placeholder="아이디를 입력하세요">
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
               </div>
               
         <div class="form-group wrap-input100 validate-input" data-validate="Password is required">
                  <span class="label-input100">비밀번호</span>
                  <input onkeydown="javascript: if(event.keyCode == 13) {doLogin()}" class="input100" type="password" name="password" id="pass" placeholder="비밀번호를 입력하세요">
                  <span class="focus-input100" data-symbol="&#xf190;"></span>
               </div>
               
               
            <div class="text-right p-t-8 p-b-31">
               <span id="msg" style=" color: red; width: 10%;"></span>
               <a href="#" style="color: black; text-decoration:underline;">아이디 / 비밀번호 찾기</a>
            </div>
            
            <div class="container-login100-form-btn">
                  <div class="wrap-login100-form-btn">
                     <div class="login100-form-bgbtn"></div>
                     <button onclick="javascript:doLogin()" type="button"class="login100-form-btn" id="LoginButton">Login</button>
                  </div>
               </div>
               </form>
               <div class="txt1 text-center p-t-54 p-b-20">
                  <span>
                     SNS로그인
                  </span>
               </div>
               <div class="flex-c-m">
                  <a href="#">
                     <img class="img-circle"  alt="..." src="resources/images/NAVER.PNG" style="width: 53px;height: 53px;">
                  </a>

                  <a href="#">
                     <img class="img-circle"  alt="..." src="resources/images/kokoao.png" style="width: 53px;height: 53px; margin-right: 15px; margin-left: 15px;">
                  </a>

                  <a href="#">
                     <img class="img-circle"  alt="..." src="resources/images/Facebook.png" style="width: 53px;height: 53px;">
                  </a>
               </div>
				<c:if test="${sessionScope.LoginSuccess != null}">
				<h2>네이버 아이디 로그인 성공하셨습니다!!</h2>
				<h3>'${sessionScope.LoginSuccess}'님 환영합니다!</h3>
				<h3>
					<a href="logout">로그아웃</a>
				</h3>
				</c:if>

				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
=======

   </head>
   <!-- 모달 시작 -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
   
      <div class="modal-content">
      
         <div class="modal-header">
         </div>
         
         <div class="modal-body">
         <form  id="frm">
         <input type="hidden" id ="locationUrl">
         <div class="form-group wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                  <span class="label-input100">아이디</span>
                  <input class="input100" type="text" name="id" id = "id"placeholder="아이디를 입력하세요">
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
               </div>
               
         <div class="form-group wrap-input100 validate-input" data-validate="Password is required">
                  <span class="label-input100">비밀번호</span>
                  <input onkeydown="javascript: if(event.keyCode == 13) {doLogin()}" class="input100" type="password" name="password" id="pass" placeholder="비밀번호를 입력하세요">
                  <span class="focus-input100" data-symbol="&#xf190;"></span>
               </div>
               
               
            <div class="text-right p-t-8 p-b-31">
               <span id="msg" style=" color: red; width: 10%;"></span>
               <a href="#" style="color: black; text-decoration:underline;">아이디 / 비밀번호 찾기</a>
            </div>
            
            <div class="container-login100-form-btn">
                  <div class="wrap-login100-form-btn">
                     <div class="login100-form-bgbtn"></div>
                     <button onclick="javascript:doLogin()" type="button"class="login100-form-btn" id="LoginButton">Login</button>
                  </div>
               </div>
               </form>
               <div class="txt1 text-center p-t-54 p-b-20">
                  <span>
                     SNS로그인
                  </span>
               </div>
               <div class="flex-c-m">
                  <a href="#">
                     <img class="img-circle"  alt="..." src="resources/images/NAVER.PNG" style="width: 53px;height: 53px;">
                  </a>

                 <a href="#" onclick="javascript:kakaoLogin();">
                     <img class="img-circle"  alt="..." src="resources/images/kokoao.png" style="width: 53px;height: 53px; margin-right: 15px; margin-left: 15px;">
                  </a>
                  
   					
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
				</div>
<<<<<<< HEAD
				<br>
=======
               
             
               
               
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git

<<<<<<< HEAD
				<div id="status"></div>
               <div id="userInfo"></div>
               

				<div class="txt1 text-center" style="padding-top: 40px;">
                  <span>회원가입</span>
                  </div>
=======
 					<div class="txt1 text-center" style="padding-top: 40px;">
                  		<a href="<c:url value='/NewMember.do'/>"><span style="color: black;">회원가입</span></a>
                    </div>
               		
               
               
               
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
         </div>
      </div>
   </div>
</div>
<!-- 모달끝 -->
<<<<<<< HEAD

<script>
function doLogin(){
   
   $.ajax({
      url:"<c:url value='/Login.do'/>",
      type:'get',
      dataType:'text',
      data:$('#frm').serialize(),
      success:function(data){
         console.log(data);
         //$('#msg').html(data);
         var msg = data;
         if(msg == "로그인 성공"){
            window.location.href = $('#locationUrl').val();
         }
         else{
            $('#msg').html(data);
         }
         
      },
      error:function(data){
         console.log('에러:',data.responseText);
      }
   });
   
}
</script>



   
=======
<script>
function doLogin(){
	   
	   $.ajax({
	      url:"<c:url value='/Login.do'/>",
	      type:'get',
	      dataType:'text',
	      data:$('#frm').serialize(),
	      success:function(data){
	         //$('#msg').html(data);
	         var msg = data;
	         if(msg == "로그인 성공"){
	            window.location.href = $('#locationUrl').val();
	         }
	         else if(msg == "이미있는카카오계정") {
	        	 window.location.href = "<c:url value='/home.do'/>"
	         }
	         else{
	            $('#msg').html(data);
	         }
	         
	      },
	      error:function(data){
	      }
	   });
	   
	}
</script>
<script type='text/javascript'>
function kakaoLogin(){
	Kakao.init("2dc22a04b6ff1d2619ae3a6fd26088ff"); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.loginForm({
		success : function(authObj) {
		   Kakao.API.request({
	           url : '/v2/user/me',
	           success : function(res) {
	           var kakaoid = res.id
	           var kakaoname = res.properties['nickname']
	           var key;
	        	  $.ajax({
	           	   url:"<c:url value='/kakaoLogin.do'/>",
	           	   type:'get',
	           	   data:{id:kakaoid,name:kakaoname},
	           	   dataType:'json',
	              		success:function(data){
	              			$.each(data,function(key,value){
	              				console.log('key:',key,'value:',value);
	              				if(value == '카카오톡첫로그인') {
	              					window.location.href = "<c:url value='/NewMember.do?kakaoid='/>"+kakaoid+"&kakaoname="+kakaoname;
	                     			}
	              				else if(value == '카카오톡첫로그인아님'){
	              					window.location.href = "<c:url value='/kakaoisLogin.do?kakaoid='/>"+kakaoid;
	              				}
	              			});
	              			
	              		},
	              		error:function(data){
	              			console.log('에러:',data.responseText);
	              			console.log('if문 에이작스에러');
	              		}
	              });   
	        	  
	           }
	        })
	     }
	})
	} 
</script>
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
