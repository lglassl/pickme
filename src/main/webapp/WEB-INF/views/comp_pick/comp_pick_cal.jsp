<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" type="text/css" href="/resources/fullcalendar/fullcalendar.css">
	<script src='/resources/fullcalendar/jquery.min.js'></script>
	<script src='/resources/fullcalendar/moment.min.js'></script>
	<script src="/resources/fullcalendar/fullcalendar.js"></script>

<script>
$(document).ready(function() {
	/* var jsoncompPickList = 	JSON.parse('${jsonCompPickList}');
	var jsonUserComPpList = JSON.parse('${jsonUserComPpList}'); */
	//var compInfo = '${compInfo}';
	console.log('${compInfo}');
	
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: ''
		},
		/* defaultDate: '2017-11-12', */
		navLinks: false, // can click day/week names to navigate views
		/* selectable: true,
		selectHelper: true, */
		/* select: function(start, end) {
			var title = prompt('Event Title:');
			var eventData;
			if (title) {
				eventData = {
					title: title,
					start: start,
					end: end
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			}
			$('#calendar').fullCalendar('unselect');
		}, */
		editable: false,	//드래그
		eventLimit: true, // allow "more" link when too many events
		eventSources:[{
			imageurl : '/resources/images/red_ball.png',
			events: ${compInfo}
		}],
		eventClick: function(calEvent, jsEvent, view) {	//alert창 띄우기
	           alert(calEvent.title);
	           // change the border color just for fun
	           //$(this).css('border-color', 'red');
	       }
			/* [
			{
				imageurl : '../resources/image/red_ball.png',
				title: 'Click for Google',
				url: 'comp_pick_list.htm',
				start: '2017-11-28',
				color: ''
			}
		], 
    	eventRender:function(event, eventElement) {
            if(event.imageurl) {	//이미지 삽입
                eventElement.find("div.fc-content").prepend("<img src='" + event.imageurl + "' style='width:15px;'>");
            }
        }*/
	});
	$('.fc-time').html('');	//12a 제거
	/* $('.fc-day-grid-event .fc-h-event .fc-event .fc-start .fc-not-end').attr({"href" : "#"}); */
	

});
</script>
<style>

	body {
		/* margin: 40px 10px; */
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
<div id="content">
<div id="calendar"></div>
</div>