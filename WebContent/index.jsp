<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 

<%

	if(request.getParameter("submit")!=null)
	{
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
			pst= con.prepareStatement("insert into student (name,course,fee,email,contact_no) values (?,?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, course);
			pst.setInt(3, fee);
			pst.setString(4, email);
			pst.setString(5, contact_no);
			pst.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}	
		
	%>
	<script>

		alert("Record Added.");
	</script>
	
	<% 		
	}
	%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration System</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h1>Student Registration</h1>
	<br>
	<div class="row">
		<div class="col-sm-4">
			<form action="#" method="POST" >
				<div alight="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Studen Name" name="name" id="name" required>
				</div>
				<div alight="left">
					<label class="form-label">Course</label>
					<input type="text" class="form-control" placeholder="Course" name="course" id="course" required>
				</div>
				<div alight="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="fee" name="fee" id="fee" required>
				</div>
				<div alight="left">
					<label class="form-label">Email-ID</label>
					<input type="text" class="form-control" placeholder="email-id" name="email" id="email" required>
				</div>
				<div alight="left">
					<label class="form-label">Phone-No</label>
					<input type="text" class="form-control" placeholder="Contact-no" name="contact_no" id="contact_no" required>
				</div>
				<br>
				<div alight="right">
					<input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
				</div>
			</form>
		</div>
		<div class="col-sm-8"> 
			<div class="panel-body">
				<table id="tb1-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Student Name</th>
							<th>Course</th>
							<th>Fee</th>
							<th>email</th>
							<th>contact_no</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						<%
						Connection con;
						ResultSet rs;
						
						String url="jdbc:mysql://localhost:3306/studentmng";
						String user="root";
						String psw ="1234";
						String sql = "select * from student";
						
						try {
							
							Class.forName("com.mysql.cj.jdbc.Driver");
							con = DriverManager.getConnection(url,user,psw);
							Statement st = con.createStatement();
							rs = st.executeQuery(sql);
							while(rs.next())
							{
								int id = rs.getInt("id");
						%>
						<tr>
							<td><%= rs.getString("name") %></td>
							<td><%= rs.getString("course") %></td>
							<td><%= rs.getString("fee") %></td>
							<td><%= rs.getString("email") %></td>
							<td><%= rs.getString("contact_no") %></td>
							<td><a href="update.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
						</tr>
						<% 
						
						    } 
					      }catch (Exception e) {
							
							e.printStackTrace();
						}
						
						%>
					</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>