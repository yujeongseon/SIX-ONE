/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event,calendar) {
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID
    

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editCount.val(event.extendedProps.count);
    editSetCount.val(event.extendedProps.setCount);
    editStart.val(moment(event.start).format('YYYY-MM-DD'));
    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }
        
        var playNo = event.id;
        var routineNo = event.extendedProps.routineNo;
        var title = editTitle.val();
        var count = editCount.val();
        var setCount = editSetCount.val();
        var start = moment(editStart.val()).format('YYYY-MM-DD');
        var backgroundColor = event.backgroundColor;
        
        event.setProp('title',title);
        event.setExtendedProp('count',count);
        event.setExtendedProp('setCount',setCount);
        event.setStart(start);
        event.setAllDay(true);
        event.setProp('backgroundColor',backgroundColor);

        eventModal.modal('hide');

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "/sixone/schedule.updateOne",
            data: {
            	'playNo': playNo,
            	'routineNo': routineNo,
            	'title': editTitle.val(),
                'count': count,
                'setCount': setCount,
                'start': start,
                'backgroundColor': backgroundColor
            },
            success: function (response) {
                alert('수정되었습니다.');
                calendar.refetchEvents();
            }
        });
        
        

    });


// 삭제버튼
$('#deleteEvent').unbind();
$('#deleteEvent').on('click', function () {
    event.remove();
    eventModal.modal('hide');
    var playNo = event.id;
    console.log(playNo);
    //삭제시
    $.ajax({
        type: "get",
        url: "/sixone/schedule.delete",
        data: {
        	"playNo":playNo
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});

};