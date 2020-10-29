<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%

	if(request.getParameter("submit")!=null)
	{
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		int fee = Integer.parseInt(request.getParameter("fee"));
		String email = request.getParameter("email");
		String contact_no = request.getParameter("contact_no");
		
		Connection con;
		PreparedStatement pst;
		
		
		String url="jdbc:mysql://localhost:3306/studentmng";
		String user="root";
		String psw ="1234";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,psw);
			pst= con.prepareStatement("update student set name = ?,course = ?,fee = ?,email = ?,contact_no = ? where id = ?");
			pst.setString(1, name);
			pst.setString(2, course);
			pst.setInt(3, fee);
			pst.setString(4, email);
			pst.setString(5, contact_no);
			pst.setInt(6, id);
			pst.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}	
		
	%>
	<script>

		alert("Update Successfully.");
	</script>
	
	<% 		
	}
	%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<title>Update Student Registration</title>
</head>
<body>
	<h2>Update Student Details</h2>
	<div class="row">
		<div class="col-sm-4">
			<form action="#" method="POST" >
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
						pst= con.prepareStatement("select * from student where id = ?");
						pst.setInt(1, id);
						rs = pst.executeQuery();
						while(rs.next())
						{
							
					
				%>
				<div alight="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Studen Name" value="<%= rs.getString("name") %>" name="name" id="name" required>
				</div>
				<div alight="left">
					<label class="form-label">Course</label>
					<input type="text" class="form-control" placeholder="Course" value="<%= rs.getString("course") %>" name="course" id="course" required>
				</div>
				<div alight="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="fee" value="<%= rs.getInt("fee") %>" name="fee" id="fee" required>
				</div>
				<div alight="left">
					<label class="form-label">Email-ID</label>
					<input type="text" class="form-control" placeholder="email-id" value="<%= rs.getString("email") %>" name="email" id="email" required>
				</div>
				<div alight="left">
					<label class="form-label">Phone-No</label>
					<input type="text" class="form-control" placeholder="Contact-no" value="<%= rs.getString("contact_no") %>" name="contact_no" id="contact_no" required>
				</div>
				<%
						}
			    } catch (Exception e) {
				
				    e.printStackTrace();
			    }	
			
				%>
				
				<br>
				<div alight="right">
					<input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
				</div>
				<div align="right">
					<p><a href="index.jsp">Click Back</a></p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>