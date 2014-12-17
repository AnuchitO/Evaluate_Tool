<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Tool</title>
<style>
body {
	position: absolute;
	background:#505D6E url(resources/images/body1.jpg) no-repeat center center fixed; 
	min-height:100%;
	-webkit-background-size: cover;
	   -moz-background-size: cover;
	     -o-background-size: cover;
	        background-size: cover;
}

#language{
	text-align: right;
	margin-right: 10px;
}

.modal-header{
	color: #FF6600;
}

#divLogIn {
	margin-top: 50px;
}

#buttonLogIn {
	border: 0px;
	background-color: #FF6600;
}

</style>
</head>

<body>
	<div id="language">
		<span><a href="?lang=en_US">English</a> : </span>
		<span><a href="?lang=th_TH">Thai</a></span>
	</div>
	  	
	<div id="divLogIn" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog">
	  <div class="modal-content">
	      <div class="modal-header">
	          <h1 class="text-center"><strong><spring:message code="APP.name" /></strong></h1>
	      </div>
	      <div class="modal-body">
	          <div class="form center-block">
	            <div class="form-group">
	              <input type="text" class="form-control" id="userName" placeholder="<spring:message code='APP.username' />">
	            </div>
	            <div class="form-group">
	              <input type="password" class="form-control" id="password" placeholder="<spring:message code='APP.password' />">
	            </div>
	            <div class="form-group">
	              <button id="buttonLogIn" type="submit" class="btn btn-primary btn-lg btn-block"><spring:message code="APP.lname" /></button>
	            </div>
	            <div class="form-group" align="right">
				 	<a href="memberRegister"><button type="button" class="btn btn-info">Sign Up</button></a>
				</div>
	          </div>
	      </div>
	  </div>
	  </div>
	  
	</div>

	<!-- <div id="divLogIn">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">Log In</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<input type="text" class="form-control" id="userName" placeholder="Username">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<input type="password" class="form-control" id="password" placeholder="Password">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-1 col-md-1 col-md-offset-4 col-sm-offset-4">
								<button id="buttonLogIn" type="submit" class="btn btn-default">Log In</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->


	<script>
		$("#buttonLogIn")
				.click(
						function() {
							var userAndPassword = {};
							userAndPassword.userName = $("#userName").val();
							userAndPassword.password = $("#password").val();
							var dataUserAndPassword = JSON
									.stringify(userAndPassword);
									// alert(dataUserAndPassword);
							$
									.ajax({
										url : "/EvaluateTool/application/checkUserPassword",
										type : 'POST',
										data : {
											dataUserAndPassword : dataUserAndPassword
										},
										success : function(data) {
											var yourId = JSON.parse(data).id;
											var yourName = JSON.parse(data).name;
											var yourLastName = JSON.parse(data).lastName;
											var yourPosition = JSON.parse(data).position;
											//alert("Wellcome , " + yourName
											//		+ " " + yourLastName);
											location.href = "/EvaluateTool/application/examinationRoom"
													+ "?yourId="
													+ encodeURIComponent(yourId)
													+ "&yourPosition="
													+ encodeURIComponent(yourPosition)
													+ "&yourName="
													+ encodeURIComponent(yourName)
													+ "&yourLastName="
													+ encodeURIComponent(yourLastName);
										},
										error : function(data, status, er) {
											alert("Wrong Username or Password, Try Again");
										}
									});

						});
	</script>
</body>
</html>