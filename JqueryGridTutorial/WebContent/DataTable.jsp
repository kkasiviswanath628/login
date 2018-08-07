<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

    <!-- import="jquery.datatables.model.*"%> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Applying jQuery DataTables plugin in the Java Server application</title>
        <link href="media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />
        <link href="media/dataTables/demo_table.css" rel="stylesheet" type="text/css" />
        <link href="media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" />
        <link href="media/themes/base/jquery-ui.css" rel="stylesheet" 

           type="text/css" media="all" />
        <link href="media/themes/smoothness/jquery-ui-1.7.2.custom.css" 

           rel="stylesheet" type="text/css" media="all" />
        <script src="scripts/jquery-1.4.4.min.js"

           type="text/javascript"></script>
        <script src="scripts/jquery.dataTables.min.js" 

           type="text/javascript"></script>
        <script type="text/javascript">
        $(document).ready(function () {
            $("#companies").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>
    </head>
    <body id="dt_example">
        <div id="container">
            <div id="demo_jui">
                <table id="companies" class="display">
                    <thead>
                        <tr>
                            <th>Company name</th>
                            <th>Address</th>
                            <th>Town</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%--   <% for(Company c: DataRepository.GetCompanies()){ %>
                    <tr>
                             <td><%=c.getName()%></td>
                         <td><%=c.getAddress()%></td>
                         <td><%=c.getTown()%></td>
                    </tr>
                <% } %> --%>
                    </tbody>
                </table>
         </div>
        </div> 
    </body>
</html>
