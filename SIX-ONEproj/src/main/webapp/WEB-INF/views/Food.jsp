<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.ex {
    background-image: url(resources/images/btn_sx.jpg);
    display: block;
    cursor: pointer;
    height: 13px;
    width: 13px;
    margin-right: 5px;
}

.basket ul li a {
    float: left;
    margin: 4px 0 0 20px;
}
.kcal{
	color: #1a252f;
	font-weight: bold;


}
.food_cart{
	background-image: url(resources/images/bt_cart.jpg);
	display: block;
    cursor: pointer;
    height: 13px;
    width: 13px;
    margin-right: 5px;
} 

.food table tr a {
    width: 50px;
    margin: 4px 0 0 40px;
}
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
						<label for="foodName">브랜드명</label>
						<select class="form-control food_select" id="foodBrand" multiple class="form-control" style="height: 300px">
						 	<option value="">식품군을 선택하세요</option>
						</select>				
					</div>
					
					<div class="col-md-6">
						<label for="foodContent">식품명</label>
						<select class="form-control food_select" id="foodName"multiple class="form-control" style="height: 300px">
						 	<option value="">브랜드를 선택하세요</option>
						</select>				
					</div>
				
				 	
				</form>
				<hr/>
			</div>
			
			<div class="row" style="margin-top: 30px;">
				<div class="col-md-12" style="border: solid 1px #abacb1; min-height: 500px;">
					<div class="col-md-8 table-responsive food">
						<table class="table table-condensed " id="food_table">
							<tr>
								<th>음식</th>
								<th>1회제공량</th>
								<th>칼로리</th>
							</tr>
							
						</table>
						
						
					</div>
					
					<div class="col-md-4 text-center" style="min-height: 500px;">
						<div style="margin-top: 10px">2020-06-10</div>
						<div class="text-left basket"style="background-color: #f2f3f7; min-height: 350px" >
							<ul class="list-unstyled" id="my_food_list" style="padding-top: 10px">
								<li><a href="#"><span class="ex"></span></a><span class="basket_menu">고구마 줄기 나물</span>&nbsp;<span class="kcal">300Kcal</span></li>
								<li><a href="#"><span class="ex"></span></a><span class="basket_menu">흰쌀밥 1공기</span>&nbsp;<span class="kcal">300Kcal</span></li>
							</ul>
						
						
						</div>
						
					
					
					
					
					</div>
					
					
					
				
				
				
				
				</div>
				
			
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
		        url: "http://192.168.0.36:9090/restapi/foodBrand/"+foodGroup,
		        data:{
		        },
		        dataType:'json',
		        success: function(response){
		        	var query;
		        	response.forEach(function(el){
		        		query += '<option value="'+el['foodBrand']+'">'+el['foodBrand']+'</option>'
		        		
		        	});
		        	
		        	$('#foodBrand').html(query)
		        	
		        },
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
					
				}
			});
			
			$('#foodName').html('<option value="">브랜드를 선택하세요</option>');
			
		});
		
		$('#foodBrand').change(function(){
			var foodBrand = $(this).val()[0];
			var foodGroup = $('#foodGroup').val();
			if(foodBrand != ''){
				
				$.ajax({
			        type: "get",
			        url: "http://192.168.0.36:9090/restapi/foodName/"+foodGroup+"/"+foodBrand,
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
			}
			
		});
		
		var index = 1;
		$('#foodName').change(function(){
			var foodName = $(this).val()[0];
			var foodBrand = $('#foodBrand').val();
			
			if(foodName != ''){
			
				$.ajax({
				        type: "get",
				        url: "http://192.168.0.36:9090/restapi/food/"+foodBrand+'/'+foodName,
				        dataType:'json',
				        success: function(response){
				        	var query = $('#food_table').html();
				        	var foodName = response['foodName'];
				        	console.log(foodName)
			        		query += '<tr>'
			        		query += '<td>'+response['foodName']+'</td>'
			        		query += '<td>'+response['foodOnce']+'</td>'
			        		query += '<td class="kcal">'+response['foodKcal']+'kcal</td>'
			        		query += '<td><a class="btn_cart" onclick="javascript:add_cart('+"this"+')">'
		        			query += '<img src="<c:url value="/resources/images/bt_cart.jpg"/>"/></a></td></tr>'
							
				        	
				        	$('#food_table').html(query);
		        			index +=1;
				        	
				        },
				        error:function(request,error){
								console.log('상태코드:',request.status);
								console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
								console.log('에러:',error);
							
						}
				});
			
			}
			
			
			
		});
		
		
		function add_cart(ss){
			var foodName = $(ss).closest('tr').find('td').eq(0).html();
			var foodKcal = $(ss).closest('tr').find('td').eq(2).html();
		
			
			var query = $('#my_food_list').html();
			query += '<li><a href="#">'
			query += '<span class="ex"></span></a>'
			query += '<span class="basket_menu">'+foodName+'</span>&nbsp;'
			query += '<span class="kcal">'+foodKcal+'Kcal</span></li>'
			$('#my_food_list').html(query);
			
			
		}
		
		
	
	
	</script>

		
	
			
			
</html>

