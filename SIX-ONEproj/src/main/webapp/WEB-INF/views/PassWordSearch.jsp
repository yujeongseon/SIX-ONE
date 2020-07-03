<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<img src="resources/images/black.jpg"
   style="width: 100%; height: 100px;" />
        <div class="container"><!-- 좌우측의 공간 확보 -->


         
            
       
                
                    <label for="inputId" class="col-lg-2 control-label" style="margin-top: 50px;">아이디</label>
                    <div class="col-lg-10" style="margin-top: 50px;">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="oldid" name="oldid" data-rule-required="true" placeholder="아이디를 입력하세요." maxlength="30">
                    </div>
                  
            
               
                	
                    <label for="inputPhoneNumber" class="col-lg-2 control-label" style="margin-top: 50px;">질문</label>
                    <div class="col-lg-10" style="margin-top: 50px;">
                        <select class="form-control" id="oldquestion" name="oldquestion">
                        	<option>질문을 선택하세요.</option>
                            <option>어린시절 가장 동경하던 인물은?</option>
                            <option>나의 보물1호는?</option>
                            <option>자신의 인생 좌우명은?</option>
                            <option>기억에 남는 추억의 장소는?</option>
                            <option>유년시절 가장 생각나는 친구 이름은?</option>
                            <option>나의 출신 초등학교는?</option>
                            <option>다른 이메일 주소는?</option>
                        </select>
                    </div>
                	
                
               
               		
                   <label for="inputGoal" class="col-lg-2 control-label" style="margin-top: 50px;">대답</label>
                   <div class="col-lg-10" style="margin-top: 50px;">
                        <input type="text" class="form-control" name="oldanswer" id="oldanswer" data-rule-required="true" placeholder="질문에 대한 대답을 입력해주세요." maxlength="15">
                    </div>
               		
                 
              		
                    <div class="col-lg-offset-2 col-lg-10" style="margin-top: 20px;">
                        <button type="button" class="btn btn-primary" id="okbutton" onclick="javascript:search()">확인</button>
                    </div>
             		
            
<script>

	$('#okbutton').on('click',function(){
		var id = $('#oldid').val();
		var question = $('#oldquestion').val();
		var answer = $('#oldanswer').val();

		$.ajax({
			url:"<c:url value='/find.do'/>",
			type:'get',
			dataType:'json',
			data:{id:id,question:question,answer:answer},
			success:function(data){
				var id;
				$.each(data,function(key,value){
					if(key == 'id'){
						id = value;
					}
				});
					$.each(data,function(key,value){
						if(key == 'password') {
							
						var ok = confirm(value);
						
						if(ok){
							window.location.href = "<c:url value='/searchLogin.do?id='/>"+id;
						}
	
						}
						if(key == '없는회원') {
							alert(value);
						}
					});
					
			},
			error:function(data){
				
			}
		});
	});

</script>            
<script>
$(function(){
	var pattern_num = /[0-9]/; //숫자
	var pattern_eng = /[a-zA-Z]/;	// 문자
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	
	$('#okbtn').on('click',function(){
		var newid = $('#newid').val();
		var question = $('#question').val();
		var answer = $('#answer').val();

		
		if(pattern_spc.test(newid) || pattern_kor.test(newid)){
			alert("아이디는 한글 또는 특수문자는 입력 불가능 합니다.");
		}
		else if(newid.trim() == '') {
			alert("아이디를 입력해주세요.");
		}
		else if(pattern_kor.test(newpassword)) {
			alert("한글은 입력 불가능 합니다.");
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