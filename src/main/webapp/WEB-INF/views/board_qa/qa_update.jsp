<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>                                             
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

        <script type="text/javascript">
     /*    $(document).ready(function(){
            
        
             
            $("#list").click(function(){
                location.href = "qa_list.htm";
            });
             
            $("#saves").click(function(){
                 
                //널 검사
                if($("#qa_title").val().trim() == ""){
                    alert("제목2을 입력하세요.");
                    $("#qa_title").focus();
                    return false;
                }

            
               if($("#qa_ctmt").val().trim() == ""){
                    alert("내용를 입력하세요.");
                    $("#qa_ctmt").focus();
                    return false;
                } 
				
                
                 
                 
            });
             
        }); */
    </script>

    

 
 <div id="content">
<div class="main_area">

        <!-- 좌우측의 공간 확보 -->
     
            <hr/>
        
            <div class="row">
                <div class="col-lg-12">
                    <form action="qa_update.htm" method="post" name="n" >
                    		<input type="hidden" id="qa_code" name="qa_code" value = "${qadto.qa_code}">
                        	<input type="hidden" id="username" name="username" value = "${qadto.username}">
                        	<input type="hidden" id="qa_date" name="qa_date" value = "${qadto.qa_date}">
                    <table class="table table1 table-striped">
                    		<tr>
                                <th style="width:10%">제목</th>
                                <td><input type="text" id="qa_title" name="qa_title" style="width:20%;" value="${qadto.qa_title }"/></td>                   
                            </tr>
                    		<tr>
                                <th>작성자</th>
                                <td><input type="text" id="username" name="username" style="width:170px;" maxlength="10" value="${qadto.username}" readonly/></td>                   
                            </tr>
                            <tr>
                    			<th>내용</th>
                                <td>
                                	<input type = "text" name="qa_ctmt" id="qa_ctmt" value="${qadto.qa_ctmt}" style="height: 500px; width: 400px">
								</td>
                            </tr>
                    </table>
                   <div style="text-align:center">
							<input type="submit" id="saves" name="saves" >
							<!-- <button type="button" id="save" class="btn btn-default">저장</button> -->
							<button type="button" id="list" name="list" class="btn btn-default">목록</button>
					</div>
                  </form>
                </div>
            </div>
          
            <hr/>
        </div>  
</div>