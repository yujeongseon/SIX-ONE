<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 실제 내용 시작 -->
<img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div id="header_box">
					<div class="bbs_title">
						<p>${sessionScope.id} 아이디 확인 걍 씀</p>
					</div>
					<div class="desc">수정하자</div>
					<div class="side">글수정해 적는곳</div>
				</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="post" encType="multipart/form-data"
				action="<c:url value='/UpdateOK.do'/>">
				<div class="form-group">
				<label class="col-sm-2 control-label">카테고리</label>
				<div class="col-sm-2">
				<select name="category" class="form-control">
						<option value="free"<c:if test="${record.category=='free'}">selected</c:if>>자유게시판</option>
						<option value="nobody"<c:if test="${record.category=='nobody'}">selected</c:if>>익명게시판</option>
						<c:if test="${sessionScope.LoginSuccess eq 'admin'}">
						<option value="notice"<c:if test="${record.category=='notice'}">selected</c:if>>공지</option>
						</c:if>
					</select>
					</div>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="title"
							placeholder="제목을 입력하세요" value="${record.title}">
					</div>
				</div>
				<div class="form-group">
				<label class="col-sm-2 control-label">파일첨부</label>
				<div class="col-sm-4">
					<input type="file" name="upload" value="${record.image_name}">
				</div>
				</div>
				<input type="hidden" name="id" value="${sessionScope.id}" >
				<input type="hidden" name="no" value="${record.board_no}" >
				<input type="hidden" name="WorU" value="U">
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<!-- 중첩 컬럼 사용 -->
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<textarea class="form-control" name="content" rows="5"
									placeholder="내용 입력하세요">${record.content}</textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success">수정</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
<!-- container -->

<!-- 경고창 모달 시작 -->
<div class="modal fade" id="small-modal" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				
				<h4 class="modal-title">
					<span class="glyphicon glyphicon-bullhorn">경고 메시지</span>
				</h4>
				<h5 id="warningMessage"></h5>
			</div>

		</div>
	</div>
</div>

<!-- 경고창 모달 끝 -->
<!-- 실제 내용 끝 -->

<script>
	    
    	$(function(){
    		
    		var focusObject;
    		
    		
    		//모달창이 닫혔을때 발생하는 이벤트 처리 - 해당 객체에 포커스 주기
    		$('#small-modal').on('hidden.bs.modal', function (e) {
    			focusObject.focus();    			
    		});
    		
    		$('form').on('submit',function(){
    			
    			
    			if($(this).get(0).title.value==""){
    				$('#warningMessage').html('제목을 입력하세요');
    				$('#small-modal').modal('show');
    				focusObject=$(this).get(0).title; 				
    				return false;
    			}
    			
    			if($(this).get(0).content.value==""){
    				$('#warningMessage').html('내용을 입력하세요');
    				$('#small-modal').modal('show');
    				focusObject=$(this).get(0).content; 				
    				return false;
    			}
    				
    			
    		});   		
    		
    	});
    
    </script>
    
