<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="/library/resources/jquery-3.2.1.min.js"></script>
<style type="text/css">
.userpic
{width: 30px;
height: 30px;}
/* body
{background-color: rgb(217, 217, 217)} */
table
{ border-collapse: collapse; }
td
{border: lightgray solid 2px;
padding: 5px;}
</style>
</head>
<body>
<form action="/library/UserPicSelect/" method="post">
<table>

<tr>
<td><input name=userpic value=person1.jpg type="radio" ><img src='/library/resources/person1.jpg' class=userpic></td>
<td><input name=userpic value=person2.jpg type="radio" ><img src='/library/resources/person2.jpg' class=userpic></td>
<td><input name=userpic value=person3.jpg type="radio" ><img src='/library/resources/person3.jpg' class=userpic></td>
<td><input name=userpic value=person4.jpg type="radio" ><img src='/library/resources/person4.jpg' class=userpic></td>
<td><input name=userpic value=person5.jpg type="radio" ><img src='/library/resources/person5.jpg' class=userpic></td>
</tr><tr>
<td><input name=userpic value=person6.jpg type="radio" ><img src='/library/resources/person6.jpg' class=userpic></td>
<td><input name=userpic value=person7.jpg type="radio" ><img src='/library/resources/person7.jpg' class=userpic></td>
<td><input name=userpic value=person8.jpg type="radio" ><img src='/library/resources/person8.jpg' class=userpic></td>
<td><input name=userpic value=person9.jpg type="radio" ><img src='/library/resources/person9.jpg' class=userpic></td>
<td><input name=userpic value=person10.jpg type="radio" ><img src='/library/resources/person10.jpg' class=userpic></td>

</tr>

</table>
<input type="submit" value='변경'>
</form>
</body>
<script>
	  
	window.onunload = function () { 
	    window.opener.location.reload(); 
	       window.close()
	}
	
	
	
</script>
</html>