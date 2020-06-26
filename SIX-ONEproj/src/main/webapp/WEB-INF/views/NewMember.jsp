<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<img src="resources/images/black.jpg"
   style="width: 100%; height: 100px;" />
        <div class="container"><!-- 좌우측의 공간 확보 -->


         
            <form class="form-horizontal"  id="form" role="form" enctype = "multipart/form-data" method="post" action="<c:url value='/memberjoin.do'/>"  style="margin-top: 30px;">
       
                  
       
                <div class="form-group">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="newid" name="newid" data-rule-required="true" placeholder="아이디를 입력하세요." maxlength="30">
                    </div>
                </div>
               
                 
                
                <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="newpassword" name="newpassword"  data-rule-required="true" placeholder="비밀번호를 입력하세요." maxlength="30">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" name="newpasswordcheck" id="newpasswordcheck" data-rule-required="true" placeholder="비밀번호 확인" maxlength="30">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" name="name" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
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
                   		<input type="hidden" name="kakaoid" value="${param.kakaoid}">
                        <input type="text" class="form-control" name="weight" id="weight" data-rule-required="true" placeholder="몸무게를 입력해주세요." maxlength="15">
                        <input type="hidden" name="kakaoname" value="${param.kakaoname}">
                    </div>
                </div>
               
               <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="gender" name="gender">
                        	<option value="">성별을 선택하세요</option>
                            <option value="man">남</option>
                            <option value="woman">여</option>
                        </select>
                    </div>
                </div>
               
               
               
                <div class="form-group">
                    <label for="inputExercise" class="col-lg-2 control-label">프로필사진</label>
                    <div class="col-lg-10">
                        <input type="file" name="upload" size="30" id="upload"/><span>(※파일을 선택하지 않으면 기본프로필로 자동설정 됩니다.)</span>
                    </div>
                </div>
                
                 <div class="form-group">
                   <label for="inputGoal" class="col-lg-2 control-label">목표</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="goal" id="goal" data-rule-required="true" placeholder="운동목표를 입력해주세요." maxlength="15">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">질문</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="question" name="question">
                        	<option>질문을 선택하세요.</option>
                            <option>어린시절 가장 동경하던 인물은?</option>
                            <option>나의 보물1호는?</option>
                            <option>자신의 인생 좌우명은?</option>
                            <option>기억에 남는 추억의 장소는?</option>
                            <option>유년시절 가장 생각나는 친구 이름은?</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                   <label for="inputGoal" class="col-lg-2 control-label">대답</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="answer" id="answer" data-rule-required="true" placeholder="질문에 대한 대답을 입력해주세요." maxlength="15">
                    </div>
                </div>
                 
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="button" class="btn btn-primary" id="okbtn">확인</button>
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
		var newid = $('#newid').val();
		var newpassword = $('#newpassword').val();
		var newpasswordcheck = $('#newpasswordcheck').val();
		var name = $('#name').val();
		var height = $('#height').val();
		var weight = $('#weight').val();
		var gender = $('#gender').val();
		var goal = $('#goal').val();
		var question = $('#question').val();
		var answer = $('#answer').val();
		var upload = $('#upload').val();
		
		if(pattern_spc.test(newid) || pattern_kor.test(newid)){
			alert("아이디는 한글 또는 특수문자는 입력 불가능 합니다.");
		}
		else if(newid.trim() == '') {
			alert("아이디를 입력해주세요.");
		}
		else if(pattern_kor.test(newpassword)) {
			alert("한글은 입력 불가능 합니다.");
		}
		else if(newpassword.trim() == '') {
			alert("비밀번호를 입력해주세요.");
		}
		else if(pattern_kor.test(newpasswordcheck)){
			alert("한글은 입력 불가능 합니다.");
		}
		else if(newpasswordcheck.trim() == '') {
			alert("비밀번호확인 입력해주세요.");
		}
		else if(newpasswordcheck != newpassword) {
			alert("비밀번호가 다릅니다.");
		}
		else if(name.trim() == ''){
			alert("이름을 입력해주세요.");
		}
		else if(pattern_num.test(name) || pattern_eng.test(name) || pattern_spc.test(name)) {
			alert('이름은 한글만 입력해주세요.');
		}
		else if(height.trim() == ''){
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
		else if(question == '질문을 선택하세요.'){
			alert('질문을 선택해주세요.');
		}
		else if(answer == ''){
			alert('대답을 입력해주세요.');
		}
		else{
			 $('#form').submit();
		}
		
		

	});
});

</script>  
</body>
</html>