<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.obssolution.model.Department" %>
<%@ page import="com.obssolution.model.Student" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	
	<!-- Attribute -->
	<% String userID = (String)request.getSession().getAttribute("userID"); %>
	<% Department[] departments = (Department[])request.getSession().getAttribute("departments"); %>
	
	<!-- CSS -->
	<style>
	  #studentPopup {
	    display: none;
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    padding: 20px;
	    border: 1px solid black;
	    z-index: 9999;
	  }
	  
	  #departmentName{
	  	text-align: center;
	  }
	  
	  #departmentStudentName{
	  	text-align: left;
	  }
	  
  	  #departmentStudentMark{
	  	text-align: right;
	  }
	  
	  #departmentPassRate{
	  	text-align: center;
	  }
	</style>
	
	<script>
		function ShowPopup(studentName) {
			document.getElementById("studentName").innerText = studentName;
			document.getElementById("studentPopup").style.display = "block";
		}
		
		function ClosePopup() {
			document.getElementById("studentPopup").style.display = "none";			
		}
	</script>
</head>
<body>
    <!-- Welcome  -->
	<label>Welcome <%= userID %></label>
	
	<!-- Pop up -->
	<div class="popup" id="studentPopup">
	    <h2 id="studentName"></h2>
	      <button onclick="ClosePopup()">Close</button>
    </div>
	
	<!-- Table -->
	<table border="1">
		<tr>
			<th>Department</th>
			<th>Student ID</th>
			<th>Marks</th>
			<th>Pass %</th>
		</tr>
		
		<% NumberFormat numberFormat = NumberFormat.getInstance();
		   numberFormat.setMaximumFractionDigits(2);
		   
		   for (Department department : departments){
			   // Calculate Pass Percentage
			   int passStudents = 0;
			   for (Student student : department.Students()) {
				   if(student.Mark() >= 40){
					   passStudents++;
				   }
			   }
			   
			   double passPercentage = ((double)passStudents / (double)department.Students().length) * 100;
		%>
		
		<%-- Display --%>
		<tr>
			<td id="departmentName" rowspan="<%= department.Students().length %>"><%= department.Name() %></td>
			<td id="departmentStudentName">
				<a href="#" onclick="ShowPopup('<%= department.Students()[0].Name() %>')"><%= department.Students()[0].ID() %></a>
			</td>
			<td id="departmentStudentMark"><%= department.Students()[0].Mark() %></td>
			<td id="departmentPassRate" rowspan="<%= department.Students().length %>"><%= numberFormat.format(passPercentage) %></td>
		</tr>
		
			<%for (int i = 1; i < department.Students().length; ++i) { %>
				<tr>
					<td id="departmentStudentName">
						<a href="#" onclick="ShowPopup('<%= department.Students()[i].Name() %>')"><%= department.Students()[i].ID() %></a>
					</td>
					<td id="departmentStudentMark"><%= department.Students()[i].Mark() %></td>
				</tr>
			<% } %>
		<% } %>
	</table>
</body>
</html>