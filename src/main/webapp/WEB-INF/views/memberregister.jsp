<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Register</title>
<style>
form {
	margin: 40px;
}
div {
	padding: 3px;
}
#head {
	text-align: center;
}
</style>
</head>
<body>
	<form id="formSignUp">
	
		<div class="row" id="head">
			<div class="col-md-6 col-md-offset-3">
				<pre><strong>Sign Up</strong></pre>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3 col-md-offset-3">
				<input type="text" class="form-control" id="firstName" placeholder="First Name">
			</div>
			<div class="col-md-3">
				<input type="text" class="form-control" id="lastName" placeholder="Last Name">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1 col-md-offset-3">
				<strong>Gender</strong>
			</div>
			<div class="col-md-1">
				<label class="radio-inline">
					<input type="radio" name="inlineRadioOptions" id="female" value="option1">Female
				</label>
			</div>
			<div class="col-md-1">
				<label class="radio-inline">
					<input type="radio" name="inlineRadioOptions" id="male" value="option2">Male
				</label>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="email" class="form-control" id="email" placeholder="Enter email">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="email" class="form-control" id="confirmEmail" placeholder="Re-enter email">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3 col-md-offset-3">
				<input type="password" class="form-control" id="password" placeholder="Password">
			</div>
			<div class="col-md-3">
				<input type="password" class="form-control" id="confirmPassword" placeholder="Re-enter Password">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<select class="form-control">
					<option>Position</option>
				  	<option></option>
				  	<option></option>
				  	<option></option>
				  	<option></option>
				</select>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" class="form-control" id="institute" placeholder="Institute">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3 col-md-offset-3">
				<input type="text" class="form-control" id="phoneNumber" placeholder="Phone number">
			</div>
			<div class="col-md-3">
				<select class="form-control">
					<option>Internship or Co-operative</option>
				  	<option></option>
				  	<option></option>
				  	<option></option>
				  	<option></option>
				</select>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" class="form-control" id="facebook" placeholder="Facebook">
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-2 col-md-offset-3">
				<button id="button" type="button" class="btn btn-primary">Sign Up</button>
			</div>
		</div>
		
	</form>

<!-- <form id="contact">
  <input name="user[email]" value="jsmith@example.com">
  <input name="user[pets][]" type="checkbox" value="cat" checked>
  <input name="user[pets][]" type="checkbox" value="dog" checked>
  <input name="user[pets][]" type="checkbox" value="bird">
  <input type="submit">
</form> -->

<script>
	$(function() {
		$("#button").click(function() {
			//$("#formSignUp").submit(function(event){
				//var data = $(this).serialize();
				var dataForm = {};
					dataForm.firstname = $("#firstName").val();
					dataForm.lastname = $("#lastName").val();
					dataForm.gender = $("#gender").val();
					dataForm.email = $("#email").val();
					dataForm.reemail = $("#confirmEmail").val();
					dataForm.password = $("#password").val();
					dataForm.repassword = $("#confirmPassword").val();
					dataForm.position = $("#position").val();
					dataForm.institute = $("#institute").val();
					dataForm.phonenumber = $("#phoneNumber").val();
					dataForm.internship = $("#internship").val();
					dataForm.facebook = $("#facebook").val();
				
				var dataSend = JSON.stringify(dataForm);
				
				console.info(dataSend);
					$.ajax({
						url : "/EvaluateTool/memberregister",
						type: 'POST',					
						data: {
							dataForm:dataSend
						},					
						success : function(data) {
							alert(data);
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status + " er:" + er);
						}
					});
			});
	//	});
	});
</script>
</body>
</html>