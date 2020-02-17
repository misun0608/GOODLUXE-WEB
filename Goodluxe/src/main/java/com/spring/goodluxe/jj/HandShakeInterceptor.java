package com.spring.goodluxe.jj;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShakeInterceptor  extends HttpSessionHandshakeInterceptor {
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String,Object> map) throws Exception {

		System.out.println("Before Handshake");
		
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI:" + request.getURI());
		HttpServletRequest req = ssreq.getServletRequest();
		/*
		String name = (String) req.getSession().getAttribute("name");
		map.put("userName", name);
		System.out.println("HttpSession?óê ???û•?êú name : " + name);
		*/
		String member_id = (String)req.getSession().getAttribute("member_id");
		map.put("userId",member_id);
		System.out.println("HttpSession_member_id : " +member_id);
		return super.beforeHandshake(request, response, wsHandler, map);
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
		System.out.println("After Handsake");
		
		super.afterHandshake(request, response, wsHandler, ex);
	}

}
