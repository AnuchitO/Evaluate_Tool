<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Tool</title>
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

.btn {
	background-color: #FF8C00;
}

.bg-default {
	background-color: #FF8C00;
}

.panel-body {
	background-color: #FFD700;
}

</style>
<body>
	<input type="hidden" id="committeeId" value="${yourId}" />
	<div class="row">
		<pre class="bg-default"><strong>Evaluate Tool</strong></pre>
	</div>
	<div id="container" class="row">
		<div id="setSizeContainer" class="col-sm-12 col-md-12"></div>
	</div>
	<div id="setSizeCard0" class="col-sm-6 col-md-5"></div>
	<div id="room0" class="panel panel-default"></div>
	<div id="body0" class="panel-body"></div>
	<div id="setSizeProgress0" class="col-sm-4 col-md-4"></div>
	<div id="setSizeDetail0" class="col-sm-8 col-md-8"></div>
	<div id="roomName0"></div>
	<div id="roomDescription0"></div>
	<div id="roomTime0"></div>
	<input type="hidden" id="examinerId0" value="" />
	<div id="examiner0"></div>
	<div id="modulator0"></div>
	<div id="roomStatus0"></div>
	<div id="setHalfSizeOne0" class="col-sm-6 col-md-6"></div>
	<div id="setHalfSizeTwo0" class="col-sm-6 col-md-6"></div>
	<button id="btnExaminer0" type="button"
		class="btn btn-default disabled">Examiner</button>
	<button id="btnCommittee0" type="button" class="btn btn-default"
		onClick="javascript:sendId(this)">Committee</button>

	<script>
		$(function() {
			$("#setSizeCard0").hide();
			$("#room0").hide();
			$("#body0").hide();
			$("#setSizeProgress0").hide();
			$("#setSizeDetail0").hide();
			$("#roomName0").hide();
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
			var dummyRoomName = 0;
			var dummyRoomDescription = 0;
			var dummyTime = 0;
			var dummyExaminerId = 0;
			var dummyExaminer = 0;
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
			var genRoomName = ("#roomName" + dummyRoomName);
			var genRoomDescription = ("#roomDescription" + dummyRoomDescription);
			var genTime = ("#roomTime" + dummyTime);
			var genExaminerId = ("#examinerId" + dummyExaminerId);
			var genExaminer = ("#examiner" + dummyExaminer);
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
											var roomDescription = room.description;
											var roomStartTime = room.startTime;
											var roomEndTime = room.endTime;
											var roomExaminerId = room.examinerId;
											var roomExaminer = room.examiner;
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
											$("#setSizeProgress0")
													.clone()
													.attr(
															'id',
															'setSizeProgress'
																	+ (++dummyProgress))
													.insertAfter(genProgress)
													.show()
													.appendTo(
															$("#body"
																	+ dummyRoom));
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
							});
		});
		function sendId(element) {
			count = (element.id).replace(/[^\d.]/g, '');
			var detailPerson = {};
			detailPerson.committeeId = $("#committeeId").val();
			detailPerson.examinerId = $("#examinerId" + count).val();
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
							var lastNameExaminer = JSON.parse(data).lastNameExaminer;
							var idCommittee = JSON.parse(data).idCommittee;
							var nameCommittee = JSON.parse(data).nameCommittee;
							var lastNameCommittee = JSON.parse(data).lastNameCommittee;
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
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});
		}
	</script>
</body>
</html>