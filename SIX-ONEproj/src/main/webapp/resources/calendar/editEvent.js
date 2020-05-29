/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event) {
    
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID
    

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
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

       


        

        event.title = editTitle.val();
        event.start = editStart.val();
        event.end = moment(editEnd).format('YYYY-MM-DD');
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

        var start = moment(editStart.val()).format('YYYY-MM-DD');
        var end = moment(editEnd.val()).add(1,'days').format('YYYY-MM-DD');
        


        event.setProp('title',editTitle.val());
        event.setStart(start);
        event.setEnd(end);
        event.setAllDay(true);
        
        event.setProp('backgroundColor',editColor.val());
        event.setExtendedProp('description',editDesc.val());

        eventModal.modal('hide');

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "",
            data: {
                //...
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

    //삭제시
    $.ajax({
        type: "get",
        url: "",
        data: {
            //...
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});

};