package kr.or.pickme.handler;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class ChatSocket {
	 private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	    
	    @OnMessage	//클라이언트로부터 메시지 도착 시 처리
	    public void onMessage(String message, Session session) throws IOException {
	        System.out.println("메시지 : " + message);
	        synchronized(clients) {
	            for(Session client : clients) {
	                if(!client.equals(session)) {
	                    client.getBasicRemote().sendText(message);
	                }
	            }
	        }
	    }
	    
	    @OnOpen	//클라이언트에서 서버로 접속할 때의 처리
	    public void onOpen(Session session) {
	        System.out.println("session : " + session);
	        clients.add(session);
	    }
	    
	    @OnClose	//접속이 끊겼을 때 처리
	    public void onClose(Session session) {
	        clients.remove(session);
	    }
}
