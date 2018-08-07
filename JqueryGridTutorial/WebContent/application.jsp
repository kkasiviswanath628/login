<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%!public int Converter(String str) {
		int convrtr = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			convrtr = Integer.parseInt(str);
		} catch (Exception e) {

		}
		return convrtr;
	}%>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata", "root", "root");
	ResultSet rsPgin = null;
	ResultSet rsRwCn = null;
	PreparedStatement psPgintn = null;
	PreparedStatement psRwCn = null;
	// Number of records displayed on each page 
	int iSwRws = 5;
	// Number of pages index displayed 
	int iTotSrhRcrds = 10;
	int iTotRslts = Converter(request.getParameter("iTotRslts"));
	int iTotPags = Converter(request.getParameter("iTotPags"));
	int iPagNo = Converter(request.getParameter("iPagNo"));
	int cPagNo = Converter(request.getParameter("cPagNo"));
	int iStRsNo = 0;
	int iEnRsNo = 0;
	if (iPagNo == 0) {
		iPagNo = 0;
	} else {
		iPagNo = Math.abs((iPagNo - 1) * iSwRws);
	}
	String sqlPgintn = "SELECT SQL_CALC_FOUND_ROWS * FROM registerdata limit " + iPagNo + "," + iSwRws + "";
	psPgintn = con.prepareStatement(sqlPgintn);
	rsPgin = psPgintn.executeQuery();
	// Count total number of fetched rows 
	String sqlRwCnt = "SELECT FOUND_ROWS() as cnt";
	psRwCn = con.prepareStatement(sqlRwCnt);
	rsRwCn = psRwCn.executeQuery();
	if (rsRwCn.next()) {
		iTotRslts = rsRwCn.getInt("cnt");
	}
%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Registration</title>

<script language="javascript">
function editRecord(id){
	
	
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
	
    var f=document.form;
    f.method="post";
    f.action='delete.jsp?id='+id;
    f.submit();
}
</script>
<style>
a:link, a:visited {
	background-color: #337ab7;;
	color: white;
	padding: 4px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: 2px solid lightblue;
}

a:hover, a:active {
	background-color: lightblue;
}

#formTest {
	width: 35%;
	background-color: #3CBC8D;
	color: white;
}

/* form {
	margin-left: 10%;
	margin-right: 25%;
	width: 50%;
} */

#hi {
	text-align: center;
}
</style>

<style type="text/css">
.palel-primary {
	border-color: #bce8f1;
}

.panel-primary>.panel-heading {
	background: #bce8f1;
}

.panel-primary>.panel-body {
	background-color: #EDEDED;
}

div.row {
	margin-top: 20px;
}

div.panel-heading {
	text-align: center;
}

a.btn.btn-info {
	background-color: #428bca;
	border-color: #46b8da;
	margin-top: 21px;
	margin-left: 110px;
}
</style>


<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
  <script src="bootstrap/jquery.min.js"></script>
  <script src="bootstrap/bootstrap.min.js"></script>



<!-- <link href="bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="bootstrap.min.js"></script> -->
<script src="jquery-1.11.1.min.js"></script>


<% 
String solution = (String)session.getAttribute("solution");
%>



</head>


<body>

<div style="border-radius: 6px;font-family: 'Yanone Kaffeesatz', sans-serif; text-shadow: 0 0px 20px rgba(0, 0, 0, 0.3); float:left; background-color:#225193; width:100%; height:40px;color:white; text-align: center;font-size: 140%; border:1px solid lightgray"><b>Hello World</b></div>
				<a href="LoginForm.jsp" class="btn btn-info" role="button">Back</a><br/><br/>

	<div class="row">
		<div class="col-md-8 col-sm-8 col-lg-8 col-md-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">Search By UserName</div>
				<div class="panel-body">
					<div class="row">

						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="form-group">
							<label for="myName"></label>
								<form name="searchForm" method="GET" action="SearchColumn.jsp">
									<table>


										<tr>
												
											<td><input type="text" name="user" value="" style="margin-left: 22px;margin-top: -20px;"></td>
											<td><input type="submit" name="Submit" value="Search" style="margin-top: -20px;"></td>
										</tr>



									</table>
								</form>
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="form-group">
							<label for="myName"></label>
								<form name="Hello" method="GET" action="SearchExcelData.jsp">
									<table>
										<tr>
											
											<td><input type="text" name="user" value=""
												placeholder="Search Excel Data" style="margin-top: -20px;  margin-left: 68px;	"></td>
											<td><input type="submit" name="Submit1" value="Search" style="margin-top: -20px;"></td>
	
											
										</tr>
										
									</table>
								</form>
							</div>
						</div>
					</div>



				</div>
			</div>

		</div>
	</div>
	





	<!-- <form name="searchForm" method="GET" action="SearchColumn.jsp">
		<table align="center" bgcolor="#93B874">

			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td><b>Search :</b></td>
				<td><input type="text" name="user" value=""></td>
				<td><input type="submit" name="Submit" value="Search"></td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
		</table>
	</form> -->
	

	<!-- <form name="Hello" method="GET" action="SearchExcelData.jsp">
		<table align="center" bgcolor="#93B874">

			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td><b>SearchExcelData :</b></td>
				<td><input type="text" name="user" value=""
					placeholder="Search.."></td>
				<td><input type="submit" name="Submit1" value="Search"></td>
				<br />
				
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
		</table>
	</form> -->
               <div class="form-group">
						
						<a href="ExcelData.jsp" class="btn btn-info" role="button" style="margin-left: 452px">Excel</a>
						<a href="PDF1.jsp" target="_blank" class="btn btn-info" role="button" style="margin-left: 10px">PDF</a>
						<a href="ConnectJspToMysql.jsp" class="btn btn-info" role="button" style="margin-left: 10px">Database Navigation</a>
						<a href="Reg.jsp" class="btn btn-info" role="button" style="margin-left: 10px">Register</a>
						
					</div>
	<form method="post" name="form">
		<input type="hidden" name="iPagNo" value="<%=iPagNo%>"> <input
			type="hidden" name="cPagNo" value="<%=cPagNo%>"> <input
			type="hidden" name="iSwRws" value="<%=iSwRws%>"> 
		<!-- <a href="ExcelData.jsp">Excel</a> <a href="ConnectJspToMysql.jsp">Database
			Navigation</a> <a href="PDF1.jsp">PDF</a> <a href="Reg.jsp">Register</a><br>
		<br> -->
		
		
		
		
		<div class="container">
		
		<table  id="example" class="table table-bordered">
		
 <thead>
