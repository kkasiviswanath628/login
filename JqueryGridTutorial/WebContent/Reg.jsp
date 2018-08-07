<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Registration</title>

<!--  ============================================================================== -->
<!-- <link rel="stylesheet" href="./css/commonFormStyle.css" />
Google Web fonts
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='assets/updatedCss/dataTables.jqueryui.min.css' rel='stylesheet' type='text/css' />
DataTable Style
<link href='css/dataTableStyle.css' rel='stylesheet' type='text/css' />	
<link href="css/jquery-ui-themes.css" rel="stylesheet">
Data Table Export Buttons
<link href="assets/datatablejs&css/jquery.dataTables.min.css" rel="stylesheet" type='text/css'>
<link href="assets/datatablejs&css/buttons.dataTables.min.css" rel="stylesheet"> -->

<!-- =================================================================================== -->

<% 

String solution = (String)session.getAttribute("solution");

%>
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
<script type="text/javascript">
	function add() {
		/* var a = document.getElementById("firstName").value; */
		var b = document.getElementById("myName").value;
		 var c = document.getElementById("lastname").value;
		 var d = document.getElementById("age").value;
		 /* var e = document.getElementById("subDistrict").value; */
		/* var e = document.getElementById("ulb_code").value; */
		/* var h = document.getElementById("userType").value;
		var j = document.getElementById("createdBy").value;
		var level =/^[1-6]{1,6}$/;  */  
		/* if (a == 0 || a == null || a == "") {
			alert("Please Enter First Name");
			document.getElementById("firstName").focus();
			return false;
		}  */ if (b == 0 || b == null || b == "") {
			alert("Please Enter User Name");
			document.getElementById("myName").focus();
			return false;
		} else if (c == 0 || c == null || c == "") {
			alert("Please Enter password");
			document.getElementById("lastname").focus();
			return false;
		}
		else if (d == 0 || d == null || d == "") {
			alert("Please Enter ID");
			document.getElementById("age").focus();
			return false;
		}
		
		 else if (h == 0 || h == null || h == "" || h >= 7) {
			alert("Please Select the User Type 1  To 6");
			document.getElementById("userType").focus();
			return false;
		} else if(!h.match(level)){
			alert("Please Select the User Type 1  To 6");
			document.getElementById("userType").focus();
			return false;
		} 
		 else if (j == 0 || j == null || j == "") {
			alert("Please Enter Created By");
			document.getElementById("createdBy").focus();
			return false;
		}
		 else {
			
			document.forms[0].submit();
		}
	}
</script>



<link href="bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="bootstrap.min.js"></script>
<script src="jquery-1.11.1.min.js"></script>
<%
session.setMaxInactiveInterval(2);
%>


 <script type="text/javascript">
var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
 function alertName(){
 alert("Form has been submitted");
 } 
 }
 </script> 


</head>


<body>

<div style="border-radius: 6px;font-family: 'Yanone Kaffeesatz', sans-serif; text-shadow: 0 0px 20px rgba(0, 0, 0, 0.3); float:left; background-color:#225193; width:100%; height:40px;color:white; text-align: center;font-size: 140%; border:1px solid lightgray"><b>Hello World</b></div>
				<br/><br/>	<br/>	
