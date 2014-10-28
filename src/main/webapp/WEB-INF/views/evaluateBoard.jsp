<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Board</title>
<style>
#formBoard {
	margin: 40px;
}

#require {
	margin-top: 10px;
}

#message {
	margin-top: 10px;
}

.navbar-default {
	background-color: #F8F8F8;
	border-color: #E7E7E7;
}

.blue {
	background-color: #428bca;
	color: #FFFFFF;
}

#btn0 {
	margin-top: 10px;
	margin-right: 100px;
	box-shadow: 3px 5px 0px 0px #97c4fe;
	border-radius: 30px;
	cursor: pointer;
	font-size: 20px;
	padding: 15px 25px;
}

#btn03 {
	margin-top: 10px;
	margin-right: 100px;
	box-shadow: 3px 5px 0px 0px #97c4fe;
	border-radius: 30px;
	cursor: pointer;
	font-size: 20px;
	padding: 15px 16px;
}

#btn05 {
	margin-top: 10px;
	margin-right: 100px;
	box-shadow: 3px 5px 0px 0px #97c4fe;
	border-radius: 30px;
	cursor: pointer;
	font-size: 20px;
	padding: 15px 16px;
}

#btn08 {
	margin-top: 10px;
	margin-right: 100px;
	box-shadow: 3px 5px 0px 0px #97c4fe;
	border-radius: 30px;
	cursor: pointer;
	font-size: 20px;
	padding: 15px 16px;
}

#btn1 {
	margin-top: 10px;
	margin-right: 100px;
	box-shadow: 3px 5px 0px 0px #97c4fe;
	border-radius: 30px;
	cursor: pointer;
	font-size: 20px;
	padding: 15px 25px;
}

#buttonSubmit {
	margin-top: 10px;
}

.nav-pills>li {
	border-radius: 5px;
	background-color: #BDBDBD;
}

.nav-pills>li>a {
	color: #000000;
}

.panel-heading {
	cursor: pointer;
}
</style>
</head>

