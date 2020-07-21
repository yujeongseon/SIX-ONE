<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.ex {

    background-image: url(resources/images/btn_sx.jpg);
    display: block;
    cursor: pointer;
    height: 13px;
    width: 13px;
    margin-right: 5px;
}

.basket ul li {
	font-size:14px;
	margin-bottom:3px;
}
.basket ul li a {
    float: left;
    margin: 3px 5px 0 20px;
}
.kcal{
	color: #ca481d;
}
.food_cart{
	background-image: url(resources/images/bt_cart.jpg);
	display: block;
    cursor: pointer;
    height: 13px;
    width: 13px;
    margin-right: 5px;
} 

#food_table tr td:last-child {
	text-align:center;
	padding-top:5px;
}

#food_table td {
    border-bottom: 1px rgb(128, 128, 128) solid;
    padding:9px 10px 5px;
    vertical-align:middle;
    font-size:14px;
}
#food_table th{
	border-top: none !important;
	background-color: #f9f9f9;
	padding: 9px 10px 5px;
	color:#333;	
}
.food{
	padding:15px 0;
}


#foodWrap{
	min-height: 400px; 
}
#cart{
	margin-top:15px;
	padding-right:0;
}
#cart > div {
	position:relative;
	background-color:#f9f9f9;
	min-height: 400px; 
	padding-bottom:50px;
}
#cart > div > p {
	margin-bottom:0;
	position:absolute;
	bottom: 12px;
    right: 25px;
    font-size: 20px;
    font-weight: bold;
    color:#000;
}
#cart .kcal {
	padding-left:10px;
}
#cart .cart_date {
	background-color: #f3f3f3;
    height: 37px;
    border-bottom: 1px solid #e7e7e7;
    line-height: 39px;
    color: #333;
}

#food_selector{
	color: #333;

}
#food_selector .food_select{
	font-size:14px !important;

}
#pred_loading div { /*로딩 이미지*/
	position: fixed;
	top:45%;
	left:45%;
	/*margin-left: -21px;
	margin-top: -21px;*/
	z-index: 9999;
}
.display_none{
	display: none;
}

