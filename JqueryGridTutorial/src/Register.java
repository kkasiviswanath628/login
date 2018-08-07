
import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class Register extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String user=request.getParameter("username"); 
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");  
          
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/countrydata","root","root");  
  
PreparedStatement ps=con.prepareStatement(  
"insert into registerdata values(?,?,?)");  
  
ps.setString(1,id);  
ps.setString(2,user);  
ps.setString(3,pwd);  

          
int i=ps.executeUpdate();  
if(i>0)  
out.print("You are successfully registered..."); 
HttpSession session = request.getSession();

session.setAttribute("solution", "solution");
response.sendRedirect("/JqueryGridTutorial/Reg.jsp");  
      
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}  