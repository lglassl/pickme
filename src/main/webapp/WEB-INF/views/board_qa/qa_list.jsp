<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css"
   rel="stylesheet" type="text/css">

<link href="/resources/bootstrap/css/entityList.css" rel="stylesheet"
   type="text/css">



<!--/////////////////////// 글입력폼 css ////////////////////////////  -->


<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
   integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
   crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
   integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
   crossorigin="anonymous"></script>
</head>

<script>


$(document).ready(function() {
    $('#qaList').DataTable({
        "lengthMenu": [[10,15,20],[10,15,20]],
       //"class" : table-hover,
       "searching": true,
        order: [[ 0, 'desc' ], [ 1, 'desc' ]], // 정렬 (sort)
        "columnDefs" : [ //이건 수정이랑 삭제버튼은 정렬버튼 없애려고 한거임
            {
               "targets" : [ -1 ], //마지막 컬럼
               "orderable" : false, //정렬하는거 없앰
            }, ]
      }); 
    $('#insertModal').click(function(){
       $('#aa').modal('show');
    });  
}); 

 /* function check(){
      var check = false;

       if(!insertmodalform.qa_title.value){
           alert("제목을 입력해주세요");
           insertmodalform.qa_title.focus();
           return false;
       }
      
       if(!insertmodalform.qa_ctmt.value){            
           alert("내용을 입력해주세요");
           insertmodalform.qa_ctmt.focus();
           return false;
       }
       if(!insertmodalform.username.value){            
           alert("작성자을 입력해주세요");
           insertmodalform.username.focus();
           return false;
       }
   
       document.insertmodalform.submit();
       alert("등록 성공 !");
   }
 */


</script> 

<div id="content">
<div class="main_area">

   <div>
      <table class="table table-hover"
         style="text-align: center; background-color: white; color: black;"
         id="qaList" >
         <thead style="font-size: 18px">
            <tr>
                <th style="visibility: hidden; width : 1%;"></th> <!-- 공지사항 여부 (숨김) -->
               <th width=40% style="text-align: center; width: 709px; left: 10px;">번호</th>
               <th width=10% style="text-align: center; width: 469px; left: 10px;">제목</th>
               <th width=10% style="text-align: center; width: 343px; left: 10px;">작성자</th>
               <th width=10%
                  style="text-align: center;  border-left-width: 10px; padding-right: 15px;">작성일</th>
                  <th width=5% style="text-align: center; padding-right: 10px;">조회수</th> 
                  <th style="visibility: hidden; width : 1%;"></th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="list" items="${list}" varStatus="status">
               <tr>
               <!-- <a href="read.htm?num=${b.num}&pg=${pg}">${b.subject}</a></td>  -->
                     
                     
                     <c:if test="${ list.qa_notice =='1'}">
                   <td style="visibility: hidden; width : 1%; background: gray">${list.qa_notice}</td>
                  <td width=5% style="text-align: center; background: gray">${list.qa_code}</td>
                  <td width=20% style="text-align: center; background: gray">
                   <a id ="detail" href="qa_Detail.htm?qa_code=${list.qa_code}">${list.qa_title}</a> 
                  </td> 
                  <td width=10% style="text-align: center; background: gray" >${list.username}</td>
                  <td width=10% style="text-align: center; background: gray">${list.qa_date}</td>
                  <td width=5% style="text-align: center; background: gray">1 </td>
                  <td style="visibility: hidden; width : 1%; background: gray"></td>
                  </c:if>
                     <c:if test="${ list.qa_notice =='0'}">
                   <td style="visibility: hidden; width : 1%;">${list.qa_notice}</td>
                  <td width=5% style="text-align: center;">${list.qa_code}</td>
                  <td width=20% style="text-align: center;">
                   <a id ="detail" href="qa_Detail.htm?qa_code=${list.qa_code}">${list.qa_title}</a> 
                  </td> 
                  <td width=10% style="text-align: center;">${list.username}</td>
                  <td width=10% style="text-align: center;">${list.qa_date}</td>
                  <td width=5% style="text-align: center;">1 </td>
                  <td style="visibility: hidden; width : 1%;"></td>
                  </c:if>
               
               </tr>
            </c:forEach>


         </tbody>
         <tr>
            <td></td>
            <td></td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td width=10% align="right">
            
            <a id="insert" href="/qa_insertForm.htm">
               <button type="button" style="" >글등록</button>
               </a>
            </td>
         </tr>
      </table>
      



   </div>
   </div>
</div>