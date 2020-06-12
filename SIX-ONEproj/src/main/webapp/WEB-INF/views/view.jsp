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
						<td>${record.board_no}</td>
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td>${record.title}</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td>${record.name}</td>
					</tr>
					<tr>
						<th class="text-center">조회수</th>
						<td>${record.count}</td>
					</tr>
					
					<tr>
						<th class="text-center">등록일</th>
						<td>${record.create_at}</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">내용</th>						
					</tr>
					<tr>						
						<td colspan="2">${record.content}</td>
					</tr>				
				</table>	
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
		
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          루틴 보기
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       <div class="row">
					<div class="schedule text-center animate-box">
						<div class="col-md-12">
							<div class="routine" >
								<div class="col-md-1 week">
									<div>월요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-arm"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>화요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>수요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>목요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>금요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>토요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
			
								<div class="col-md-1 week">
									<div>일요일</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>팔굽혀펴기</span></p>
									</div>
									<div class="entry-forth">
										<p class="icon"><span><i class="flaticon-gym"></i></span></p>
										<p class="time"><span>10회/3세트</span></p>
										<p class="trainer"><span>턱걸이</span></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
      </div>
    </div>
  </div>
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



