package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.spring.goodluxe.jj.ChatMemberVO;
import com.spring.goodluxe.jj.ChatVO;

public class SocketHandler extends TextWebSocketHandler {
	
	HttpServletRequest request;
	
	//Service접근 (db 처리를 하기위해 )
	@Autowired
	ChatService chatService;
	ChatMemberService chatmemberService;
	
	
	// 작성순서 : afterConnectionEstablished(서버접속시) -> afterConnectionClosed(서버연결끊을시) 
	//  -> handleTextMessage(서버가 메세지를 받았을때) 
	//기타 필요한 method는 중간중간 필요에따라 작성
	//서버 연결에 필요한 websocket변수들도 필요에 따라 추가
	
	
	//서버에 연결된 사용자들을 저장하기위해 선언
		private List<WebSocketSession> sessionList = new ArrayList<>(); //메세지를 날려주기위한 웹소켓전용 세션
		private Map<WebSocketSession, String> mapList = new HashMap<>(); //실제session의 아이디정보, web소켓정보
		private Map<WebSocketSession,String> roomList = new HashMap<>(); //실제 session의 아이디정보,  room정보
		private List<String> userList = new ArrayList<>(); //접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트
	
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	
	
	public SocketHandler() {
		super();
		System.out.println("create SocketHandler instance!");
	}
	
	// 연결 되었을 때 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		//1. 들어온 사람의 실제 로그인 아이디 정보를 가져온다.
		Map<String, Object> map = session.getAttributes();
    	MemberVO mem = (MemberVO)map.get("login"); 
    	String userId = mem.getMember_id();
		HashMap<String, Object> oo = new HashMap<String, Object>();
		oo.put("0", 0);
		oo.put("userId", userId);
		oo.put("", "");
		
    	
    	//2. 들어온 아이디로 어느 방에 있는 지 확인한다.
    	ChatMemberVO chatmembervo = new ChatMemberVO();
    	
//    	ChatMemberVO userRoom = chatmemberService.getRoomMember(new ChatMemberVO(oo));

		
		
		sessionSet.add(session);
		System.out.println("add session!");
		
		
//		Map<String, Object> map = session.getAttributes();
    	//MemberDto mem = (MemberDto)map.get("login"); 
    	//String userId = mem.getId();
		
		
	}
	
	//연결이 끝났을 때 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		System.out.println("remove session!");
	}

	// 메시지 보낼 때
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		
		// session.getAttributes() : HandshakeInterceptor?쓽 beforeHandshake() 硫붿꽌?뱶?뿉?꽌 ???옣?븳 map?쓣 媛??졇?삩?떎
		Map<String, Object> map = session.getAttributes();
		/*
		String userName = (String)map.get("userName");
		System.out.println("?쟾?넚?옄 ?씠由? : " + userName);
		*/
		String userId = (String)map.get("userId");
		System.out.println("userId : " + userId);
		
//		for (WebSocketSession webSocketSession : sessionList) {
//	   		
//			//같은방일때만 보냄
//			if(msgArr[2].equals(roomList.get(webSocketSession))) {
//				//만약 자신의 세션아이디와 다르다면 메세지를 아래와같이 전달(자기자신한테는 보낼필요가없기때문)
//        		if(!session.getId().equals(webSocketSession.getId())) {
//        			webSocketSession.sendMessage(new TextMessage(JsonData(userId, msgArr[0])));
//        		}   
//			}  		
//		}
		
		
		for(WebSocketSession client_session:this.sessionSet) {
			if(client_session.isOpen()) {
				try {
					client_session.sendMessage(message);
				}catch(Exception ignored) {
					System.out.println("fail to send message!" + ignored);
				}
			}
		}
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("web socket error!" + exception);
	}
	
	@Override
	public boolean supportsPartialMessages() {
		System.out.println("call method!");
		
		return false;
	}

}