<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${ result} "></c:if>  
<script type="text/javascript">
var websocket = new WebSocket
("ws://localhost:9090/EL_jstl/broadcast");

function send(){
	
	websocket.send(document.getElementById("idwindow").innerHTML+"-"+document.getElementById("inputMessage").value);
	//websocket.send(document.getElementById("inputMessage").value);
	
}


websocket.onopen = function(event){
	document.getElementById("result").innerHTML="<h3>웹소켓연결</h3>";
	//websocket.send(document.getElementById("idwindow").innerHTML+"님 접속하셨습니다.");
	//websocket.send("클라이언트가 전달합니다.")//데이터 서버에 보냄
}

websocket.onmessage = function(event){
	//id-메시지 또는 id-/to 귀속말id 귀속말메시지
	//alert(event);
	var message = event.data.split("-");
	var sender = message[0];
	var content = message[1];
	//alert(sender +":" +content);
	var myid = document.getElementById("idwindow").innerHTML; 
	//귓속말 출력.
	if(content != null && content.match("/to ")){
		if(content.match("/to " + myid)){
			// /to id 귀속말메시지 --> xxx(귀속말):xxx 출력	
			var temp = content.replace
			("/to " + myid, "(귀속말):");
			// (귀속말):귀속말메시지
			document.getElementById("result").
			innerHTML += 
			"<p style='color:blue'>" +	sender + temp + "</p>";	
		}
	}
	else{
	//id-메시지:귀속말 아니어도 출력
	document.getElementById("result").
	innerHTML += 
	"<p style='color:green'>" 
	+event.data +"</p>";
	}
	//"<h3>웹소켓서버로부터 메시지 전달</h3>:"+ 
	//event.data;
	

}
websocket.onerror = function(event){
	document.getElementById("result").innerHTML="<h3>오류 발생</h3>";
}
</script>
</body>
<span id='idwindow'  style="border: solid 2px pink">${loginId}</span>님 환영합니다.<br>
<div id=result style="background-color: lightgreen">
</div>
메세지 입력<input type=text id=inputMessage>
<input type=button value=전송 onclick="send()">









</html>