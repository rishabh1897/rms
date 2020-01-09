<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ page import = "java.sql.*" %>
 <%@ page import = "javax.sql.*" %>
 <%
   try{
	   
		request.getSession();
		int status=0;
		System.out.println("\n in delete");
		int job_id=Integer.parseInt(request.getParameter("job_id"));
		 Class.forName("com.mysql.cj.jdbc.Driver");
	        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
	        Statement st= con.createStatement();
	        ResultSet rs;
	        System.out.println(job_id);
	     status = st.executeUpdate("delete from jobs where job_id = "+job_id+" ");
	     
	     if(status>0)
	     {
	    	 session.setAttribute("deleted","");
	    	 response.sendRedirect("companyJobListPage.jsp");
	     }
	     else
	     {
	    	 out.println("something went wrong");
	     }
   }
  catch(Exception e)
   {
	  System.out.println(e);
   }
 %>

</body>
</html>