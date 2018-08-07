<%@ page language="java" %> 
<% 
String name=request.getParameter("name"); 
session.setAttribute("name",name); 
%> 

<html> 
<head> 
<title>Name Saved</title> 
</head> 
<body> 
<p><a href="showsession.jsp">Next Page to view the session value</a><p> 
</body> 
</html> 