<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>companyPostJobPage</title>
</head>

<body>

<%@page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%
String cname = request.getParameter("cname");
String sl = request.getParameter("sl");
String skill = request.getParameter("skill");
String type = request.getParameter("type");
String date = request.getParameter("date");
String loc = request.getParameter("location");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
Statement st= con.createStatement();
int rs = st.executeUpdate("insert into jobs(Cname,Skill,Type,Date,Location,sl) values('"+cname+"','"+skill+"','"+type+"','"+date+"','"+loc+"','"+sl+"')");
if(rs == 1)
{response.sendRedirect("companyJobListPage.jsp");}
else
{out.println("error");}
}

catch(Exception e)
{System.out.println(e);}


%>



</body>
</html>