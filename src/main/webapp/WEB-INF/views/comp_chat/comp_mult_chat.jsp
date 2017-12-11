<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
 
<body>
    <!-- �α����� ������ ���� ��α��� ������ ����� chat_id���� -->
    <c:if test="${(login.id ne '') and !(empty login.id)}">
        <input type="hidden" value='${login.id }' id='chat_id' />
    </c:if>
    <c:if test="${(login.id eq '') or (empty login.id)}">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    </c:if>
    <!--     ä��â -->
    <div id="_chatbox" style="display: block">
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
   <!--  <img class="chat" src="./img/chat.png" /> -->
</body>
<!-- ��ǳ�������� Ŭ���� ä��â ���� �ݱ� -->
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
                    var temp = content.replace("/" + $("#chat_id").val(), "(�ӼӸ�) :").split(":");
                    if (temp[1].trim() == "") {	//���̵� �ٸ� ��
                    } else {	//���̵�(����) ���� �� �ӼӸ� ��
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(�ӼӸ�) :") + "</p>");
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
        $("#messageWindow").html("<p class='chat_content'>ä�ÿ� �����Ͽ����ϴ�.</p>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>�� : " + inputMessage.value + "</p>");
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    //     ����Ű�� ���� send��
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //     ä���� ������ ��ũ�ѹٰ� �Ѿ���� �ڵ������� ��ũ�ѹٰ� ����������
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
</script>











<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="content">
<div>ä�ù�</div>
<script type="text/javascript">
	
	function connect() {
	   var ws = new WebSocket("ws://192.168.0.143:8090/chat.htm");
	   alert("������ ����");
	   ws.onopen = function () {
	        $('#chatStatus').text('Info: connection opened.');
	        alert("���⼭");
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
	        alert('������ ������ ����Ǿ����ϴ�');
	    };
	    alert("open����");
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
		<button type="button" onclick="connect();">���� ����</button>
		<div id='chatStatus'></div>
		<textarea name="chatMsg" rows="5" cols="40"></textarea>
	<p>
	�޽��� �Է� : <input type="text" name="chatInput">
	 <div id="userList">
	 </div>
</div> --%>