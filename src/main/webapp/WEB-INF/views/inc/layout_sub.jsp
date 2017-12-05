<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
    	<tiles:getAsString name="title"/>
    </title>
    
	<tiles:insertAttribute name="common" />
    
  </head>
  <body class="skin-blue sidebar-mini">
  
    <!-- header -->
	<tiles:insertAttribute name="header" />
		<!-- content -->
		<div class="content-wrapper">
	        <tiles:insertAttribute name="content" />
	       </div> 

	<!-- footer -->
	<tiles:insertAttribute name="footer" />
	
  </body>
</html>