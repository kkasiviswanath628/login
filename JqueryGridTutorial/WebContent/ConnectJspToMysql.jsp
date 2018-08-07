<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<HTML>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
  <script src="bootstrap/jquery.min.js"></script>
  <script src="bootstrap/bootstrap.min.js"></script>
<head>
<body>
<br/>
<div style="border-radius: 6px;font-family: 'Yanone Kaffeesatz', sans-serif; text-shadow: 0 0px 20px rgba(0, 0, 0, 0.3); float:left; background-color:#225193; width:100%; height:40px;color:white; text-align: center;font-size: 140%; border:1px solid lightgray"><b>Hello World</b></div>
				<a href="application.jsp" class="btn btn-info" role="button">Back</a><br/><br/>

<%          int current = 0;
            // declare a connection by using Connection interface 
            Connection connection = null;
            /* Create string of connection url within specified 
            format with machine name, port number and database 
            name. Here machine name id localhost and database 
            name is student. */
            String connectionURL = "jdbc:mysql://localhost:3306/countrydata";
            /*declare a resultSet that works as a table 
            resulted by execute a specified sql query. */
            ResultSet rs = null;
%>
<FORM NAME="form1" ACTION="ConnectJspToMysql.jsp" METHOD="get"  style="color: #225193;">






<%
            if (request.getParameter("hidden") != null) {
                current = Integer.parseInt(request.getParameter("hidden"));
            }
            // Declare statement.
            Statement statement = null;
            try {
                // Load JDBC driver "com.mysql.jdbc.Driver".
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                /* Create a connection by using getConnection()
                method that takes parameters of string type connection
                url, user name and password to connect to database. */
                connection = DriverManager.getConnection(connectionURL, 
                "root", "root");
                /* createStatement() is used for create statement 
                object that is used for sending sql statements to 
                the specified database. */
                statement = connection.createStatement();
                // executeQuery() method execute specified sql query. 
                rs = statement.executeQuery("select * from registerdata");
                for (int i = 0; i < current; i++) {
                    rs.next();
                }
                if (!rs.next()) {
%>






<%
        out.println("Thank You ! All Records Navigation Compleate.");
    } else {
%>



<div class="row"> 
    <div class="col-md-6 col-sm-12 col-lg-6 col-md-offset-3">
		<div class="panel panel-primary">
	
			<div class="panel-heading" style=" text-align:  center;">DataBase Navigation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			</div>
		
			<div class="panel-body">
				
				<div class="row">
				
					<div class="col-xs-6 col-sm-6 col-md-6">
					<table class="table table-bordered col-md-6" style="margin-left: 137px;">
    
    <tr><th style="width: 1px;background-color: #225193;color:  white;">UserName</TH><td> <%= rs.getString(2)%> </td></tr>
    <tr><th style="width: 1px;background-color: #225193;color:  white;">Id</th><td> <%= rs.getString(1)%> </td></tr>
    <tr><th style="width: 1px;background-color: #225193;color:  white;">Password</th><td> <%= rs.getString(3)%> </td></tr>    
    
</table>
<BR>
<input type="hidden" name="hidden" value="<%=current + 1%>">
<input type="submit" value="Next Record"  style="margin-left: 190px;margin-top: -12px;background-color: #225193;color: white;">

					</div>
					</div>	
			</div>
		</div>
	</div>
</div>

<%
    }
} 
catch (Exception ex) {
%>
<FONT size="+3" color="red"></b>
    <%
                out.println("Unable to connect to database.");
            } finally {
                // close all the connections.
                rs.close();
                statement.close();
                connection.close();
            }
    %>
</FONT>

</body> 
</html>
