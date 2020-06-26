$(function(){

	$(document).ready(function () { $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .4) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); });

	
	$("#myinformation").trigger("click");
	
	
	$('#kgup').on('click',function(){
		var weight = $('#weight').html();
		var Intweight = parseFloat(weight);
		var aa = $('#weight').html(Intweight + 1);
		$('#weightid').val(Intweight + 1);
		
	});
		

	$('#kgdown').on('click',function(){
		var weight = $('#weight').html();
		var Intweight = parseFloat(weight);
		var aa = $('#weight').html(Intweight - 1);
		$('#weightid').val(Intweight - 1);
	});
	
});

var weight = $('#weight').html();
var Intweight = parseFloat(weight);


		var weight = Intweight;
		var heightCM = 172;
		var age = 24;
		var heightM = heightCM * 0.01;
		


		// BMI 지수 = 체중 ÷ (키 x 키)
		var bmiResult = (weight / (heightM * heightM)).toFixed(2);
		bmiResult = parseFloat(bmiResult);
		var bmiResult = bmiResult.toFixed(2);
		if(bmiResult <= 18.5) {
			$('#target').after('<span class="label label-success" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		else if(bmiResult <= 24.8) {
			$('#target').after('<span class="label label-primary" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		else if(bmiResult <= 29.8) {
			$('#target').after('<span class="label label-warning" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		else {
			$('#target').after('<span class="label label-danger" id="bmi"><span id="bmiResult" style="font-weight: bold;"></span> kg/m2</span>');
			$('#bmiResult').html(bmiResult);
		}
		
		
		

		// 18.5 미만	저체중
		// 18.6 ~ 22.9	표준
		// 23.0 ~ 24.9	과체중
		// 25.0 ~ 29.9	중도비만
		// 30.0 이상	고도비만
		//남성 체지방량kg = (1.10 x 본인체중kg) - (128 x (본인체중kg ÷ 본인키cm))
		//여성 체지방량kg = (1.07 x 본인체중kg) - (128 x (본인체중kg ÷ 본인키cm))
		//var fatResult = (1.07 * weight) - (128 * (weight / heightCM)).toFixed(2);   // 여자
		var fatResult = (1.10 * weight) - (128 * (weight / heightCM)).toFixed(2);  //남자
		fatResult = parseFloat(fatResult);
		fatResult = fatResult.toFixed(2);
		if(fatResult <= 18.5) {
			$('#calor').after('<span class="label label-success"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else if(fatResult <= 22.9) {
			$('#calor').after('<span class="label label-primary"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else if(fatResult <= 24.9) {
			$('#calor').after('<span class="label label-info"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else if(fatResult <= 29.9) {
			$('#calor').after('<span class="label label-warning"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		else{
			$('#calor').after('<span class="label label-danger"><span id="fatResult" style="font-weight: bold;"></span> kg</span>');
			$('#fatResult').html(fatResult);
		}
		
		
		
		
		//var fatResult = fatResult.toFixed(2);
		
		
		
		// 17.0 이하	저체중	20.0 이하	저체중
		// 17.1 ~ 22.9	표준	20.1 ~ 26.9	표준
		//23.0 ~ 27.9	과체중	27.0 ~ 32.9	과체중
		// 28.0 ~ 37.9	중도비만	33.0 ~ 42.9	중도비만
		// 38.0 이상		고도비만	43.0 이상		고도비만



		//비만도
		//표준체중(남) = (신장 - 100) * 0.9
		//표준체중(여) = (신장 - 105) * 0.9
		//비만도 = (실제체중 / 표준체중) * 100
		var ratioResult = ((weight / ((heightCM - 100) * 0.9)) * 100).toFixed(2); //남자
		//var ratioResult = ((weight / ((heightCM - 105) * 0.9)) * 100).toFixed(2); // 여자
		ratioResult = parseFloat(ratioResult);
		ratioResult = ratioResult.toFixed(2);
		
		if(ratioResult <= 94) {
			$('#Beman').after('<span class="label label-success"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else if(ratioResult <= 119) {
			console.log(ratioResult);
			$('#Beman').after('<span class="label label-primary"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else if(ratioResult <= 129) {
			$('#Beman').after('<span class="label label-info"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else if(ratioResult <= 149) {
			$('#Beman').after('<span class="label label-warning"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}
		else{
			$('#Beman').after('<span class="label label-danger"><span id="ratioResult" style="font-weight: bold;"></span></span>');
			$('#ratioResult').html(ratioResult);
		}

		// 90 ~ 110%	저체중
		// 110 ~ 119 %	표준
		// 120 ~ 129%	과체중
		// 130 ~ 149%	중도비만
		// 150%	고도비만

		//기초대사량
		//남자 = 66.47+(13.75 x 체중)+(5 x 키) - (6.76 x 나이)
		//여자 = 655.1+(9.56 x 체중)+(1.85 x 키) - (4.68 x 나이)
		var kcalResult = (66.47 +(13.75 * weight) + (5 * heightCM) - (6.76 * age)).toFixed(2);//남자
		//var kcalResult = (655.1 +(9.56 * weight) + (1.85 * heightCM) - (4.68 * age)).toFixed(2); //여자
		kcalResult = parseFloat(kcalResult);
		kcalResult = kcalResult.toFixed(2);
		
		$('#daesalyang').after('<span class="label label-primary" id="Result"><span id="kcalResult" style="font-weight: bold;"></span>kcal</span>');
		$('#kcalResult').html(kcalResult);
			
		

		//		남자 						여자
		// 나이	평균 기초대사량				 나이	평균 기초대사량
		// 20 ~ 29세	1728 ± 368.2 ㎉		20 ~ 29세	1311.5 ± 233.0 ㎉
		// 30 ~ 49세	1669.5 ± 302.1 ㎉	30 ~ 49세	1316.8 ± 225.9 ㎉
		// 50세 이상	1493.8 ± 315.3 ㎉	50세 이상	1252.5 ± 228.6 ㎉	
		
		
		$(function(){
			$('#tb').hide();
			$('#Result').on('mouseenter',function(){
				$('#tb').show();
			});
			
			$('#Result').on('mouseleave',function(){
				$('#tb').hide();
			});
			
			$('#tb').hide();
			$('#daesalyang').on('mouseenter',function(){
				$('#tb').show();
			});
			
			$('#daesalyang').on('mouseleave',function(){
				$('#tb').hide();
			});
			
			
			
			
			
			
		});