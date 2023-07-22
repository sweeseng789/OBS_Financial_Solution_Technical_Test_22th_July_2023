<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	
	<!-- Script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	
	<!-- Attribute -->
	<% String error = (String)request.getSession().getAttribute("error"); %>
	
	<script>		
		
		$(function(){		
			const accountForm = $("#accountForm");
			const username = $("#username");
			const password = $("#password");
			
			/* Check for error */	
			const error = '<%= error == null ? "" : error %>';
			if(error){
				alert(error);
			}
			
			/* AccountForm Submit Event */
			accountForm.submit(function(event) {
				try {
					/*Check for valid username*/
					if(!username.val()){
						throw "Invalid username!";
					}
					/*Check for valid password*/
					else if(!password.val()){
						throw "Invalid password!";
					}
				}
				catch (e) {
					event.preventDefault();
					alert(e);
				}
			});
		});
	</script>
</head>
<body>
	<form id="accountForm" action="Account" method="post">
		<!-- Username -->
		<label for="username">Username:</label>
		<input type="text" id="username" name="username">
		
		<br>
		<br>
		
		<!-- Password -->		
		<label for="password">Password:</label>	
		<input type="password" id="password" name="password">

		<br>
		<br>
		
		<!-- Login Button -->
		<input type="submit" id="submit" value="Login">
		
		
	</form>
</body>
</html>