package journey.diary.test.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("{0} connected", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("From {0}, received Message : {1} ", session.getId(), message.getPayload());
		
		session.sendMessage(new TextMessage("echo" + message.getPayload()));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("{0} Connection Closed", session.getId());
		super.afterConnectionClosed(session, status);
	}
	
	
	
	
	
}