<body>

	<div class="container">
		<div class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle"
						data-target=".navbar-collapse" data-toggle="collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="">Evaluate Board</a>
				</div>
				<div id="bs-navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a id="presenting">Presenting</a></li>
						<li><a id="topicList">Topic List</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- Body -->
		<button id="buttonCreate" type="button" class="btn btn-primary">Create
			Panel</button>
		<button id="buttonDelete" type="button" class="btn btn-primary">Delete
			Panel</button>

		<label id="examinerId" value="e001">Examiner : Pite</label> <label
			id="committeeId" value="c001">Committee : P'Aod</label>

		<div id="formBoard"></div>

		<div id="panelScore" class="panel panel-primary">
			<div class="panel-heading">
				<label id="subject">${subject}</label> : <label id="title">${title}</label>
			</div>
			<div class="panel-body">
				<label id="detail">${detail}</label>
				<textarea id="message" class="form-control" rows="3"
					placeholder="comment here"></textarea>

				<div class="btn-group">
					<button id="btn0" type="button" class="btn btn-default" value="0">0</button>
					<button id="btn03" type="button" class="btn btn-default"
						value="0.3">0.3</button>
					<button id="btn05" type="button" class="btn btn-default"
						value="0.5">0.5</button>
					<button id="btn08" type="button" class="btn btn-default"
						value="0.8">0.8</button>
					<button id="btn1" type="button" class="btn btn-default" value="1">1</button>
				</div>

				<button id="buttonSubmit" type="button" class="btn btn-primary">Submit</button>
			</div>
		</div>

		<div class="panel-group" id="accordion">
			<div class="panel panel-primary">
				<div class="panel-heading" data-toggle="collapse"
					data-parent="#accordion" href="#collapseObject"
					data-target="#collapseObject">
					<h4 class="panel-title">
						Object - Oriented<span class="badge pull-right">4</span>
					</h4>
				</div>
				<div id="collapseObject" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav nav-pills nav-stacked">
							<li id="aaa"><a href="#">Abstraction : Understand
									abstraction concept</a></li>
							<li><a href="#">Encapsulation : Understand encapsulation
									concept</a></li>
							<li><a href="#">Inheritance : Understand inheritance
									concept</a></li>
							<li><a href="#">Polymorphism : Understand polymorphism
									concept</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading" data-toggle="collapse"
					data-parent="#accordion" href="#collapseJava"
					data-target="#collapseJava">
					<h4 class="panel-title">
						Java<span class="badge pull-right">3</span>
					</h4>
				</div>
				<div id="collapseJava" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav nav-pills nav-stacked">
							<li><a href="#">Assignments : grade B Understand default
									value of variable, scope of variable wrapper class.</a></li>
							<li><a href="#">Declaration & Access control : grade C
									Can declare variable and class in java.</a></li>
							<li><a href="#">Flow Control - Exceptions : grade C
									Understand the mechanism of condition statement such as
									If...else, switch and every type of loop.</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="modalScore" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Score</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="panel panel-primary">
									<div class="panel-head">
										<label id="subject">${subject}</label> : <label id="title">${title}</label>
									</div>
									<div class="panel-body">
										<label id="detail">${detail}</label>
										<textarea id="message" class="form-control" rows="3"
											placeholder="comment here"></textarea>

										<div class="btn-group">
											<button id="btn0" type="button" class="btn btn-default"
												value="0">0</button>
											<button id="btn03" type="button" class="btn btn-default"
												value="0.3">0.3</button>
											<button id="btn05" type="button" class="btn btn-default"
												value="0.5">0.5</button>
											<button id="btn08" type="button" class="btn btn-default"
												value="0.8">0.8</button>
											<button id="btn1" type="button" class="btn btn-default"
												value="1">1</button>
										</div>

										<button id="buttonSubmit" type="button"
											class="btn btn-primary">Submit</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="score" value="" />
	</div>

	<script>
		$(function() {
			$("#panelScore").hide();
			$("#accordion").hide();
			$("#presenting").click(function() {
				$("#accordion").hide();
				$("#panelScore").fadeIn('slow').appendTo($("#formBoard"));
			});
			$("#topicList").click(function() {
				$("#panelScore").hide();
				$("#accordion").fadeIn('slow').appendTo($("#formBoard"));
			});
			$("#aaa").click(
					function() {
						var data = {};
						data.examinerId = $("#examinerId").attr('value');
						data.committeeId = $("#committeeId").attr('value');

						var dataSend = JSON.stringify(data);

						$.ajax({
							url : "/EvaluateTool/committeeBoard",
							type : 'POST',
							data : {
								data : dataSend
							},
							success : function(data) {

							},
							error : function(data, status, er) {
								alert("error: " + data + " status: " + status
										+ " er:" + er);
							}
						});
						$("#modalScore").modal("show");
					});
			$("#btn0").click(function() {
				$("#score").val("0");
			});
			$("#btn03").click(function() {
				$("#score").val("0.3");
			});
			$("#btn05").click(function() {
				$("#score").val("0.5");
			});
			$("#btn08").click(function() {
				$("#score").val("0.8");
			});
			$("#btn1").click(function() {
				$("#score").val("1");
			});
			$("#buttonCreate").click(function() {
				$("#panelScore").clone().appendTo($("#formBoard"));
			});
			$("#buttonDelete").click(function() {
				$("#panelScore").remove();
			});
			$("#buttonSubmit").click(function() {
				var dataForm = {};
				dataForm.message = $("textarea#message").val();
				dataForm.btnGroup = $("#score").val();
				alert(dataForm.message + " " + dataForm.btnGroup);

				//var dataSend = JSON.stringify(dataForm);

				//console.info(dataSend);
				//$.ajax({
				//url : "/EvaluateTool/evaluateboard",
				//type : 'GET',
				//data : {
				//dataForm : dataSend
				//},
				//success : function(data) {
				//alert(data);
				//},
				//error : function(data, status, er) {
				//alert("error: " + data + " status: " + status
				//	+ " er:" + er);
				//}
				//});

			});
		});
	</script>
</body>
</html>