<%@page import="java.sql.*"%>
<%

String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata", "root", "root");
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM registerdata WHERE id = '"+no+"'");

session.setAttribute("solution", "solution");
response.sendRedirect("application.jsp");
}
catch(Exception e){}
%>