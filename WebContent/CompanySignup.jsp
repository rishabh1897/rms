<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%
String name = request.getParameter("Name");
String address = request.getParameter("Address");
String phone = request.getParameter("Number");
String mail = request.getParameter("mail");
String pass=request.getParameter("Password");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
Statement st= con.createStatement();
int rs = st.executeUpdate("insert into company(cname,address,phone,mail,password) values('"+name+"','"+address+"','"+phone+"','"+mail+"','"+pass+"')");
if(rs == 1)
{response.sendRedirect("login.html");}
else
{out.println("error");}
}

catch(Exception e)
{System.out.println(e);}


%>



</body>
</html>