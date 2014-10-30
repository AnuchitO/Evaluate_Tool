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

#panelScoreBtnSubmit {
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
		<h4 id="panelTitle0" class="panel-title">
		</h4>
		<div id="collapse0" class="panel-collapse collapse"></div>
		<div id="panelBody0" class="panel-body"></div>
		<ul id="navpills0" class="nav nav-pills nav-stacked">
		</ul>
		<li id="listNavpills0" class="lialert"
			onClick="javascript:showModal(this);"></li><a id="linkToScore0"
			href="#"></a>
		<span id="spanScore0" class="badge pull-right"></span>
		<!----------------------Model Collapse---------------------->

		<!----------------------Model Panel in Modal---------------------->
		<div id="panelScore0" class="panel panel-primary"></div>
		<div id="panelScoreHead0" class="panel-heading"></div>
		<label id="panelScoreSubject0" class="textSubject"></label>
		<button id="panelScoreBtnClose" type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<div id="panelScoreBody0" class="panel-body"></div>
		<label id="panelScoreDescription0" class="textDescription"></label>
		<textarea id="panelScoreMessage0" class="form-control" rows="3"
			placeholder="comment here"></textarea>
		<div id="panelScoreBtnGroup0" class="btn-group">
			<button id="btn0" type="button" class="btn btn-default" value="0">0</button>
			<button id="btn03" type="button" class="btn btn-default" value="0.3">0.3</button>
			<button id="btn05" type="button" class="btn btn-default" value="0.5">0.5</button>
			<button id="btn08" type="button" class="btn btn-default" value="0.8">0.8</button>
			<button id="btn1" type="button" class="btn btn-default" value="1">1</button>
		</div>
		<button id="panelScoreBtnSubmit" type="button" class="btn btn-primary">Submit</button>
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
			count=element.id.slice(-1);
			$("#modalScore"+count).modal("show");
			var textDescription = $("#"+element.id).children('a').text();
			var textDescriptionDone = textDescription.split("0",1);
			var textSubject = $("#"+element.id).parent('ul').parent('div').parent('div').parent('div').children('div').children('h4').text();
			$(".textSubject").text(textSubject);
			$(".textDescription").text(textDescriptionDone);
		}
		$(function() {
			$("#panelRealTime").hide();
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
			$("#panelScoreDescription0").hide();
			$("#panelScoreMessage0").hide();
			$("#panelScoreBtnGroup0").hide();
			$("#panelScoreBtnSubmit").hide();
			
			$("#topicList").click(function() {
				$("#panelRealTime").hide();
				$("#accordion").empty();
				
				var data = {};
				data.examinerId = $("#examinerId").attr('value');
				data.committeeId = $("#committeeId").attr('value');
				data.courseId = $("#courseId").attr('value');

				var dataSend = JSON.stringify(data);
				$.ajax({
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
			});
			function createCollapse(course){
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
				var dummyPanelScoreDescription = 0;
				var dummyPanelScoreMessage = 0;
				var dummyPanelScoreBtnGroup = 0;
				
				var genIdPanel = $("#panelCollapse"+ dummyPanel);
				var genIdHead = $("#panelHeading" + dummyHead);
				var genIdTitle = $("#panelTitle" + dummyTitle);
				var genIdCollapse = $("#collapse"+ dummyCollapse);
				var genIdBody = $("#panelBody" + dummyBody);
				var genIdNavpills = $("#navpills"+ dummyNavpills);
				var genIdListNav = $("#listNavpills"+ dummyList);
				var genIdScore = $("#spanScore"+ dummyScore);
				var genIdLink = $("#linkToScore" + dummyLink);
				var genIdModalScore = $("#modalScore" + dummyModalScore);
				var genIdModalScoreDialog = $("#modalScoreDialog" + dummyModalScoreDialog);
				var genIdModalScoreContent = $("#modalScoreContent" + dummyModalScoreContent);
				var genIdPanelScore = $("#panelScore" + dummyPanelScore);
				var genIdPanelScoreHead = $("#panelScoreHead" + dummyPanelScoreHead);
				var genIdPanelScoreSubject = $("#panelScoreSubject" + dummyPanelScoreSubject);
				var genIdPanelScoreBody = $("#panelScoreBody" + dummyPanelScoreBody);
				var genIdPanelScoreDescription = $("#panelScoreDescription" + dummyPanelScoreDescription);
				var genIdPanelScoreMessage = $("#panelScoreMessage" + dummyPanelScoreMessage);
				var genIdPanelScoreBtnGroup = $("#panelScoreBtnGroup" + dummyPanelScoreBtnGroup);
				var sizeTopic = 0;
				
				$.each(course,function(i, item) {
					item.forEach(function(subject) {
						var sendNameOfSubject = subject.name;
							$("#panelCollapse0").clone().attr('id','panelCollapse'+ (++dummyPanel))
											.insertAfter(genIdPanel).fadeIn('slow')
											.appendTo($("#accordion"));
							$("#panelHeading0").clone().attr('id','panelHeading'+ (++dummyHead))
											.attr('href','#collapse'+ dummyHead)
											.attr('data-target','#collapse'+ dummyHead)
											.insertAfter(genIdHead).show()
											.appendTo($("#panelCollapse"+ dummyPanel));
							$("#panelTitle0").clone().attr('id','panelTitle'+ (++dummyTitle))
											.text(sendNameOfSubject).insertAfter(genIdTitle).show()
											.appendTo($("#panelHeading"+ dummyHead));
							$("#collapse0").clone().attr('id','collapse'+ (++dummyCollapse))
											.insertAfter(genIdCollapse)
											.appendTo($("#panelCollapse"+ dummyPanel));
							$("#panelBody0").clone().attr('id','panelBody'+ (++dummyBody))
											.show().appendTo($("#collapse"+ dummyCollapse));
							$("#navpills0").clone().attr('id','navpills'+ (++dummyNavpills))
											.insertAfter(genIdNavpills).show()
											.appendTo($("#panelBody"+ dummyBody));
							
							var index = 0;
							var keepTopic = item[sizeTopic].topic;
							for (index; index < keepTopic.length; ++index) {
								var sendTitle = keepTopic[index].name;
								var sendDescription = keepTopic[index].description;
								var sendScore = keepTopic[index].score;
								$("#listNavpills0").clone().attr('id','listNavpills'+ (++dummyList))
												.insertAfter(genIdListNav).show()
												.appendTo($("#navpills"+ dummyNavpills));
								$("#linkToScore0").clone().attr('id','linkToScore'+ (++dummyLink))
												.text(sendTitle+ " : "+ sendDescription)
												.insertAfter(genIdLink).show()
												.appendTo($("#listNavpills"+ dummyList));
								$("#spanScore0").clone().attr('id','spanScore'+ (++dummyScore))
												.text(sendScore).insertAfter(genIdLink)
												.appendTo($("#linkToScore"+ dummyLink));
								
								$("#modalScore0").clone().attr('id','modalScore'+ (++dummyModalScore))
												.insertAfter(genIdModalScore);
								$("#modalScoreDialog0").clone().attr('id','modalScoreDialog'+ (++dummyModalScoreDialog))
												.insertAfter(genIdModalScoreDialog).show()
												.appendTo($("#modalScore"+dummyModalScore));
								$("#modalScoreContent0").clone().attr('id','modalScoreContent'+ (++dummyModalScoreContent))
												.insertAfter(genIdModalScoreContent).show()
												.appendTo($("#modalScoreDialog"+dummyModalScoreDialog));
								$("#panelScore0").clone().attr('id','panelScore'+ (++dummyPanelScore))
												.insertAfter(genIdPanelScore).show()
												.appendTo($("#modalScoreContent"+ dummyModalScoreContent));
								$("#panelScoreHead0").clone().attr('id','panelScoreHead'+ (++dummyPanelScoreHead))
												.insertAfter(genIdPanelScoreHead).show()
												.appendTo($("#panelScore"+ dummyPanelScore));
								$("#panelScoreSubject0").clone().attr('id','panelScoreSubject'+ (++dummyPanelScoreSubject))
												.insertAfter(genIdPanelScoreSubject).show()
												.appendTo($("#panelScoreHead"+ dummyPanelScoreHead));
								$("#panelScoreBtnClose").clone().show().appendTo($("#panelScoreHead"+ dummyPanelScoreHead));
								$("#panelScoreBody0").clone().attr('id','panelScoreBody'+ (++dummyPanelScoreBody))
												.insertAfter(genIdPanelScoreBody).show()
												.appendTo($("#panelScore"+ dummyPanelScore));
								$("#panelScoreDescription0").clone().attr('id','panelScoreDescription'+ (++dummyPanelScoreDescription))
												.insertAfter(genIdPanelScoreDescription).show()
												.appendTo($("#panelScoreBody"+ dummyPanelScoreBody));
								$("#panelScoreMessage0").clone().attr('id','panelScoreMessage'+ (++dummyPanelScoreMessage))
												.insertAfter(genIdPanelScoreMessage).show()
												.appendTo($("#panelScoreBody"+ dummyPanelScoreBody));
								$("#panelScoreBtnGroup0").clone().attr('id','panelScoreBtnGroup'+ (++dummyPanelScoreBtnGroup))
												.insertAfter(genIdPanelScoreBtnGroup).show()
												.appendTo($("#panelScoreBody"+ dummyPanelScoreBody));
								$("#panelScoreBtnSubmit").clone().show().appendTo($("#panelScoreBody"+ dummyPanelScoreBody));
							}
							sizeTopic++;
					});
				});
			}
			$("#presenting").click(function() {
				$("#accordion").empty();
				$("#panelRealTime").fadeIn('slow').appendTo($("#formBoard"));
			});
			
			$(".lialert").click(function() {
				$("#accordion").empty();
				$("#panelScore").fadeIn('slow').appendTo($("#formBoard"));
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