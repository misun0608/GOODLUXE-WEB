package com.spring.goodluxe.jj;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


//작성순서 : afterConnectionEstablished(서버접속시) -> afterConnectionClosed(서버연결끊을시) 
//-> handleTextMessage(서버가 메세지를 받았을때) 
//기타 필요한 method는 중간중간 필요에따라 작성
//서버 연결에 필요한 websocket변수들도 필요에 따라 추가



@Component
public class SocketHandler extends TextWebSocketHandler {
	
	HttpServletRequest request;
	
	//Service접근 (db 처리를 하기위해 )
	@Autowired 
	ChatService chatService;
	@Autowired
	ChatMemberService chatmemberService;
	
	//연결 요청 처리 
    //메시지 받기, 메시지 전달

//WebSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체  
//해당 객체를 통해 메시지를 주고 받음
	//서버에 연결된 사용자들을 저장하기위해 선언
		private List<WebSocketSession> sessionList = new ArrayList<>(); //메세지를 날려주기위한 웹소켓전용 세션
		private Map<WebSocketSession, String> mapList = new HashMap<>(); //실제session의 아이디정보, web소켓정보
		private Map<WebSocketSession,String> roomList = new HashMap<>(); //실제 session의 아이디정보,  room정보
		private List<String> userList = new ArrayList<>(); //접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트
	//룸번호를 받아랏 
	ChatVO chatvo = new ChatVO();
	ChatMemberVO chatmembervo = new ChatMemberVO();
	
public SocketHandler() {
	sessionList = new ArrayList<WebSocketSession>(); //메세지를 날려주기위한 웹소켓전용 세션
	mapList = new HashMap<WebSocketSession, String>(); //실제session의 아이디정보, web소켓정보
	roomList = new HashMap<WebSocketSession,String>(); //실제 session의 아이디정보,  room정보
	userList = new ArrayList<String>(); //접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트
}

@Override
    //소켓 연결 생성 후 실행 메서드
public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	System.out.println("TextWebSocketHandler : 연결 생성!");
	
	//1. 들어온 사람의 실제 로그인 아이디 정보를 가져온다.
	Map<String, Object> map = session.getAttributes();
		String member_id = (String) map.get("member_id"); 
	Member2VO mem = new Member2VO();
		mem.setMember_id(member_id); 
	String userId = mem.getMember_id();
	
	//2. 들어온 아이디로 어느 방에 있는 지 확인한다.
	ChatMemberVO chatmembervo = new ChatMemberVO();
	chatmembervo.setChat_num(0);
	chatmembervo.setMember_id(userId);
	chatmembervo.setChat_room("");
	
	ChatMemberVO userRoom = chatmemberService.getRoomMember(chatmembervo);
	
	//3. 들어온 아이디로 찾은 방이름을 웹소켓 세션에 추가
	roomList.put(session, userRoom.getChat_room());
	System.out.println(userId+"님이 "+userRoom.getChat_room()+" 방에 들어왔습니다.");
	
		/*
		 * //4. 이전 방 정보 DB에서 수정하기 //System.out.println("변경 전 :"+userRoom.getPriroom());
		 * //변경전 String priroom = userRoom.getChat_room();
		 * 
		 * ChatMemberVO chatmembervo_update = new ChatMemberVO();
		 * chatmembervo.setChat_num(0); chatmembervo.setMember_id(userId);
		 * chatmembervo.setChat_room("");
		 * chatmemberService.updateRoomMember(chatmembervo_update);
		 * //System.out.println("변경 후 :"+userRoom.getRoom()); //변경전
		 */ 	
	
	//4. mapList(해당세션의 실제아이디 값을 저장하기위해 map으로 저장)
	mapList.put(session,userId); //세션:key, 유저아이디:value
	
	//5. map을 사용하지않아도 될경우를 위해서 session값도 넣도록함
	sessionList.add(session); //세션의 값 넣기(session : id=0~ , url:/ 주소/ echo.do)
	
	System.out.println("세션추가:"+session.getId()+"접속자아이디:"+mem.getMember_id()+" 현재채팅접속자:"+sessionList.size()+"명");
	
	//6. 입장 시 해당 방 인원 수를 증가시킨다.
	ChatVO chatvo = new ChatVO();
	chatvo.setChat_num(0);
	chatvo.setChat_name(userRoom.getChat_room());
	chatvo.setChat_totalcount(0);
	chatvo.setChat_remaincount(0);
	chatvo.setChat_content("");
	
