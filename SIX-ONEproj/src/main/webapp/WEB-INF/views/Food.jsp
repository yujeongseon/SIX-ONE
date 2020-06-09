<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.food_list ul li {
    font-family: NanumSquare;
    list-style: none;
    float: left;
    margin: 3px 3px 0 0px;
    width: 164.5px;
    text-align: center;
    background-color: #21B9BC;
    height: 48px;
    line-height: 48px;
    color: #ffffff;
    font-size: 12.5pt;
}
.calculator {
    overflow: hidden;
    float: left;
    width: 670px;
    border-right: 1px solid #F7F7F7;
    min-height: 694px;
}
.all {
    width: 1003px;
    margin: 30px auto 0px;
    border: 1px solid #626463;
    background-color: white;
    overflow: hidden;
}



</style>




<style>
* {margin:0px; padding:0px;}

html, body {height:1080px; width:100%;}
body { font-family: '돋움'; }
a {text-decoration: none;}

.all {width:1003px; margin:30px auto 0px; border:1px solid #626463; background-color:white; overflow:hidden;}
#sort {text-align:right; float:right;}
#sort li {float:right; text-align:center; line-height:30px; list-style:none;}
#sort li a {padding:10px 17px;}
#kind_select {margin:69px auto 0px; /*252px auto 0px; */width:1005px;}

.food {float:left; height:40px; margin: -4px 0 0 15px;}
.food h7 {float:left; width:160px; font-size:9pt; font-family:'돋움', 'Dotum'; color:#606060;}
.food .kcal_sort {float:left; width:50px; font-family:Verdana, Sans-serif; color:#00b1b8; font-size:9pt;}
.food ul li {list-style: none; border-bottom: 1px solid #f0f0f0;}
.food ul li a {width:50px; margin:4px 0 0 40px;}
.food ul li h7 img {margin: 0 4px 4px 0;}
.pre_view .food ul {float:left;}
.pre_view .food ul li {float:left; margin-left:10px;}
.ex {background: url("/images/kcal/btn_sx.jpg") no-repeat scroll 0 0; display:block; cursor: pointer; height: 13px; width: 13px; margin-right:5px; }

.food_list {width:1005px; margin: 0 auto;}
.food_list ul {overflow:hidden;}
.food_list ul li {font-family:NanumSquare; list-style: none; float:left; margin:3px 3px 0 0px; width:164.5px; text-align:center; background-color:#21B9BC; height:48px; line-height:48px; color:#ffffff; font-size:12.5pt;}
.food_list ul li:hover {background-color:#252525;}

.pre_view {width:100%; margin: 40px 0 0 10px;}
.calculator {overflow:hidden; float:left; width:670px; border-right:1px solid #F7F7F7; min-height:694px;}
#datepicker {border:none; border-right:0px; border-top:0px; border-left:0px; border-bottom:0px; font-size:9pt; font-weight:bold; cursor:pointer; margin:30px 0 0 0; width:125px; font-family:'돋움', 'Dotum'; color:#606060;}
.ui-datepicker-trigger { vertical-align:middle;}
/* 빼주려면 .basket height .total_kcal position, .kcal_cal position 삭제 */
.total {margin:0 auto; float:left; width:332px;}
.total_kcal {width:272px; position:relative; height:272px; margin:0 30px; background-color:#F7F7F7;}

.advice {width:272px; text-align:center; margin: 0 auto; height:37px; line-height:35px; font-family:Verdana; font-size:9pt; color:#464646; font-weight:bold; }
.explain { width:272px; position:relative; margin: 0px auto; text-align:center; background:#e5f7f7; height:83px; }
.explain span { line-height:55px; font-size:9pt; font-family:'돋움', 'Dotum'; }
.explain span p { margin-top:-17px; color:#00b2b6; font-family:'돋움', 'Dotum'; font-size:9pt; font-weight:bold; }

.basket {height:270px; border:1px solid #ededed;}
.basket ul {margin:20px 0 -15px 0;}
.basket ul li {list-style:none; vertical-align: middle;}
.basket ul li a {float:left; margin:4px 0 0 20px;}

.basket_Kcal {border-bottom:1px dotted #ededed;}
.basket_menu {font-family: '돋움', 'dotum'; color:#606060; font-size:9pt;}
.plus {text-align:right; margin:20px 30px 0 0; font-size:18pt; font-weight:bold; font-family:Verdana, Sans-serif;}
.kcal_cal {position:absolute; top:200px; width:100%;}
/* #wrap1 {background:url('/images/kcal/bg1.jpg') no-repeat; background-size: cover; padding-bottom:200px; }
#wrap2 {background:url('/images/kcal/bg2.jpg') no-repeat; background-size: cover; padding-bottom:200px; }
#wrap3 {background:url('/images/kcal/bg3.jpg') no-repeat; background-size: cover; padding-bottom:200px; }
#wrap4 {background:url('/images/kcal/bg4.jpg') no-repeat; background-size: cover; padding-bottom:200px; } */
#wrap1 { z-index:9999; }
#wrap2 { z-index:9999; }
#wrap3 { z-index:9999; }
#wrap4 { z-index:9999; }

.kcal {color:#21b9bc; font-weight:bold; font-family: '돋움', 'dotum'; font-size:9pt;}

.calendar {text-align:center; margin-bottom:10px;}
.choice {text-align:center; margin:5px 0 5px 0;}
.click {text-align:center;}
.underline {border-bottom: 1px solid #659D9E; max-width:250px; margin:0 auto;}
.selector {margin: 0 5px 0 0; vertical-align: middle;}

label[for="select1"] {font-family: '돋움', 'dotum'; font-size:8pt; color:#969696;};

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
			
			
			<div class="row">
				<div id="kind_select" class="col-md-12 text-center">
					<div class="food_list">
						<ul>
								<a href="#" id="food1"><li>밥류</li></a>
								<a href="#" id="food2"><li>국 / 찌개</li></a>
								<a href="#" id="food3"><li>조림 / 볶음류</li></a>
								<a href="#" id="food4"><li>구이 / 튀김 / 전류</li></a>
								<a href="#" id="food5"><li>생채 / 숙채 / 무침류</li></a>
								<a href="#" id="food10"><li>차 / 음료 / 우유</li></a>
								<a href="#" id="food6"><li>양식</li></a>
								<a href="#" id="food11"><li>일식 / 중식</li></a>
								<a href="#" id="food12"><li>일품요리 / 분식</li></a>
								<a href="#" id="food8"><li>빵 / 케이크</li></a>
								<a href="#" id="food7"><li>과일류</li></a>
								<a href="#" id="food9"><li>주류</li></a>
							</ul>
					</div>
				</div>
			
			
			
			
			</div>	
			
				
			<div class="all">
				<div class="calculator">
						<div id="list">
							<div class="calorie_chart">
								<p class="chart">
								<span id="total">
								
								</span>
								</p>
								
								<div class="menu" style="margin:10px 0 0 0px">
									<div class="pre_view"><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">흰쌀밥 반공기</h7><p id="food1" class="kcal_sort">150kcal</p><a class="btn_cart" href="javascript:basket(&quot;흰쌀밥 반공기&quot;,150, 1);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">흰쌀밥 1공기</h7><p id="food2" class="kcal_sort">300kcal</p><a class="btn_cart" href="javascript:basket(&quot;흰쌀밥 1공기&quot;,300, 2);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">현미밥 반공기</h7><p id="food3" class="kcal_sort">160kcal</p><a class="btn_cart" href="javascript:basket(&quot;현미밥 반공기&quot;,160, 3);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">현미밥 1공기</h7><p id="food4" class="kcal_sort">321kcal</p><a class="btn_cart" href="javascript:basket(&quot;현미밥 1공기&quot;,321, 4);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">보리밥 반공기</h7><p id="food5" class="kcal_sort">145kcal</p><a class="btn_cart" href="javascript:basket(&quot;보리밥 반공기&quot;,145, 5);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">보리밥 1공기</h7><p id="food6" class="kcal_sort">290kcal</p><a class="btn_cart" href="javascript:basket(&quot;보리밥 1공기&quot;,290, 6);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">검정콩밥 반공기</h7><p id="food7" class="kcal_sort">170kcal</p><a class="btn_cart" href="javascript:basket(&quot;검정콩밥 반공기&quot;,170, 7);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">검정콩밥 1공기</h7><p id="food8" class="kcal_sort">340kcal</p><a class="btn_cart" href="javascript:basket(&quot;검정콩밥 1공기&quot;,340, 8);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">씨리얼 1공기</h7><p id="food9" class="kcal_sort">350kcal</p><a class="btn_cart" href="javascript:basket(&quot;씨리얼 1공기&quot;,350, 9);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">흰죽 1공기</h7><p id="food10" class="kcal_sort">150kcal</p><a class="btn_cart" href="javascript:basket(&quot;흰죽 1공기&quot;,150, 10);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">잣죽 1인분</h7><p id="food11" class="kcal_sort">275kcal</p><a class="btn_cart" href="javascript:basket(&quot;잣죽 1인분&quot;,275, 11);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">야채죽 1인분</h7><p id="food12" class="kcal_sort">215kcal</p><a class="btn_cart" href="javascript:basket(&quot;야채죽 1인분&quot;,215, 12);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">경단 5개</h7><p id="food13" class="kcal_sort">240kcal</p><a class="btn_cart" href="javascript:basket(&quot;경단 5개&quot;,240, 13);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">백설기 1쪽</h7><p id="food14" class="kcal_sort">234kcal</p><a class="btn_cart" href="javascript:basket(&quot;백설기 1쪽&quot;,234, 14);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">송편 5개</h7><p id="food15" class="kcal_sort">215kcal</p><a class="btn_cart" href="javascript:basket(&quot;송편 5개&quot;,215, 15);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">약식 1쪽</h7><p id="food16" class="kcal_sort">130kcal</p><a class="btn_cart" href="javascript:basket(&quot;약식 1쪽&quot;,130, 16);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">인절미 6개</h7><p id="food229" class="kcal_sort">450kcal</p><a class="btn_cart" href="javascript:basket(&quot;인절미 6개&quot;,450, 229);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">절편 5개</h7><p id="food230" class="kcal_sort">220kcal</p><a class="btn_cart" href="javascript:basket(&quot;절편 5개&quot;,220, 230);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">찐감자 1개</h7><p id="food231" class="kcal_sort">109kcal</p><a class="btn_cart" href="javascript:basket(&quot;찐감자 1개&quot;,109, 231);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">찐고구마 1개</h7><p id="food232" class="kcal_sort">250kcal</p><a class="btn_cart" href="javascript:basket(&quot;찐고구마 1개&quot;,250, 232);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">밥</h7><p id="food233" class="kcal_sort">1kcal</p><a class="btn_cart" href="javascript:basket(&quot;밥&quot;,1, 233);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">초밥</h7><p id="food238" class="kcal_sort">120kcal</p><a class="btn_cart" href="javascript:basket(&quot;초밥&quot;,120, 238);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">새우볶음밥</h7><p id="food257" class="kcal_sort">0kcal</p><a class="btn_cart" href="javascript:basket(&quot;새우볶음밥&quot;,0, 257);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div><div class="food"><ul><li><h7><img src="/images/kcal/ico_dot.jpg">쌀국수</h7><p id="food258" class="kcal_sort">320kcal</p><a class="btn_cart" href="javascript:basket(&quot;쌀국수&quot;,320, 258);"><img src="/images/kcal/bt_cart.jpg"></a></li></ul></div></div>
									<!-- <div class="pagination">
									
									</div> -->
								</div>
							</div>
						</div>
				</div>
			
				<div class="total">
				<div class="calendar">
						<input type="text" id="datepicker" name="date_save" autocomplete="off" value="2020.06.09.&nbsp;화요일" readonly="" class="hasDatepicker"><img class="ui-datepicker-trigger" src="/images/kcal/ico_calendar.jpg" alt="Select date" title="Select date">
						<input type="hidden" id="day" name="day" value="수">
				</div>
				<div class="underline"></div>
				<div class="choice">
					
						<input type="radio" class="selector" name="choice" id="select1" value="breakfast"><label for="select1" style="font-family: '돋움', 'dotum'; font-size:8.5pt; color:#969696;">아침</label>&nbsp;
						<input type="radio" class="selector" name="choice" id="select2" value="lunch"><label for="select2" style="font-family: '돋움', 'dotum'; font-size:8.5pt; color:#969696;">점심</label>&nbsp;
						<input type="radio" class="selector" name="choice" id="select3" value="dinner"><label for="select3" style="font-family: '돋움', 'dotum'; font-size:8.5pt; color:#969696;">저녁</label>&nbsp;
						<input type="radio" class="selector" name="choice" id="select4" value="snack"><label for="select4" style="font-family: '돋움', 'dotum'; font-size:8.5pt; color:#969696;">간식</label>
					
				</div>
				
				<div class="total_kcal">
					
					<div class="basket">
						
					<ul class="basket_del120"><li><a href="javascript:basket_del(120, 215, 215, &quot;야채죽 1인분&quot;);"><span class="ex"></span></a><span class="basket_menu">야채죽 1인분</span>&nbsp;<span class="kcal">215Kcal</span></li></ul></div>
					<div class="kcal_cal">
						<p class="basket_Kcal"></p>
							<span class="plus" id="plus" style="display: block;">215Kcal</span>
						
					</div>
					
				</div>
				
				
				<br>
				<div class="click">
						<a href="#" onclick="javascript:stats(); return false;"><img src="/images/kcal/bt_monthly.jpg"></a>
						<input type="image" src="/images/kcal/bt_save.jpg" name="click_save" id="click_save">
				</div>
				<br><br>
				<div style="background:#c9f1f1; height:120px; margin:0 auto; width:272px; border:1px solid #c9f1f1;">
				<div class="explain"><span>200 ~ 250kcal를 소모하려면 ? <br><p>스쿼시 20분</p></span></div>
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

