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
			   	<li style="background-image: url(resources/images/img_bg_4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2 style="font-size:30px;">회원님께서는 해당 사유에 의해 제제 되셨습니다</h2>
				   					<h2 style="font-size:30px; ">제제 사유 :&nbsp;&nbsp; ${sessionScope.ban}</h2>
				   					<h2 style="font-size:30px">자세한 사항은 아래 메일로 건의 해주시길 바랍니다</h2>
				   					<h2 style="font-size:30px">six_one@exercise.com</h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>	
			  	</ul>
		  	</div>
		</aside>