	chatService.updateChatCountInc(chatvo);
	
	
	//7. 모든유저들에게 서로다른 메시지를 전달하기위해 전체적으로 for문을 돌리도록한다.
	for(int i=0; i<sessionList.size(); i++) { 
		
		//8. 해당 i번째 사람(sessionList.get(i) 의 방이름정보를 가져온다.
		// 웹소켓세션아이디가 저장된 sessionList를 이용해서 방정보를 가져옴
		String roomName = roomList.get(sessionList.get(i));
		System.out.println("122 roonName="+roomName);
		//9. 접속자가 속한 방에만 접속했음을 알린다.
		
		if(userRoom.getChat_room().equals(roomList.get(sessionList.get(i)))) {
			sessionList.get(i).sendMessage(new TextMessage(JsonDataOpen(userId)));
		}
		
		//11. 같은 방에 있는사람에게만 접속자 리스트를 날려주도록한다.
		userList = informUser(mapList, roomName); //현재 while문에서 사용중인 roomName값으로 리스트를 가져온다(아래method확인)
		System.out.println("현재방에 참석중인사람수:"+userList.size());
		ChatUtil chatUtil = new ChatUtil(); //f.project.util소속 클래스 선언
		String userListMessage = chatUtil.split(userList); // 받아온 list에 대해서 문자열로 바인딩해서 날려줌
		sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));
		
		//12. 방리스트를 모든 사람들에게 보내줌
		String roomNames = roomName;
		sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));
		
		
	}
	
	//13. 없는방에대해서 삭제처리를 한다.
	chatService.deleteChat();
}
	
	
	//users.add(session);


@Override
    //메시지 수신 후 실행 메서드
protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	
	
	//1. 회원정보 가져오기
	Map<String, Object> map = session.getAttributes();

	String member_id = (String) map.get("member_id"); 
	Member2VO mem = new Member2VO();
		mem.setMember_id(member_id); 
	String userId = mem.getMember_id();
	String roomName = chatmemberService.selectChatroomList(member_id).get(0).getChat_room();
	System.out.println("164 roomName="+roomName);
	// 검색어로 들어왔을 경우,
	if(message.getPayload().contains("!%/&")) {
		//메세지 전달이 아닌 검색리스트 전달
		
		//문자열 형태 : !%/&
		System.out.println("getPayload="+message.getPayload());
		
		String searchRoom = message.getPayload().replaceAll("!%/&", "");
		System.out.println("searchRoom="+searchRoom);
		
		String roomNames="";
		if(searchRoom.equals("")) {
			
			roomNames = roomName;
		}
		else {
			roomNames = searchRoom;
		}
		
		
		for (WebSocketSession webSocketSession : sessionList) {
			//자신한테만 보내도록 함
			if(session.getId().equals(webSocketSession.getId())) {
				
				webSocketSession.sendMessage(new TextMessage(JsonRoom(roomNames)));
			}
		}
		
	}
	else {
	
		//2. 문자열 형태 : 문자 !%/ 대상 !%/ 방이름
		System.out.println(message.getPayload());
		
		//3. 배열선언(split을 이용해서 문자열을 자른다)
		String msgArr[] = new String[3];
		msgArr = message.getPayload().split("!%/"); // %!로 문자를 잘라서 배열에저장
		
		//4. [0]: 유저가 보낸 메시지,  [1]:귓속말 대상자,  [2]:방의 이름
		System.out.println("보낸메시지:"+msgArr[0]+", 귓속말대상자:"+msgArr[1]+", 방의이름:"+msgArr[2]);
		
		//5.귓속말이라면 해당아이디를 가진사람한테만 보내도록한다.
		if(!msgArr[1].equals("")) {
			Iterator<WebSocketSession> sessionIds = mapList.keySet().iterator(); //기존에 저장된 접속자명단을 가져옴
	    	while(sessionIds.hasNext()) {
	    		WebSocketSession sessionId = sessionIds.next();
	    		String value = mapList.get(sessionId);
	    		//while문을 돌면서 귓속말 대상자를 찾는다. 찾게되면 해당사람에게 귓속말로 문자를 보내도록한다.
	    		if(value.equals(msgArr[1])) {
	    			sessionId.sendMessage(new TextMessage(JsonWisper(userId, msgArr[0])));
	    		}
	    	}
		}
		 	
		//6.귓속말로 하지않았을경우 해당 유저와 같은 방에 있는 사람에게만 메세지를 날리도록한다.
		else {
			for (WebSocketSession webSocketSession : sessionList) {
		   		
				//같은방일때만 보냄
				if(msgArr[2].equals(roomList.get(webSocketSession))) {
					//만약 자신의 세션아이디와 다르다면 메세지를 아래와같이 전달(자기자신한테는 보낼필요가없기때문)
	        		if(!session.getId().equals(webSocketSession.getId())) {
	        			webSocketSession.sendMessage(new TextMessage(JsonData(userId, msgArr[0])));
	        		}   
				}  		
			}
			
		}
		
		System.out.println("메세지:"+message);
	}
	
	
	
	
	
	
	
	
	
	
	
