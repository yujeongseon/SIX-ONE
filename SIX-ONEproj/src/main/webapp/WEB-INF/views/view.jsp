<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<title>모두다짐</title>
	
	
	<script>
	jQuery(document).ready(function($) {
		var followFlag = true;
		
		
		$( window ).resize( function() {
			if($(window).width()<970 && followFlag){
				$('.follow *').hide();
				followFlag = false;
			}else if($(window).width()>970 && !followFlag){
				$('.follow *').show();
				followFlag = true;
			}
		});	
	$(window)
	.scroll(
			function() {
				if ($(window).scrollTop() + 200 < ($(document).height() - $(window).height())) {
					$('.follow').attr('style',('padding-top :'+ $(window).scrollTop()+'px') );
				}
			})
		});
	</script>
<style>

</style>
	</head>
	<body>
	<img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
	
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-2 follow" style="padding-top:100px;">
		<!-- 카루셀 -->
		<div id="carousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel" data-slide-to="0" class="active"></li>
				<li data-target="#carousel" data-slide-to="1"></li>
				<li data-target="#carousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/images/11.jpg" alt="바1" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item">
					<img src="resources/images/22.jpg" alt="바2" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
					<div class="item">
					<img src="resources/images/33.jpg" alt="바3" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
				...
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel"
				role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		</div>
		<!-- 카루셀1 -->
		
		<div class="col-md-8">
		<div class="col-md-1"></div>
			<div class="col-md-10">
			<div id="header_box">
					<div class="bbs_title">
						<p>${sessionScope.id} 아이디 확인 걍 씀</p>
						<p>${nowPage} 페이지 확인 걍 씀</p>
					</div>
					<div class="desc">글적는곳</div>
					<div class="side">사이드 적는곳</div>
				</div>

				
			<div>
				<table class="table table-bordered table-striped">
					<tr>
						<th class="col-md-2 text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">조회수</th>
						<th class="text-center">등록일</th>
					</tr>
					<tr class="text-center">
						<td>${record.board_no}</td>
						<td>${record.title}</td>
						<td>${record.name}</td>
						<td>${record.count}</td>
						<td>${record.create_at}</td>
					</tr>
					</table>
					<div>
					<span><img src="<c:url value='/resources/uploadimage/${record.image_name}'/>" style="width:300px; height:400px;"  /></span>
					<span><textarea rows="10" cols="80" id="text">${record.content}</textarea></span>
					
					<div></div>
						
					<!-- 
						<th class="text-center" colspan="2">내용</th>						
					 -->
											
						
						
					
						
					
		</div>
				
			<!-- 검색용 UI -->
	
			<div>
				<ul id="pillMenu" class="nav nav-pills" style="margin-bottom:10px">
				<li><a href="<c:url value='/freeboard.do?nowPage=${param.nowPage}'/>" class="btn btn-success" >목록</a></li>
				<c:choose>
				<c:when test="${sessionScope.id == record.id}">
					<li style="float: right"><a href="<c:url value='/Update.do?nowPage=${param.nowPage}&&no=${record.board_no}'/>" class="btn btn-success">수정</a></li>
					<li style="float: right"><a href="<c:url value='/delete.do?nowPage=${param.nowPage}&no=${record.board_no}'/>" class="btn btn-success">삭제</a></li>
				</c:when>
				<c:when test="${sessionScope.id eq 'admin'}">
					<li style="float: right"><a href="<c:url value='/Update.do?nowPage=${param.nowPage}&no=${record.board_no}'/>" class="btn btn-success">수정</a></li>
					<li style="float: right"><a href="<c:url value='/delete.do?nowPage=${param.nowPage}&no=${record.board_no}'/>" class="btn btn-success">삭제</a></li>
				</c:when>
				</c:choose>
				</ul>
			</div>
		
		
			</div>
			</div>
			
		<!-- 카루셀 -->
		<div class="col-md-2 follow" style="padding-top:100px;">
		<div id="carousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel2" data-slide-to="3" class="active"></li>
				<li data-target="#carousel2" data-slide-to="4"></li>
				<li data-target="#carousel2" data-slide-to="5"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/images/44.jpg" alt="바4" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item">
					<img src="resources/images/55.jpg" alt="바5" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
					<div class="item">
					<img src="resources/images/66.jpg" alt="바6" style="width:100%;height:400px;">
					<div class="carousel-caption">
					</div>
					</div>
				...
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel2" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel2"
				role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		</div>
		</div><!-- row -->
		<!-- 카루셀 -->
		
		
		
		
		
		
			
			</div>
	

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	
	</body>
</html>




