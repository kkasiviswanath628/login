<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	 <%@ page import="org.json.JSONObject,org.json.JSONException,org.json.*,java.util.*"%>
<%@page import="java.io.*,java.sql.* ,com.session.contant.*,javax.servlet.http.*,javax.servlet.*,java.text.SimpleDateFormat,java.text.DateFormat,com.itextpdf.text.*,com.itextpdf.text.pdf.*,java.io.*,java.util.*" %>
 
<html>
<head>
<title>jqGird in Servlet</title>




<body>
		
	
		
	<%
try{
	
	response.setContentType("application/pdf");
	
   /*  response.setContentType("application/pdf");
      response.setHeader("content-disposition","attachment;filename="+"FirstPdf.pdf"); */
      
      /* Step-2: Initialize PDF documents - logical objects */  
      Class.forName ("com.mysql.jdbc.Driver"); 
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root");
    	 Statement stmt = conn.createStatement(); 
            
        /* Define the SQL query */  
    	 ResultSet query = stmt.executeQuery("SELECT * FROM registerdata");  
        /* Step-2: Initialize PDF documents - logical objects */  
        
        Document PDFLogReport =null;
         PDFLogReport = new Document(); 
         
        /*  PdfPTable table = new PdfPTable(new float[] { 2, 1, 2 });
		  table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		  table.addCell("UserName");
	          table.addCell("Id");
	          table.addCell("Location");
	          table.setHeaderRows(1);
	          PdfPCell[] cells = table.getRow(0).getCells(); 
	    	  for (int j=0;j<cells.length;j++){
	    	     cells[j].setBackgroundColor(BaseColor.GRAY);
	    	  }
	            
	        	     table.addCell("kasi");
	                 table.addCell("26");
	                 table.addCell("kurnool"); */


        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(PDFLogReport, buffer);  
        PDFLogReport.open(); 
        Paragraph p = new Paragraph();
        
        
        p.setSpacingAfter(25);
        p.setSpacingBefore(25);
        p.setAlignment(Element.ALIGN_CENTER);
        p.setIndentationLeft(50);
        p.setIndentationRight(50);
    
       
            Chunk chunk = new Chunk("Registration");
            p.add(chunk);
            
        
        
        
        
  /*   for(int i=0; i<10; i++){
        Chunk chunk = new Chunk(
            "This is a sentence which is long " + i + ". ");
        p.add(chunk);
        
    } */
        
        
  	/* p.add("Example Pdf Jsp Application"); */
        //we have two columns in our table  
        PdfPTable LogTable = new PdfPTable(new float[] { 2, 1, 2 });  
        LogTable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        LogTable.addCell("UserName");
        LogTable.addCell("Id");
        LogTable.addCell("Password");
        LogTable.setHeaderRows(1);
        //create a cell object  
        PdfPCell[] table_cell = LogTable.getRow(0).getCells(); 
  	  for (int j=0;j<table_cell.length;j++){
  		table_cell[j].setBackgroundColor(BaseColor.GRAY);
  	  }
        
        while (query.next()) {   
        	String Username = query.getString("username");
        	LogTable.addCell(Username);
        	String id=query.getString("id");
        	LogTable.addCell(id);
        	 String password=query.getString("password"); 
        	LogTable.addCell(password);
        	
               /*  String Username = query.getString("username");  
                table_cell=new PdfPCell(new Phrase(Username));  
                LogTable.addCell(table_cell);  
                
                
                String id=query.getString("id");  
                table_cell=new PdfPCell(new Phrase(id));  
                LogTable.addCell(table_cell);  
                
                String password=query.getString("password");  
                table_cell=new PdfPCell(new Phrase(password));  
                LogTable.addCell(table_cell); */
                
                }  
        //Attach pParagraph to pdf Document
        PDFLogReport.add(p); %> <br>
        <%
        /* Attach report table to PDF */  
        PDFLogReport.add(LogTable); 
  
        
        PDFLogReport.close();  
        /* Close all DB related objects */  
        query.close();  
        stmt.close();   
        conn.close();   
 
        
        
        DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
        byte[] bytes = buffer.toByteArray();
        response.setContentLength(bytes.length);
        for(int i = 0; i < bytes.length; i++)
            dataOutput.writeByte(bytes[i]);

        dataOutput.flush();
        dataOutput.close();
        return;
        }
	catch(DocumentException e)
	{
	    e.printStackTrace();
	}

 %>


    
</body>
</html>

























































































<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	 <%@ page import="org.json.JSONObject,org.json.JSONException,org.json.*,java.util.*"%>
<%@page import="java.io.*,java.sql.* ,com.session.contant.*,javax.servlet.http.*,javax.servlet.*,java.text.SimpleDateFormat,java.text.DateFormat,com.itextpdf.text.*,com.itextpdf.text.pdf.*,java.io.*,java.util.*" %>
 
<html>
<head>
<title>jqGird in Servlet</title>




<body>
		
	 <TABLE cellpadding="15" border="1" style="background-color: #ffffcc;" align="center" id="example">
<tr><th>UserID</th><th>Password</th><th>FName</th><th>LName</th><th>Email</th></tr>
		
	<%

	
   /*  response.setContentType("application/pdf");
      response.setHeader("content-disposition","attachment;filename="+"FirstPdf.pdf"); */
      
      /* Step-2: Initialize PDF documents - logical objects */  
      Class.forName ("com.mysql.jdbc.Driver"); 
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root");
    	 Statement stmt = conn.createStatement(); 
            
        /* Define the SQL query */  
    	 ResultSet query = stmt.executeQuery("SELECT * FROM user");  
        /* Step-2: Initialize PDF documents - logical objects */  
        Document PDFLogReport = new Document();  
        PdfWriter.getInstance(PDFLogReport, new FileOutputStream("d:\\LogReport.pdf"));  
        PDFLogReport.open();        
        //we have two columns in our table  
        PdfPTable LogTable = new PdfPTable(3);  
        //create a cell object  
        PdfPCell table_cell;  
        while (query.next()) {          
                String Username = query.getString(1);  
                table_cell=new PdfPCell(new Phrase(Username));  
                LogTable.addCell(table_cell);  
                
                
                String id=query.getString(2);  
                table_cell=new PdfPCell(new Phrase(id));  
                LogTable.addCell(table_cell);  
                
                String password=query.getString(3);  
                table_cell=new PdfPCell(new Phrase(password));  
                LogTable.addCell(table_cell);
                
                }  
        
        ServletOutputStream out1 = response.getOutputStream();
        response.setContentType("application/pdf");
        response.setHeader("content-disposition","attachment;filename="+"FirstPdf.pdf");
        /* Attach report table to PDF */  
        PDFLogReport.add(LogTable); 
  
        
        PDFLogReport.close();  
        /* Close all DB related objects */  
        query.close();  
        stmt.close();   
        conn.close();   
 
  

 %>


    
</body>
</html>



























 --%>