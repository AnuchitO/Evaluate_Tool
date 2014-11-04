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

	<div id="container" class="container">
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

		<!-- <button id="buttonCreate" type="button" class="btn btn-primary">Create
			Panel</button>
		<button id="buttonDelete" type="button" class="btn btn-primary">Delete
			Panel</button> -->

		<label id="examinerId" value="2">Examiner : Pite</label> <label
			id="committeeId" value="3">Committee : P'Aod</label> <label
			id="courseId" value="1">Course : SDT</label>


		<div id="formBoard">
			<span id="submitOfAllTOpic" class="badge pull-right">Total <label
				id="submitTopic" style="margin: 2px;"></label> / <label
				id="totalTopic" style="margin: 2px;"></label></span> <br> <br>
			<div class="panel-group" id="accordion"></div>
		</div>

		<div id="panelRealTime" class="panel panel-primary">
			<div class="panel-heading">
				<label id="subject">${subject}</label> : <label id="title">${title}</label>
			</div>
			<div class="panel-body">
				<label id="detail">${detail}</label>
				<textarea id="message" class="form-control" rows="3"
					placeholder="comment here"></textarea>

				<div id="panelButtonScore" class="btn-group">
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

		<!-- <div class="panel-group" id="accordion">
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
		</div> -->

		<!----------------------Model Collapse---------------------->
		<div id="panelCollapse0" class="panel panel-primary"></div>
		<div id="panelHeading0" class="panel-heading" data-toggle="collapse"
			data-parent="#accordion" href="#collapse0" data-target="#collapse0">
		</div>
		<h4 id="panelTitle0" class="panel-title"></h4>
		<div id="collapse0" class="panel-collapse collapse"></div>
		<div id="panelBody0" class="panel-body"></div>
		<ul id="navpills0" class="nav nav-pills nav-stacked">
		</ul>
		<li id="listNavpills0" onClick="javascript:showModal(this);"></li> <a
			id="linkToScore0" href="#"></a> <span id="spanScore0"
			class="badge pull-right"></span>
		<!----------------------Model Collapse---------------------->

		<!----------------------Model Panel in Modal---------------------->
		<div id="panelScore0" class="panel panel-primary"></div>
		<div id="panelScoreHead0" class="panel-heading"></div>
		<label id="panelScoreSubject0" class="textSubject"></label>
		<button id="panelScoreBtnClose" type="button" class="close"
			data-dismiss="modal" aria-hidden="true">&times;</button>
		<div id="panelScoreBody0" class="panel-body"></div>
		<span id="dummyKeepIdTopic0" class="textId"></span> <label
			id="panelScoreDescription0" class="textDescription"></label>
		<textarea id="panelScoreMessage0" class="form-control" rows="3"
			placeholder="comment here"></textarea>
		<div id="panelScoreBtnGroup0" class="btn-group">
			<button id="btnZero0" type="button"
				class="btn btn-default buttonFirst" value="0"
				onClick="javascript:setScore(this.id)"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 25px;">0</button>
			<button id="btnThree0" type="button"
				class="btn btn-default buttonSecond" value="0.3"
				onClick="javascript:setScore(this.id)"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.3</button>
			<button id="btnFive0" type="button"
				class="btn btn-default buttonSecond" value="0.5"
				onClick="javascript:setScore(this.id)"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.5</button>
			<button id="btnEight0" type="button"
				class="btn btn-default buttonSecond" value="0.8"
				onClick="javascript:setScore(this.id)"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.8</button>
			<button id="btnOne0" type="button"
				class="btn btn-default buttonFirst" value="1"
				onClick="javascript:setScore(this.id)"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 25px;">1</button>
		</div>
		<button id="panelScoreBtnSubmit0" type="button"
			class="btn btn-primary" onClick="javascript:sendMessageScore(this);"
			data-dismiss="modal" style="margin: 20px">Submit</button>
		<!----------------------Model Panel in Modal---------------------->

		<!----------------------Model Modal---------------------->
		<div class="modal fade" id="modalScore0" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"></div>
		<div id="modalScoreDialog0" class="modal-dialog"></div>
		<div id="modalScoreContent0" class="modal-content"></div>
		<!----------------------Model Modal---------------------->

		<input type="hidden" id="score" value="" />
	</div>

	<script>
		function showModal(element) {
			count = (element.id).replace(/[^\d.]/g, '');
			$("#modalScore" + count).modal("show");
			var textDescription = $("#" + element.id).children('a').clone()
					.children('span').remove().end().text();
			var textTopicId = $("#" + element.id).children('a').clone()
					.children('span').remove().end().text();
			var textSubject = $("#" + element.id).parent('ul').parent('div')
					.parent('div').parent('div').children('div').children('h4')
					.text();
			$(".textSubject").text(textSubject);
			$(".textDescription").text(textDescription);
		}
		function sendMessageScore(buttonSubmit) {
			count = (buttonSubmit.id).replace(/[^\d.]/g, '');
			var textMessage = $("textarea#panelScoreMessage" + count).val();
			var textScore = $("#panelScoreBtnGroup" + count).find(
					"button.active").prop('value');
			var textId = $("#dummyKeepIdTopic" + count).text();
			//alert(textId + textMessage + textScore);
			var dataSave = {};
			dataSave.examinerId = $("#examinerId").attr('value');
			dataSave.committeeId = $("#committeeId").attr('value');
			dataSave.topicId = textId;
			dataSave.score = textScore;
			dataSave.comment = textMessage;

			var dataSend = JSON.stringify(dataSave);
			$
					.ajax({
						url : "/EvaluateTool/application/scoring",
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

			if ($("#spanScore" + count).text() == '-') {
				var keepOriginalSubmitTopic = $("#submitTopic").text();
				keepOriginalSubmitTopic++;
				$("#submitTopic").text(keepOriginalSubmitTopic);
			}
			$("#spanScore" + count).text(textScore);

		}
		function setScore(btnScore) {
			$('button').removeClass('active');
			$("#" + btnScore).addClass('active');
		}
		$(function() {
			$("#panelRealTime").hide();
			$("#submitOfAllTOpic").hide();
			$("#panelCollapse0").hide();
			$("#panelHeading0").hide();
			$("#panelTitle0").hide();
			$("#panelBody0").hide();
			$("#navpills0").hide();
			$("#listNavpills0").hide();
			$("#modalScoreDialog0").hide();
			$("#modalScoreContent0").hide();
			$("#panelScore0").hide();
			$("#panelScoreHead0").hide();
			$("#panelScoreSubject0").hide();
			$("#panelScoreBtnClose").hide();
			$("#panelScoreBody0").hide();
			$("#dummyKeepIdTopic0").hide();
			$("#panelScoreDescription0").hide();
			$("#panelScoreMessage0").hide();
			$("#panelScoreBtnGroup0").hide();
			$("#panelScoreBtnSubmit0").hide();
			$("#btnZero0").hide();
			$("#btnThree0").hide();
			$("#btnFive0").hide();
			$("#btnEight0").hide();
			$("#btnOne0").hide();

			//var keepTopicOfSubmit = 0;

			$("#topicList")
					.click(
							function() {
								$("#panelRealTime").hide();
								$("#accordion").empty();

								var data = {};
								data.examinerId = $("#examinerId")
										.attr('value');
								data.committeeId = $("#committeeId").attr(
										'value');
								data.courseId = $("#courseId").attr('value');

								var dataSend = JSON.stringify(data);
								$
										.ajax({
											url : "/EvaluateTool/application/evaluateBoardTopicList",
											type : 'POST',
											data : {
												data : dataSend
											},
											success : function(data) {
												var course = JSON.parse(data);
												createCollapse(course);
											},
											error : function(data, status, er) {
												alert("error: " + data
														+ " status: " + status
														+ " er:" + er);
											}
										});
							});
			function createCollapse(course) {
				var dummyPanel = 0;
				var dummyHead = 0;
				var dummyCollapse = 0;
				var dummyTitle = 0;
				var dummyBody = 0;
				var dummyNavpills = 0;
				var dummyList = 0;
				var dummyScore = 0;
				var dummyLink = 0;
				var dummyModalScore = 0;
				var dummyModalScoreDialog = 0;
				var dummyModalScoreContent = 0;
				var dummyPanelScore = 0;
				var dummyPanelScoreHead = 0;
				var dummyPanelScoreSubject = 0;
				var dummyPanelScoreBody = 0;
				var dummyPanelScoreId = 0;
				var dummyPanelScoreDescription = 0;
				var dummyPanelScoreMessage = 0;
				var dummyPanelScoreBtnGroup = 0;
				var dummyPanelScoreBtnSubmit = 0;
				var dummyBtnZero = 0;
				var dummyBtnThree = 0;
				var dummyBtnFive = 0;
				var dummyBtnEight = 0;
				var dummyBtnOne = 0;

				var genIdPanel = $("#panelCollapse" + dummyPanel);
				var genIdHead = $("#panelHeading" + dummyHead);
				var genIdTitle = $("#panelTitle" + dummyTitle);
				var genIdCollapse = $("#collapse" + dummyCollapse);
				var genIdBody = $("#panelBody" + dummyBody);
				var genIdNavpills = $("#navpills" + dummyNavpills);
				var genIdListNav = $("#listNavpills" + dummyList);
				var genIdScore = $("#spanScore" + dummyScore);
				var genIdLink = $("#linkToScore" + dummyLink);
				var genIdModalScore = $("#modalScore" + dummyModalScore);
				var genIdModalScoreDialog = $("#modalScoreDialog"
						+ dummyModalScoreDialog);
				var genIdModalScoreContent = $("#modalScoreContent"
						+ dummyModalScoreContent);
				var genIdPanelScore = $("#panelScore" + dummyPanelScore);
				var genIdPanelScoreHead = $("#panelScoreHead"
						+ dummyPanelScoreHead);
				var genIdPanelScoreSubject = $("#panelScoreSubject"
						+ dummyPanelScoreSubject);
				var genIdPanelScoreBody = $("#panelScoreBody"
						+ dummyPanelScoreBody);
				var genIdPanelScoreId = $("#dummyKeepIdTopic"
						+ dummyPanelScoreId);
				var genIdPanelScoreDescription = $("#panelScoreDescription"
						+ dummyPanelScoreDescription);
				var genIdPanelScoreMessage = $("#panelScoreMessage"
						+ dummyPanelScoreMessage);
				var genIdPanelScoreBtnGroup = $("#panelScoreBtnGroup"
						+ dummyPanelScoreBtnGroup);
				var genIdPanelScoreBtnSubmit = $("#panelScoreBtnSubmit"
						+ dummyPanelScoreBtnSubmit);
				var genIdBtnZero = $("#btnZero" + dummyBtnZero);
				var genIdBtnThree = $("#btnThree" + dummyBtnThree);
				var genIdBtnFive = $("#btnFive" + dummyBtnFive);
				var genIdBtnEight = $("#btnEight" + dummyBtnEight);
				var genIdBtnOne = $("#btnOne" + dummyBtnOne);

				var sizeTopic = 0;
				var numberOfTopic = 0;

				$
						.each(
								course,
								function(i, item) {
									item
											.forEach(function(subject) {
												var sendNameOfSubject = subject.name;
												$("#panelCollapse0")
														.clone()
														.attr(
																'id',
																'panelCollapse'
																		+ (++dummyPanel))
														.insertAfter(genIdPanel)
														.fadeIn('slow')
														.appendTo(
																$("#accordion"));
												$("#panelHeading0")
														.clone()
														.attr(
																'id',
																'panelHeading'
																		+ (++dummyHead))
														.attr(
																'href',
																'#collapse'
																		+ dummyHead)
														.attr(
																'data-target',
																'#collapse'
																		+ dummyHead)
														.insertAfter(genIdHead)
														.show()
														.appendTo(
																$("#panelCollapse"
																		+ dummyPanel));
												$("#panelTitle0")
														.clone()
														.attr(
																'id',
																'panelTitle'
																		+ (++dummyTitle))
														.text(sendNameOfSubject)
														.insertAfter(genIdTitle)
														.show()
														.appendTo(
																$("#panelHeading"
																		+ dummyHead));
												$("#collapse0")
														.clone()
														.attr(
																'id',
																'collapse'
																		+ (++dummyCollapse))
														.insertAfter(
																genIdCollapse)
														.appendTo(
																$("#panelCollapse"
																		+ dummyPanel));
												$("#panelBody0")
														.clone()
														.attr(
																'id',
																'panelBody'
																		+ (++dummyBody))
														.show()
														.appendTo(
																$("#collapse"
																		+ dummyCollapse));
												$("#navpills0")
														.clone()
														.attr(
																'id',
																'navpills'
																		+ (++dummyNavpills))
														.insertAfter(
																genIdNavpills)
														.show()
														.appendTo(
																$("#panelBody"
																		+ dummyBody));

												var index = 0;
												var keepTopic = item[sizeTopic].topic;
												for (index; index < keepTopic.length; ++index) {
													var sendId = keepTopic[index].id;
													var sendTitle = keepTopic[index].name;
													var sendDescription = keepTopic[index].description;
													var sendScore = keepTopic[index].score;

													$("#listNavpills0")
															.clone()
															.attr(
																	'id',
																	'listNavpills'
																			+ (++dummyList))
															.insertAfter(
																	genIdListNav)
															.show()
															.appendTo(
																	$("#navpills"
																			+ dummyNavpills));
													$("#linkToScore0")
															.clone()
															.attr(
																	'id',
																	'linkToScore'
																			+ (++dummyLink))
															.text(
																	sendTitle
																			+ " : "
																			+ sendDescription)
															.insertAfter(
																	genIdLink)
															.show()
															.appendTo(
																	$("#listNavpills"
																			+ dummyList));
													$("#spanScore0")
															.clone()
															.attr(
																	'id',
																	'spanScore'
																			+ (++dummyScore))
															.text(sendScore)
															.insertAfter(
																	genIdLink)
															.appendTo(
																	$("#linkToScore"
																			+ dummyLink));
													$("#dummyKeepIdTopic0")
															.clone()
															.attr(
																	'id',
																	'dummyKeepIdTopic'
																			+ (++dummyPanelScoreId))
															.text(sendId)
															.insertAfter(
																	genIdPanelScoreId)
															.hide()
															.appendTo(
																	$("#linkToScore"
																			+ dummyLink));

													$("#modalScore0")
															.clone()
															.attr(
																	'id',
																	'modalScore'
																			+ (++dummyModalScore))
															.insertAfter(
																	genIdModalScore);
													$("#modalScoreDialog0")
															.clone()
															.attr(
																	'id',
																	'modalScoreDialog'
																			+ (++dummyModalScoreDialog))
															.insertAfter(
																	genIdModalScoreDialog)
															.show()
															.appendTo(
																	$("#modalScore"
																			+ dummyModalScore));
													$("#modalScoreContent0")
															.clone()
															.attr(
																	'id',
																	'modalScoreContent'
																			+ (++dummyModalScoreContent))
															.insertAfter(
																	genIdModalScoreContent)
															.show()
															.appendTo(
																	$("#modalScoreDialog"
																			+ dummyModalScoreDialog));
													$("#panelScore0")
															.clone()
															.attr(
																	'id',
																	'panelScore'
																			+ (++dummyPanelScore))
															.insertAfter(
																	genIdPanelScore)
															.show()
															.appendTo(
																	$("#modalScoreContent"
																			+ dummyModalScoreContent));
													$("#panelScoreHead0")
															.clone()
															.attr(
																	'id',
																	'panelScoreHead'
																			+ (++dummyPanelScoreHead))
															.insertAfter(
																	genIdPanelScoreHead)
															.show()
															.appendTo(
																	$("#panelScore"
																			+ dummyPanelScore));
													$("#panelScoreSubject0")
															.clone()
															.attr(
																	'id',
																	'panelScoreSubject'
																			+ (++dummyPanelScoreSubject))
															.insertAfter(
																	genIdPanelScoreSubject)
															.show()
															.appendTo(
																	$("#panelScoreHead"
																			+ dummyPanelScoreHead));
													$("#panelScoreBtnClose")
															.clone()
															.show()
															.appendTo(
																	$("#panelScoreHead"
																			+ dummyPanelScoreHead));
													$("#panelScoreBody0")
															.clone()
															.attr(
																	'id',
																	'panelScoreBody'
																			+ (++dummyPanelScoreBody))
															.insertAfter(
																	genIdPanelScoreBody)
															.show()
															.appendTo(
																	$("#panelScore"
																			+ dummyPanelScore));
													$("#panelScoreDescription0")
															.clone()
															.attr(
																	'id',
																	'panelScoreDescription'
																			+ (++dummyPanelScoreDescription))
															.insertAfter(
																	genIdPanelScoreDescription)
															.show()
															.appendTo(
																	$("#panelScoreBody"
																			+ dummyPanelScoreBody));
													$("#panelScoreMessage0")
															.clone()
															.attr(
																	'id',
																	'panelScoreMessage'
																			+ (++dummyPanelScoreMessage))
															.insertAfter(
																	genIdPanelScoreMessage)
															.show()
															.appendTo(
																	$("#panelScoreBody"
																			+ dummyPanelScoreBody));
													$("#panelScoreBtnGroup0")
															.clone()
															.attr(
																	'id',
																	'panelScoreBtnGroup'
																			+ (++dummyPanelScoreBtnGroup))
															.insertAfter(
																	genIdPanelScoreBtnGroup)
															.show()
															.appendTo(
																	$("#panelScoreBody"
																			+ dummyPanelScoreBody));
													$("#btnZero0")
															.clone()
															.attr(
																	'id',
																	'btnZero'
																			+ (++dummyBtnZero))
															.insertAfter(
																	genIdBtnZero)
															.show()
															.appendTo(
																	$("#panelScoreBtnGroup"
																			+ dummyPanelScoreBtnGroup));
													$("#btnThree0")
															.clone()
															.attr(
																	'id',
																	'btnThree'
																			+ (++dummyBtnThree))
															.insertAfter(
																	genIdBtnThree)
															.show()
															.appendTo(
																	$("#panelScoreBtnGroup"
																			+ dummyPanelScoreBtnGroup));
													$("#btnFive0")
															.clone()
															.attr(
																	'id',
																	'btnFive'
																			+ (++dummyBtnFive))
															.insertAfter(
																	genIdBtnFive)
															.show()
															.appendTo(
																	$("#panelScoreBtnGroup"
																			+ dummyPanelScoreBtnGroup));
													$("#btnEight0")
															.clone()
															.attr(
																	'id',
																	'btnEight'
																			+ (++dummyBtnEight))
															.insertAfter(
																	genIdBtnEight)
															.show()
															.appendTo(
																	$("#panelScoreBtnGroup"
																			+ dummyPanelScoreBtnGroup));
													$("#btnOne0")
															.clone()
															.attr(
																	'id',
																	'btnOne'
																			+ (++dummyBtnOne))
															.insertAfter(
																	genIdBtnOne)
															.show()
															.appendTo(
																	$("#panelScoreBtnGroup"
																			+ dummyPanelScoreBtnGroup));
													$("#panelScoreBtnSubmit0")
															.clone()
															.attr(
																	'id',
																	'panelScoreBtnSubmit'
																			+ (++dummyPanelScoreBtnSubmit))
															.insertAfter(
																	genIdPanelScoreBtnSubmit)
															.show()
															.appendTo(
																	$("#panelScoreBody"
																			+ dummyPanelScoreBody));
													numberOfTopic++;
												}
												sizeTopic++;

											});

								});
				var keepTopicOfSubmit = 0;
				$("#submitOfAllTOpic").show();
				var indexCheck = 1
				for (indexCheck; indexCheck < numberOfTopic; indexCheck++) {
					if ($("#spanScore" + indexCheck).text() != '-') {
						keepTopicOfSubmit++;
					}
				}
				$("#submitTopic").text(keepTopicOfSubmit);
				$("#totalTopic").text(numberOfTopic);
			}
			$("#presenting").click(function() {
				$("#submitOfAllTOpic").hide();
				//$("#submitTopic").text(keepTopicOfSubmit);
				$("#accordion").empty();
				$("#panelRealTime").fadeIn('slow').appendTo($("#formBoard"));
			});

			$(".lialert").click(function() {
				$("#accordion").empty();
				$("#panelScore").fadeIn('slow').appendTo($("#formBoard"));
			});
			$("#btn0").click(function() {
				$('button').removeClass('active');
				$(this).addClass('active');
			});
			$("#btn03").click(function() {
				$('button').removeClass('active');
				$(this).addClass('active');
			});
			$("#btn05").click(function() {
				$('button').removeClass('active');
				$(this).addClass('active');
			});
			$("#btn08").click(function() {
				$('button').removeClass('active');
				$(this).addClass('active');
			});
			$("#btn1").click(function() {
				$('button').removeClass('active');
				$(this).addClass('active');
			});

			$("#buttonSubmit").click(
					function() {
						var dataForm = {};
						dataForm.message = $("textarea#message").val();
						dataForm.btnGroup = $("#panelButtonScore").find(
								"button.active").prop('value');
						;
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