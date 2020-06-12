package com.team.sixone.webSocket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//웹소켓 서버
public class webSocretServer extends TextWebSocketHandler {
	
	//접속한 클라이언트를 저장하기위한 속성]
	//키는 웹소켓 세션 아이디
	private Map<String, WebSocketSession> clients = new HashMap<String, WebSocketSession>();
	
	//클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
	//컬렉션에 연결된 클라이언트 추가
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId()+"연결 했어요");
		clients.put(session.getId(), session);
		
	}
	//클라이언트와 연결이 끊어졌을때 호출되는 콜백 메소드]
	//컬렉션에 저장된 클라이언트 삭제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+"연결이 끊어졌어요");
		clients.remove(session.getId());
	}

	//클라이언트로부터 메시지를 받았을떄 자동 호출되는콜백 메소드]
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로 부터 받은 메시지:"+message.getPayload());
		//접속한 모든 클라이언트에게 session.getid()가 보낸 메시지 뿌려주기
		//메시지 뿌려주기]
		for(WebSocketSession client : clients.values()) {
			if(!session.getId().equals(client.getId())) { //자기가 보낸 메시지를 서버로부터 다시 받지 않도록
					client.sendMessage(message);
			}
		}
	}
	
	//클라이언트와 통신장애시 자동으로 호출되는 메소드]
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
			System.out.println(session.getId()+"와 통신 장애 발생:"+exception.getMessage());
	}
	
}
