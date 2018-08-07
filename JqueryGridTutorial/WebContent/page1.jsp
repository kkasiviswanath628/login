<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  --%>
<%@ page language="java" %> 
<html> 
<head> 
<title>page1</title> 
</head> 
<body> 

 <% 
String name=request.getParameter("name"); 

session.setAttribute("name",name); 

%> 



<form method="post" action="page1.jsp"> 
Name: </b><input type="text" name="name" value="${name}"><br> 
Name: </b><input type="hidden" name="name" value="<%=name%>"><br> 
Name: </b><input type="text" name="name" value="<%=name%>"><br> 

 _Name:<input type="textbox" name="empName" value="${name}"  /><br>

<input type="submit" value="Submit"> 
Name is: <%=name%><br> 
 Name is: ${name}
</form> 
</body> 
</html> 


  

 
   





<%-- Name: </b><input type="text" name="name" value="<%=name%>" disabled="disabled"><br>  --%>




<%-- <% 
String name=request.getParameter("name"); 
session.setAttribute("name",name); 

%>  --%>


<%-- 

<%!  

 int ID=5; 
 String Name=""; 

%>
 --%>
 
 <%-- 
 <% 
String name=request.getParameter("name"); 
if(name!=null && !"".equals(name)){ 
session.setAttribute("name",name); 
}
%>  --%>