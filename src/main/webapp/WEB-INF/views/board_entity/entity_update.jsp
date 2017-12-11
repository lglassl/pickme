<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>                                             
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

        <script type="text/javascript">
     /*    $(document).ready(function(){
            
        
             
            $("#list").click(function(){
                location.href = "entity_list.htm";
            });
             
            $("#saves").click(function(){
                 
                //널 검사
                if($("#entity_title").val().trim() == ""){
                    alert("제목2을 입력하세요.");
                    $("#entity_title").focus();
                    return false;
                }

            
               if($("#entity_ctmt").val().trim() == ""){
                    alert("내용를 입력하세요.");
                    $("#entity_ctmt").focus();
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
                    <form action="entity_update.htm" method="post" name="n" >
                     		<input type="hidden" id="entity_code" name="entity_code" value = "${entitydto.entity_code}">
                        	<input type="hidden" id="username" name="username" value = "${entitydto.username}">
                        	<input type="hidden" id="entity_date" name="entity_date" value = "${entitydto.entity_date}">
           			 <table class="table table1 table-striped">
                            <tr>
                                <th style="width:20%">제목</th>
                                <td><input type="text" id="entity_title" name="entity_title" style="width:50%;" value="${entitydto.entity_title }"/></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><input type="text" id="username" name="username" style="width:50%;" maxlength="10" value="${entitydto.username}" readonly/></td>
                            </tr>
                            <tr>
                    			<th>내용</th>
                                <td>
                                	<input type = "text" name="entity_ctmt" id="entity_ctmt" value="${entitydto.entity_ctmt}" style="height: 500px; width: 400px">
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