<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.panel-body {
	text-align: right;
}

.panel-footer {
	text-align: center;
	color: #FFFFFF;
	background-color: #428bca;
}
.modal-title {
	text-align: center;
}
</style>
<body>
	<div class="row">
		<pre class="bg-primary"><strong>Evaluate Tool</strong></pre>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="col-sm-4 col-md-4">
				<div id="room1" class="panel panel-primary">
					<div class="panel-body">
						<p id="roomName1">
							<strong>Pite</strong>
						</p>
						<p>Software Development Trainee</p>
						<p>Java Room 9:00 AM - 12:00 AM</p>
					</div>
					<div id="footer1" class="panel-footer panel-primary">Join</div>
				</div>
			</div>
			<div class="col-sm-4 col-md-4">
				<div id="room2" class="panel panel-primary">
					<div class="panel-body">
						<p id="roomName2">
							<strong>Nong</strong>
						</p>
						<p>Software Development</p>
						<p>Assembly Room 9:00 AM - 12:00 AM</p>
					</div>
					<div id="footer2" class="panel-footer panel-primary">Join</div>
				</div>
			</div>
			<div class="col-sm-4 col-md-4">
				<div id="room3" class="panel panel-primary">
					<div class="panel-body">
						<p id="roomName3">
							<strong>Bank</strong>
						</p>
						<p>Software Analysis</p>
						<p>Assembly Room 9:00 AM - 12:00 AM</p>
					</div>
					<div id="footer3" class="panel-footer panel-primary">Join</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Join Relate</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="panel panel-default">
								<div class="panel-body">
									<a id="examinerImg" href="/EvaluateTool/examinerDashBoard"><img src="resources/images/examiner.jpg" alt="" width="100%" height="100%" class="img-rounded" /></a>
								</div>
								<div class="panel-footer">Examiner</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="panel panel-default">
								<div class="panel-body">
									<a id="committeeImg" href="/EvaluateTool/evaluateBoard"><img src="resources/images/committee.jpg" alt="" width="100%" height="100%" class="img-rounded" /></a>
								</div>
								<div class="panel-footer">Committee</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#room1").click(function() {
				$("#modal").modal("show");
			});
			$("#room2").click(function() {
				$("#modal").modal("show");
			});
			$("#room3").click(function() {
				$("#modal").modal("show");
			});
			//$("#committeeImg").click(function() {
				
			//});
		});
	</script>
</body>
</html>