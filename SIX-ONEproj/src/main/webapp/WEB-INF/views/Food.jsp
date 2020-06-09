<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	




</style>

	
	<aside id="colorlib-hero">
		<div class="flexslider">
			<ul class="slides">
		   	<li style="background-image: url(resources/images/img_bg_2.jpg);">
		   		<div class="overlay"></div>
		   		<div class="container-fluid">
		   			<div class="row">
			   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
			   				<div class="slider-text-inner text-center">
			   					<h1>식단</h1>
								<h2><span><a href="<c:url value='/'/>">Home</a> | <a href="#Exercise" class="scroll" style="color:white">바로가기</a></span></h2>
			   				</div>
			   			</div>
			   		</div>
		   		</div>
		   	</li>
		  	</ul>
	  	</div>
	</aside>
	<!-- 나중에 크롤링 같은거 배우면 여기에 적용하자 -->
	
	<div class="colorlib-blog">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2 style="font-size:3em; font-weight: bold">"GET FIT IN THE GYM,<br/> LOSE WEIGHT IN THE KITCHEN"</h2>
					<p style="font-size:2em">"몸매는 헬스장에서 관리하고, 다이어트는 부엌에서 해라"
				</div>
				<div class="col-md-12 text-center" style="margin-top:30px">	
					<img src="<c:url value="/resources/images/backimg01.jpg"/>"style="margin-bottom: 30px" alt=""/>
					<h2><span><b id="gangjo">올바른</b>식습관</span></h2>
						<p>
							<span style="color: red; font-size: 20px;">하나.</span>충분한 수분섭취를 한다<br> 
							<span style="color: red; font-size: 20px;">둘.</span>영양소 균형을 맞춰준다<br> 
							<span style="color: red; font-size: 20px;">셋.</span>식사시 음식에만 집중한다<br> 
							<span style="color: red; font-size: 20px;">넷.</span>오후 6시이후로 안먹는다<br> 
							<span style="color: red; font-size: 20px;">다섯.</span>계절 채소로 직접 조리해 먹는다
						</p>
				</div>
			</div>
			
			<div class="row">
				<h2>음식 칼로리 계산하기.</h2>
				<p>오늘 하루 먹은 음식의 칼로리를 계산해보세요</p>
				<hr/>
			</div>	
			
			<div class="row">
				<form>
					<div class="col-md-3">
						<label for="foodGroup">식품군</label>
						<select class="form-control food_select" id="foodGroup" multiple class="form-control" style="height: 300px">
						</select>				
					</div>
					
					<div class="col-md-3">
						<label for="foodName">식품명</label>
						<select class="form-control food_select" id="foodName" multiple class="form-control" style="height: 300px">
						  <option value="">식품군을 선택하세요</option>
						</select>				
					</div>
					
					<div class="col-md-6">
						<label for="foodContent">내용</label>
						<select class="form-control food_select" id="foodContent"multiple class="form-control" style="height: 300px">
						  
						</select>				
					</div>
				
				 	
				</form>
				<hr/>
			</div>
				
				
				
				
				
				
				
				
				
		</div><!-- container -->
	</div>

	<script>
		$.ajax({
	        type: "get",
	        url: "http://192.168.0.36:9090/restapi/foodGroup",
	        dataType:'json',
	        success: function(response){
	        	var query;
	        	response.forEach(function(el){
	        		query += '<option value="'+el['foodGroup']+'">'+el['foodGroup']+'</option>'
	        		
	        	});
	        	
	        	
	        	$('#foodGroup').html(query)
	        	
	        },
	        error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
					console.log('에러:',error);
				
			}
		});
		
		$('#foodGroup').change(function(){
			var foodGroup = $(this).val()[0];
			
			$.ajax({
		        type: "get",
		        url: "http://192.168.0.36:9090/restapi/foodName/"+foodGroup,
		        data:{
		        },
		        dataType:'json',
		        success: function(response){
		        	var query;
		        	response.forEach(function(el){
		        		query += '<option value="'+el['foodName']+'">'+el['foodName']+'</option>'
		        		
		        	});
		        	
		        	$('#foodName').html(query)
		        	
		        },
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
					
				}
			});
			
		});
		
		$('#foodName').change(function(){
			var foodName = $(this).val()[0];
			
			$.ajax({
		        type: "get",
		        url: "http://192.168.0.36:9090/restapi/food/"+foodName,
		        dataType:'json',
		        success: function(response){
		        	var query;
		        	query += '<option value="'+response['foodCode']+'">단백질:'+response['foodProtein']+', 탄수화물:'+response['foodCarbohydrate']+', 지방:'+response['foodFat']+', 칼로리:'+response['foodEnergy']+'</option>'
		        		
		        	$('#foodContent').html(query)
		        	
		        },
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
					
				}
			});
			
			
			
			
			
		});
		
		
		
	
	
	
	
	</script>

		
	
			
			
</html>

