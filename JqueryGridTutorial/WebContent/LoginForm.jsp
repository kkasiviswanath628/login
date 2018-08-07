<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Registration</title>
<style type="text/css">
	.palel-primary
	{
		border-color: #bce8f1;
	}
	.panel-primary>.panel-heading
	{
		background:#bce8f1;
		
	}
	.panel-primary>.panel-body
	{
		background-color: #EDEDED;
	}
div.row {
margin-top: 72px;
}
div.panel-heading {
text-align: center;
}

 button#submit{
margin-left: -50px;
} 

 a.btn.btn-info {
	background-color: #428bca;
	border-color: #46b8da;
	
	margin-left: -10px;
} 
</style>
<link href="bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="bootstrap.min.js"></script>
<script src="jquery-1.11.1.min.js"></script>
</head>
<body>



<div class="row" > 
    <div class="col-md-3 col-sm-3 col-lg-3 col-md-offset-4">
		<div class="panel panel-primary">
			<div class="panel-heading">Login
			</div>
			<div class="panel-body">
				<form name="myform" action="LoginCheck.jsp" method="post">
				
				
					<div class="form-group">
						<label for="myName">User Name *</label>
						<input id="myName" name="username" class="form-control" type="text" data-validation="required">
						<span id="error_name" class="text-danger"></span>
					</div>
					
					
				
					<div class="form-group">
						<label for="password">Password *</label>
						<input id="txtPassword" name="password" class="form-control" type="password" data-validation="required">
						 
					</div>
					
					<div class="row1" id="sub">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<a href="index.html" class="btn btn-info" role="button">Home</a>
					</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<button id="submit" type="submit" value="submit" class="btn btn-primary center">Submit</button>
					</div>
					</div>
					</div>
					
					
					
					
			
				</form>

			</div>
		</div>
	</div>
</div>



















	<!-- <h1 id="hi">Login Page</h1>
	<center>
		
		<form action="LoginCheck.jsp" method="post">
		<table>
		<tr>
      <td><label for="txtUsername">Username:</label></td>
      <td><input type="text" id="txtUsername" name="username"></td>
    </tr>
    <tr>
      <td><label for="txtPassword">Password:</label></td>
      <td><input type="text" id="txtPassword" name="password" size=""></td>
    </tr>
		
		<tr>
      <td>&nbsp;</td>
      <td><input type="submit" value="Submit" id="btnSubmit">&nbsp;
          <input type="reset" value="CLEAR" id="btnReset"></td>
    </tr>
		
		
			
			</table>
		</form>
	</center> -->
</body>
</html>


