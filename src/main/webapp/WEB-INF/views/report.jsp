<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-right: 0px;
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

		<input type="hidden" id="yourId" value="${yourId}" />
		<div id="formTable" class="row">


			<div id="menuReSize2" class="col-md-10 column">
				<div id="setSizeWordExaminer"
					class="col-sm-1 col-md-1 col-md-offset-1">
					<label>Examiner</label>
				</div>
				<div id="setSizeTable" class="col-sm-3 col-md-5">
					<select id="pickExaminer" class="selectpicker" data-width="100%">
						<option id="optionAll" value="null">ALL</option>
					</select>
				</div>
				<div id="setSizeBtnSubmit" class="col-sm-1 col-md-1">
					<button id="buttonSumary" type="button" class="btn btn-default"
						onClick="javascript:showRoom($(this).parent('div').parent('div').children('#setSizeTable').children('select').val())">Sumary</button>
				</div>
			
				<option id="option0"></option>
				<input type="hidden" id="roomId0" value="" /> <br>
				<div id="menuReSize3" class="col-sm-5 col-md-9 col-sm-offset-3 col-md-offset-0" style="margin-top: 30px";>
					<table id="table" class="table table-bordered">
						<thead>
							<tr>
								<th>Examiner</th>
								<th>Score</th>
								<th>Percent</th>
								<th>Room</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody id="tableBody0" class="tableBody">
							<tr id="tableRow0">
								<td id="tableDataName" class="td"></td>
								<td id="tableDataScore" class="td"></td>
								<td id="tableDataPercent" class="td"></td>
								<td id="tableNameRoom" class="td"></td>
								<td id="tableDate" class="td"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div style="width:100px;position:fixed;top:50%;left:0px;z-index:2" id="menulefthover"><img width="32px" height="30px" onclick="openmenuleft()" src="/EvaluateTool/resources/images/menu.png" id="imgmenuleft" class="glyphicon">
		<b hidden="" id="extendimgmenuleft" style="display: none;">Menu</b>
	</div>

	<script>
		$(function() {
			$("#table").hide();
			$("#tableBody0").hide();
			$("#tableRow0").hide();
			$("#tableDataName").hide();
			$("#tableDataScore").hide();
			$("#tableDataPercent").hide();
			$("#tableDate").hide();
			$("#tableNameRoom").hide();
			$("#option0").hide();
			var completedRoom = JSON.parse('${completeRoom}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			var genRoomId = ("#roomId" + dummyRoomId);

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

		});
		function showRoom(examinerId) {
			$("#tableBody1").remove();
			var examiner = {};
			examiner.id = examinerId;
			var examinerId = JSON.stringify(examiner);
			$
					.ajax({
						url : "/EvaluateTool/application/getroomscore",
						type : 'POST',
						data : {
							examinerId : examinerId
						},
						success : function(data) {
							var report = JSON.parse(data);
							console.log(report);
							var dummyTableBody = 0;
							var dummyTableRow = 0;
							var genTableBody = $("#tableBody" + dummyTableBody);
							var genTableRow = $("#tableRow" + dummyTableRow);
							$
									.each(
											report,
											function(i, item) {
												$("#tableBody0")
														.clone()
														.attr(
																'id',
																'tableBody'
																		+ (++dummyTableBody))
														.insertAfter(
																genTableBody)
														.fadeIn('slow')
														.appendTo($("#table"));
												item
														.forEach(function(
																report) {
															$("#table").show();
															$("#tableRow0")
																	.clone()
																	.attr(
																			'id',
																			'tableRow'
																					+ (++dummyTableRow))
																	.insertAfter(
																			genTableRow)
																	.show()
																	.appendTo(
																			$("#tableBody"
																					+ dummyTableBody));
															$("#tableDataName")
																	.clone()
																	.text(
																			report.examiner)
																	.show()
																	.appendTo(
																			$("#tableRow"
																					+ dummyTableRow));
															$("#tableDataScore")
																	.clone()
																	.text(
																			report.score.toFixed(2)
																					+ " of "
																					+ report.topicTotal)
																	.show()
																	.appendTo(
																			$("#tableRow"
																					+ dummyTableRow));

															if (report.topicTotal == 0) {
																report.topicTotal = 1;
															}
															var percent = (report.score / report.topicTotal) * 100;
															
															$(
																	"#tableDataPercent")
																	.clone()
																	.text(
																			percent
																				.toFixed(2)
																					+ "%")
																	.show()
																	.appendTo(
																			$("#tableRow"
																					+ dummyTableRow));
															$("#tableNameRoom")
																	.clone()
																	.text(
																			report.nameRoom)
																	.show()
																	.appendTo(
																			$("#tableRow"
																					+ dummyTableRow));
															$("#tableDate")
																	.clone()
																	.text(
																			report.dateTest)
																	.show()
																	.appendTo(
																			$("#tableRow"
																					+ dummyTableRow));
														});

											});

						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});
		}


		
		$("#room").click(
				function() {
					var yourId = $("#yourId").attr('value');
					location.href = "/EvaluateTool/application/examinationRoom"
							+ "?yourId=" + encodeURIComponent(yourId)
							+ "&yourPosition="
							+ encodeURIComponent('${yourPosition}')
							+ "&yourName="
							+ encodeURIComponent('${name}')
							+ "&yourLastName="
							+ encodeURIComponent('${lastName}');
							;
				});
		$("#logOut").click(function() {
			location.href = "/EvaluateTool/application/logIn";
		});

		$("#summaryScore").click(
				function() {
					//var yourId = $("#committeeId").attr('value');
						location.href = "/EvaluateTool/application/report"
						+ "?yourId=" 
						+ encodeURIComponent('${yourId}')
						+ "&yourPosition="
						+ encodeURIComponent('${yourPosition}')
						+ "&yourName="
						+ encodeURIComponent('${name}')
						+ "&yourLastName="
						+ encodeURIComponent('${lastName}');
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
						+ encodeURIComponent('${name}')
						+ "&yourLastName="
						+ encodeURIComponent('${lastName}');
				});

		var i=0
			function openmenuleft(){
				if(i==0){
					$("#menuleftSummary").hide();
					i++;
				}else{
					$("#menuleftSummary").slideDown(800);
					i--;
				}
				
			}

			$("#imgmenuleft").mouseover(function(){
					$("#extendimgmenuleft").slideToggle(300);
				});
			$("#imgmenuleft").mouseout(function(){
				$("#extendimgmenuleft").slideToggle(300);
			});

		var fullname = '${name}'+'  '+'${lastName}';
		$("#fullname").html(fullname);
        var yourPosition='${yourPosition}';
		$("#menuReSize").show();
		$("#menulefthead").hide();
		$("#menulefthover").hide();
		$("#menuleftplus").hide();
		$("#headdropdownapprovepermission").hide();
		$("#headdropdownsubmitandcancel").hide();
        if(yourPosition=="Software Analyst"){
            //$("#confighome").show();
            $("#configroom").show();
            $("#configreport").hide();
            //$("#confighistory").show();
            $("#configmanager").show();
        }else if(yourPosition=="Manager"){
            //$("#confighome").show();
            $("#configroom").show();
            $("#configreport").hide();
            //$("#confighistory").show();
            $("#configmanager").show();
        }else if(yourPosition=="Software Development Trainee"){
            //$("#confighome").show();
            $("#configroom").show();
            $("#configreport").hide();
            //$("#confighistory").hide();
            $("#configmanager").hide();
        }else{
            //$("#confighome").show();
            $("#configroom").show();
            $("#configreport").hide();
            //$("#confighistory").show();
            $("#configmanager").hide();
        }
        $("#nameproject").click(function(){
            location.href = "/EvaluateTool/application/examinationRoom"
                    + "?yourId="
                    + encodeURIComponent('${yourId}')
                    + "&yourPosition="
                    + encodeURIComponent('${yourPosition}')
                    + "&yourName="
                    + encodeURIComponent('${name}')
                    + "&yourLastName="
                    + encodeURIComponent('${lastName}');
        });
        $("#configmanager").click(
                function() {
                    location.href = "/EvaluateTool/application/managerCourse"
                            + "?yourId="
                            + encodeURIComponent('${yourId}')
                            + "&yourPosition="
                            + encodeURIComponent('${yourPosition}')
                            + "&yourName="
                            + encodeURIComponent('${name}')
                            + "&yourLastName="
                            + encodeURIComponent('${lastName}');
                });
	</script>
</body>
</html>