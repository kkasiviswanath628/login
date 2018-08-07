<%@page import="java.io.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>

<%
       String name[]=request.getParameterValues("name");
       String address[]=request.getParameterValues("address");
       try{
       Document document=new Document();
       PdfWriter.getInstance(document,new FileOutputStream("d:/data.pdf"));
       document.open();
       PdfPTable table=new PdfPTable(2);
       table.addCell("Name");
       table.addCell("Address");
       for(int i=0;i<name.length;i++){
       table.addCell(name[i]);
       table.addCell(address[i]);
       }
       document.add(table);
       document.close();
       }
       catch(Exception e){}
  %>