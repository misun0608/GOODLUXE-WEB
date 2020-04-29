package com.spring.goodluxe.jy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class AlarmHandshakeInterceptor  extends HttpSessionHandshakeInterceptor {
	
	@Override//1
	public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler, Map<String,Object>map) throws Exception{
	
		
		System.out.println("Before Handshake");
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI : "+request.getURI());
		HttpServletRequest req = ssreq.getServletRequest();
		
		String id = (String) req.getSession().getAttribute("member_id");
		
		map.put("userId", id);
		System.out.println("HttpSession에 저장된 id:"+id);
		
		return super.beforeHandshake(request, response, wsHandler, map);
	}
	
	
	@Override//2
	public void afterHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
		System.out.println("After HandShake");
		
		super.afterHandshake(request, response, wsHandler, ex);
		
	}
}
