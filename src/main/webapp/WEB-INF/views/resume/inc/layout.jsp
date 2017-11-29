<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- header -->
	<tiles:insertAttribute name="header" />
		<!-- content -->
		<div class="content-wrapper">
	        <tiles:insertAttribute name="content" />
	       </div> 

	<!-- footer -->
	<tiles:insertAttribute name="footer" />