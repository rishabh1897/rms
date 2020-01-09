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
 String userid= session.getAttribute("userid").toString();
 %>
 
 <%
 	int job_id=Integer.parseInt(request.getParameter("job_id"));
 
 try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywork","root","annarish");
        Statement st= con.createStatement();
        System.out.println(userid);
        ResultSet rs = st.executeQuery("select * from jobs where job_id= '"+job_id+"' ");
       
        if(rs.next()) {  
        	String cname = rs.getString(2);
         String skill= rs.getString(3);
        String type= rs.getString(4);
        String date= rs.getString(5);
        String sl= rs.getString(7);
        System.out.println(date);
       // int i = st.executeUpdate("insert into appliedjob(job_id,skill,type,date,cname) values('"+job_id+"','"+skill+"','"+type+"','"+date+"','"+cname+"')");
        
        
  
         ResultSet rs2 = st.executeQuery("select * from candidate where mail= '"+userid+"' ");
          if(rs2.next()) {  
        String fname= rs2.getString(2);
        String lname= rs2.getString(3);
        String phone= rs2.getString(4);
        String mail= rs2.getString(5);

        
        System.out.println(mail);
        int i = st.executeUpdate("insert into appliedjob(job_id,fname,lname,phone,mail,skill,type,date,cname,sl) values('"+job_id+"','"+fname+"','"+lname+"','"+phone+"','"+mail+"','"+skill+"','"+type+"','"+date+"','"+cname+"','"+sl+"')");
        response.sendRedirect("candidateAppliedJobListPage.jsp");
        }
      }
      }  
      catch(Exception e)
      {
      System.out.println(e);
      }
 %>
</body>
</html>