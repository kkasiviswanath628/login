<%@ page import="java.util.*,com.javatpoint.dao.*,com.javatpoint.beans.*" %>  
<%  
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=10;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  
List<Emp> list=EmpDao.getRecords(pageid,total);  
  
  
out.print("<table border='1' cellpadding='4' width='60%'>");  
out.print("<tr><th>UserName</th><th>ID</th><th>Password</th>");  
for(Emp e:list){  
    out.print("<tr><td>"+e.getUsername()+"</td><td>"+e.getId()+"</td> <td>"+e.getPassword()+"</td></tr>");  
}  
out.print("</table>");  
%>  
<a href="view.jsp?page=1">1</a>  
<a href="view.jsp?page=2">2</a>  
<a href="view.jsp?page=3">3</a> 

