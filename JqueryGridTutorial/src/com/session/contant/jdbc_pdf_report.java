package com.session.contant;

import java.io.FileOutputStream;  
import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.ResultSet;  
import java.sql.Statement;  



import com.itextpdf.text.Document;  
import com.itextpdf.text.Phrase;  
import com.itextpdf.text.pdf.PdfPCell;  
import com.itextpdf.text.pdf.PdfPTable;  
import com.itextpdf.text.pdf.PdfWriter;  
public class jdbc_pdf_report {   
    public static void main(String[] args) throws Exception{  
        /* Create Connection objects */  
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
        /* Attach report table to PDF */  
        PDFLogReport.add(LogTable);              
        PDFLogReport.close();  
        /* Close all DB related objects */  
        query.close();  
        stmt.close();   
        conn.close();          
    }  
}  


