package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class AlarmSocketHandler extends TextWebSocketHandler{
	
	HttpServletRequest request;
	
	
	private List<WebSocketSession> sessionList = new ArrayList<>(); //
	private Map<WebSocketSession, String> mapList = new HashMap<>(); //
	private Map<WebSocketSession,String> roomList = new HashMap<>(); //실제 session의 아이디정보,  room정보
	private Map<String, Object> userMap;
	private List<String> userList = new ArrayList<>(); //
	
	public AlarmSocketHandler() {
		userMap = new HashMap<String,Object>();
		sessionList = new ArrayList<WebSocketSession>(); //
	
	}
	
	
	//클라이언트에서 접속을 하여 성공할 경우 발생하는 이벤트
		@Override//4
		public void afterConnectionEstablished(WebSocketSession session) throws Exception{
			System.out.println("add Session");
			System.out.println("세션아이디?????????????????????????"+session.getAttributes().get("member_id"));
			sessionList.add(session); //접속된 사람들 전부
			for(int i = 0; i<sessionList.size();i++) {
				System.out.println("세션 리스트를 한번 쭉 훑어보자"+sessionList.get(i).getAttributes().toString());
			}
			
			
		}
		
		//클라이언트에서 send메소드를 이용해서 메세지 발송을 한 경우 이벤트 핸들링
		@Override//5
		protected void handleTextMessage(WebSocketSession session, TextMessage receiver) throws Exception {
			System.out.println("TextWebSocketHandler : 메시지 수신!");
			System.out.println("receiver : " + receiver.getPayload());
			
			int indexNo = -1;
		
			for(int i=0; i<sessionList.size(); i++) { 
				
				System.out.println("세션get(i).getID()"+ sessionList.get(i).getAttributes().get("member_id").toString());
				String receive = sessionList.get(i).getAttributes().get("member_id").toString();
				
				for(int k=0; k<sessionList.size();k++) {
					if(sessionList.get(k).getAttributes().get("member_id").toString().equals(receive)) {
						indexNo = k;
					}
				}
				
				userMap.put(receive, sessionList.get(indexNo));
				System.out.println("user"+userMap.get(receive));
				if(receive.equals(receiver.getPayload())){
					System.out.println("반짝0");
					WebSocketSession ws = (WebSocketSession)userMap.get(receive);
					System.out.println("반짝1");
					ws.sendMessage(new TextMessage(receive));
					System.out.println("반짝2");
				}
			}
		}
		//전송에러 발생할 때 호출
		@Override//6
		public void handleTransportError(WebSocketSession session, Throwable exception)throws Exception{
			System.out.println("web socket error!에러" + exception);
		}
		
		//메세지가 긴 경우 분할해서 보낼 수 있는지 여부를 결정하는 메소드
		@Override//3
		public boolean supportsPartialMessages() {
			System.out.println("call method!");
			return false;
		}
		//클라이언트에서 연결을 종료할경우 발생하는 이벤트
		@Override//7
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{ 
			super.afterConnectionClosed(session, status);
			
			sessionList.remove(session); //세션을 세션셋에서 제거할때 사용
			System.out.println("remove session!");
			
		}


	
}
