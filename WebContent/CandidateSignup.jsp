<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String phone=request.getParameter("phone");
String mail=request.getParameter("mail");



String address=request.getParameter("address");
String dob=request.getParameter("dob");
String password=request.getParameter("password");


try{
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
Statement stmt= con.createStatement();

 
ResultSet rs;

int i=stmt.executeUpdate("insert into candidate(fname,lname,phone,mail,address,dob,password) values('"+fname+"','"+lname+"','"+phone+"','"+mail+"','"+address+"','"+dob+"','"+password+"')");
if(i==1)
{
	response.sendRedirect("login.html");
}
else{
	out.println("error");
}
}
catch(Exception e){
	System.out.println(e);
}
%>

</body>
</html>