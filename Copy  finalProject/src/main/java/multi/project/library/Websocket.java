/*package multi.project.library;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//어노테이션 (annotation) : Websocet 클래스--broadcast url 호출
//요청 클라이언트마다 객체 1개씩 대응
@ServerEndpoint("/broadcast")
public class Websocket {
	static Set<Session> clients = new HashSet<Session>();

	//클라이언트 : 서버에게서 메세지 전달 받았을때
	//websocket.onmessage(){....}
	//서버 : 클라이언트에게서 메세지 전달받았을때 호출
	@OnMessage
	public void a(String message, Session session) throws Exception{//http  session이 아니다. 나에게 연결한 클라이언트 의미
		//클라이언트에 메세지 수신
		System.out.println("웹소켓 클아이언트가 메세지 보냄 : "+message+session.getId());
	//클라이언트에 메세지 송신
		//set은 키값도 없고 인덱스값도 없고 순서도 없다 그래서 c없는 foreach문 사용
		for (Session c : clients) {
			//System.out.println("보낸다");
		c.getBasicRemote().sendText(message);
		}
	}
	@OnOpen
	public void b(Session session){//html 의 session이 아니다.
		System.out.println("웹소켓 연결"+session.getId());
		//클라이언트 접속 = Session객체를 생성
		//Hashset구성
        clients.add(session);
	
	}
	@OnClose
	public void c(Session session){
		System.out.println("웹소켓 연결해제"+session.getId());
		clients.remove(session);
	}
	@OnError
	public void d(Throwable e,Session session){
		System.out.println("웹소켓 오류"+session.getId()+" : "+e);
	}
}
*/