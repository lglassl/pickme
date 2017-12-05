<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
       <link href="/resources/bootstrap/css/entityList.css" rel="stylesheet" type="text/css" />
       
       
       <!-- //////////////////////////////////////////////////////// -->

    </head>
    
    <div id="content">

        <!-- 좌우측의 공간 확보 -->
        <div class="content">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                     
                        <thead>
                            <tr align="center">
                                <th width=10%>작성자</th>
                               
                               
                              <td align="left">${resumedto.username}</td>
           						
                                <td></td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>자소서 내용
                                </td>
                                <td>
                               ${resumedto.resu_ctmt}
                                </td>
                            </tr>
                        </tbody>
                        
                    </table>
                </div>
            </div>
            <hr/>
        </div>    
			</div>
	