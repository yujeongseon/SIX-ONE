<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<title>모두다짐</title>
	
	</head>
	<body>
	<img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
	
	<div class="container-fluid">
	<div class="row">

		
		<div class="col-md-8 col-md-offset-3" style="">
			<div class="col-md-10">
			<div id="header_box">
					<div class="bbs_title">
						.
					</div>
					<div class="desc"></div>
					<div class="side"></div>
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
					
		</div>
				
			<!-- 검색용 UI -->
	
			<div>
				<ul id="pillMenu" class="nav nav-pills" style="margin-bottom:10px;display: table; margin: auto; padding:0;">
				<li><a href="<c:url value='/freeboard.do?nowPage=${param.nowPage}'/>" class="btn btn-success" >목록</a></li>
				<c:if test="${LoginSuccess == record.id}">
					<li><a href="<c:url value='/Update.do?nowPage=${param.nowPage}&no=${record.board_no}'/>" class="btn btn-success">수정</a></li>
					<li><a href="<c:url value='/delete.do?nowPage=${param.nowPage}&no=${record.board_no}'/>" class="btn btn-success">삭제</a></li>
				</c:if>
				</ul>
			</div>
		
		
			</div>
			</div>
			
			</div>
	

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	
	</body>
</html>




