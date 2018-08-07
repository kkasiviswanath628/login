<%@page language="java"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>Registration</title>
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
  <script src="bootstrap/jquery.min.js"></script>
  <script src="bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div style="border-radius: 6px;font-family: 'Yanone Kaffeesatz', sans-serif; text-shadow: 0 0px 20px rgba(0, 0, 0, 0.3); float:left; background-color:#225193; width:100%; height:40px;color:white; text-align: center;font-size: 140%; border:1px solid lightgray"><b>Hello World</b></div>
				<a href="application.jsp" class="btn btn-info" role="button">Back</a><br/><br/><br/><br/>
<form method="post" action="update.jsp">
<div class="container">
<div style="border-radius: 6px;font-family: 'Yanone Kaffeesatz', sans-serif; text-shadow: 0 0px 20px rgba(0, 0, 0, 0.3); float:left; background-color:#225193; width:97%; height:40px;color:white; text-align: center;font-size: 140%; border:1px solid lightgray"><b>Update UserName and Password based on ID</b></div>
<table class="table table-bordered">

<tr><th style="background-color: #225193;color:  white;">UserName</th><th style="background-color: #225193;color:  white;">ID</th><th style="background-color: #225193;color:  white;">Password</th></tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root");
String query = "select * from registerdata where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="username" value="<%=rs.getString(2)%>"></td>
<td><input type="text" name="id" value="<%=rs.getString(1)%>"></td>
<td><input type="text" name="password" value="<%=rs.getString(3)%>"></td>

<td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
</tr>
<tr>
<td><input type="submit" name="Submit" value="Update" style="background-color:#225193;font-weight:bold;color:#ffffff;"></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</div>
</form>

</body>
</html>