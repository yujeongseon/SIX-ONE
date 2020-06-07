//SELECT 색 변경
//$('#exe-part').css('color','#d92027');


$('#exe-part').change(function () {
    $(this).css('color', $('#exe-part option:selected').css('color'));
});


//datetimepicker
$("#edit-start, #edit-end").datetimepicker({
    format: 'YYYY-MM-DD'
});