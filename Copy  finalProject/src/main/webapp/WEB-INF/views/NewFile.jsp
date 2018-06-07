<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>자유 게시판</title>
 

<style type="text/css">
.re1
{border: 0px;
 border-right : solid black 2px;
background-color: lightgray;}
.re2
{border: 0px;}
.ts
{background-color: gray;}
table
{border: ridge gray 6px;
 margin-bottom: 2px; 
 border-collapse: collapse; }
td
{border: solid black 2px; }
.tit
{ width: 300px;}
.title
{ width: 300px;}
#search
{display: inline-block;
border: gray solid 1px;
padding: 2px;}
#main
{margin: 20px;}

#userIdTag
{background-color: lightblue;
padding-left: 20px;}
#userpic
{width: 30px;
height: 30px;}
#userinfo
{border: 0px;
 }
.u
{border: 0px;}
a 
{ text-decoration:none } 
body
{background-color: rgb(217, 217, 217)}
</style>
</head>
<body>

<div id="userIdTag"><c:forEach items="${user}" var="userInfo">
<table id= "userinfo">
<tr><td class="u">
<a href="#"><img name='<%=session.getAttribute("userid")%>' id='userpic' alt='No Image' src='/library/resources/${userInfo.m_Pic}'></a></td>
<td class="u"><h2>${userInfo.m_Id}</h2></td></tr></table>
</c:forEach></div>

<div id="main">
<h1>자유 게시판</h1>
<div id="cont"> 

</div>

<table>
<tr class='ts'><td>글번호</td><td>ID</td><td>제목</td><td>작성시간</td></tr>
<c:forEach items="${freelist}" var="li">
<tr><td id="num">${li.f_Num }</td>
<td id="id">${li.f_m_Id }</td>
<td class="title"  id="${li.f_Num }" ><a href="#">${li.f_Title }</a></td>
<td id="date">${li.f_Date }</td></tr></c:forEach>
</table>

<c:forEach begin="1" end="${totalpage }" var="page">
<a href="/library/Freelist?pagenum=${page }">${page }</a>
</c:forEach>
<input type="button" value="새글작성" id="newcont">
<br>

<form name="Ser" action="/library/FreeSearch/">
<div id="search" class="search" >
<select name="searchdate" id="searchdate">
<option value="all">전체기간</option>
<option value="1d">최근하루</option>
<option value="1w">최근일주일</option>
<option value="1m">최근한달</option>
</select>
<select name="searchBy" id="searchBy">
<option value="0">제목+내용</option>
<option value="1">작성자</option>
<option value="2">제목</option>
</select>
<input type="text" name="searchText" id="searchText">
<input id='serchbtn' type="image" value="검색" src="/library/resources/serchbutton2.jpg" width="28" height="20">

</div></form>
</div>

</body>

