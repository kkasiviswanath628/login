<%@ page contentType="text/html"%>

<%@ page import="java.util.*"%>

<%@ page import="org.apache.taglibs.datagrid.DataGridParameters"%> 

<%@ page import="java.sql.*"%>

<%@ page import="com.session.contant.*"%>

<%@ taglib uri="http://jakarta.apache.org/taglibs/datagrid-1.0" prefix="ui" %>

<%-- <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %> --%>



<html>

<head>

<title>jsp paging example in datagrid</title>

<style>

th a:link { text-decoration: none; color: black }

th a:visited { text-decoration: none; color: black }

.rows { background-color: white }

.hiliterows { background-color: pink; color: #000000; font-weight: bold }

.alternaterows { background-color: #efefef }

.header { background-color: cyan; color: #000000;font-weight: bold }



.datagrid { border: 1px solid #C7C5B2; font-family: arial; font-size: 9pt;

font-weight: normal }

</style>

</head>

<body>

<br><br>



<span align="center" style="padding-left:250px;font-size:20px;">Employee Records</span>

<br>

<% ArrayList empList = new ArrayList ();

Employee empObj;

int fromIndex, toIndex;

int tcount =0;

int perpage=4;

int tpage=0;

try {

String connectionURL = "jdbc:mysql://localhost:3306/countrydata";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "root", "root");

statement = connection.createStatement();

String QueryString = "SELECT * from register";

rs = statement.executeQuery(QueryString);

while (rs.next()) { 

tcount++;

empObj = new Employee ();

empObj.setFirstName(rs.getString("firstname"));

empObj.setLastName(rs.getString("lastname"));

empObj.setUsername(rs.getString("username"));

empObj.setEmail(rs.getString("email"));

empObj.setCountry(rs.getString("country"));

empList.add(empObj);

}



rs.close();

statement.close();

connection.close();

} 

catch (Exception ex) {

System.out.println("Unable to connect to batabase."+ex);

}

fromIndex = (int) DataGridParameters.getDataGridPageIndex (request, "datagrid1");

if ((toIndex = fromIndex+4) >= empList.size ())

toIndex = empList.size();

request.setAttribute ("empList", empList.subList(fromIndex, toIndex));





pageContext.setAttribute("tCount", tcount);

%>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">



<ui:dataGrid items="${empList}" var="employee" name="datagrid1" cellPadding="0" 

cellSpacing="0" styleClass="datagrid" >

<columns>



<column width="50">

<header value="" hAlign="left" styleClass="header"/>



</column>



<column width="200">

<header value="Name" hAlign="left" styleClass="header"/>

<item value="${employee.firstName} ${employee.lastName}" hAlign="left" 

styleClass="item"/>





</column>

<column width="200">

<header value="Username" hAlign="left" styleClass="header"/>

<item value="${employee.username}" hAlign="left" styleClass="item"/>





</column>

<column width="200">

<header value="Email" hAlign="left" styleClass="header"/>

<item value="${employee.email}" hAlign="left" styleClass="item"/>



</column>



<column width="100">

<header value="Country" hAlign="left" styleClass="header"/>

<item value="${employee.country}" hAlign="left" styleClass="item"/>



</column>



</columns>

<rows styleClass="rows" hiliteStyleClass="hiliterows"/>

<alternateRows styleClass="alternaterows"/>



<paging size="4" count="${tCount}" custom="true" nextUrlVar="next" 

previousUrlVar="previous" pagesVar="pages"/>

<order imgAsc="up.gif" imgDesc="down.gif"/>

</ui:dataGrid>

<table width="750" style="font-family: arial; font-size: 10pt" border=0>



<tr>

<td align="left" width="33%">

<c:if test="${previous != null}">

<a href="<c:out value="${previous}"/>">Previous</a>

</c:if>&nbsp;

</td>

<td align="center" width="33%">

<c:forEach items="${pages}" var="page">

<c:choose>

<c:when test="${page.current}">

<b><a href="<c:out value="${page.url}"/>"><c:out value="${page.index}"/></a></b>

</c:when>

<c:otherwise>

<a href="<c:out value="${page.url}"/>"><c:out value="${page.index}"/></a>

</c:otherwise>

</c:choose>

</c:forEach>

</td>

<td align="right" width="33%">&nbsp;

<c:if test="${next != null}">

<a href="<c:out value="${next}"/>">Next</a>

</c:if>

</td>

</tr>

</table>

</body>

</html>