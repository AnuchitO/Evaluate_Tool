<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Tool</title>
<style type="text/css">
@IMPORT url("${contextPath}/resources/styles/css/alertify.core.css");
@IMPORT url("${contextPath}/resources/styles/css/alertify.default.css");
@IMPORT url("${contextPath}/resources/styles/css/sweet-alert.css");
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
<script type="text/javascript"
		src="${contextPath}/resources/styles/js/alertify.min.js"></script>
<script type="text/javascript"
		src="${contextPath}/resources/styles/js/sweet-alert.js"></script>
	  	
	<div id="divLogIn" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
		<div id="language">
			<span><a href="?lang=en_US">English</a> : </span>
			<span><a href="?lang=th_TH">Thai</a></span>
		</div>
	  <div class="modal-dialog">
	  <div class="modal-content">
	      <div class="modal-header">
	          <h1 class="text-center"><strong><spring:message code="APP.name" /></strong></h1>
	      </div>
	      <div class="modal-body">
	          <div class="form center-block">
	            <div class="form-group">
	              <input type="text" class="form-control" id="userName" placeholder="<spring:message code='APP.username' />"onkeydown="if (event.keyCode == 13) document.getElementById('buttonLogIn').click()">
	            </div>
	            <div class="form-group">
	              <input type="password" class="form-control" id="password" placeholder="<spring:message code='APP.password' />" onkeydown="if (event.keyCode == 13) document.getElementById('buttonLogIn').click()">
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

	<script>
			$("#buttonLogIn")
					.click(
					function sinIn(){
						var userAndPassword = {};
						userAndPassword.userName = $("#userName").val();
						userAndPassword.password = $("#password").val();
						var dataUserAndPassword = JSON
								.stringify(userAndPassword);
						// alert(dataUserAndPassword);
						$
								.ajax({
									url: "/EvaluateTool/application/checkUserPassword",
									type: 'POST',
									data: {
										dataUserAndPassword: dataUserAndPassword
									},
									success: function (data) {
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
									error: function (data, status, er) {
										swal("Wrong Username or Password, Try Again.");
									}
								});

					});

	</script>
</body>
</html>