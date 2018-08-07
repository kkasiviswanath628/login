<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo Regjsp</title>
<style>

a:link, a:visited {
    background-color: green;
    color: white;
    padding: 4px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
     border:2px solid lightblue;
}


a:hover, a:active {
    background-color: lightblue;
}
</style>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("username"); 
session.putValue("username",user);
String id=request.getParameter("id");
String pwd=request.getParameter("pwd"); 
  
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into registerdata values ('"+id+"','"+user+"','"+pwd+"')"); 

out.println("Registered"); 


%>
<a href ="Login.html">Login</a>
<a href="index.html">Home</a>
<a href="application.jsp">DataGrid</a>
</body>
</html>