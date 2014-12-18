<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Tool</title>
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

th {
	background-color: #FF8C00;
}

.tableBody {
	background-color: #FFD700;
}

a {
	cursor: pointer;
}

div {
	margin-right: 20px;
}

table>thead>tr>th {
	text-align: center;
}

table>tbody>tr>td {
	text-align: center;
}

.btn {
	background-color: #FF8C00;
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
						<li><a id="room">Room</a></li>
						<li><a id="logOut">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
		<input type="hidden" id="yourId" value="${yourId}" />
		
		<div id="menuReSize" class="col-md-2 column">
				<div id="menuleft" class="panel panel-default" style="background-color: #eee">		
					<a style="color: black ; text-decoration: none" id="summaryScore">
						<div class="panel-body" >
							Summary Score
						</div>
					</a>
					<a style="color: black ; text-decoration: none" id="summaryByTopic">
						<div class="panel-body" >
							Summary By Topic
						</div>
					</a>
				</div>
			</div>	

		<div id="formTable" class="row">
			<div id="setSizeWordExaminer" class="col-sm-1 col-md-1 col-sm-offset-2 col-md-offset-1">
				<label>Examiner</label>
			</div>
			<div id="setSizeTable" class="col-sm-2 col-md-2">
				<select id="pickExaminer"  data-width="100%">
					<option id="pleaseSelect">Please Select</option>
				</select>
			</div>

			<div id="setRoom" class="col-sm-1 col-md-1 col-sm-offset-2 col-md-offset-1">
				<label>Room</label>
			</div>
			<div id="setSizeRoom" class="col-sm-2 col-md-2">
				<select id="pickRoom"  data-width="100%">
					<option>Please Select</option>
				</select>
			</div>

			<div id="setSizeBtnSubmit" class="col-sm-1 col-md-1">
				<button id="buttonSumary" type="button" class="btn btn-default"
					onClick="javascript:showRoom($(this).parent('div').parent('div').children('#setSizeTable').children('select').val())">Sumary</button>
			</div>
		</div>
		<option id="option0"></option>
		<option id="optionPickRoom"></option>

<!-- ========================================================================== -->
	
	<div class="ui list">
			<div id="formBoard">
					<div class="panel-group" id="accordion"></div>
			</div>
			<!----------------------Model Collapse---------------------->
			<div id="panelCollapse0" class="panel panel-default"></div>
			<div id="panelHeading0" class="panel-heading" data-toggle="collapse" 
				data-parent="#accordion" href="#collapse0" data-target="#collapse0">
			</div>
			<h4 id="panelTitle0" class="panel-title"></h4>
			<span id="spanTopic0" class="badge " style="background-color: #585858;"></span>
			<span id="spanAverage0" class="badge pull-right" style="background-color: #585858;"></span>
			<label id="submitEachTopic0" style="margin: 2px;"></label> 
			<label id="totalEachTopic0" style="margin: 2px;"></label>
			
			<div id="collapse0" class="panel-collapse collapse"></div>
			<div id="panelBody0" class="panel-body"></div>
			<ul id="navpills0" class="nav nav-pills nav-stacked"></ul>
			<li id="listNavpills0" onClick="javascript:showModal(this);"></li>
			<a id="linkToScore0" ></a>
			<span id="spanScore0" class="badge pull-right"></span>


			<!----------------------Model Panel in Modal---------------------->
			<div id="panelScore0" class="panel panel-default"></div>
			<div id="panelScoreHead0" class="panel-heading"></div>
			<label id="panelScoreSubject0" class="textSubject"></label>
			<button id="panelScoreBtnClose" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<div id="panelScoreBody0" class="panel-body"></div>
			<span id="dummyKeepIdTopic0" class="textId"></span>
			<label id="panelScoreDescription0" class="textDescription"></label>
			<textarea id="panelScoreMessage0" class="form-control" rows="3" placeholder="No comment."></textarea>
			
			<!----------------------Model Panel in Modal---------------------->

			<!----------------------Model Modal---------------------->
			<div id="modalScore0" class="modal" style="width:600px;height:450px;"  tabindex="-1"
			aria-labelledby="myModalLabel" aria-hidden="true"></div>
			<div id="modalScoreDialog0" class="modal-dialog"></div>
	</div>

	<div style="width:100px;position:fixed;top:50%;left:0px;z-index:2" id="menulefthover"><img width="32px" height="30px" onclick="openmenuleft()" src="/EvaluateTool/resources/images/menu.png" id="imgmenuleft" class="glyphicon">
		<b hidden="" id="extendimgmenuleft" style="display: none;">Menu</b>
	</div>


	<script>
		$(function() {
			$("#panelCollapse0").hide();
			$("#panelHeading0").hide();
			$("#panelBody0").hide();
			$("#navpills0").hide();
			$("#listNavpills0").hide();
			$("#modalScoreDialog0").hide();
			$("#panelScore0").hide();
			$("#panelScoreHead0").hide();
			$("#panelScoreSubject0").hide();
			$("#panelScoreBtnClose").hide();
			$("#panelScoreBody0").hide();
			$("#dummyKeepIdTopic0").hide();
			$("#panelScoreDescription0").hide();
			$("#panelScoreMessage0").hide();
			$("#accordion").empty();

			var completedRoom = JSON.parse('${completeRoom}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			// var genRoomId = ("#roomId" + dummyRoomId);

			$.each(completedRoom, function(i, item) {
				item.forEach(function(room) {
					var nameAndLastName = room.examiner;
					var examinerId = room.examinerId;
					$("#option0").clone()
							.attr('id', 'option' + (++dummyOption)).text(
									nameAndLastName).val(examinerId)
							.insertAfter(genOptionId).show().appendTo(
									$("#pickExaminer"));
				});
			});

			var personId = $("#pickExaminer").val();
				$.ajax({
					url:"/EvaluateTool/application/getRoomName",
					type:"POST",
					data:{ personId:personId},

				success:function(data){
					var addRoom = JSON.parse(data);
					var dummyOption = 0;
					var dummyRoomId = 0;
					var genOptionId = ("#option" + dummyOption);
					// var genRoomId = ("#roomId" + dummyRoomId);

					$.each(addRoom, function(i, item) {
						item.forEach(function(data) {
						var courseId = data.courseId;
						var roomId = data.roomId;
						var name = data.roomName;
						var startTime = data.startTime;
						
							$("#optionPickRoom").clone()
									.attr('id', 'option' + (dummyOption++)).text(
											name+" : "+startTime).val(roomId)
									.insertAfter(genOptionId).show().appendTo(
											$("#pickRoom"));
						});
					});

				}
				});

		});

		$("#setSizeTable").change(function(index,element) {
			var personId = $("#pickExaminer").val();
	
				$.ajax({
					url:"/EvaluateTool/application/getRoomName",
					type:"POST",
					data:{ personId:personId},

				success:function(data){
					// alert(data);
					var addRoom = JSON.parse(data);
					var dummyOption = 0;
					var dummyRoomId = 0;
					var genOptionId = ("#option" + dummyOption);
					// var genRoomId = ("#roomId" + dummyRoomId);
					$("#pickRoom").empty();
					$("#pleaseSelect").remove();

					$.each(addRoom, function(i, item) {
						item.forEach(function(data) {
						var roomId = data.roomId;
						var name = data.roomName;
						var courseId = data.courseId;
						var startTime = data.startTime;
						
							$("#optionPickRoom").clone()
									.attr('id', 'option' + (dummyOption++)).text(
											name+" : "+startTime).val(roomId).attr('class',courseId)
									.insertAfter(genOptionId).show().appendTo(
											$("#pickRoom"));
						});
					});

					$("#buttonSumary").click(function(){
						var roomSelect = $("#pickRoom").val();
						var courseIdInroom = $("#pickRoom option").attr("class");
						var committeeId = $("#yourId").val();

						var dataCourse = {};
							dataCourse.roomId = roomSelect;
							dataCourse.examinerId = personId;
							dataCourse.committeeId = committeeId;
							dataCourse.courseId = courseIdInroom;
						var dataSend = JSON.stringify(dataCourse);
					$
					.ajax({
						url : "/EvaluateTool/application/summaryTopicList",
						type : 'POST',
						data : {
							data : dataSend
						},
						success : function(data) {
							// alert(data);

							var course = JSON.parse(data);
							createCollapse(course);		
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
								+ " er:" + er);
						}
					});
					});
				}
				});
		});

		$("#room").click(function() {
					var yourId = $("#yourId").attr('value');
					location.href = "/EvaluateTool/application/examinationRoom"
							+ "?yourId=" + encodeURIComponent(yourId)
							+ "&yourPosition="
							+ encodeURIComponent('${yourPosition}')
							+ "&yourName="
							+ encodeURIComponent('${name}')
							+ "&yourLastName="
							+ encodeURIComponent('${lastName}');
							
		});

		$("#logOut").click(function() {
			location.href = "/EvaluateTool/application/logIn";
		});

// =============================================================
			
		function createCollapse(course) {
			$("#panelCollapse0").empty();
			$("#panelHeading0").empty();
			$("#panelBody0").empty();
			$("#navpills0").empty();
			$("#listNavpills0").empty();
			$("#modalScoreDialog0").empty();
			$("#panelScore0").empty();
			$("#panelScoreHead0").empty();
			$("#panelScoreSubject0").empty();
			// $("#panelScoreBtnClose").empty();
			$("#panelScoreBody0").empty();
			$("#dummyKeepIdTopic0").empty();
			$("#panelScoreDescription0").empty();
			$("#panelScoreMessage0").empty();
			$("#accordion").empty();

				var countOfSpanScore = 1;
				var dummyPanel = 0;
				var dummyHead = 0;
				var dummyCollapse = 0;
				var dummyTitle = 0;
				var dummyCountScoreEachTopic = 0;
				var dummyAverageScoreEachTopic = 0;
				var dummySubmitEachTopic = 0;
				var dummyTotalEachTopic = 0;
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
				var genIdCountScoreEachTopic = $("#spanTopic"
					+ dummyCountScoreEachTopic);
				var genIdAverageScoreEachTopic = $("#spanAverage"
					+ dummyAverageScoreEachTopic);
				var genIdSubmitEachTopic = $("#submitEachTopic"
					+ dummySubmitEachTopic);
				var genIdTotalEachTopic = $("#totalEachTopic"
					+ dummyTotalEachTopic);
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
//									alert( subject.averageScore);
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
							$("#spanTopic0")
							.clone()
							.attr(
								'id',
								'spanTopic'
								+ (++dummyCountScoreEachTopic))
							.insertAfter(
								genIdCountScoreEachTopic)
							.show()
							.appendTo(
								$("#panelTitle"
									+ dummyTitle));
							$("#spanAverage0")
							.clone()
							.attr(
								'id',
								'spanAverage'
								+ (++dummyAverageScoreEachTopic))
							.insertAfter(
								genIdAverageScoreEachTopic)
							.show()
							.appendTo(
								$("#panelTitle"
									+ dummyTitle));
							$("#spanAverage"+dummyAverageScoreEachTopic)
									.text(subject.averageScore+"%");
							$("#submitEachTopic0")
							.clone()
							.attr(
								'id',
								'submitEachTopic'
								+ (++dummySubmitEachTopic))
							.insertAfter(
								genIdSubmitEachTopic)
							.show()
							.appendTo(
								$("#spanTopic"
									+ dummyCountScoreEachTopic));
							$("#totalEachTopic0")
							.clone()
							.attr(
								'id',
								'totalEachTopic'
								+ (++dummyTotalEachTopic))
							.insertAfter(
								genIdTotalEachTopic)
							.show()
							.appendTo(
								$("#spanTopic"
									+ dummyCountScoreEachTopic));
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

							var numberEachOfTopic = 0;
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
								$("#panelScoreMessage0").attr('disabled',true)
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
								// $("#panelScoreBtnGroup0")
								// .clone()
								// .attr(
								// 	'id',
								// 	'panelScoreBtnGroup'
								// 	+ (++dummyPanelScoreBtnGroup))
								// .insertAfter(
								// 	genIdPanelScoreBtnGroup)
								// .show()
								// .appendTo(
								// 	$("#panelScoreBody"
								// 		+ dummyPanelScoreBody));

								// checkScoreFromBase(
								// 	sendScore,
								// 	dummyPanelScoreBtnGroup);

								numberOfTopic++;
								numberEachOfTopic++;
							}
							sizeTopic++;
							var indexCheckTopic = 0;
							var keepEachTopicOfSubmit = 0;
							for (indexCheckTopic; indexCheckTopic < numberEachOfTopic; indexCheckTopic++) {
								if ($(
									"#spanScore"
									+ countOfSpanScore)
									.text() != '-') {
									keepEachTopicOfSubmit++;
									}
							countOfSpanScore++;
							}

							$("#submitEachTopic" + sizeTopic)
							.text(
								keepEachTopicOfSubmit);
							$("#totalEachTopic" + sizeTopic)
							.text(
								 " / "
								+ "  "
								+ numberEachOfTopic);
					});

});		
}

	function showModal(element) {
		count = (element.id).replace(/[^\d.]/g, '');
		$("#modalScore" + count).modal("show");
				var textSubject = $("#" + element.id).parent('ul').parent('div')
					.parent('div').parent('div').children('div').children('h4')
					.clone().children('span').remove().end().text();
				var textDescription = $("#" + element.id).children('a').clone()
					.children('span').remove().end().text();

				$(".textSubject").text(textSubject);
				$(".textDescription").text(textDescription);
	}

	$("#summaryScore").click(
				function() {
					//var yourId = $("#committeeId").attr('value');
						location.href = "/EvaluateTool/application/report"
						+ "?yourId=" 
						+ encodeURIComponent('${yourId}')
						+ "&yourPosition="
						+ encodeURIComponent('${yourPosition}')
						+ "&yourName="
						+ encodeURIComponent('${nameCommittee}')
						+ "&yourLastName="
						+ encodeURIComponent('${lastNameCommittee}');
				});

		$("#summaryByTopic").click(
				function() {
					//var yourId = $("#committeeId").attr('value');
						location.href = "/EvaluateTool/application/summaryByTopic"
						+ "?yourId=" 
						+ encodeURIComponent('${yourId}')
						+ "&yourPosition="
						+ encodeURIComponent('${yourPosition}')
						+ "&yourName="
						+ encodeURIComponent('${nameCommittee}')
						+ "&yourLastName="
						+ encodeURIComponent('${lastNameCommittee}');
				});

		var i=0
			function openmenuleft(){
				if(i==0){
					$("#menuleft").hide();
					// $("#menuReSize").removeClass("col-md-2 column");
					$("#menuReSize2").removeClass("col-md-10 column");
					$("#menuReSize3").removeClass("col-sm-5 col-md-9 col-sm-offset-3 col-md-offset-0");
					// $("#menuReSize	").addClass("col-md-0 column");					
					$("#menuReSize2").addClass("col-md-12 column");
					$("#menuReSize3").addClass("col-sm-5 col-md-10 col-sm-offset-3 col-md-offset-0");	
					i++;
				}else{
					$("#menuleft").slideDown(800);
					// $("#menuR	eSize").removeClass("col-md-0 column");					
					$("#menuReSize2").removeClass("col-md-12 column");
					$("#menuReSize3").removeClass("col-sm-5 col-md-10 col-sm-offset-3 col-md-offset-0");
					// $("#menuReSiz	e").addClass("col-md-2 column");
					$("#menuReSize2").addClass("col-md-10 column");
					$("#menuReSize3").addClass("col-sm-5 col-md-9 col-sm-offset-3 col-md-offset-0");
					i--;
				}
				
			}

			$("#imgmenuleft").mouseover(function(){
					$("#extendimgmenuleft").slideToggle(300);
				});
			$("#imgmenuleft").mouseout(function(){
				$("#extendimgmenuleft").slideToggle(300);
			});

	</script>
</body>
</html>
