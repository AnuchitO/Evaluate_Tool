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
	background-color: #FF8C00;
}

.navbar-default>.container-fluid>.navbar-header>.navbar-brand {
	color: #000000;
}

.navbar-default>.container-fluid>.navbar-collapse>.navbar-nav>li>a {
	color: #000000;
}

.panel-default>.panel-heading {
	background-color: #FF8C00;
	color: #000000;
}

.panel-default>.panel-body {
	
}

.panel-collapse>.panel-body>.nav-pills>li>a {
	background-color: #FFD700;
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
						<!-- <li><a id="presenting">Presenting</a></li>
						<li><a id="topicList">Topic List</a></li> -->
					</ul>
				</div>
			</div>
		</div>

		<!-- <button id="buttonCreate" type="button" class="btn btn-primary">Create
			Panel</button>
		<button id="buttonDelete" type="button" class="btn btn-primary">Delete
			Panel</button> -->

		<label id="examinerId" value="${idExaminer}">Examiner :
			${nameExaminer} ${lastNameExaminer}</label> / <label id="committeeId"
			value="${idCommittee}">Committee : ${nameCommittee}
			${lastNameCommittee}</label> / <label id="courseId" value="1">Course
			: SDT</label>
		<div id="formBoard">
			<span id="submitOfAllTOpic" class="badge pull-right">Total <label
				id="submitTopic" style="margin: 2px;"></label> / <label
				id="totalTopic" style="margin: 2px;"></label></span> <br> <br>
			<div class="panel-group" id="accordion"></div>
		</div>

		<div id="panelRealTime" class="panel panel-default">
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

				<button id="buttonSubmit" type="button" class="btn btn-default"
					style="margin: 20px; background-color: #FF8C00; color: #FFFFFF;">Submit</button>
			</div>
		</div>

		<!----------------------Model Collapse---------------------->
		<div id="panelCollapse0" class="panel panel-default"></div>
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
		<div id="panelScore0" class="panel panel-default"></div>
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
			<button id="btnZero0" type="button" class="btn btn-default" value="0"
				onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 25px;">0</button>
			<button id="btnThree0" type="button" class="btn btn-default"
				value="0.3"
				onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.3</button>
			<button id="btnFive0" type="button" class="btn btn-default"
				value="0.5"
				onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.5</button>
			<button id="btnEight0" type="button" class="btn btn-default"
				value="0.8"
				onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.8</button>
			<button id="btnOne0" type="button" class="btn btn-default" value="1"
				onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
				style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 25px;">1</button>
		</div>
		<button id="panelScoreBtnSubmit0" type="button"
			class="btn btn-default"
			onClick="javascript:sendDetailScoreOfTopic(this);"
			style="margin: 20px; background-color: #FF8C00; color: #FFFFFF;">Submit</button>
		<!----------------------Model Panel in Modal---------------------->

		<!----------------------Model Modal---------------------->
		<div class="modal fade" id="modalScore0" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"></div>
		<div id="modalScoreDialog0" class="modal-dialog"></div>
		<!----------------------Model Modal---------------------->
		<div id="loader" align="center">
			<img src="resources/images/ajax-loader.gif" alt="" width="10%"
				height="10%"
		</div>
		<div id="alertChooseScore" class="alert alert-warning" role="alert"
			style="margin-top: 20px;">
			<strong>Warning! </strong>Please choose Score.
		</div>
		<input type="hidden" id="score" value="" />
	</div>

	<script>
		function showModal(element) {
			$("#alertChooseScore").hide();
			count = (element.id).replace(/[^\d.]/g, '');
			if ($("#spanScore" + count).text() == '-') {
				$("#panelScoreMessage" + count).val('');
				$("#btnZero" + count).removeClass('active');
				$("#btnThree" + count).removeClass('active');
				$("#btnFive" + count).removeClass('active');
				$("#btnEight" + count).removeClass('active');
				$("#btnOne" + count).removeClass('active');
				$("#panelScoreBtnSubmit" + count).removeAttr("data-dismiss");
			} else {
				var checkScore = $("#spanScore" + count).text();
				if (checkScore == "0") {
					$("#btnThree" + count).removeClass('active');
					$("#btnFive" + count).removeClass('active');
					$("#btnEight" + count).removeClass('active');
					$("#btnOne" + count).removeClass('active');
					$("#btnZero" + count).addClass('active');
				} else if (checkScore == "0.3") {
					$("#btnZero" + count).removeClass('active');
					$("#btnFive" + count).removeClass('active');
					$("#btnEight" + count).removeClass('active');
					$("#btnOne" + count).removeClass('active');
					$("#btnThree" + count).addClass('active');
				} else if (checkScore == "0.5") {
					$("#btnZero" + count).removeClass('active');
					$("#btnThree" + count).removeClass('active');
					$("#btnEight" + count).removeClass('active');
					$("#btnOne" + count).removeClass('active');
					$("#btnFive" + count).addClass('active');
				} else if (checkScore == "0.8") {
					$("#btnZero" + count).removeClass('active');
					$("#btnThree" + count).removeClass('active');
					$("#btnFive" + count).removeClass('active');
					$("#btnOne" + count).removeClass('active');
					$("#btnEight" + count).addClass('active');
				} else {
					$("#btnZero" + count).removeClass('active');
					$("#btnThree" + count).removeClass('active');
					$("#btnFive" + count).removeClass('active');
					$("#btnEight" + count).removeClass('active');
					$("#btnOne" + count).addClass('active');
				}
			}
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
		function sendDetailScoreOfTopic(buttonSubmit) {
			count = (buttonSubmit.id).replace(/[^\d.]/g, '');
			var textMessage = $("textarea#panelScoreMessage" + count).val();
			var textScore = $("#panelScoreBtnGroup" + count).find(
					"button.active").prop('value');
			var textId = $("#dummyKeepIdTopic" + count).text();
			if (textScore == null) {
				$("#alertChooseScore").show().appendTo(
						$("#panelScoreBody" + count));
			} else {

				var detailScoreOfTopic = {};
				detailScoreOfTopic.examinerId = $("#examinerId").attr('value');
				detailScoreOfTopic.committeeId = $("#committeeId")
						.attr('value');
				detailScoreOfTopic.topicId = textId;
				detailScoreOfTopic.score = textScore;
				detailScoreOfTopic.comment = textMessage;

				var dataDetailScoreOfTopic = JSON.stringify(detailScoreOfTopic);
				$.ajax({
					url : "/EvaluateTool/application/scoring",
					type : 'POST',
					data : {
						dataDetailScoreOfTopic : dataDetailScoreOfTopic
					},
					success : function(data) {

					},
					error : function(data, status, er) {
						alert("error: " + data + " status: " + status + " er:"
								+ er);
					}
				});

				if ($("#spanScore" + count).text() == '-') {
					var keepOriginalSubmitTopic = $("#submitTopic").text();
					keepOriginalSubmitTopic++;
					$("#submitTopic").text(keepOriginalSubmitTopic);
				}
				$("#spanScore" + count).text(textScore);
			}

		}
		function setScore(btnScore, groupScore) {
			$("#" + groupScore + '>' + 'button').removeClass('active');
			$("#" + btnScore).addClass('active');
			$("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');

		}

		function checkScoreFromBase(score, count) {
			var dummyBtnZero = count - 1;
			var dummyBtnThree = count - 1;
			var dummyBtnFive = count - 1;
			var dummyBtnEight = count - 1;
			var dummyBtnOne = count - 1;
			var dummyPanelScoreBtnSubmit = count - 1;
			var genIdBtnZero = $("#btnZero" + dummyBtnZero);
			var genIdBtnThree = $("#btnThree" + dummyBtnThree);
			var genIdBtnFive = $("#btnFive" + dummyBtnFive);
			var genIdBtnEight = $("#btnEight" + dummyBtnEight);
			var genIdBtnOne = $("#btnOne" + dummyBtnOne);
			var genIdPanelScoreBtnSubmit = $("#panelScoreBtnSubmit"
					+ dummyPanelScoreBtnSubmit);

			$("#btnZero0").clone().attr('id', 'btnZero' + (++dummyBtnZero))
					.insertAfter(genIdBtnZero).show().appendTo(
							$("#panelScoreBtnGroup" + count));
			$("#btnThree0").clone().attr('id', 'btnThree' + (++dummyBtnThree))
					.insertAfter(genIdBtnThree).show().appendTo(
							$("#panelScoreBtnGroup" + count));
			$("#btnFive0").clone().attr('id', 'btnFive' + (++dummyBtnFive))
					.insertAfter(genIdBtnFive).show().appendTo(
							$("#panelScoreBtnGroup" + count));
			$("#btnEight0").clone().attr('id', 'btnEight' + (++dummyBtnEight))
					.insertAfter(genIdBtnEight).show().appendTo(
							$("#panelScoreBtnGroup" + count));
			$("#btnOne0").clone().attr('id', 'btnOne' + (++dummyBtnOne))
					.insertAfter(genIdBtnOne).show().appendTo(
							$("#panelScoreBtnGroup" + count));
			$("#panelScoreBtnSubmit0").clone().attr('id',
					'panelScoreBtnSubmit' + (++dummyPanelScoreBtnSubmit))
					.insertAfter(genIdPanelScoreBtnSubmit).show().appendTo(
							$("#panelScoreBody" + count));

			if (score == 0) {
				$("#btnZero" + count).addClass('active');
				$("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');

			} else if (score == 0.3) {
				$("#btnThree" + count).addClass('active');
				$("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
			} else if (score == 0.5) {
				$("#btnFive" + count).addClass('active');
				$("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
			} else if (score == 0.8) {
				$("#btnEight" + count).addClass('active');
				$("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
			} else if (score == 1) {
				$("#btnOne" + count).addClass('active');
				$("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
			} else {

			}
		}
		$(function() {
			var $loading = $('#loader').hide();
			$(document).ajaxStart(function() {
				$loading.show();
			}).ajaxStop(function() {
				$loading.hide();
			});
			$("#alertChooseScore").hide();
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
			$("#panelRealTime").hide();
			$("#accordion").empty();

			var data = {};
			data.examinerId = $("#examinerId").attr('value');
			data.committeeId = $("#committeeId").attr('value');
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
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
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
													var sendComment = keepTopic[index].comment;
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
																	$("#modalScoreDialog"
																			+ dummyModalScoreDialog));
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
															.text(sendComment)
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

													checkScoreFromBase(
															sendScore,
															dummyPanelScoreBtnGroup);

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
			//$("#topicList").click(function() {

			//});
			//$("#presenting").click(function() {
			//	$("#submitOfAllTOpic").hide();
			//	$("#accordion").empty();
			//	$("#panelRealTime").fadeIn('slow').appendTo($("#formBoard"));
			//});

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