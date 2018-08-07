<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<form action="contantvalue.jsp">
    <body>
        First INPUT:

<%
   String name = request.getParameter( "second" );
   session.setAttribute( "second", name );
%>

        <input name="firstinput" type="text" 
       value='<%=request.getParameter("firstinput")%>' />
       <input name="second" type="text" />
       <input type="text" id="userName" name="userName"/>
        <br>
        <input type="submit" value="Submit">
        <%
            String first = request.getParameter("firstinput");
        String second = request.getParameter("second");
        out.println(first);
        out.println(second);

        %>
    </body>
</form>
</html>