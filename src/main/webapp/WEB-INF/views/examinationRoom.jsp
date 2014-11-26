<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Tool</title>
</head>
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

.btn {
	background-color: #FF8C00;
}

.bg-default {
	background-color: #FF8C00;
}

.panel-body {
	background-color: #FFD700;
}

a {
	cursor: pointer;
}
</style>
<body>
	<input type="hidden" id="yourId" value="${yourId}" />
	<input type="hidden" id="yourPosition" value="${yourPosition}" />
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
	<div id="container" class="row">
		<div id="setSizeContainer" class="col-sm-12 col-md-12"></div>
	</div>
	<div id="setSizeCard0" class="col-sm-6 col-md-5"></div>
	<div id="room0" class="panel panel-default"></div>
	<div id="body0" class="panel-body"></div>
	<div id="setSizeProgress0" class="col-sm-4 col-md-4"></div>
	<div id="setSizeDetail0" class="col-sm-12 col-md-12"></div>
	<div id="roomName0"></div>
	<input type="hidden" id="roomId0" value="" />
	<div id="courseName0"></div>
	<input type="hidden" id="courseId0" value="" />
	<div id="roomDescription0"></div>
	<div id="roomTime0"></div>
	<input type="hidden" id="examinerId0" value="" />
	<div id="examiner0"></div>
	<input type="hidden" id="modulatorId0" value="" />
	<div id="modulator0"></div>
	<div id="roomStatus0"></div>
	<div id="setHalfSizeOne0" class="col-sm-6 col-md-6"></div>
	<div id="setHalfSizeTwo0" class="col-sm-6 col-md-6"></div>
	<button id="btnExaminer0" type="button"
		class="btn btn-default examiner"
		onClick="javascript:sendIdExaminer(this)">Examiner</button>
	<button id="btnCommittee0" type="button"
		class="btn btn-default committee" onClick="javascript:sendId(this)">Committee</button>

	<script>
		$(function() {
			$("#setSizeCard0").hide();
			$("#room0").hide();
			$("#body0").hide();
			$("#setSizeProgress0").hide();
			$("#setSizeDetail0").hide();
			$("#roomName0").hide();
			$("#courseName0").hide();
			$("#roomDescription0").hide();
			$("#roomTime0").hide();
			$("#examiner0").hide();
			$("#modulator0").hide();
			$("#roomStatus0").hide();
			$("#setHalfSizeOne0").hide();
			$("#setHalfSizeTwo0").hide();
			$("#btnExaminer0").hide();
			$("#btnCommittee0").hide();

			var allRoom = JSON.parse('${room}');
			var dummySetSizeCard = 0;
			var dummyRoom = 0;
			var dummyBody = 0;
			var dummyProgress = 0;
			var dummyDetail = 0;
			var dummyRoomId = 0;
			var dummyRoomName = 0;
			var dummyCourseId = 0;
			var dummyCourseName = 0;
			var dummyRoomDescription = 0;
			var dummyTime = 0;
			var dummyExaminerId = 0;
			var dummyExaminer = 0;
			var dummyModulatorId = 0;
			var dummyModulator = 0;
			var dummyRoomStatus = 0;
			var dummySetHalfSizeOne = 0;
			var dummySetHalfSizeTwo = 0;
			var dummyBtnExaminer = 0;
			var dummyBtnCommittee = 0;

			var genSetSizeCard = ("#setSizeCard" + dummySetSizeCard);
			var genRoom = ("#room" + dummyRoom);
			var genBody = ("#body" + dummyBody);
			var genProgress = ("#setSizeProgress" + dummyProgress);
			var genDetail = ("#setSizeDetail" + dummyDetail);
			var genRoomId = ("#roomId" + dummyRoomId);
			var genRoomName = ("#roomName" + dummyRoomName);
			var genCourseId = ("#courseId" + dummyCourseId);
			var genCourseName = ("#courseName" + dummyCourseName);
			var genRoomDescription = ("#roomDescription" + dummyRoomDescription);
			var genTime = ("#roomTime" + dummyTime);
			var genExaminerId = ("#examinerId" + dummyExaminerId);
			var genExaminer = ("#examiner" + dummyExaminer);
			var genModulatorId = ("#modulatorId" + dummyModulatorId);
			var genModulator = ("#modulator" + dummyModulator);
			var genRoomStatus = ("#roomStatus" + dummyRoomStatus);
			var genSetHalfSizeOne = ("#setHalfSizeOne" + dummySetHalfSizeOne);
			var genSetHalfSizeTwo = ("#setHalfSizeTwo" + dummySetHalfSizeTwo);
			var genBtnExaminer = ("#btnExaminer" + dummyBtnExaminer);
			var genBtnCommittee = ("#btnCommittee" + dummyBtnCommittee);

			$
					.each(
							allRoom,
							function(i, item) {

								item
										.forEach(function(room) {
											var roomId = room.id;
											var roomName = room.name;
											var roomCourseId = room.courseId;
											var roomCourseName = room.courseName;
											var roomDescription = room.description;
											var roomStartTime = room.startTime;
											var roomEndTime = room.endTime;
											var roomExaminerId = room.examinerId;
											var roomExaminer = room.examiner;
											var roomModulatorId = room.modulatorId;
											var roomModulator = room.modulator;
											var roomStatus = room.status;

											$("#setSizeCard0")
													.clone()
													.attr(
															'id',
															'setSizeCard'
																	+ (++dummySetSizeCard))
													.insertAfter(genSetSizeCard)
													.show()
													.appendTo(
															$("#setSizeContainer"));
											$("#room0")
													.clone()
													.attr(
															'id',
															'room'
																	+ (++dummyRoom))
													.insertAfter(genRoom)
													.fadeIn('slow')
													.appendTo(
															$("#setSizeCard"
																	+ dummySetSizeCard));
											$("#body0")
													.clone()
													.attr(
															'id',
															'body'
																	+ (++dummyBody))
													.insertAfter(genBody)
													.show()
													.appendTo(
															$("#room"
																	+ dummyRoom));
											//$("#setSizeProgress0")
											//		.clone()
											//		.attr(
											//				'id',
											//				'setSizeProgress'
											//						+ (++dummyProgress))
											//		.insertAfter(genProgress)
											//		.show()
											//		.appendTo(
											//				$("#body"
											//						+ dummyRoom));
											$("#setSizeDetail0")
													.clone()
													.attr(
															'id',
															'setSizeDetail'
																	+ (++dummyDetail))
													.insertAfter(genDetail)
													.show()
													.appendTo(
															$("#body"
																	+ dummyRoom));
											$("#roomId0")
													.clone()
													.attr(
															'id',
															'roomId'
																	+ (++dummyRoomId))
													.val(roomId)
													.insertAfter(genRoomId)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#roomName0")
													.clone()
													.attr(
															'id',
															'roomName'
																	+ (++dummyRoomName))
													.text(roomName)
													.insertAfter(genRoomName)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#courseId0")
													.clone()
													.attr(
															'id',
															'courseId'
																	+ (++dummyCourseId))
													.val(roomCourseId)
													.insertAfter(genCourseId)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#courseName0")
													.clone()
													.attr(
															'id',
															'courseName'
																	+ (++dummyCourseName))
													.text(roomCourseName)
													.insertAfter(genCourseName)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#roomDescription0")
													.clone()
													.attr(
															'id',
															'roomDescription'
																	+ (++dummyRoomDescription))
													.text(roomDescription)
													.insertAfter(
															genRoomDescription)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#roomTime0")
													.clone()
													.attr(
															'id',
															'roomTime'
																	+ (++dummyTime))
													.text(
															roomStartTime
																	+ " : "
																	+ roomEndTime)
													.insertAfter(genTime)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#examinerId0")
													.clone()
													.attr(
															'id',
															'examinerId'
																	+ (++dummyExaminerId))
													.val(room.examinerId)
													.insertAfter(genExaminerId)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#examiner0")
													.clone()
													.attr(
															'id',
															'examiner'
																	+ (++dummyExaminer))
													.text(
															"Examiner : "
																	+ roomExaminer)
													.insertAfter(genExaminer)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#modulatorId0")
													.clone()
													.attr(
															'id',
															'modulatorId'
																	+ (++dummyModulatorId))
													.val(roomModulatorId)
													.insertAfter(genModulatorId)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#modulator0")
													.clone()
													.attr(
															'id',
															'modulator'
																	+ (++dummyModulator))
													.text(
															"Modulator : "
																	+ roomModulator)
													.insertAfter(genModulator)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#roomStatus0")
													.clone()
													.attr(
															'id',
															'roomStatus'
																	+ (++dummyRoomStatus))
													.text(
															"Status : "
																	+ roomStatus)
													.insertAfter(genRoomStatus)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#setHalfSizeOne0")
													.clone()
													.attr(
															'id',
															'setHalfSizeOne'
																	+ (++dummySetHalfSizeOne))
													.insertAfter(
															genSetHalfSizeOne)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));
											$("#setHalfSizeTwo0")
													.clone()
													.attr(
															'id',
															'setHalfSizeTwo'
																	+ (++dummySetHalfSizeTwo))
													.insertAfter(
															genSetHalfSizeTwo)
													.show()
													.appendTo(
															$("#setSizeDetail"
																	+ dummyDetail));

											$("#btnExaminer0")
													.clone()
													.attr(
															'id',
															'btnExaminer'
																	+ (++dummyBtnExaminer))
													.insertAfter(genBtnExaminer)
													.show()
													.appendTo(
															$("#setHalfSizeOne"
																	+ dummySetHalfSizeOne));
											$("#btnCommittee0")
													.clone()
													.attr(
															'id',
															'btnCommitte'
																	+ (++dummyBtnCommittee))
													.insertAfter(
															genBtnCommittee)
													.show()
													.appendTo(
															$("#setHalfSizeTwo"
																	+ dummySetHalfSizeTwo));
										});
								var yourPosition = $("#yourPosition").val();

								if (yourPosition == "Software Development Trainee") {
									//alert(yourPosition);
									$(".committee")
											.attr('disabled', 'disabled');
								} else {
									//alert(yourPosition);
									$(".examiner").attr('disabled', 'disabled');
								}
							});
		});
		function sendId(element) {
			var count = (element.id).replace(/[^\d.]/g, '');
			var detailPerson = {};
			detailPerson.roomId = $("#roomId" + count).val();
			detailPerson.committeeId = $("#yourId").val();
			detailPerson.examinerId = $("#examinerId" + count).val();
			detailPerson.modulatorId = $("#modulatorId" + count).val();
			var dataPersonId = JSON.stringify(detailPerson);
			$
					.ajax({
						url : "/EvaluateTool/application/checkCommittee",
						type : 'POST',
						data : {
							dataPersonId : dataPersonId
						},
						success : function(data) {
							var idRoom = JSON.parse(data).idRoom;
							var idCourse = JSON.parse(data).idCourse;
							var idExaminer = JSON.parse(data).idExaminer;
							var nameExaminer = JSON.parse(data).nameExaminer;
							var lastNameExaminer = JSON.parse(data).lastNameExaminer;
							var idCommittee = JSON.parse(data).idCommittee;
							var nameCommittee = JSON.parse(data).nameCommittee;
							var lastNameCommittee = JSON.parse(data).lastNameCommittee;
							var idModulator = JSON.parse(data).idModulator;
							var yourPosition = $("#yourPosition").val();
							location.href = "/EvaluateTool/application/evaluateBoard"
									+ "?idRoom="
									+ encodeURIComponent(idRoom)
									+ "&idCourse="
									+ encodeURIComponent(idCourse)
									+ "&idExaminer="
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
									+ encodeURIComponent(lastNameCommittee)
									+ "&idModulator="
									+ encodeURIComponent(idModulator)
									+ "&yourPosition="
									+ encodeURIComponent(yourPosition);
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});
		}
		function sendIdExaminer(element) {
			count = (element.id).replace(/[^\d.]/g, '');
			var roomId = $("#roomId" + count).val();
			var yourId = $("#yourId").val();
			var yourPosition = $("#yourPosition").val();
			var examinerId = $("#examinerId" + count).val();
			var courseId = $("#courseId" + count).val();

			location.href = "/EvaluateTool/application/examinerDashBoard"
					+ "?idRoom=" + encodeURIComponent(roomId) + "&idExaminer="
					+ encodeURIComponent(examinerId) + "&idCourse="
					+ encodeURIComponent(courseId) + "&yourId="
					+ encodeURIComponent(yourId) + "&yourPosition="
					+ encodeURIComponent(yourPosition);
		}
		$("#logOut").click(function() {
			location.href = "/EvaluateTool/application/logIn";
		});
	</script>
</body>
</html>