<div class="row"> 
    <div class="col-md-6 col-sm-12 col-lg-6 col-md-offset-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Enter Your Details Here
			</div>
			<div class="panel-body">
				<form name="myform" action="JqueryGridTutorial/Register" method="post">
				<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<label for="myName">First Name *</label>
						<input id="myName" name="username" class="form-control" type="text" data-validation="required">
						<span id="error_name" class="text-danger"></span>
					</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<label for="lastname">Last Name *</label>
						<input id="lastname" name="pwd" class="form-control" type="text" data-validation="email">
						<span id="error_lastname" class="text-danger"></span>
					</div>
					</div>
					</div>
					<div class="form-group">
						<label for="age">Age *</label>
						<input id="age" name="id"  class="form-control" type="number" min="1" >
						<span id="error_age" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="dob">Date Of Birth *</label>
						<input type="date" name="dob" id="dob" class="form-control">
						<span id="error_dob" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="gender">Gender</label>
						<select name="gender" id="gender" class="form-control">
							<option selected>Male</option>
							<option>Female</option>
							<option>Other</option>
						</select>
						<span id="error_gender" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="phone">Phone Number *</label>
						<input type="text" id="phone" name="phone" class="form-control" >
						<span id="error_phone" class="text-danger"></span>
					</div>
					<div class="form-group">
						<label for="disc">Discription</label>
						<textarea class="form-control" rows="3"></textarea>
					</div>
					
					
					<div class="row1" id="sub">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<a href="index.html" class="btn btn-info" role="button">Home</a>
					</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<button id="submit" type="submit" value="submit" class="btn btn-primary center" onclick="add()">Submit</button>
					</div>
					</div>
					</div>
					
				
			
				</form>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$flag=1;
	$("#myName").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_name").text("* You have to enter your first name!");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_name").text("");

    	}
   });
    $("#lastname").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_lastname").text("* You have to enter your Last name!");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_lastname").text("");
    	}
   });
    $("#dob").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_dob").text("* You have to enter your Date of Birth!");
    	}
    	else
    	{
    		$(this).css("border-color", "#2eb82e");
    		$('#submit').attr('disabled',false);
    		$("#error_dob").text("");
    	}
   });
    $("#gender").focusout(function(){
    	$(this).css("border-color", "#2eb82e");
   
   });
    $("#age").focusout(function(){
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_age").text("* You have to enter your Age!");
    	}
    	else
    	{
    		$(this).css({"border-color":"#2eb82e"});
    		$('#submit').attr('disabled',false);
    		$("#error_age").text("");

    	}
    	});
    $("#phone").focusout(function(){
        $pho =$("#phone").val();
		if($(this).val()==''){
    		$(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* You have to enter your Phone Number!");
    	}
    	else if ($pho.length!=10)
    	{   
                $(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* Lenght of Phone Number Should Be Ten");
    	}
    	else if(!$.isNumeric($pho))
    	{
    	        $(this).css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			$("#error_phone").text("* Phone Number Should Be Numeric");  
    	}
    	else{
    		$(this).css({"border-color":"#2eb82e"});
    		$('#submit').attr('disabled',false);
    		$("#error_phone").text("");
    	}

	});

		$( "#submit" ).click(function() {
			if($("#myName" ).val()=='')
			{
    		$("#myName").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_name").text("* You have to enter your first name!");
    	}
    	if($("#lastname" ).val()=='')
			{
    		$("#lastname").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_lastname").text("* You have to enter your Last name!");
    	}
			if($("#dob" ).val()=='')
			{
    		$("#dob").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_dob").text("* You have to enter your Date of Birth!");
    	}
			if($("#age" ).val()=='')
			{
    		$("#age").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_age").text("* You have to enter your Age!");
    	}
    	if($("#phone" ).val()=='')
			{
    		$("#phone").css("border-color", "#FF0000");
    			$('#submit').attr('disabled',true);
    			 $("#error_phone").text("* You have to enter your Phone Number!");
    	}
		});


	
});
</script>
<script type="text/javascript"> window.onload = alertName; </script>


<!-- ================================================================================================== -->

<!-- <script src="./js/placeholder.js"></script>
	<script src="js/panelArrow.js"></script>
	<script src="assets/datatablejs&css/jquery.dataTables.min.js"></script>
    <script src="assets/updateJs/jquery-ui.js"></script>
    <script src="assets/updateJs/jquery.dataTables.min.js"></script>	
	<script src="assets/updateJs/dataTables.jqueryui.min.js"></script>
	
	
	
	<script src="assets/datatablejs&css/dataTables.buttons.min.js"></script>	
	<script src="assets/datatablejs&css/buttons.flash.min.js"></script>
	<script src="assets/datatablejs&css/jszip.min.js"></script>	
	<script src="assets/datatablejs&css/pdfmake.min.js"></script>
	<script src="assets/datatablejs&css/vfs_fonts.js"></script>	
	<script src="assets/datatablejs&css/buttons.html5.min.js"></script>
	<script src="assets/datatablejs&css/buttons.print.min.js"></script> -->




<!-- ================================================================================================== -->


<logic:present name="solution" scope="session">
		<script type="text/javascript">
			alert("User Added Successfully");
			$("#alertMessageModal").modal();
			$("#modalSuccessHeader").show();
			$("#modalErrorHeader,#modalWarningHeader,#modalInfoHeader").hide();
			$("#alertSuccessBody").html("User Added Successfully");
		</script>
	</logic:present>


</body>





































<!-- 
<body>
<h1 id="hi">Registration Form</h1>
<TABLE  border="1">
<form action="reg.jsp" method="post">
<TR>
 <TD>
User name :<input type="text" name="username" /></TD>
 <TD>
ID :<input type="text" name="id" /></TD>
 <TD>
Password :<input type="password" name="pwd" /></TD>


<br/><br/>
<TD>
<input type="submit" value="submit" /></TD>

</TR>
</form>
</TABLE><br><br>
<a href="index.html">Login & Register</a>
</body> -->
</html>