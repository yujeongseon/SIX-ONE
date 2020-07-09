var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editTitle = $('#edit-title');
var editCount = $('#edit-count');
var editSetCount = $('#edit-setcount');
var editStart = $('#edit-start');
var editColor = $('#edit-color');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var addEvent = function (info,calendar) {

    var start = moment(info.start).format('YYYY-MM-DD');
    var end = moment(info.end-1).format('YYYY-MM-DD');
   
    modalTitle.html('새로운 운동 등록');
    
    editTitle.val('');
    editStart.val(start);
    editCount.val('');
    editSetCount.val('');
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
//    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            title: editTitle.val(),
            count: editCount.val(),
            setCount: editSetCount.val(),
            start: editStart.val(),
            backgroundColor: editColor.val()
        };
        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }
        
        
        
        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "/sixone/schedule.insert",
            data: {
            	'title': editTitle.val(),
                'count': editCount.val(),
                'setCount' : editSetCount.val(),
                'start': editStart.val(),
                'backgroundColor': editColor.val()
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            	calendar.refetchEvents();
            	
            	
            }
        });
        
        //calendar.addEvent(eventData);
        //calendar.refetchEvents();
        //eventModal.find('input, textarea').val('');
        eventModal.modal('hide');
       
        
        
    });
};