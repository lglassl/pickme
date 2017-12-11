<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.wrap {
    width: 500px;
    height: auto;
    position: relative;
    display: inline-block;
}
.wrap textarea {
    width: 100%;
    resize: none;
    min-height: 4.5em;
    line-height:1.6em;
    max-height: 9em;
}
.wrap span {
    position: absolute;
    bottom: 5px;
    right: 5px;
}
#counter {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
}
#progressbar{
width: 400px
}
</style>
  
<script type="text/javascript">


$(function() {
	
	for(var i=0; i<3; i++){
    $('#content'+i).keyup(function (e){
        var content0 = $(this).val();
        var content1 = $(this).val();
        var content2 = $(this).val();
        $('#counter'+i).html((content+i).length + '/300');
        $( "#progressbar"+i ).progressbar({
            value: (content.length/300 * 100)

          });
    });
    $('#content'+i).keyup();
	}
});


</script>
<body>
<div class="wrap">
    <textarea id="content0" maxlength="300"></textarea>
    <span id="counter0">###</span>
</div>
<hr>
<div class="wrap">
    <textarea id="content1" maxlength="300"></textarea>
    <span id="counter1">###</span>
</div>
<div class="wrap">
    <textarea id="content2" maxlength="300"></textarea>
    <span id="counter2">###</span>
</div>
<div id="progressbar0"></div>
<div id="progressbar1"></div>
<div id="progressbar2"></div>
</body>
</html>