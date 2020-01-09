<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>companyappliedjoblistpage</title>
 <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/candidate.css" title="style" />
 <style>
 table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable tbody td {
  font-size: 13px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
}
table.blueTable tfoot td {
  font-size: 14px;
}
table.blueTable tfoot .links {
  text-align: right;
}
table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}
 </style>
 <script type="text/javascript">
  	function validation()
  	{
  		swal("Record Deleted successfully")
  	}
  </script>
</head>
<body>
<%@ page import = "java.sql.*" %>
 <%@ page import = "javax.sql.*" %>
  <%
 String userid= session.getAttribute("userid").toString();
 %>
<div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">Company's<span class="logo_colour"> Page</span></a></h1>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li><a href="companyJobListPage.jsp">Job List</a></li>
          <li class="selected"><a href="companyAppliedJobListPage.jsp">Applied Candidate</a></li>
          <li><a href="companyPostJobPage.html">Add job</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
        <table class="blueTable">
<thead>
<tr>

<th>Fname</th>
<th>Lname</th>
<th>Contact</th>
<th>Mail</th>
<th>Job_id</th>
<th>Date</th>
<!--  <th>profile</th>-->
</tr>
</thead>
<tfoot>
<tr>
<td colspan="5">
<div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
</td>
</tr>
</tfoot>
<tbody>
 <%
   try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
        Statement st= con.createStatement();
        ResultSet rs = st.executeQuery("select A.fname,A.lname,A.phone,A.mail,A.job_id,A.date from appliedjob A,company C where C.mail='"+userid+"' and C.sl=A.sl;");
        while(rs.next()) {  
 %>
  <tr>
  
  <td><%=rs.getString(1) %></td>
  <td><%=rs.getString(2) %></td>
  <td><%=rs.getString(3) %></td>
  <td><%=rs.getString(4) %></td>
  <td><%=rs.getString(5) %></td>
  <td><%=rs.getString(6) %></td> 
 
  </tr>
<%
     }
    } catch(Exception e){
     out.println(e);
     }
 %>     
</tbody>
</table>

    </div>
  </div>
</body>
</html>