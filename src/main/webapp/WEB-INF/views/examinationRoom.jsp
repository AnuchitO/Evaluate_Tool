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
		<pre class="bg-default">
			<strong>Evaluate Tool</strong>
		</pre>
	</div>
	<div id="examinerId">2</div>
	<div id="committeeId">3</div>
	<div id="container" class="row">
		<div id="setSizeContainer" class="col-md-12"></div>
	</div>
	<div id="setSizeCard" class="col-sm-5 col-md-5 col-md-offset-1"></div>
	<div id="room0" class="panel panel-default"></div>
	<div id="body" class="panel-body"></div>
	<div id="setSizeProgress" class="col-sm-4 col-md-4"></div>
	<div id="setSizeDetail" class="col-sm-8 col-md-8"></div>
	<div id="roomName"></div>
	<strong id="examinerName"></strong>
	<div id="roomDetail"></div>
	<div id="examiner">Examiner :</div>
	<div id="modulator">Modulator :</div>
	<div id="roomStatus">Status :</div>
	<div id="setSizeBtn" class="row"></div>
	<div id="setSizeBtnExaminer" class="col-sm-6 col-md-6"></div>
	<div id="setSizeBtnCommittee" class="col-sm-6 col-md-6"></div>
	<button id="btnExaminer" type="button" class="btn btn-default disabled">Examiner</button>
	<button id="btnCommittee" type="button" class="btn btn-default">Committee</button>
	<script>
		$("#btnCommittee")
				.click(
						function() {
							var detailPerson = {};
							detailPerson.committeeId = $("#committeeId").text();
							detailPerson.examinerId = $("#examinerId").text();
							var dataPersonId = JSON.stringify(detailPerson);
							$
									.ajax({
										url : "/EvaluateTool/application/checkCommittee",
										type : 'POST',
										data : {
											dataPersonId : dataPersonId
										},
										success : function(data) {
											var idExaminer = JSON.parse(data).idExaminer;
											var nameExaminer = JSON.parse(data).nameExaminer;
											var lastNameExaminer = JSON
													.parse(data).lastNameExaminer;
											var idCommittee = JSON.parse(data).idCommittee;
											var nameCommittee = JSON
													.parse(data).nameCommittee;
											var lastNameCommittee = JSON
													.parse(data).lastNameCommittee;
											location.href = "/EvaluateTool/application/evaluateBoard"
													+ "?idExaminer="
													+ encodeURIComponent(idExaminer)
													+ "&nameExaminer="
													+ encodeURIComponent(nameExaminer)
													+ "&lastNameExaminer="
													+ encodeURIComponent(lastNameExaminer)
													+ "&idCommittee="
													+ +encodeURIComponent(idCommittee)
													+ "&nameCommittee="
													+ encodeURIComponent(nameCommittee)
													+ "&lastNameCommittee="
													+ encodeURIComponent(lastNameCommittee);
										},
										error : function(data, status, er) {
											alert("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});
						});
		//$(function() {
		//	$("#room").click(function() {
		//		$("#modal").modal("show");
		//	});
		//});
	</script>
</body>
</html>