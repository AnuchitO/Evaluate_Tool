<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Register</title>
<style type="text/css">
@IMPORT url("${contextPath}/resources/styles/css/sweet-alert.css");
@IMPORT url("${contextPath}/resources/styles/css/alertify.core.css");
@IMPORT url("${contextPath}/resources/styles/css/alertify.default.css");
div {
	padding: 3px;
}

#divSignUp{
	margin: 40px;
}

#head {
	text-align: center;
}

.selectpicker {
	margin: -3px;
}
#confirmEmail-error, #email-error, #confirmPassword-error, #password-error, #phoneNumber-error, #phoneNumber-error, #firstName-error, #lastName-error, #username-error {
	color: red; 
}

</style>
</head>
<body>
<form id="myform" name="myform" novalidate="novalidate">
	<div id="divSignUp">

		<div class="row" id="head">
			<div class="col-md-6 col-md-offset-3">
				<pre class="bg-primary"><strong>Sign Up</strong></pre>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3 col-md-offset-3">
				<input type="text" class="form-control" id="firstName" name="firstName" 
					placeholder="Firstname">
			</div>
			<div class="col-sm-6 col-md-3">
				<input type="text" class="form-control" id="lastName" name="lastname" 
					placeholder="Lastname">
			</div>
		</div>

		<div class="row">
			<div class="col-md-1 col-md-offset-3">
				<strong>Gender</strong>
			</div>
			<div class="col-md-3">
				<label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="female" name="radiobox" value="Female">Female
				</label> <label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="male" name="radiobox" value="Male">Male
				</label>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="email" class="form-control" id="email" name="email" 
					placeholder="Enter email">
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="email" class="form-control" id="confirmEmail" name="confirmEmail" 
					placeholder="Re-enter email">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-offset-3">
				<input type="text" class="form-control" id="username" name="username" 
					placeholder="Username">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3 col-md-offset-3">
				<input type="password" class="form-control" id="password" name="password" 
					placeholder="Password">
			</div>
			<div class="col-sm-6 col-md-3">
				<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
					placeholder="Re-enter Password">
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<select id="position" class="selectpicker" name="position" data-width="100%">
					<option selected disabled value="-1">Position</option>
					<option value="Software Development Trainee">Software Development Trainee</option>
					<option value="Software Development">Software Development</option>
					<option value="Senior Software Development">Senior Software Development</option>
					<option value="Software Analyst">Software Analyst</option>
					<option value="Senior Software Analyst">Senior Software Analyst</option>
				</select>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" class="form-control" id="institute" name="institute" 
					placeholder="Institute">
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6 col-md-3 col-md-offset-3">
				<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" 
					placeholder="Phone number">
			</div>
			<div class="col-sm-6 col-md-3">
				<select id="internship" class="selectpicker" name="internship" data-width="100%">
					<option selected disabled value="-1">Status</option>
					<option value="Internship">Internship</option>
					<option value="Co-operative">Co-operative</option>
					<option value="Employee">Employee</option>
				</select>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" class="form-control" id="facebook" name="facebook"
					placeholder="Facebook">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2 col-md-offset-3">
				<button id="buttonSignUp" type="submit" class="btn btn-primary">Sign
					Up</button>
			</div>
		</div>

	</div>
</form>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<script type="text/javascript"
		src="${contextPath}/resources/styles/js/sweet-alert.js"></script>
<script type="text/javascript"
		src="${contextPath}/resources/styles/js/alertify.min.js"></script>
	<script>
		$(function() {
			$("#buttonSignUp").click(
					function() {
						//Validate
						jQuery.validator.setDefaults({
							debug: true,
							validClass: "success",
							errorClass: "error"
						});
						$("#myform").validate({
							rules: {
								firstName: {
									required: true
								},
								lastname: {
									required: true
								},
								email: {
									required: true,
									email: true
								},
								confirmEmail: {
									equalTo: "#email"
								},
								username: {
									required: true,
									rangelength: [4, 16]
								},
								password: {
									required: true,
									rangelength: [4, 20]
								},
								confirmPassword: {
									equalTo: "#password"
								},
								phoneNumber: {
									required: true,
									number: true,
									rangelength : [10, 10]
								},
								position: {
									required: true
								},
								agree: "required"
							},
							messages:{
								firstName: {
								 	required: "Please enter your firstname."
								},
								lastname: {
									required: "Please enter your lastname."
								},
								email:{
									required: "We need your email address to contact you.",
									email: "Your email address must be in the format of name@domain.com"
								},
								username: {
									required: "Please enter your username.",
									rangelength: "Please enter between 4 and 16 characters."
								},
								password: {
									required: "Please enter your password.",
									rangelength: "Please enter between 4 and 20 characters."
								},
								phoneNumber: {
									required: "Please enter your phone number.",
									number: "Please enter a valid number.",
									rangelength: "Please enter 10 characters."
								},
								position: {
									required: "Please choose your position."
								}
							},
							submitHandler: function(form) {
								var dataForm = {};
									dataForm.firstname = $("#firstName").val();
									dataForm.lastname = $("#lastName").val();
									dataForm.gender = $("input:radio:checked").val();
									dataForm.email = $("#email").val();
									dataForm.reemail = $("#confirmEmail").val();
									dataForm.username = $("#username").val();
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
											swal({   title: "Congratulations! You have successfully register.",
												type: "success",
												confirmButtonColor: "#8ACBE5",
												confirmButtonText: "OK",
												closeOnConfirm: false
												},function (isConfirm) {
													if (isConfirm) {
														window.location.href = "/EvaluateTool/";
													}
												}
											);
										},
										error : function(data, status, er) {
											// alert("error: " + data + " status: " + status
											// 		+ " er:" + er);
											swal("Please fill out this form!!");
										}
									});
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