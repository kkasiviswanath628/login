<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
margin-left: 103px;

}
a.btn.btn-info {

background-color: #428bca;
    border-color: #46b8da;
    margin-top: 21px;
    margin-left: 110px;


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
			<div class="panel-heading">Login Failed
			</div>
			<div class="panel-body">
				<form name="myform" action="LoginCheck.jsp" method="post">
				
				
					<div class="form-group">
						<label for="myName">Enter Valid UserName and Password *</label>
						<br>
						<a href="LoginForm.jsp" class="btn btn-info" role="button">Login</a>
						
					</div>
				
			
				</form>

			</div>
		</div>
	</div>
</div>












<!-- <h1> UserName and Password not matched
</h1>

<a href="LoginForm.jsp">Login</a>
</body> -->
</html>