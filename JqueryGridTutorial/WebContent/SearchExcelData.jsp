<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>

<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>

<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>

<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>

<%@ page import="java.io.*" %>

<%@ page import="java.util.*" %>

<%@ page import="java.sql.*" %>



<%!

Connection conn = null;

    String url = "jdbc:mysql://localhost:3306/";

    String dbName = "countrydata";

    String driver = "com.mysql.jdbc.Driver";

    String username = "root";

    String userPassword = "root";



%>

<br><br>

<%

   int index=3;

  int sno=0;
/*
  String name="";

java.util.Date date = new java.util.Date();

String filename = "d:\\f"+date.getTime()+".xls" ;

String  searchText="";


if(request.getParameter("searchtxt")!=null)

 {

              searchText= request.getParameter("searchtxt").toString();

System.out.println(""+searchText);

}
 */


try{

   HSSFWorkbook hwb = new HSSFWorkbook();

   HSSFSheet sheet = hwb.createSheet("new sheet");

   HSSFRow rowhead = sheet.createRow((short)2);

   rowhead.createCell((short) 0).setCellValue("SNO");

   rowhead.createCell((short) 1).setCellValue("USERNAME");

   rowhead.createCell((short) 2).setCellValue("ID");

   rowhead.createCell((short) 3).setCellValue("PASSWORD");

   
   String name = (String)request.getParameter("user");

  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/countrydata","root","root");  
  Statement stmt = conn.createStatement();
  String strQuery = "select * from registerdata where username = '" + name + "'";
 
  ResultSet rs = stmt.executeQuery(strQuery);

  while(rs.next()) 
 {
	  sno++;
                                   

   HSSFRow row = sheet.createRow((short)index);

   row.createCell((short) 0).setCellValue(sno);

   row.createCell((short) 1).setCellValue(rs.getString(2));

   row.createCell((short) 2).setCellValue(rs.getString(1));

   row.createCell((short) 3).setCellValue(rs.getString(3));


   index++;

            }
  
  ServletOutputStream out1 = response.getOutputStream();

  response.setContentType("application/xls");
  response.setHeader("Content-Disposition", "attachment;filename=Registration.xls");

  out.println("<b>Your excel file has been generated</b>");
   hwb.write(out1);

   out1.close();

  
        } catch ( Exception ex ) {

       

        }

%>


<!-- String strQuery = "select * from  user"; -->