<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	 <%@ page import="org.json.JSONObject,org.json.JSONException,org.json.*,java.util.*"%>
<html>
<head>
<title>Registration</title>




<!-- ========================================================================================================== -->
<link rel="stylesheet" href="assets/datatablejs&css/jquery-ui.css">
<link rel="stylesheet" href="assets/datatablejs&css/dataTables.jqueryui.min.css">
<script src="assets/datatablejs&css/jquery-3.3.1.js"></script>
<script src="assets/datatablejs&css/jquery.dataTables.min.js"></script>
<script src="assets/datatablejs&css/dataTables.jqueryui.min.js"></script>

<!-- ========================================================================================================== -->

<link href="assets/datatablejs&css/buttons.dataTables.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="assets/datatablejs&css/buttons.flash.min.js"></script>
<script src="assets/datatablejs&css/jszip.min.js"></script>	
<script src="assets/datatablejs&css/pdfmake.min.js"></script>
<script src="assets/datatablejs&css/buttons.html5.min.js"></script>
<script src="assets/updateJs/jquery-ui.js"></script>
<script src="assets/datatablejs&css/vfs_fonts.js"></script>	
<style>
td {	
	margin-bottom: -20%;
}
#example tr td {
	height: 20px;
}
em {
	font-style: normal; 
	text-decoration: underline; 
}
.glyphicon {
    font-size: 10px;
}

.dataTables_wrapper .ui-toolbar {
    padding: 8px;
    background-color: #225193;
}

.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
    color: white;
}

table.dataTable thead th div.DataTables_sort_wrapper {
    position: relative;
    background-color: gray;
    color: white;
}
</style>





<body>
<div style="border-radius: 6px;font-family: 'Yanone Kaffeesatz', sans-serif; text-shadow: 0 0px 20px rgba(0, 0, 0, 0.3); float:left; background-color:#225193; width:100%; height:40px;color:white; text-align: center;font-size: 140%; border:1px solid lightgray"><b>Hello World</b></div>
				<a href="Logout.jsp" class="btn btn-info" role="button">logout</a></div></center><br/><br/><br/><br/>
  <table id="example" class="cell-border compact stripe" style="width:100%">
		
		<thead>
            <tr>
                <th>UserName</th>
                <th>ID</th>
                <th>Password</th>

            </tr>
        </thead>
	 

		
	<%

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from registerdata"); 
while(rs.next()) 
{
%>
	
   <TR>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(1)%></TD>
        <TD><%=rs.getString(3)%></TD>
        
    </TR>
    <%   }    %>
    </table>
    
    
    <style>
	.dt-button.copy {
        color: red;
        background: url(./buttonimages/copy-icon.jpg) no-repeat center right;
        background-size: 30px 30px;
    }
    .dt-button.print {
        color: red;
        background: url(./buttonimages/print.jpeg) no-repeat center right;
        background-size: 30px 30px;
    }
    .dt-button.pdf {
        color: red;
        background: url(./buttonimages/pdf-icon.png) no-repeat center right;
        background-size: 30px 30px;
    }
  .dt-button.csv {
        color: red;
        background: url(./buttonimages/csvv.png) no-repeat center right;
        background-size: 30px 30px;
    }
     .dt-button.excel {
        color: red;
        background: url(./buttonimages/msexcel.png) no-repeat center right;
        background-size: 30px 30px;
    }
	</style>
  <script type="text/javascript">
  
  $(document).ready(function() {
	  var table = $('#example').DataTable({
	   
	    url:'ResultSet',
	    "lengthMenu": [ [5, 10, 15, -1], [5, 10, 15, "All"] ],
	    "pageLength": 5,
		 "language": {
	            "lengthMenu": "Show _MENU_ entries",
	            "zeroRecords": "No records available",
	            "info": "Showing page _PAGE_ of _PAGES_",
	            "infoEmpty": "No records available",
	            "infoFiltered": "(filtered from _MAX_ total records)",    
	        }
	    
	} );
	  new $.fn.dataTable.Buttons( table, {
	        buttons: [
	{
	    extend:    'copyHtml5',
	    text:      '&nbsp;',
	    className: 'copy',
	    titleAttr: 'Copy'
	},
	
	{
	    extend:    'print',
	    text:      '&nbsp;',
	    className: 'print',
	    titleAttr: 'Print'
	},
	
	{
	    extend:    'excelHtml5',
	    text:      '&nbsp;',
	    className: 'excel',
	    titleAttr: 'Excel'
	},
	{
	    extend:    'pdfHtml5',
	    title: 'Registration',
	    exportOptions: {
	        columns: [ 0, 1, 2]
	    },
	    customize : function(doc) {
	    	//pageMargins [left, top, right, bottom]  	
	    	doc.pageMargins = [50, 30, 20,20 ]; 
	    doc.styles.title = {
	            color: 'red',
	            fontSize: '15',
	          //  background: 'khaki',
	            alignment: 'center'
	        }
	   // Border lines
	    doc.content[1].layout = 'lightHorizontalLines';
	    doc.content[1].layout = 'lightVerticalLines';
	    },
	    orientation: 'landscape',
	    pageSize: 'A4',
	    text:      '&nbsp;',
	    className: 'pdf',
	    titleAttr: 'PDF'
	}
	]
	    } );
	 
	    table.buttons( 0, null ).container().prependTo(
	        table.table().container()
	    );
	    table.buttons().container()
	    .appendTo( '#example_wrapper .col-md-6:eq(0)' );
	    
	    $("select").css({"height":"25px"});
	    $("button").css({"height":"30px"});
	} );
		</script>
  
</body>



</html>


































<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo loginjsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("usr"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from user where userid='"+userid+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
out.println("welcome"+userid); 

} 
else 
{ 
out.println("Invalid password try again"); 
} 
} 
else 
%>
<a href="index.html">Home</a>
</body>
</html> --%>