<tr>
				<th style="background-color: #337ab7;color: white;">UserName</th>
				<th style="background-color: #337ab7;color: white;">ID</th>
				<th style="background-color: #337ab7;color: white;">Password</th>
				<th style="background-color: #337ab7;color: white;">Edit</th>
				<th style="background-color: #337ab7;color: white;">Delele</th>
			</tr>

    </thead>
			<%
				while (rsPgin.next()) {
			%>
			<tr>
				<td><%=rsPgin.getString(2)%></td>
				<td><%=rsPgin.getString(1)%></td>
				<td><%=rsPgin.getString(3)%></td>

				<td><input type="button" name="edit" value="Edit"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"
					onclick="editRecord(<%=rsPgin.getString(1)%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: #ff0000; font-weight: bold; color: #ffffff;"
					onclick="deleteRecord(<%=rsPgin.getString(1)%>);"></td>
			</tr>
			<%
				}
			%>

			<%
				// Calculate next record start and end position 
				try {
					if (iTotRslts < (iPagNo + iSwRws)) {
						iEnRsNo = iTotRslts;
					} else {
						iEnRsNo = (iPagNo + iSwRws);
					}
					iStRsNo = (iPagNo + 1);
					iTotPags = ((int) (Math.ceil((double) iTotRslts / iSwRws)));
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

			<tr>
				<td colspan="5">
					<div>
						<%
							// Create index of pages 
							int i = 0;
							int cPge = 0;
							if (iTotRslts != 0) {
								cPge = ((int) (Math.ceil((double) iEnRsNo / (iTotSrhRcrds * iSwRws))));
								int prePageNo = (cPge * iTotSrhRcrds) - ((iTotSrhRcrds - 1) + iTotSrhRcrds);
								if ((cPge * iTotSrhRcrds) - (iTotSrhRcrds) > 0) {
						%>
						<a
							href="application1.jsp?iPagNo=<%=prePageNo%>&cPagNo=<%=prePageNo%>" ><<
							Previous</a>
						<%
							}
								for (i = ((cPge * iTotSrhRcrds) - (iTotSrhRcrds - 1)); i <= (cPge * iTotSrhRcrds); i++) {
									if (i == ((iPagNo / iSwRws) + 1)) {
						%>
						<a href="application1.jsp?iPagNo=<%=i%>"
							style="cursor: pointer; color: black"><b><%=i%></b></a>
						<%
							} else if (i <= iTotPags) {
						%>
						<a href="application1.jsp?iPagNo=<%=i%>"><%=i%></a>
						<%
							}
								}
								if (iTotPags > iTotSrhRcrds && i < iTotPags) {
						%>
						<a href="application1.jsp?iPagNo=<%=i%>&cPagNo=<%=i%>">>> Next</a>
						<%
							}
							}
						%>
						<b>Rows <%=iStRsNo%> - <%=iEnRsNo%> Total Result <%=iTotRslts%></b>
					</div>
				</td>
			</tr>
		</table>
		</div>
	</form>
	
<logic:present name="solution" scope="session">
		<script type="text/javascript">
			alert("User Deleted Successfully");
			$("#alertMessageModal").modal();
			$("#modalSuccessHeader").show();
			$("#modalErrorHeader,#modalWarningHeader,#modalInfoHeader").hide();
			$("#alertSuccessBody").html("User Deleted Successfully");
		</script>
	</logic:present>	

</body>
</html>
<%
	try {
		if (psPgintn != null) {
			psPgintn.close();
		}
		if (rsPgin != null) {
			rsPgin.close();
		}
		if (psRwCn != null) {
			psRwCn.close();
		}
		if (rsRwCn != null) {
			rsRwCn.close();
		}
		if (con != null) {
			con.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>