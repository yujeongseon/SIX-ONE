<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<img src="resources/images/black.jpg"
   style="width: 100%; height: 100px;" />
        <div class="container"><!-- 좌우측의 공간 확보 -->

            <form class="form-horizontal" action="<c:url value='/Navermember.do'/>" id="form" role="form" enctype="multipart/form-data" method="POST"   style="margin-top: 30px;">

				<div class="form-group">
                   <label for="inputHeight" class="col-lg-2 control-label">아이디</label>
                   <div class="col-lg-10">
                        <span class="form-control" id="id">${id}</span>
                    </div>
                </div>
                <div class="form-group">
                   <label for="inputHeight" class="col-lg-2 control-label">이름</label>
                   <div class="col-lg-10">
                        <span class="form-control" id="name">${name}</span>
                    </div>
                </div>
                <div class="form-group">
                   <label for="inputHeight" class="col-lg-2 control-label">키</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="height" id="height" data-rule-required="true" placeholder="키를 입력해주세요." maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="divWeight">
                   <label for="inputWeight" class="col-lg-2 control-label">몸무게</label>
                   <div class="col-lg-10">
                   		<input type="hidden" name="id" value="${id}">
                        <input type="text" class="form-control" name="weight" id="weight" data-rule-required="true" placeholder="몸무게를 입력해주세요." maxlength="15">
                        <input type="hidden" name="name" value="${name}">
                    </div>
                </div>
               
               <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="gender" name="gender">
                        	<option value="">성별을 선택하세요</option>
                            <option>남</option>
                            <option>여</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputExercise" class="col-lg-2 control-label">프로필사진</label>
                    <div class="col-lg-10">
                        <input type="file" name="upload" size="30" id="upload" /><span>(※파일을 선택하지 않으면 기본프로필로 자동설정 됩니다.)</span>
                    </div>
                </div>
                
                 <div class="form-group">
                   <label for="inputGoal" class="col-lg-2 control-label">목표</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="goal" id="goal" data-rule-required="true" placeholder="운동목표를 입력해주세요." maxlength="15">
                    </div>
                </div>
                
            
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="button" id="okbtn" class="btn btn-primary">확인</button>

                    </div>
                </div>
            </form>
            <script>
$(function(){
	var pattern_num = /[0-9]/; //숫자
	var pattern_eng = /[a-zA-Z]/;	// 문자
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	
	$('#okbtn').on('click',function(){
		var height = $('#height').val();
		var weight = $('#weight').val();
		var gender = $('#gender').val();
		var goal = $('#goal').val();
		var upload = $('#upload').val();
		
		if(height.trim() == ''){
			alert('키를 입력해주세요.');
		}
		else if(pattern_kor.test(height) || pattern_eng.test(height) || pattern_spc.test(height)){
			alert('키는 숫자만 입력해주세요.');
		}
		else if(weight.trim() == ''){
			alert('몸무게를 입력해주세요.');
		}
		else if(pattern_kor.test(weight) || pattern_eng.test(weight) || pattern_spc.test(weight)){
			alert('몸무게는 숫자만 입력해주세요.');
		}
		else if(gender == ''){
			alert('성별을 선택해주세요.');
		}
		else if(goal == '') {
			alert('운동목표를 입력해주세요.');
		}
		else{
			 $('#form').submit();
		}
		
	});
});

</script>  