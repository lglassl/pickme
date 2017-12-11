<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
  <link rel="stylesheet" href="jqueryui/style.css">
<script type="text/javascript">
$(function() {
	
	for(var i=1; i<4; i++){
		var index = "#content"+i;
		var index2 = "#counter"+i;
		 $(index).keyup(function (e){
		        var content = $(this).val();
		        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		        $(index2).html(content.length +" dfdfdf"+ '/300');
		        $( "#progressbar" ).progressbar({
		            value: (content.length/300 * 100)
		          });
		    });
		    $(index).keyup();
	}
});
//300 에 글자수 넣고, 위아래 둘다.
// 그리고


</script>
<body>
<div class="wrap">
    <textarea id="content1" maxlength="300"></textarea>
    <span id="counter1"></span>
    
    <textarea id="content2" maxlength="300"></textarea>
    <span id="counter2"></span>
    
    <textarea id="content3" maxlength="300"></textarea>
    <span id="counter3"></span>
</div>
<hr>
<div id="progressbar">

</div>
</body>
</html>