<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#divLogIn {
	margin-top: 50px;
}

.panel-default>.panel-heading {
	text-align: center;
	background-color: #FF8C00;
	color: #000000;
}

#userName {
	margin: 3px;
}

#password {
	margin: 3px;
}

#buttonLogIn {
	margin: 3px;
	background-color: #FF8C00;
}
</style>
</head>
<body>
	<div id="divLogIn">
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">Log In</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-11 col-md-11">
								<input type="text" class="form-control" id="userName"
									placeholder="Username">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-11 col-md-11">
								<input type="password" class="form-control" id="password"
									placeholder="Password">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-11 col-md-11">
								<button id="buttonLogIn" type="button" class="btn btn-default">Log
									In</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<script>
		$("#buttonLogIn")
				.click(
						function() {
							var userAndPassword = {};
							userAndPassword.userName = $("#userName").val();
							userAndPassword.password = $("#password").val();
							var dataUserAndPassword = JSON
									.stringify(userAndPassword);
							$
									.ajax({
										url : "/EvaluateTool/application/checkUserPassword",
										type : 'POST',
										data : {
											dataUserAndPassword : dataUserAndPassword
										},
										success : function(data) {
											location.href = "/EvaluateTool/application/examinationRoom";
										},
										error : function(data, status, er) {
											alert("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});

						});
	</script>
</body>
</html>