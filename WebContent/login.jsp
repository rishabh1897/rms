<%@page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
try{
String userid=request.getParameter("email");
session.setAttribute("userid",userid);
//String sl=request.getParameter("sl");
//session.setAttribute("sl",sl);

String pwd=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
Statement st= con.createStatement();
ResultSet rs1=st.executeQuery("select * from company where mail='"+userid+"'");
int r1=0;
int r2=0;
if(rs1.next())
{ 
if(rs1.getString(6).equals(pwd) && rs1.getString(5).equals(userid))
{ r1=1;
response.sendRedirect("companyJobListPage.jsp");
out.println("welcome"+userid);

}
else
{ response.sendRedirect("login.html");
System.out.println("Invalid password try again");
}
}
ResultSet rs2=st.executeQuery("select * from candidate where mail='"+userid+"'");
if(rs2.next())
{ 
  if(rs2.getString(8).equals(pwd) && rs2.getString(5).equals(userid))
  {   
	r2=1;
	 response.sendRedirect("candidateJobListPage.jsp");
    out.println("welcome"+userid);

  }
  else
  { 
	response.sendRedirect("login.html");
    System.out.println("Invalid password try again");
  }
}
if(r1==0 && r2==0)
{response.sendRedirect("login.html");}
}
catch(Exception e)
{System.out.println(e);}
%>