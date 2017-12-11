<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="content">
<div class="main_area">

        <script src="/resources/SE2/js/HuskyEZCreator.js"></script>
        <script type="text/javascript">
        
        var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
        
        $(document).ready(function() {
            // Editor Setting
            nhn.husky.EZCreator.createInIFrame({
                oAppRef : oEditors, // 전역변수 명과 동일해야 함.
                elPlaceHolder : "qa_ctmt", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
                sSkinURI : "/resources/SE2/SmartEditor2Skin.html", // Editor HTML
                fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
                htParams : {
                    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseToolbar : true,
                    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseVerticalResizer : true,
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger : true, 
                }
            }); 
            
            //글쓰기 버튼 클릭 시 form 전송
            $('#save').click(function() {
                var i = oEditors.getById["qa_ctmt"].exec("UPDATE_CONTENTS_FIELD", []);
                console.log("i 값" + i)
               /*  var m_content=document.getElementById("content").value;
                     var contents = $.trim(oEditors[0].getContents());
                     이부분에 에디터 validation 검증     */
                $('#editor').submit();
                     
            });     
            
        });
    
        $(document).ready(function(){
            
        
             
            $("#list").click(function(){
                location.href = "qa_list.htm";
            });
             
            
             
        });
    </script>
    

        <!-- 좌우측의 공간 확보 -->
     
            <hr/>
            
            <div class="row">
                <div class="col-lg-12">
                <form class="form-horizontal" action="qa_insert.htm" method="post" id="editor">
                    <table class="table table1 table-striped"> 
                            <tr>
                                <th style="width:20%">제목</th>
                                <td><input type="text" id="qa_title" name="qa_title" style="width:50%;" value=""/></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><input type="text" id="username" name="username" style="width:50%;" maxlength="10" value=""/></td>
                            </tr>
                            <tr>
                            	<th>공지사항 여부</th>
                                <td><input type="checkbox" id="qa_notice" name="qa_notice" value="1"></td>
                            </tr>
                            <tr>
                            	<th>내용</th>
                                <td><textarea rows="10" cols="100" style="width:100%; height:412px; " name="qa_ctmt" id="qa_ctmt" placeholder="내용"></textarea></td>
                            </tr>                        
                    </table>
					<div style="text-align:center">
						<button type="button" id="save" class="btn btn-default">등록</button>
						<button type="button" id="list" name="list" class="btn btn-default">목록</button>
					</div>
                </form>
                </div>
            </div>
            <hr/>
        </div>    
</div>