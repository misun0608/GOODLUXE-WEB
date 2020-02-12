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
	
	//Service���� (db ó���� �ϱ����� )
	@Autowired
	ChatService chatService;
	ChatMemberService chatmemberService;
	
	
	// �ۼ����� : afterConnectionEstablished(�������ӽ�) -> afterConnectionClosed(�������������) 
	//  -> handleTextMessage(������ �޼����� �޾�����) 
	//��Ÿ �ʿ��� method�� �߰��߰� �ʿ信���� �ۼ�
	//���� ���ῡ �ʿ��� websocket�����鵵 �ʿ信 ���� �߰�
	
	
	//������ ����� ����ڵ��� �����ϱ����� ����
		private List<WebSocketSession> sessionList = new ArrayList<>(); //�޼����� �����ֱ����� ���������� ����
		private Map<WebSocketSession, String> mapList = new HashMap<>(); //����session�� ���̵�����, web��������
		private Map<WebSocketSession,String> roomList = new HashMap<>(); //���� session�� ���̵�����,  room����
		private List<String> userList = new ArrayList<>(); //������ ����� �����κ��� �ѷ��ֱ����� ������ �Ϲݸ���Ʈ
	
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	
	
	public SocketHandler() {
		super();
		System.out.println("create SocketHandler instance!");
	}
	
	// ���� �Ǿ��� �� 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		//1. ���� ����� ���� �α��� ���̵� ������ �����´�.
		Map<String, Object> map = session.getAttributes();
    	MemberVO mem = (MemberVO)map.get("login"); 
    	String userId = mem.getMember_id();
		HashMap<String, Object> oo = new HashMap<String, Object>();
		oo.put("0", 0);
		oo.put("userId", userId);
		oo.put("", "");
		
    	
    	//2. ���� ���̵�� ��� �濡 �ִ� �� Ȯ���Ѵ�.
    	ChatMemberVO chatmembervo = new ChatMemberVO();
    	
//    	ChatMemberVO userRoom = chatmemberService.getRoomMember(new ChatMemberVO(oo));

		
		
		sessionSet.add(session);
		System.out.println("add session!");
		
		
//		Map<String, Object> map = session.getAttributes();
    	//MemberDto mem = (MemberDto)map.get("login"); 
    	//String userId = mem.getId();
		
		
	}
	
	//������ ������ �� 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		System.out.println("remove session!");
	}

	// �޽��� ���� ��
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		
		// session.getAttributes() : HandshakeInterceptor?�� beforeHandshake() 메서?��?��?�� ???��?�� map?�� �??��?��?��
		Map<String, Object> map = session.getAttributes();
		/*
		String userName = (String)map.get("userName");
		System.out.println("?��?��?�� ?���? : " + userName);
		*/
		String userId = (String)map.get("userId");
		System.out.println("userId : " + userId);
		
//		for (WebSocketSession webSocketSession : sessionList) {
//	   		
//			//�������϶��� ����
//			if(msgArr[2].equals(roomList.get(webSocketSession))) {
//				//���� �ڽ��� ���Ǿ��̵�� �ٸ��ٸ� �޼����� �Ʒ��Ͱ��� ����(�ڱ��ڽ����״� �����ʿ䰡���⶧��)
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