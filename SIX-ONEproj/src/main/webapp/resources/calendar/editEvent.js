/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event) {
    
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID
    

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editCount.val(event.extendedProps.count);
    editStart.val(moment(event.start).format('YYYY-MM-DD'));
    editEnd.val(moment(event.end-1).format('YYYY-MM-DD'));
    editDesc.val(event.extendedProps.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);
    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }
        
        var calendarNo = event.extendedProps.calendarNo;
        var routineNo = event.extendedProps.routineNo;
        var playNo = event.extendedProps.playNo;
        var title = editTitle.val();
        var count = editCount.val();
        var start = moment(editStart.val()).format('YYYY-MM-DD');
        var end = moment(editEnd.val()).format('YYYY-MM-DD');
        var backgroundColor = editColor.val();
        var description = event.description = editDesc.val();
        

        event.setProp('title',title);
        event.setExtendedProp('count',count);
        event.setStart(start);
        event.setEnd(end);
        event.setAllDay(true);
        
        event.setProp('backgroundColor',backgroundColor);
        event.setExtendedProp('description',description);

        eventModal.modal('hide');

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "/sixone/schedule.updateOne",
            data: {
            	'calendarNo': calendarNo,
            	'routineNo': routineNo,
            	'playNo': playNo,
            	'title': editTitle.val(),
                'count': count,
                'start': start,
                'end': end,
                'description': description,
                'username': 'kim',
                'backgroundColor': backgroundColor
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

    });


// 삭제버튼
$('#deleteEvent').unbind();
$('#deleteEvent').on('click', function () {
    event.remove();
    eventModal.modal('hide');
    var calendarNo = event.extendedProps.calendarNo;
    //삭제시
    $.ajax({
        type: "get",
        url: "/sixone/schedule.delete",
        data: {
        	"calendarNo":calendarNo
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});

};