.hiddenImage{
	visibility: hidden;
}
#pred_loading{
	position: fixed;
	top:0;
	width:100%;
	height:100%;
	background-color:red;
	z-index: 8888;
	background-color: rgba(128, 128, 128,0.2);
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
			
			<div class="row" style="margin-top:50px;">
				<h2>음식 칼로리 계산하기.</h2>
				<p>오늘 하루 먹은 음식의 칼로리를 계산해보세요</p>
				<hr/>
			</div>	
			
			<div class="row">
				<form id="food_selector">
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
			</div>
			
			<div class="row" style="margin-top: 30px;">
				<div id="foodWrap" class="col-md-12">
					<div class="col-md-8 table-responsive food">
						<table class="table table-condensed " id="food_table">
							<tr>
								<th>음식</th>
								<th>1회제공량</th>
								<th>칼로리</th>
								<th> </th>
							</tr>
							
							<%-- <tr>
			        		<td>고구마</td>
			        		<td>100</td>
			        		<td class="kcal">100kcal</td>
			        		<td><a href="#;" onclick="javascript:add_cart(this)">
		        			<img src="<c:url value="/resources/images/bt_cart.jpg"/>"/></a></td></tr>
							
							<tr>
			        		<td>고구마</td>
			        		<td>100</td>
			        		<td class="kcal">100kcal</td>
			        		<td><a href="#;" onclick="javascript:add_cart(this)">
		        			<img src="<c:url value="/resources/images/bt_cart.jpg"/>"/></a></td></tr>
		        			
		        			<tr>
			        		<td>고구마</td>
			        		<td>100</td>
			        		<td class="kcal">100kcal</td>
			        		<td><a href="#;" onclick="javascript:add_cart(this)">
		        			<img src="<c:url value="/resources/images/bt_cart.jpg"/>"/></a></td></tr> --%>						
													
						</table>						
						
					</div>
					
					<div id ="cart" class="col-md-4 text-center">
						<div>
							<div class="cart_date"><input id="datepicker" style="text-align: center" disabled><!-- 2020-06-10 --></div>
							<form class="form-horizontal">
							
								<label class="radio-inline"> 
									<input type="radio" name="foodRadio" id="inlineRadio1" value="b">아침
								</label> 
								
								<label class="radio-inline"> 
									<input type="radio" name="foodRadio" id="inlineRadio2" value="l">점심
								</label> 
								<label class="radio-inline"> 
									<input type="radio" name="foodRadio" id="inlineRadio3" value="d">저녁
								</label>
							
							</form>
							<div class="text-left basket"style="min-height: 300px" >
								<ul class="list-unstyled" id="my_food_list" style="padding-top: 20px">
								<!-- 
									<li><a href="javascript:void(0)" onclick="remove_cart(this)"><span class="ex"></span></a><span class="basket_menu">고구마 줄기 나물</span>&nbsp;<span class="kcal">300Kcal</span></li>
									<li><a href="#;"><span class="ex"></span></a><span class="basket_menu">흰쌀밥 1공기</span>&nbsp;<span class="kcal">300Kcal</span></li>
								 -->
								</ul>
							</div>
							<p><span id="total_kcal">0</span> kcal</p>
							
						</div>
						
						<button class="btn btn-warning" style="float:right;" onclick="javascript:foodSave()">저장하기</button>
						<button class="btn btn-primary" style="float:right;" onclick="javascript:openFoodModal()">사진올리기</button>
						
					</div>														
				</div>			
			</div>
										
		</div><!-- container -->
	</div>
	
	<!-- 음식 사진 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="foodModal">
		<div class="modal-dialog" role="document" style="width: 40%;">
			<div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                          aria-hidden="true">&times;</span></button>
                  <h4 class="exemodal-title">음식사진등록</h4>
              </div>
              <div class="modal-body">
                  <form id="FILE_FORM">
                 	<img id="image_section" src="#" alt="your image" style="width:100%;height:100%;"/>
                  	<input type="file" name="file" id="foodFile"/>
                  </form>
                  <div>
                  	<div class="text-left basket" >
						<ul class="list-unstyled" id="pred_food_list" style="padding-top: 20px">
							
							<li><a href="javascript:void(0)" onclick="remove_cart(this)"><span class="ex"></span></a><span class="basket_menu">고구마 줄기 나물</span>&nbsp;<span class="kcal">300Kcal</span></li>
							<li><a href="#;"><span class="ex"></span></a><span class="basket_menu">흰쌀밥 1공기</span>&nbsp;<span class="kcal">300Kcal</span></li>
						  	
						</ul>
						<div id="pred_food_kcal"></div>
					</div>
					
                  	<span id="pred_err" style="color:red;"></span>
                  </div>
             </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="predict_food">분석하기</button>
                <button type="button" class="btn btn-info" onclick="applyPred()">적용하기</button>
            </div>
          </div><!-- /.modal-content -->
		</div>
	</div>
	
	<div id="pred_loading" class="display_none">
		
		<div><img src="<c:url value='/resources/images/pred_loading.gif'/>"/></div>
	</div>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
		//음식 불러오기
		$.ajax({
	        type: "get",
	        url: "http://115.91.88.230:8082/restapi/foodGroup",
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
		        url: "http://115.91.88.230:8082/restapi/foodBrand/"+foodGroup,
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
			        url: "http://115.91.88.230:8082/restapi/foodName/"+foodGroup+"/"+foodBrand,
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
				        url: "http://115.91.88.230:8082/restapi/food/"+foodBrand+'/'+foodName,
				        dataType:'json',
				        success: function(response){
				        	var query = $('#food_table').html();
				        	var foodName = response['foodName'];
			        		query += '<tr>'
			        		query += '<td>'+response['foodName']+'</td>'
			        		query += '<td>'+response['foodOnce']+'</td>'
			        		query += '<td class="kcal">'+response['foodKcal']+'kcal</td>'
			        		query += '<td><a href="#;" onclick="javascript:add_cart('+"this"+')">'
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
		
		// 카트에 담기
		function add_cart(ss){
			var foodName = $(ss).closest('tr').find('td').eq(0).html();
			var foodKcal = $(ss).closest('tr').find('td').eq(2).html();		
			var query = $('#my_food_list').html();
			
			query += '<li><a href="#;" onclick="remove_cart('+"this"+')">'
			query += '<span class="ex"></span></a>'
			query += '<span class="basket_menu">'+foodName+'</span>&nbsp;'
			query += '<span class="kcal">'+foodKcal+'</span></li>'
			$('#my_food_list').html(query);
			
			var total_kcal = $('#total_kcal').html();
			food_kcal = foodKcal.substring(0,foodKcal.length-4)
			$('#total_kcal').html((parseInt(total_kcal)+parseInt(food_kcal)));
			
			
		}
		
		// 카트에서 삭제
		function remove_cart(e){
			if($(e).parent().parent().attr('id') == 'my_food_list'){
				var total_kcal = $('#total_kcal').html();
				var foodKcal = $(e).closest('li').find('span').eq(2).html();
				food_kcal = foodKcal.substring(0,foodKcal.length-4)
				$('#total_kcal').html((parseInt(total_kcal)-parseInt(food_kcal)));
			}
			else{
				var total_kcal = $('#pred_total_kcal').html();
				var foodKcal = $(e).closest('li').find('span').eq(2).html();
				food_kcal = foodKcal.substring(0,foodKcal.length-4)
				$('#pred_total_kcal').html((parseInt(total_kcal)-parseInt(food_kcal)));
			}
			$(e).parent().remove();
		}
		
		// 데이트피커
		$( "#datepicker" ).datepicker({
		      showOn: "button",
		      buttonImage: "resources/images/calendar-icon.png",
		      buttonImageOnly: true,
		      showButtonPanel: true,
		      buttonText: "Select date"
		    });
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");
		$( "#datepicker" ).datepicker('setDate', new Date());
		
		// 음식 저장하기
		function foodSave(){
			foodWhen = $(":input:radio[name=foodRadio]:checked").val();
			var foodLists = $('#my_food_list > li > .basket_menu');
			var kcalLists = $('#my_food_list > li > .kcal');
			var isLogin = ${LoginSuccess == null};
			if(isLogin){
				alert('식단을 저장하려먼 로그인이 필요합니다');
				$('#myModal').modal('show');
				return false;
			}
			if(foodWhen == null){
				alert('식사시간을 선택하세요');
				return false;
			}
			else if(foodLists.length == 0){
				alert('추가할 음식이 없습니다');
				return false;
			}
			
			var foodName = '';
			for(var i = 0; i < foodLists.length; i++){
				if(i == foodLists.length-1){
					foodName += $(foodLists[i]).html();
				}
				else{
					foodName += $(foodLists[i]).html() + ',';
				}
			}
			
			var foodKcal = '';
			for(var i = 0; i < kcalLists.length; i++){
				if(i == kcalLists.length-1){
					foodKcal += $(kcalLists[i]).html().substring(0,$(kcalLists[i]).html().length-4);
				}
				else{
					foodKcal += $(kcalLists[i]).html().substring(0,$(kcalLists[i]).html().length-4) + ',';
				}
			}
			
			$.ajax({
			        type: "get",
			        url: "/sixone/food.insert",
			        traditional : true,
			        data: {
		            	'foodWhen': foodWhen,
		                'foodName': foodName,
		                'foodKcal' : foodKcal,
		                'foodDate': $('#datepicker').val(),
		            },
			        success: function(response){
			        	if(response == 1){
			        		alert('저장 성공 했습니다');
			        		$('#my_food_list').html('');
			        		
			        	}
			        	else{
			        		alert('저장 실패 했습니다');
			        	}
			        	
			        },
			        error:function(request,error){
							console.log('상태코드:',request.status);
							console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
							console.log('에러:',error);
					}
			});
		}
		
		// 음식 모달 열기
		function openFoodModal(){
			$('#foodModal').modal('show');
			$('#foodFile').val('');
			$('#image_section').attr('src', '');
			$('#pred_food_list').html('');
			$("#pred_food_kcal").html('');
			$('#image_section').addClass('hiddenImage');			
		}
		
		$('#predict_food').on('click', function(){
			predict_food();
	    });

	
		
		// 분석버튼 누르기
		function predict_food(){
			if($("#foodFile").val() == ''){
        		$('#pred_err').html('사진을 올려주세요');
				return false;						
        	}
			$('#pred_err').html('');
			var form = $('#FILE_FORM')[0];
            var formData = new FormData(form);
            formData.append("file", jQuery("#foodFile")[0].files[0]);
        	
			$.ajax({
				type: "post",
		        url: "http://115.91.88.230:8282/foodImage",
		        data: formData,
	            contentType : false,
	            processData : false,
		        success: function(response){
		        	var food2 = response['food2'];
		        	//base64 디코딩 인코딩
		        	var base64Image = atob(btoa(food2));		         
		        	$('#image_section').prop('src','data:image/jpeg;base64,'+base64Image);
		        	var datas = response['datas'];
		        	$('#pred_food_list').html('');
		        	var query = '';
		        	var totalKcal = 0;
		        	datas.forEach(e => {
		        		query += '<li><a href="#;" onclick="remove_cart('+"this"+')">'
						query += '<span class="ex"></span></a>'
						query += '<span class="basket_menu">'+e[0]+'</span>&nbsp;'
						query += '<span class="kcal">'+parseInt(e[1])+'kcal</span></li>'
						totalKcal += e[1];
						
		        	})
		        	var kcalQuery = '<p><span id="pred_total_kcal">'+totalKcal+'</span> kcal</p>'
		        	$('#pred_food_list').html(query);
		        	$('#pred_food_kcal').html(kcalQuery);
		        },
		        beforeSend: function () {
		        	$('#pred_loading').removeClass('display_none');
		        },
		        complete: function () {
		        	$('#pred_loading').addClass('display_none');
     			},
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
				}
			}); //ajax
		}
		
		// 사진 미리보기
		function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  reader.onload = function (e) {
			   $('#image_section').attr('src', e.target.result);  
			  }
			  reader.readAsDataURL(input.files[0]);
			  }
			}
			  
		$("#foodFile").change(function(){
			$('#image_section').removeClass('hiddenImage');
			readURL(this);
		});
		
		// 적용하기
		function applyPred(){
			var predFoodList = $('#pred_food_list').html()
			if(predFoodList == ''){
				$('#pred_err').html('적용할 데이타가 없습니다');
				return false;
			}
			$('#pred_err').html('');
			var myFoodList = $('#my_food_list').html();
			myFoodList += $('#pred_food_list').html();
			$('#my_food_list').html(myFoodList)
			
			var total_kcal = $('#total_kcal').html();
			total_kcal = parseInt(total_kcal) + parseInt($('#pred_total_kcal').html());
			$('#total_kcal').html(total_kcal);
			$('#foodModal').modal('hide');	
		
		} // applyPred
		
		
		
		
	</script>

		
	
			
			
</html>

