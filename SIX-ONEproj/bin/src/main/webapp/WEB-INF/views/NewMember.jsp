<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD

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
=======
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            <div class="row">
                <p></p>
                <div class="col-md-12">
                    <small>
                    <a href="#">Login</a> | <a href="#">Join</a>
                    </small>
                </div>
            </div>
            <!--// 헤더 들어가는 부분 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
            <!-- 본문 들어가는 부분 -->
                
 
 			<c:if test="${not empty param.kakaoid}" >
            <form class="form-horizontal" role="form" enctype = "multipart/form-data" method="post" action="<c:url value='/Profile.do'/>" >
           </c:if>
           
           <c:if test="${empty param.kakaoid}" >
            <form class="form-horizontal" role="form" enctype = "multipart/form-data" method="post" action="<c:url value='#'/>" >
           </c:if>
                <div class="form-group">
                    <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
                    <div class="col-lg-10" id="provision">
                        <textarea class="form-control" rows="8" style="resize:none">약관동의
블라블라블라블라블라블라블라블라블라블라블라블라
블라블라블라블라블라블라블라블라블라블라블라블라
블라블라블라블라블라블라블라블라블라블라블라블라.................
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionYn" name="provisionYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
                    <div class="col-lg-10" id="memberInfo">
                        <textarea class="form-control" rows="8" style="resize:none">개인정보의 항목 및 수집방법
블라블라블라블라블라블라블라블라블라블라블라블라                        
블라블라블라블라블라블라블라블라블라블라블라블라
블라블라블라블라블라블라블라블라블라블라블라블라.................
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                
                <c:if test="${empty param.kakaoid}">
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="hidden" name="kakaoid" value="${param.kakaoid}">
                        <input type="text" class="form-control onlyAlphabetAndNumber"  name="id" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                    </div>
                </div>
                </c:if>
                <c:if test="${not empty param.kakaoid}" ></c:if>
                
                
                <c:if test="${empty param.kakaoid}" >
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" name="password"  data-rule-required="true" placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                </c:if>
                
                <c:if test="${not empty param.kakaoid}" ></c:if>
                
                <c:if test="${empty param.kakaoid}" >
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" name="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                </c:if>
                
                <c:if test="${not empty param.kakaoid}" ></c:if>
                
                <c:if test="${empty param.kakaoid}" >
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" name="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                </c:if>
                <c:if test="${not empty param.kakaoid}" ></c:if>
                
                
                <div class="form-group" id="divHeight">
                   <label for="inputHeight" class="col-lg-2 control-label">키</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="height" data-rule-required="true" placeholder="키" maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="divWeight">
                   <label for="inputWeight" class="col-lg-2 control-label">몸무게</label>
                   <div class="col-lg-10">
                   		<input type="hidden" name="kakaoid" value="${param.kakaoid}">
                        <input type="text" class="form-control" name="weight" data-rule-required="true" placeholder="몸무게" maxlength="15">
                        <input type="hidden" name="kakaoname" value="${param.kakaoname}">
                    </div>
                </div>
               
               <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="gender" name="gender">
                            <option value="M">남</option>
                            <option value="F">여</option>
                        </select>
                    </div>
                </div>
               
               
               
                <div class="form-group">
                    <label for="inputExercise" class="col-lg-2 control-label">프로필사진</label>
                    <div class="col-lg-10">
                        <input type="file" name="upload" size="30" id="upload" />
                    </div>
                </div>
                 <div class="form-group" id="divGoal">
                   <label for="inputGoal" class="col-lg-2 control-label">목표</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="goal" data-rule-required="true" placeholder="목표" maxlength="15">
                    </div>
                </div>
                <div class="form-group" >
                   <label for="inputGoal" class="col-lg-2 control-label">질문</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="question" data-rule-required="true" placeholder="아이디 및 비밀번호 찾을때 질문" maxlength="15">
                    </div>
                </div>
                
                <div class="form-group">
                   <label for="inputGoal" class="col-lg-2 control-label">대답</label>
                   <div class="col-lg-10">
                        <input type="text" class="form-control" name="answer" data-rule-required="true" placeholder="대답" maxlength="15">
                    </div>
                </div>
                 
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<c:if test="${not empty param.kakaoid}" >
                        <button type="submit" class="btn btn-primary">확인</button>
                        </c:if>
                        <c:if test="${empty param.kakaoid}" >
                        <button type="submit" class="btn btn-primary">확인</button>
                        </c:if>
                    </div>
                </div>
            </form>
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
