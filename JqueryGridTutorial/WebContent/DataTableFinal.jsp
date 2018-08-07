<%@ page import="java.sql.*" %>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.jqueryui.min.js"></script>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<link href="https://cdn.datatables.net/1.10.16/css/dataTables.jqueryui.min.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	
	
	</script>

</head>
<body>


<br><br>

<table border="1" id="example">

<thead>
            <tr>
                <th>UseName</th>
                <th>Id</th>
                <th>Password</th>
            </tr>
        </thead>
        
        <tfoot>
            <tr>
                <th>Username</th>
                <th>Id</th>
                <th>Password</th>
             
            </tr>
        </tfoot>

<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "countrydata";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="root";

int sumcount=0;
Statement st;
try{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from user";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>

<%
while(rs.next()){
%>

<tbody>
<tr><td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>


</tr> 
 </tbody>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>





</body>
</html>