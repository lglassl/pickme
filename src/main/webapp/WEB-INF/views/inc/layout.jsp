<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>wecome to PickMe</title>
    
	<tiles:insertAttribute name="common" />
    
  </head>
  <body class="skin-black-light sidebar-mini">
  
    <!-- header -->
	<tiles:insertAttribute name="header" />
		<!-- content -->
		<div class="content-wrapper">
			
			<div><a href="<%=request.getContextPath() %>/resume/update.htm">초기이력서 수정 버튼 click</a></div>
	        
	   		<div><a href="<%=request.getContextPath() %>/apply.htm?pick_code=1111111">공고 지원 버튼 click</a></div>
		
			<tiles:insertAttribute name="content" />
			
			
			
			
       	</div> 
	<!-- footer -->
	<tiles:insertAttribute name="footer" />
	
  </body>
</html>