//	System.out.println("TextWebSocketHandler : 메시지 수신!");
//	System.out.println("메시지 : " + message.getPayload());
//	JSONObject object = new JSONObject(message.getPayload());
//	String type = object.getString("type");
//
//	if(type != null && type.equals("register") ) {
//		//등록 요청 메시지
//		String user = object.getString("userid");
//		//아이디랑 Session이랑 매핑 >>> Map
//		userMap.put(user, session);
//	}else {
//		//채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
//		//Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
//		String target = object.getString("target");
//		WebSocketSession ws = (WebSocketSession)userMap.get(target);
//		String msg = object.getString("message");
//		if(ws !=null ) {
//			ws.sendMessage(new TextMessage(msg));
//		}
//	}
}

@Override
    //연결 해제 후 실행 메서드
public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	System.out.println("TextWebSocketHandler : 연결 종료!");
	
	//1. 현재 접속한 사람의 로그인한 id정보를 가져온다.
    Map<String, Object> map = session.getAttributes();
    String member_id = (String) map.get("member_id"); 
	Member2VO mem = new Member2VO();
		mem.setMember_id(member_id); 
	String userId = mem.getMember_id();
 	
	//2. 접속을끊을 때 해당 아이디로 DB에서 어느 방에 존재하는지 확인한다.
 	ChatMemberVO chatmembervo = new ChatMemberVO();
 	chatmembervo.setChat_num(0);
 	chatmembervo.setMember_id(userId);
 	chatmembervo.setChat_room("");
 	ChatMemberVO member = chatmemberService.getRoomMember(chatmembervo);
 	  
	//3. 해당유저의 roomList, mapList, sessionList를 제거한다( 미리 제거를 해야만 본인 제외한 모든사람들에게 본인의 정보를 날려줄수있기때문)
	roomList.remove(session);
	mapList.remove(session); //세션:key, 유저아이디:value
	sessionList.remove(session); // 실제 websocket 세션명 	
	System.out.println("세션삭제:"+session.getId()+",아이디삭제:"+userId+",채팅 남은사람수:"+sessionList.size());
	
	
	//4. 이전 방에서 인원수를 감소시킨다. (이전방정보로 지우기)
	ChatVO chatvo_dec = new ChatVO();
	chatvo_dec.setChat_num(0);
	chatvo_dec.setChat_name(member.getChat_room());
	chatvo_dec.setChat_totalcount(0);
	chatvo_dec.setChat_remaincount(0);
	chatvo_dec.setChat_content("");
	
	chatService.updateChatCountDec(chatvo_dec);
	
	
	//4. 본인 제외하고 본인이 있던방의 모든사람들에게 나갔음을 알림
	// 이유 : 해당 아이디가 이전의 있던 방에만 데이터를 전달할경우, 해당아이디가 없었던 방의 데이터는 전달이 안되고 아무정보도 들어오지않기때문
	for(int i=0; i<sessionList.size(); i++) {
		
		//5. 해당 i번째 사람(sessionList.get(i) 의 방이름정보를 가져온다.
		String roomName = roomList.get(sessionList.get(i)); //i번째사람의 방이름이 저장되어있다.

		//6. sesionList.get(i).getId() 사람이 속한 방에만 전달하도록 설정한다.
		Iterator<WebSocketSession> roomIds = roomList.keySet().iterator(); //현재 존재하는 roomList를 가져온다.
		//map이기때문에 iterator를 사용하여 while문을 동작시킨다.
		while(roomIds.hasNext()) { 
    		WebSocketSession roomId = roomIds.next(); //roomId : 실제 세션명
    		String value = roomList.get(roomId); // value : 방이름
    		
    	
    	}
		//8. 같은 방에 있는사람에게만 접속자 리스트를 날려주도록한다.
		userList = informUser(mapList, roomName); //현재 while문에서 사용중인 roomName값으로 리스트를 가져온다(아래method확인)
		ChatUtil chatUtil = new ChatUtil(); //f.project.util소속 클래스 선언
		String userListMessage = chatUtil.split(userList); // 받아온 list에 대해서 문자열로 바인딩해서 날려줌
		sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));
		
		//9. 방리스트를 모든 사람들에게 보내줌
		String roomNames = roomName;
		sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));
	}
	
	
	
	
	
	
	
	//user.remove(session);
}	

