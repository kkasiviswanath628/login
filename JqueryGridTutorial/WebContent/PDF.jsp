<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,java.sql.* ,com.session.contant.*,javax.servlet.http.*,javax.servlet.*,java.text.SimpleDateFormat,java.text.DateFormat,com.itextpdf.text.*,com.itextpdf.text.pdf.*,java.io.*,java.util.*" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <title>files.jsp</title>
<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
     
    </head>
    <body style="background-color:#FFFFCC;">
   
<%
 String d=(String)application.getAttribute("div"); 
String y= (String)application.getAttribute("year");
String m =(String) application.getAttribute("month1"); 
%>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers","root","root"); 

try
{
response.setContentType("application/pdf");   
response.setHeader("content-disposition","attachment; filename="+"monthwise.pdf");   
String m1=null;
ResultSet rs=null;
Statement st=null;
st=con.createStatement();
rs=st.executeQuery("select * from ams_month where month_no="+m+";");
while(rs.next())
{
m1=rs.getString(3);
}
 %>
<center>
  <b></b><font size="4" face="Georgia, Arial" color="maroon">O&M Activity Monitoring system
   <br/>Status Report on Details of Live Files for the Division - <%=d %>   <br/>
  NIC- Ministry of Petroleum & Natural Gas<br/>  
 Files opened in<%=m1 %><%=y %> </font>  <br/><br/>  <br/><br/>
  </center>
 
   <%
  ResultSet rs1=null;
  Statement st1=null;
  st1=con.createStatement(); 
  ResultSet rs2=null;
  Statement st2=null;
  st2=con.createStatement();   
   %> 
   <center>
  <table border="1" bordercolor="black" cellpadding="3" cellspacing="5">
  <tr>
  <th><font size="3" color="blue">In Section</font></th>
  <th><font size="3" color="blue"> File No.(Computer File No.)</font></th>
   <th><font size="3" color="blue"> Subject</font></th>
  <th><font size="3" color="blue"> Opened Date</font></th>
  </tr>
  <%
 //response.setContentType("application/pdf");
 String FILE = "c:/temp/FirstPdf.pdf";
 Document document = new Document();
 PdfWriter.getInstance(document, new FileOutputStream(FILE));
  document.open();
  String name=null;
int yr =Integer.parseInt(y);  
  rs1=st1.executeQuery("select sec_name from divsec where div_code=(select divcode from ams_division where divname=\'"+d.trim()+"\');");
while(rs1.next())
{
name=rs1.getString("sec_name");
  rs=st.executeQuery("select * from file_reg where ((sec_code= (select sec_code from sec_code where sec_name=\'"+name.trim()+"\')) and (ep_flg='P')AND ((EXTRACT(month FROM open_dt))="+m+")AND ((EXTRACT(year FROM open_dt))="+yr+"))order by sec_code asc;");
  StringBuilder sb=new StringBuilder();
  while(rs.next())
  {
  DateFormat dtFormat = new SimpleDateFormat("dd/MM/yyyy");   
String formattedDate=dtFormat.format(rs.getDate("open_dt"));  
 %>
  <tr>
  <td><%=name %></td>
  <td><%=rs.getString(1) %>(<%=rs.getInt(10) %>)</td>
  <td><%=rs.getString(2) %></td>
  <td><%=formattedDate %></td>
  </tr>
   
  <%}}
  document.close();
  response.setContentType("application/pdf");
    response.setHeader("content-disposition","attachment;filename="+"FirstPdf.pdf");
    byte[] buf = new byte[8192]; 
    FileInputStream in = new FileInputStream(FILE);
    OutputStream out1 = response.getOutputStream();
     int c;  
     while ((c = in.read(buf, 0, buf.length)) > 0) {  
       out1.write(buf, 0, c);  
     }  
     out1.flush();  
   out1.close();
  }
  catch(Exception e)
  {
    }
  finally {
              // Always close the database connection.
              try {
                    if (con != null) 
                        con.close();
              }
              catch (SQLException ignored){
                
                  System.out.println(ignored);
              }
            }
   %>
 
  </table>
   
  <br/><br/>
  <input class=button type="button" value="Print" name="pr" title="Print" onClick="window.print();">
  </center>
 
   
  </body>
  </html>  