<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<div id="content">

        <!-- 좌우측의 공간 확보 -->
     
            <hr/>
        
            <div class="row">
                <div class="col-md-10">
                    <form action="entity_update.htm" method="post" name="n" >
                    <table class="table table-condensed">
                     
                        <thead>
                        <tr>
                        <th><input type="hidden" id="entity_code" name="entity_code" value = "${entitydto.entity_code}">
                        	<input type="hidden" id="username" name="username" value = "${entitydto.username}">
                        	<input type="hidden" id="entity_date" name="entity_date" value = "${entitydto.entity_date}">
                        	
                        </th>
                        </tr>
                            <tr align="center">
                                <th width=10%><div> 제목: <input type="text" id="entity_title" name="entity_title" style="width:20%;" value="${entitydto.entity_title }"/>
                                작성자: <input type="text" id="username" name="username" style="width:170px;" maxlength="10" value="${entitydto.username}" readonly/></div>
                                </th>
                                <td></td>                   
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                    	<input type = "text" name="entity_ctmt" id="entity_ctmt" value="${entitydto.entity_ctmt}" style="height: 500px; width: 400px">
                    </td>
                            </tr>
                            
                        </tbody>
                        
                    </table>
                     <table id="commentTable" class="table table-condensed"></table>
                   
                    <table class="table table-condensed">
                        <thead>
                            <tr style="width : 80%">
                                <td>
                                

                                    <span>
                                    	<input type="submit" id="saves" name="saves" >
                                        <!-- <button type="button" id="save" class="btn btn-default">저장</button> -->
                                        <button type="button" id="list" name="list" class="btn btn-default">목록</button>
                                      
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                  </form>
                </div>
            </div>
     <hr/>
        </div>  