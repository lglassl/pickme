/*package kr.or.pickme.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor {
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
            Map<String, Object> attributes) throws Exception{
		System.out.println("Before");	
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        HttpServletRequest req =  ssreq.getServletRequest();
		
        //Map<코드번호, 코드번호에 해당하는 채팅창에 들어간 id값들>
		//코드번호 삽입
		//attributes.put("code", req.getSession().getAttribute("pick_code"));
		
		//코드번호에 해당하는 아이디 삽입
		List <String> idList = new ArrayList<String>();
		idList.add((String)req.getSession().getAttribute("id"));
		
        System.out.println("berforeHandshake 왔다");
        System.out.println("code : " + req.getSession().getAttribute("pick_code"));
        //String id = (String)req.getSession().getAttribute("id");
        attributes.put((String)req.getSession().getAttribute("pick_code"), idList);	//유저 id 리스트를 뽑기 위함
        
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
	@Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex)
    {
        System.out.println("After Handshake");
        super.afterHandshake(request, response, wsHandler, ex);
    }

}
*/