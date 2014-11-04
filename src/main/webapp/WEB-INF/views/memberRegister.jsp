<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Register</title>
<style>
body {
	
}

div {
	padding: 3px;
}

#divLogIn{
	margin: 50px;
}

#divSignUp{
	margin-top: 100px;
}

#head {
	text-align: center;
}

.selectpicker {
	margin: -3px;
}
</style>
</head>
<body>
	<div id="divLogIn">
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<input type="text" class="form-control" id="userNameLogIn"
					placeholder="Username">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<input type="password" class="form-control" id="passwordLogIn"
					placeholder="Password">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<button id="buttonLogIn" type="button" class="btn btn-primary">Log
					In</button>
			</div>
		</div>
	</div>
	<div id="divSignUp">

		<div class="row" id="head">
			<div class="col-md-6 col-md-offset-3">
				<pre class="bg-primary"><strong>Sign Up</strong></pre>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3 col-md-offset-3">
				<input type="text" class="form-control" id="firstName"
					placeholder="First Name">
			</div>
			<div class="col-sm-6 col-md-3">
				<input type="text" class="form-control" id="lastName"
					placeholder="Last Name">
			</div>
		</div>

		<div class="row">
			<div class="col-md-1 col-md-offset-3">
				<strong>Gender</strong>
			</div>
			<div class="col-md-3">
				<label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="female" value="female">Female
				</label> <label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="male" value="male">Male
				</label>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="email" class="form-control" id="email"
					placeholder="Enter email">
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="email" class="form-control" id="confirmEmail"
					placeholder="Re-enter email">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3 col-md-offset-3">
				<input type="password" class="form-control" id="password"
					placeholder="Password">
			</div>
			<div class="col-sm-6 col-md-3">
				<input type="password" class="form-control" id="confirmPassword"
					placeholder="Re-enter Password">
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<select id=position class="selectpicker" data-width="100%">
					<option selected disabled>Position</option>
					<option>1</option>
					<option>2</option>
				</select>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" class="form-control" id="institute"
					placeholder="Institute">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3 col-md-offset-3">
				<input type="text" class="form-control" id="phoneNumber"
					placeholder="Phone number">
			</div>
			<div class="col-sm-6 col-md-3">
				<select id=internship class="selectpicker" data-width="100%">
					<option selected disabled>Internship or Co-operative</option>
					<option>Internship</option>
					<option>Co-operative</option>
				</select>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" class="form-control" id="facebook"
					placeholder="Facebook">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2 col-md-offset-3">
				<button id="buttonSignUp" type="button" class="btn btn-primary">Sign
					Up</button>
			</div>
		</div>

	</div>

	<script>
		$(function() {
			$("#buttonSignUp").click(
					function() {

						var dataForm = {};
						dataForm.firstname = $("#firstName").val();
						dataForm.lastname = $("#lastName").val();
						dataForm.gender = $("input:radio:checked").val();
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
							url : "/EvaluateTool/application/memberRegister",
							type : 'POST',
							data : {
								dataForm : dataSend
							},
							success : function(data) {
								alert(data);
							},
							error : function(data, status, er) {
								alert("error: " + data + " status: " + status
										+ " er:" + er);
							}
						});
					});
			$("#buttonLogIn").click(function(){
				var dataLogIn = {};
				dataLogIn.username = $("#userNameLogIn").val();
				dataLogIn.password = $("#passwordLogIn").val();
				
				var data = JSON.stringify(dataLogIn);
				
				console.info(data);
				$.ajax({
					url : "/EvaluateTool/application/memberLogIn",
					type : 'POST',
					data : {
						data : data
					},
					success : function(data) {
						alert(data);
					},
					error : function(data, status, er) {
						alert("error: " + data + " status: " + status
								+ " er:" + er);
					}
				});
			});
		});
	</script>
</body>
</html>