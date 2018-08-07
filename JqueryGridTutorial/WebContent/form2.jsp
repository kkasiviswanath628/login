<%
String name = request.getParameter("name");
session.setAttribute("theName", name);
      String email = request.getParameter("mail");
session.setAttribute("theemail", email);
%>
      <html>
  <body bgcolor="#FFEAF4">
    <center>
      <form action="description.jsp" method="post">
    <table border="1" cellpadding="0" cellspacing="0" 
               decolor=""#E2FEFD height="30%" width="50%">
	<tr bgcolor="#FBFBFB">
	<td>
        <B>Address1:</B>
        <input type="text" name="Address1" value="" size="30" />
        </td>
	</tr>

	<tr bgcolor="#FBFBFB">
	<td><B>Address2:</B><input type="text" 
        name="Address2" value="" size="30" /></td>
	</tr>

	<tr bgcolor="#FBFBFB">
	<td><B>Address3:</B><input type="tex
t" name="Address3" value="" size="30" /></td>
	</tr>

	<tr bgcolor="#FBFBFB">
	<td><input type="submit" value="NEXT" /></td>
	</tr>
	
    </table>
     </form>
   </center>
  </body>
</html>