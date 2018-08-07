<%
 /* session.setAttribute("srcfilename", request.getParameter("AQC2_SOURCE_FILENAME"));  */
		/* String str=(String)session.getAttribute("srcfilename"); */
%>

<form name-"abc" action ="abc.jsp">
<input type= "textbox" name="AQC2_SOURCE_FILENAME" size="20" value="">
<input type= "textbox" name="new textbox" size="20" value="<%=session.getAttribute("srcfilename")%>"/>

<br><br>

<% session.setAttribute("abc", request.getParameter("tgt1")); %>

<input type= "textbox" name="tgt1" size="20" value="">
<input type="text" name="Comp_Text" id="Comp_Text" value="<%=session.getAttribute("abc")%>"/>




<input type= "submit" name="Submit" size="20">
<form>