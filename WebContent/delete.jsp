
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		String url="jdbc:mysql://localhost:3306/studentmng";
		String user="root";
		String psw ="1234";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,psw);
			pst= con.prepareStatement("delete from student  where id = ?");
			pst.setInt(1, id);
			pst.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}	
		
	%>
	<script>

		alert("Delete Successfully.");
	</script>
	
	