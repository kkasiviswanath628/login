<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <html>
    <head>
    
    <title>File2.jsp</title> 
    </head>

    <body>
   <% 
String name=request.getParameter("name"); 

session.setAttribute("name",name); 

%> 

<form method="post" action="File2.jsp"> 
Name: </b><input type="text" name="name" value="${name}"><br> 
Name: </b><input type="hidden" name="hello1" value="<%=name%>"><br> 
Name: </b><input type="text" name="hello2" value="<%=name%>"><br> 

 _Name:<input type="textbox" name="empName" value="${name}"  /><br>

<input type="submit" value="Submit"> 
Name is: <%=name%><br> 
 Name is: ${name}
</form> 
</body> 
</html> 
















    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

<%-- <html>
<form action="">
    <body>
        First INPUT:
        <input name="firstinput" type="text" 
       value='<%=request.getParameter("firstinput")%>' />
       <input name="second" type="text" />
        <br>
        <input type="submit" value="Submit">
        <%
            String first = request.getParameter("firstinput");
        out.println(first);

        %> <br>
         <%
       String userName = request.getParameter("userName");
       if(userName!=null &&
            !"".equals(userName)){ 
             session.setAttribute("userName",userName);
       }
    %>
    
<input type="text" id="userName" name="userName"/>

 <br>
        <input type="submit" value="Submit">
        <%
            String first = request.getParameter("firstinput");
        out.println(first);

        %> <br>
        
    </body>
</form>
</html> --%>
 <%--
<%!  

 int ID=5; 
 String Name="Riyana"; 

%>


<FORM METHOD=POST ACTION="">
What's your name? <INPUT TYPE=TEXT NAME=username SIZE=20 value="<%=Name%>">
<input name="name" value="<%=Name%>" size="50" type="text">
<P><INPUT TYPE=SUBMIT>
</FORM>

 --%>
 
 
 <%-- <% 
    String searxhtxt=request.getParameter("searchtxt");
    
        request.getSession().setAttribute("searchtxt",searchtxt);
    
    String text=session.getAttribute("searchtxt").toString();
 %> --%>