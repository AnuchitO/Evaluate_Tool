<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Examiner Board</title>
<style>
.navbar-default {
	background-color: #FF8C00;
}

.navbar-default>.container-fluid>.navbar-header>.navbar-brand {
	color: black;
}

.navbar-default>.container-fluid>.navbar-collapse>.navbar-nav>li>a {
	color: black;
}

.bs-sidebar {
	background-color: #D8D8D8;
}

.panel-default>.panel-heading {
	text-align: center;
	background-color: #FF8C00;
	color: #000000;
}

.panel-default>.panel-body {
	text-align: center;
}

.highlight {
	background: yellow;
}

a {
	cursor: pointer;
}

.btn {
	background-color: #FF8C00;
}
</style>
</head>
<body>
	<input type="hidden" id="roomId" value="${idRoom}" />
	<label id="examinerId" value="${idExaminer}"></label>
	<br>
	<label id="courseId" value="${idCourse}"></label>
	<div class="row">
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
						<li><a id="logOut">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-sm-12">
			<div id="container" class="row">
				<div class="col-md-2 col-sm-2">
					<div class="bs-sidebar">
						<ul id="allSubjectList" class="nav bs-sidenav">
						</ul>
					</div>
				</div>
				<div id="cardSpace" class="col-md-10 col-sm-10"></div>
			</div>
		</div>
	</div>
	<li id="eachSubject0" onClick="javascript:showTopic(this);"></li>
	<a id="subject0"></a>
	<div id="card0" class="col-md-6 col-sm-6 col-xs-6"></div>
	<div id="panel0" class="panel panel-default"></div>
	<div id="panelHead0" class="panel-heading"></div>
	<h3 id="topicName0" class="panel-title"></h3>
	<div id="panelBody0" class="panel-body"></div>
	<button id="btnPresent" type="button" class="btn btn-default"
		onClick="javascript:requestController($(this).parent().children('.panel-body').attr('id'));"
		style="margin-left: 200px;">Present</button>

	<script>
		$(function() {
			$("#eachSubject0").hide();
			$("#card0").hide();
			$("#panel0").hide();
			$("#panelHead0").hide();
			$("#topicName0").hide();
			$("#panelBody0").hide();
			$("#btnPresent").hide();
			var data = {};
			data.roomId = $("#roomId").val();
			data.examinerId = $("#examinerId").attr('value');
			data.courseId = $("#courseId").attr('value');

			var dataSend = JSON.stringify(data);
			$
					.ajax({
						url : "/EvaluateTool/application/examinerDashBoardTopicList",
						type : 'POST',
						data : {
							data : dataSend
						},
						success : function(data) {
							var course = JSON.parse(data);
							createToggle(course);
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});
			function createToggle(course) {
				var dummyEachSubject = 0;
				var dummySubject = 0;
				var genEachSubject = $("#eachSubject" + dummyEachSubject);
				var genSubject = $("#subject" + dummySubject);
				$.each(course, function(i, item) {
					item
							.forEach(function(subject) {
								var sendNameOfSubject = subject.name;
								$("#eachSubject0").clone().attr('id',
										'eachSubject' + (++dummyEachSubject))
										.insertAfter(genEachSubject).show()
										.appendTo($("#allSubjectList"));
								$("#subject0").clone().attr('id',
										'subject' + (++dummySubject)).text(
										sendNameOfSubject).insertAfter(
										genSubject).appendTo(
										$("#eachSubject" + dummyEachSubject));
							});
				});
			}
		});
		function showTopic(element) {
			var sizeTopic = (element.id).replace(/[^\d.]/g, '') - 1;
			var data = {};
			//data.roomId = $("#roomId").val();
			//data.examinerId = $("#examinerId").attr('value');
			data.courseId = $("#courseId").attr('value');

			var dataSend = JSON.stringify(data);
			$
					.ajax({
						url : "/EvaluateTool/application/examinerDashBoardTopicList",
						type : 'POST',
						data : {
							data : dataSend
						},
						success : function(data) {
							$("#cardSpace").empty();
							var course = JSON.parse(data);
							var dummyCard = 0;
							var dummyPanel = 0;
							var dummyPanelHead = 0;
							var dummyTopicName = 0;
							var dummyPanelBody = 0;

							var genCard = $("#card" + dummyCard);
							var genPanel = $("#panel" + dummyPanel);
							var genPanelHead = $("#panelHead" + dummyPanelHead);
							var genTopicName = $("#topicName" + dummyTopicName);
							var genPanelBody = $("#panelBody" + dummyPanelBody);

							$
									.each(
											course,
											function(i, item) {
												var index = 0;
												var keepTopic = item[sizeTopic].topic;
												for (index; index < keepTopic.length; ++index) {
													var sendTitle = keepTopic[index].name;
													var sendDescription = keepTopic[index].description;
													$("#card0")
															.clone()
															.attr(
																	'id',
																	'card'
																			+ (++dummyCard))
															.insertAfter(
																	genCard)
															.fadeIn('slow')
															.appendTo(
																	$("#cardSpace"));
													$("#panel0")
															.clone()
															.attr(
																	'id',
																	'panel'
																			+ (++dummyPanel))
															.insertAfter(
																	genPanel)
															.show()
															.appendTo(
																	$("#card"
																			+ dummyCard));
													$("#panelHead0")
															.clone()
															.attr(
																	'id',
																	'panelHead'
																			+ (++dummyPanelHead))
															.insertAfter(
																	genPanelHead)
															.show()
															.appendTo(
																	$("#panel"
																			+ dummyPanel));
													$("#topicName0")
															.clone()
															.attr(
																	'id',
																	'topicName'
																			+ (++dummyTopicName))
															.text(sendTitle)
															.insertAfter(
																	genTopicName)
															.show()
															.appendTo(
																	$("#panelHead"
																			+ dummyPanelHead));
													$("#panelBody0")
															.clone()
															.attr(
																	'id',
																	'panelBody'
																			+ (++dummyPanelBody))
															.text(
																	sendDescription)
															.insertAfter(
																	genPanelBody)
															.show()
															.appendTo(
																	$("#panel"
																			+ dummyPanel));
													$("#btnPresent")
															.clone()
															.show()
															.appendTo(
																	$("#panel"
																			+ dummyPanel));
												}
											});
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});
		}
		function requestController(element) {
			$(".panel-body").removeClass('highlight');
			$("#" + element).addClass('highlight');
			var data = {};
			data.examinerId = $("#examinerId").attr('value');

			var dataSend = JSON.stringify(data);
			$
					.ajax({
						url : "/EvaluateTool/application/test",
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
		}
	</script>
</body>
</html>