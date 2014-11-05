<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div {
	padding: 3px;
}

#divLogIn {
	margin: 50px;
}
</style>
</head>
<body>
	<div id="divLogIn">
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<input type="text" class="form-control" id="userName"
					placeholder="Username">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<input type="password" class="form-control" id="password"
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
	<script>
		$("#buttonLogIn").click(function() {
			var data = {};
			data.userName = $("#userName").val();
			data.password = $("#password").val();
			//alert(data.userName + " " + data.password);
			var data = JSON.stringify(data);
			$
					.ajax({
						url : "/EvaluateTool/application/checkUserPassword",
						type : 'POST',
						data : {
							data : data
						},
						success : function(data) {
							location.href = "/EvaluateTool/application/evaluateBoard";
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});

		});
	</script>
</body>
</html>