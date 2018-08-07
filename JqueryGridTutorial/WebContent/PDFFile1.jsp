<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.Anchor"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.PageSize" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.ServletOutputStream" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="javax.sql.DataSource" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>

<% 
    Document doc = new Document();
OutputStream os = response.getOutputStream();
PdfWriter.getInstance(doc,new FileOutputStream(new File("D:/HelloWorld.pdf")));
doc.open();
String branch1 =request.getParameter("username");
String sem1 =request.getParameter("id");
String sub =request.getParameter("password");

  Font bfBold18 = new Font(FontFamily.TIMES_ROMAN, 18, Font.BOLD, new BaseColor(0, 0, 0)); 
  Font bfBold12 = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLDITALIC, new BaseColor(0, 0, 0)); 
  Font bf12 = new Font(FontFamily.TIMES_ROMAN, 12);   
  try
{
    String t=null;
   PdfWriter.getInstance(doc, os); 
   doc.open();
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root");
   Statement st=con.createStatement();
   ResultSet rs= st.executeQuery("select username,id from user where username='"+branch1+"' and id='"+sem1+"' and password='"+sub+"'");
    while(rs.next())
    { 
        t=rs.getString(2);
        Paragraph paragraph = new Paragraph(t, bfBold18);
        paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
        paragraph.setFont(new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL));
       doc.add(paragraph);
        doc.add( Chunk.NEWLINE );
    }      
       rs.first();  
       doc.close();
       con.close();
       os.flush();
       os.close();      
}
catch(Exception e)
{
    
}

%>
    </body>
</html>