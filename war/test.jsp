<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<% String userId = request.getParameter("userId");
String userName= request.getParameter("userName");
if(userId != null){
session.getServletContext().setAttribute("userId", userId);
session.getServletContext().setAttribute("userName", userName);
}
else{
	userId = (String)session.getServletContext().getAttribute("userId");
	userName = (String)session.getServletContext().getAttribute("userName");
}

if(userId == null || userId.isEmpty()){
	out.println("please refresh the page");
}
	%>
	
 
 <% 
if(userId !=null){
	%>
<p>username is <%=userName %></p>
<%} %>
</body>
</html>