<script src="/library/resources/jquery-3.2.1.min.js"></script>
 <script>
    
 	var userid=$("#userpic").prop("name");
   // alert(userid)
    
 	$(".title").on("click",function(){//글 내용 보기
 		//alert("내용보기")
 		var result=""
		var num=$(this).prop("id");
 		$.ajax({//작성글 내용 보기
	    	url:'/library/FreeSelectlist',
	    	type:'post',
	    	data:{'num': num},
	    	success:function(server){
	    		if(server.f_m_Id==userid){
	    		 result= 
	    			"<table class='re'><tr class='ts'><td>글번호</td><td>ID</td><td>제목</td><td>작성시간</td></tr>"+
	    			"<tr><td>"+server.f_Num+"</td>"+
	  		        "<td>"+server.f_m_Id+"</td>"+
	  		        "<td class='tit'>"+server.f_Title+"</td>"+
	  		        "<td>"+server.f_Date+"</td></tr>"+
	  		        "<tr><td>내용<br><input type='button' value='댓글보기' id='"+server.f_Num+"' class='reply'></td>"+//댓글보기 버튼
	  		        "<td  colspan='2'>"+server.f_Content+"</td><td>"+
	  		        "<form action='/library/FreeContDelete/'><input type='submit' value='삭제'>Pw : <input type='password' name='password' style='width:30px'>"+
	  		        "<input type='hidden' name='freeNumber' value="+server.f_Num+"></form></td></tr></table>";
	  		      $("#cont").html(result);   	
	    		}else{
	    		result= 
	    			"<table class='re'><tr class='ts'><td>글번호</td><td>ID</td><td>제목</td><td>작성시간</td></tr>"+
	    			"<tr><td>"+server.f_Num+"</td>"+
	  		        "<td>"+server.f_m_Id+"</td>"+
	  		        "<td class='tit'>"+server.f_Title+"</td>"+
	  		        "<td>"+server.f_Date+"</td></tr>"+
	  		        "<tr><td>내용<br><input type='button' value='댓글보기' id='"+server.f_Num+"' class='reply'></td>"+//댓글보기 버튼
	  		        "<td  colspan='2'>"+server.f_Content+"</td><td></td>"+
	  		        "</tr></table>";
	  		      $("#cont").html(result);   
	    		}
 	            
	    	}//success
	    });//ajax 글 내용보기
 	});//function 글 내용보기
  	
	  $('#cont').on('click',(".reply"),function(){//댓글 보기
		 // alert($('.reply').val())
		 var result2=""
		 var num2=$(this).prop("id");
 		 $.ajax({//댓글 보기
	    	url:'/library/ReplyView',
	    	type:'post',
	    	data:{'num': num2},
	    	//dataType:'text',
	    	success:function(server2){
		if($('.reply').val()=="댓글보기"){
			$('.reply').val("댓글접기")
  		var insertReply="<tr class='retr'><td class='re1'><input type='button' value='댓글입력' id='"+num2 +"'class='insertReply'>"
  		                +"</td><td colspan='3' class='re2'>댓글 : <input type='text' id='replyCon' class='replyCon'>"
  		                +" pw : <input id='replyPw' class='replyPw' type='password' style='width:30px'></td></tr>";
  			          $(".re").html($(".re").html() +  insertReply);
  			for(var i=0;i<server2.length;i++){
 	    				if(server2[i].fr_m_Id==userid){ 
    	    				var deleteReply=server2[i].fr_Num
    	    				
    	    			result2 = 
        					"<tr class='retr'><td class='re1'></td><td class='re2'>"
        					+"<img alt='댓글' src='/library/resources/reply2.jpg'></td><td class='re2'>"
        					+server2[i].fr_Content
        					+"<input id='"+num2 +"'class='deletebtn' name='deleteReply'type='image' value='"+deleteReply+"' src='/library/resources/xbutton.png' width='13' height='13'>"
        					+"<input type='password'  id='"+deleteReply+"' name='deletePw' class='deletePw' style='width:30px'>"//댓글삭제
        					+"</td><td class='re2'>"
        					+"<img alt='이모티콘' src='/library/resources/"+server2[i].m_Pic+"' width='17' height='17'>"
        					+server2[i].fr_m_Id+"</td></tr>";
        					
    	    			$(".re").html($(".re").html() +  result2);
    	    			
    	    			}else{
    	    			result2=
    	    				"<tr class='retr'><td class='re1'></td><td class='re2'>"
        					+"<img alt='댓글' src='/library/resources/reply2.jpg'></td><td class='re2'>"
        					+server2[i].fr_Content
        					+"</td><td class='re2'>"
        					+"<img alt='이모티콘' src='/library/resources/"+server2[i].m_Pic+"' width='17' height='17'>"
        					+server2[i].fr_m_Id+"</td></tr>";
        					$(".re").html($(".re").html() +  result2);
        					
    	    			}
    	    		}//로그인한 아이디가 작성한 리플 판별
	    			//$(".re").append(result);
		}else if($('.reply').val()=="댓글접기"){
			//alert("ㅎㅇ")
			$('.retr').parent().remove()//새로 생성된 댓글 tr의 부모인 tbody부터 자식까지 삭제
			$('.reply').val("댓글보기")
		}
	    		         }//success         
 		            });//ajax 해당글의 댓글보기          
		    })//function해당 글의 댓글보기
 	            
 	 
   $('#cont').on('click',(".insertReply"),function(){//댓글 입력//////////////////////////////////////////  
	   var replyCon=$('.replyCon').val()//리플 내용
	   var replyPw=$('.replyPw').val()//리플 비번
	   var num3=$(this).prop("id");//게시물 아이디
	   //alert("내용 :"+replyCon+" 비번 : "+replyPw+" 게시물 번호 : "+num3)
	  
	   if(replyCon!=""&&replyPw!=""){//내용 비번 입력 하면 ajax 사용
		  //alert("입력!")
		$('.retr').parent().remove()//새로 생성된 댓글 tr의 부모인 tbody부터 자식까지 삭제
 		var result3=""
		//var num=$(this).prop("id");
 		$.ajax({//작성글 내용 보기
	    	url:'/library/InsertReply',
	    	type:'post',
	    	data:{'num':num3,'userid':userid,'replyCon': replyCon,'replyPw' : replyPw},
	    	success:function(server3){
	    	//alert(num2+" "+ userid+" "+replyCon+" "+replyPw)
	    		var insertReply="<tr class='retr'><td class='re1'><input type='button' value='댓글입력' class='insertReply'>"
		                +"</td><td colspan='3' class='re2'>댓글 : <input type='text' id='replyCon' class='replyCon'>"
		                +" pw : <input id='replyPw' class='replyPw' type='password' style='width:30px'></td></tr>";
			          $(".re").html($(".re").html() +  insertReply);
			for(var i=0;i<server3.length;i++){
	    		if(server3[i].fr_m_Id==userid){ 
	    				var deleteReply=server3[i].fr_Num
	    				
	    			result3 = 
    					"<tr class='retr'><td class='re1'></td><td class='re2'>"
    					+"<img alt='댓글' src='/library/resources/reply2.jpg'></td><td class='re2'>"
    					+server3[i].fr_Content
    					+"<input id='"+num3 +"' class='deletebtn'name='deleteReply'type='image' value='"+deleteReply+"' src='/library/resources/xbutton.png' width='13' height='13'>"
    					+"<input type='password'  id='"+deleteReply+"' name='deletePw' class='deletePw' style='width:30px'>"//댓글삭제
    					+"</td><td class='re2'>"
    					+"<img alt='이모티콘' src='/library/resources/"+server3[i].m_Pic+"' width='17' height='17'>"
    					+server3[i].fr_m_Id+"</td></tr>";
    					
	    			$(".re").html($(".re").html() +  result3);
	    			}else{
	    			result3=
	    				"<tr class='retr'><td class='re1'></td><td class='re2'>"
    					+"<img alt='댓글' src='/library/resources/reply2.jpg'></td><td class='re2'>"
    					+server3[i].fr_Content
    					+"</td><td class='re2'>"
    					+"<img alt='이모티콘' src='/library/resources/"+server3[i].m_Pic+"' width='17' height='17'>"
    					+server3[i].fr_m_Id+"</td></tr>";
    					$(".re").html($(".re").html() +  result3);
    				}
	    		}
	  		}//success
	       });//ajax 댓글 입력
 	    }else{
		   alert("내용과 비밀번호를 입력하세요")
	   }
	})//function 댓글 입력 
	//<form action='/library/ReplyDelete' method='post'>
	
 	
	 $('#cont').on('click',(".deletebtn"),function(){//댓글 삭제///////////////////////////////////////
		 
		 var num4=$(this).prop("id");//게시물 아이디
		 var deleteReply=$('.deletebtn').val();//삭제할 리플의 번호(pk값)
		 var deletePw=$('.deletePw').val();//입력된 리플 삭제 비번
		 var result2=""
		 //var deletePw=$("#"+deleteReply).val();//입력된 리플 삭제 비번
		$('.retr').parent().remove()//새로 생성된 댓글 tr의 부모인 tbody부터 자식까지 삭제
		 alert("리플번호 : "+deleteReply+"비번 : "+deletePw+"게시물 번호 :  "+num4)
	    
	if($(this).val()!=""){
		 $.ajax({//댓글 보기
	    	url:'/library/ReplyDelete',
	    	type:'post',
	    	data:{'num': num4,"deletePw": deletePw,"deleteReply": deleteReply},
	    	success:function(server2){
		
			
 		var insertReply="<tr class='retr'><td class='re1'><input type='button' value='댓글입력' id='"+num4 +"'class='insertReply'>"
 		                +"</td><td colspan='3' class='re2'>댓글 : <input type='text' id='replyCon' class='replyCon'>"
 		                +" pw : <input id='replyPw' class='replyPw' type='password' style='width:30px'></td></tr>";
 			          $(".re").html($(".re").html() +  insertReply);
 			for(var i=0;i<server2.length;i++){
	    				if(server2[i].fr_m_Id==userid){ 
   	    				var deleteReply=server2[i].fr_Num
   	    				
   	    			result2 = 
       					"<tr class='retr'><td class='re1'></td><td class='re2'>"
       					+"<img alt='댓글' src='/library/resources/reply2.jpg'></td><td class='re2'>"
       					+server2[i].fr_Content
       					+"<input id='"+num4 +"' class='deletebtn'name='deleteReply'type='image' value='"+deleteReply+"' src='/library/resources/xbutton.png' width='13' height='13'>"
       					+"<input type='password' id='"+deleteReply+"' name='deletePw' class='deletePw' style='width:30px'>"//댓글삭제
       					+"</td><td class='re2'>"
       					+"<img alt='이모티콘' src='/library/resources/"+server2[i].m_Pic+"' width='17' height='17'>"
       					+server2[i].fr_m_Id+"</td></tr>";
       					
   	    			$(".re").html($(".re").html() +  result2);
   	    			
   	    			}else{
   	    			result2=
   	    				"<tr class='retr'><td class='re1'></td><td class='re2'>"
       					+"<img alt='댓글' src='/library/resources/reply2.jpg'></td><td class='re2'>"
       					+server2[i].fr_Content
       					+"</td><td class='re2'>"
       					+"<img alt='이모티콘' src='/library/resources/"+server2[i].m_Pic+"' width='17' height='17'>"
       					+server2[i].fr_m_Id+"</td></tr>";
       					$(".re").html($(".re").html() +  result2);
       					
   	    			}
   	    		}//로그인한 아이디가 작성한 리플 판별
	    			
		
	    		         }//success         
		            });//ajax 해당글의 댓글삭제          
		}else{
		alert("비밀번호 입력하세요")
	}
 	
	})//function해당 글의 댓글 삭제	
 	
 	 
 	
 	
 	
	
	$("#newcont").on('click',function(){//새글작성//////////////////////////////
 		var ww=500;    //띄울 창의 넓이
		var wh=380;    //띄울 창의 높이
		
		// 새창의 중앙 좌표
		var top=(screen.availHeight-wh)/4;
		var left=(screen.availWidth-ww)/2;
       // alert("새글 작성")
 		window.open("/library/Insert/", "window", "width="+ww+", height="+wh+", top="+top+", left="+left+", location=no, toolbar=no, menubar=no, scrollbar=no, resizable=no");
 	})//function 새글작성
 	
 	
 	 
 	 
  	 /* $('input[type=image]').on("click",function(){
 		 alert("검색")
 	 })  */
 	 
</script>
</html>