<%@ page language="java" %> 
<% 
String name=(String) session.getAttribute("name"); 
%> 
<html> 
<head> 
<title>Show value</title> 
</head> 
<body> 
Name is: <%=name%><p> 

</body> 
</html>