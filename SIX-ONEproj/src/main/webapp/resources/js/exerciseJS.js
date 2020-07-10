/*! Respond.js v1.4.2: min/max-width media query polyfill * Copyright 2013 Scott Jehl
 * Licensed under https://github.com/scottjehl/Respond/blob/master/LICENSE-MIT
 *  */
$(function(){
	$('#btn').click(function(){
		var exercise = $('#selected').val();
		var intexercise = parseFloat(exercise);
		var kg = $('#kg').val();
		var intkg = parseInt(kg);
		var m = $('#m').val();
		var intm = parseInt(m);
		var kcal = 0;
		if(!exercise) {
			$('#kclavalue').html("운동을 선택 하세요.");
			return;
		}
		
		
		if(isNaN(kg)) {
			$('#kclavalue').html("몸무게는 숫자만 입력하세요");
			return;
		}
		else if(isNaN(m)) {
			$('#kclavalue').html("운동시간은 숫자만 입력하세요");
			return;
		}
	
		else if(kg == '') {
			$('#kclavalue').html("몸무게를 입력하세요");
			return;
		}
		else if(m == '') {
			$('#kclavalue').html("운동할 시간을 정해주세요");
			return;
		}
		else if(intkg == "Nan") {
			$('#kclavalue').html("몸무게는 숫자만 입력하세요");
			return;
			}
		
		switch (intexercise) {
		case 0.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 1: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 1.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 2: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 2.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 3:
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 3.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 4: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 4.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;	
		case 5.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 6: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 6.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 7: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 7.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 8: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 8.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 9: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 9.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 10: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 10.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 11: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 11.5: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		case 12: 
			kcal = Math.ceil(5*intexercise*3.5*intkg*intm/1000);
			$('#kclavalue').html(kcal+"kcal");
			break;
		}
		
	});
});
