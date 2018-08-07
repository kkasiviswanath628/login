<%@page import="java.sql.*"%>

<%
String name=request.getParameter("username");
//System.out.println("username                " + name);
String ide=request.getParameter("id");

//System.out.println("id                " + ide);
int num=Integer.parseInt(ide);
String pass=request.getParameter("password");
//System.out.println("password                " + pass);

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root", "root");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update registerdata set username='"+name+"',password='"+pass+"' where id='"+ide+"'");
response.sendRedirect("application.jsp");
}
catch(Exception e){
System.out.println(e);
    }
%>