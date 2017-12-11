/*package kr.or.pickme.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class CompanyPickChatHandler extends TextWebSocketHandler{
	//서버에 연결한 사용자들의 리스트를 저장
	static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	public CompanyPickChatHandler(){
        System.out.println("웹소켓 핸들러 생성됨");
    }

	@Override
	//접속과 관련된 eventMethod / 클라이언트에서 접속을 하여 성공할 경우 발생
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {	
        System.out.println("afterConnectionEstablished()");
        
        //메시지 발송을 위해 session목록에 추가
        sessions.add(session);
        System.out.println("연결IP : " + session.getRemoteAddress().getHostName());
        informNewUser();
    }
	
	private void informNewUser() {
        JSONArray ja = new JSONArray();
        System.out.println("sessions size : " + sessions.size());
        System.out.println("session toString : " + sessions.get(0).getAttributes().toString());
        for(int i=0;i<sessions.size();i++) {
            String uid = (String) sessions.get(i).getAttributes().get("id");
            System.out.println("uid chat: " + uid);
            ja.add(uid);
        }
        JSONObject jo = new JSONObject();
        jo.put("userList", ja);
        String jsonStr = jo.toJSONString();
        try{
            for(int i=0;i<sessions.size();i++) {
                    sessions.get(i).sendMessage(new TextMessage(jsonStr));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	@Override
	//send, Emit 이벤트 처리
	//send : 클라이언트가 서버에게 메시지를 보냄
	//Emit : 서버에 연결되어 있는 클라이언트에게 메시지를 보냄
	//클라이언트에서 send를 이용해서 메시지를 발송할 경우 이벤트 핸들링
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("handleTextMessage()");
        String sender = (String) session.getAttributes().get("id");
        String content = message.getPayload();
        JSONParser jp = new JSONParser();
        JSONObject jo = (JSONObject) jp.parse(content);
        String msg = (String)jo.get("msg");
        msg = sender+":"+msg;
        JSONObject jsObj = new JSONObject();
        jsObj.put("msg", msg);
         
        JSONArray ja = (JSONArray)jo.get("receiver");
         
        for(int i=0;i<sessions.size();i++) {
            String uid = (String) sessions.get(i).getAttributes().get("id");
            for(int k=0;k<ja.size();k++) {
                String recvId = (String) ja.get(k);
                if(recvId.equals(uid)) {
                	//현재 싹 다 보내줌
                    sessions.get(i).sendMessage(new TextMessage(jsObj.toJSONString()));
                }
            }
        }
    }



	@Override
	//클라이언트가 서버와 연결이 끊겼을 때 실행
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("afterConnectionClosed()");
        sessions.remove(session);
    }
 
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println("handleTransportError()");
    }


}
*/