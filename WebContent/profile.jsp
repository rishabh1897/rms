<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ page contentType="application/pdf" %>
<%@ page pageEncoding="iso-8859-1" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.io.*" %>
<%!  
     // connection method for jdbc.
     Connection getConnection() throws Exception {
          String driver = "com.mysql.cj.jdbc.Driver";
          String url = "jdbc:mysql://localhost:3306/mywork"; //  dbname with  name
          String username = "root";
          String password = "annarish";
          Class.forName(driver);
          Connection conn = DriverManager.getConnection(url, username, password);
          return conn;
     }
  
     byte[] getBLOB(String cl) throws Exception {
          Connection conn = null;
          ResultSet rs = null;
          PreparedStatement pstmt = null;
          String query = "SELECT resume FROM [candidate] b where cl = ?";
          Blob blob = null;

          try {
               conn = getConnection();
               pstmt = conn.prepareStatement(query);
               pstmt.setString(1, cl); // assign the user requeested cand id to the above prepared statement.
               rs = pstmt.executeQuery();
               rs.next();
               blob = rs.getBlob("resume"); // retrieve the blob stored as column PDF.
          } catch (Exception e) {
          } finally {
               rs.close();
               pstmt.close();
               conn.close();
          }
          if (blob != null) 
               return blob.getBytes((long)1, (int)blob.length());
          else
               return null;
     }
%>
<% 
     // scriptlet part.
     ServletOutputStream os = response.getOutputStream();
     byte[] b = getBLOB(request.getParameter("cl"));  // this line gets the report uid from the jsp call url.
     os.write(b);
     os.close();
     out.clear();
     out = pageContext.pushBody();
%>  


  

</body>
</html>