//json형태로 메세지 변환(일반 메세지 보낼 때)
public String JsonData(String id, Object msg) {
	JsonObject jsonObject = Json.createObjectBuilder().add("message", 
	"<i class='user icon'></i>"+
	"<a href='#none' onclick=\"insertWisper('"+id+"')\"><b>["+id+"]</b></a> : "+msg).build();
	StringWriter write = new StringWriter();
	
	try(JsonWriter jsonWriter = Json.createWriter(write)){
		jsonWriter.write(jsonObject);
	};
	return write.toString();
}

//json형태로 메세지 변환2( 접속했음을 알릴때)
public String JsonDataOpen(String id) {
	JsonObject jsonObject = Json.createObjectBuilder().add("message",
			"<a href='#none' onclick=\"insertWisper('"+id+"')\">"+"<b>["+ 
id+"]</b> 님이 <b style='color:blue'>접속</b>하셨습니다.</a>").build();
	StringWriter write = new StringWriter();
	
	try(JsonWriter jsonWriter = Json.createWriter(write)){
		jsonWriter.write(jsonObject);
	};
	return write.toString();
}
//json형태로 메세지 변환3( 나갔음을 알릴때)
public String JsonDataClose(String id) {
	JsonObject jsonObject = Json.createObjectBuilder().add("message","<b>["+ id+"]</b> 님이 <b style='color:red'>퇴장</b>하셨습니다.").build();
	StringWriter write = new StringWriter();
	
	try(JsonWriter jsonWriter = Json.createWriter(write)){
		jsonWriter.write(jsonObject);
	};
	return write.toString();
}


//json형태로 유저 정보 날리기
public String JsonUser(String id) {
	JsonObject jsonObject = Json.createObjectBuilder().add("list", id).build();
	StringWriter write = new StringWriter();
	
	try(JsonWriter jsonWriter = Json.createWriter(write)){
		jsonWriter.write(jsonObject);
	};
	return write.toString();
}
	
	//json형태로 방 정보 날리기
public String JsonRoom(String roomNames) {
	JsonObject jsonObject = Json.createObjectBuilder().add("room", roomNames).build();
	StringWriter write = new StringWriter();
	
	try(JsonWriter jsonWriter = Json.createWriter(write)){
		jsonWriter.write(jsonObject);
	};
	
	return write.toString();
}


//json형태로 귓속말
public String JsonWisper(String fromId, Object msg) {
	JsonObject jsonObject = Json.createObjectBuilder().add("message",
	"<a href='#none' onclick=\"insertWisper('"+fromId+"')\">"+
	"<i class='user icon'></i>"+
	" <b style='color:green'>["+ // 아이디를 클릭하게되면 귓속말아이디 세팅
	fromId+"]</b>님의 귓속말</a> : "+msg+"").build();
	StringWriter write = new StringWriter();

	try(JsonWriter jsonWriter = Json.createWriter(write)){
		jsonWriter.write(jsonObject);
	};
	return write.toString();
}







//유저리스트
private List<String> informUser(Map<WebSocketSession,String> maplist, String room) throws Exception {
	//맵을 이용해서 세션을 통해 아이디값을 value로 가져와서 list에 담기
	
	//1.담을 리스트 껍데기 선언
	List<String> list = new ArrayList<>();
	
	//2. 존재하는 웹소켓아이디, 로그인아이디 만큼 while문을 돌려준다.
	Iterator<WebSocketSession> sessionIds = maplist.keySet().iterator();
	while(sessionIds.hasNext()) {
		WebSocketSession sessionId = sessionIds.next();
		String value = maplist.get(sessionId); //실제 아이디값
		
		//3. 해당 번지의 key값에 해당하는 방의 이름정보를 가져옴
		String userRoom = roomList.get(sessionId); 
		
		//4. 지금 돌고있는 while문에서 추출한 방이름과 들어온 방의이름이 같을경우 리스트에 저장하도록한다.
		if(userRoom.equals(room)) {
			System.out.println("아이디:"+value +", 방이름:"+userRoom);
			list.add(value);
		}
	}
	return list;
}
















public class ChatUtil {
	String type;
	String message;
	String list;
	
	public ChatUtil() {
	}
	
	public String split(List<String> mem) {
		String list = "";
		for(int i=0; i<mem.size();i++) {
			list +="<a href='#none' onclick=\"insertWisper('"+mem.get(i)+"')\">";
			list += mem.get(i);
			list +="</p>";
		}
		return list;
	}
}



}
