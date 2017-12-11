<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
 
<body>
    <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
    <c:if test="${(login.id ne '') and !(empty login.id)}">
        <input type="hidden" value='${login.id }' id='chat_id' />
    </c:if>
    <c:if test="${(login.id eq '') or (empty login.id)}">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    </c:if>
    <!--     채팅창 -->
    <div id="_chatbox" style="display: block">
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
   <!--  <img class="chat" src="./img/chat.png" /> -->
</body>
<!-- 말풍선아이콘 클릭시 채팅창 열고 닫기 -->
<script>
    /* $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "./img/chat.png") {
                $(".chat").attr("src", "./img/chathide.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "./img/chathide.png") {
                $(".chat").attr("src", "./img/chat.png");
                $("#_chatbox").css("display", "none");
            }
        }
    }); */
</script>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://192.168.0.143:8090/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
    };
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {	//아이디가 다를 때
                    } else {	//아이디(세션) 같을 때 귓속말 옴
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
                }
            }
        }
    }
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
</script>











<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="content">
<div>채팅방</div>
<script type="text/javascript">
	
	function connect() {
	   var ws = new WebSocket("ws://192.168.0.143:8090/chat.htm");
	   alert("웹소켓 연결");
	   ws.onopen = function () {
	        $('#chatStatus').text('Info: connection opened.');
	        alert("여기서");
	        $('input[name=chatInput]').on('keydown', function(evt){
	            if(evt.keyCode==13){
	                var userList = [];
	                $('.receiver:checked').each(function(idx){
	                    userList[idx] = $(this).val();
	                });
	                var msg = $('input[name=chatInput]').val();
	                var obj = {};
	                obj.receiver = userList;
	                obj.msg = msg;
	                var str = JSON.stringify(obj);
	 
	                ws.send(str);
	                $('input[name=chatInput]').val('');
	            }
	        });
	        alert('웹소켓 서버에 연결되었습니다');
	    };
	    alert("open다음");
	    ws.onmessage = function (event) {
	        var obj = eval('('+event.data+')');
	        if('userList' in obj) {
	            chatList(obj.userList);
	        }else{
	            $('textarea').eq(0).prepend(obj.msg+'\n');
	        }
	    };
	    ws.onclose = function (event) {
	        $('#chatStatus').text('Info: connection closed.');
	    };
	};
	 
	function chatList(userList) {
	    $('#userList').empty();
	    for(var i=0;i<userList.length;i++) {
	        $('#userList').append(userList[i]);
	        var cb = $("<input type='checkbox' class='receiver' value='"+userList[i]+"' >");
	        $('#userList').append(cb).append('<br>');
	    }
	}
	</script>
	<p>
		<button type="button" onclick="connect();">서버 접속</button>
		<div id='chatStatus'></div>
		<textarea name="chatMsg" rows="5" cols="40"></textarea>
	<p>
	메시지 입력 : <input type="text" name="chatInput">
	 <div id="userList">
	 </div>
</div> --%>