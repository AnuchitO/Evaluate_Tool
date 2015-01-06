<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin-left: 20px;
}

.textbox,select { 
	background: white; 
	border: 1px solid #DDD; 
	border-radius: 5px; 
	box-shadow: 0 0 5px #DDD inset; 
	color: #666; 
	outline: none; 
	height:25px; 
	width: 200px; 
	margin-top: 0px;
	margin-left: 50px;
} 
h3{
	margin-left: 50px;
}



</style>
</head>
<body>

	<div class="container">

		<div class="col-md-11 column">
			<div style="border-style : solid ; border-color: #FF8C00 ; margin-bottom: 20px">
				<div style="text-align: center">
					<h2>Course</h2>
				</div>
			</div>
			<div id="courseDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00 ">
				<form>
					<div>
						<h4 style="margin-left: 50px">Add Course</h4>
						<input class="textbox"type="text" placeholder="Cource" id="courseName" onkeydown="if (event.keyCode == 13) document.getElementById('btnSaveCourse').click()">
						<input class="textbox"type="text" placeholder="Cource : Description" id="courseDescription" onkeydown="if (event.keyCode == 13) document.getElementById('btnSaveCourse').click()">
						<button type="button" class="btn" id="btnSaveCourse">Add</button>
					</div>
				</form>
				<form>
					<h4 style="margin-left: 50px">Edit Or Remove Course</h4>
					<div style="margin-bottom: 20px">
						<select id="courseAllEdit">
						</select>
						<input class="textbox"type="text" placeholder="Cource" id="courseNameEdit" onkeydown="if (event.keyCode == 13) document.getElementById('btnEditCourse').click()">
						<input class="textbox"type="text" placeholder="Cource : Description" id="courseDescriptionEdit" onkeydown="if (event.keyCode == 13) document.getElementById('btnEditCourse').click()">
						<button type="button" class="btn" id="btnEditCourse">Edit</button>
						<button type="button" class="btn" id="btnRemoveCourse">Remove</button>
					</div>
				</form>
			</div>
			<div style="border-style : solid ; border-color: #FF8C00 ; margin-bottom: 20px;" >
				<div style="text-align: center;" >
					<h2>Subject</h2>
				</div>
			</div>
			<div id="subjectDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00;" >
				<form>
					<div >
						<h4 style="margin-left: 50px">Add Subject</h4>
						<label style="margin-left: 50px">Course :</label>
						<label id="showCourse"></label>
						<input class="textbox"type="text" placeholder="Subject" id="subjectName" onkeydown="if (event.keyCode == 13) document.getElementById('btnSaveSubject').click()">
						<input class="textbox"type="text" placeholder="Subject : Description" id="subjectDescription" onkeydown="if (event.keyCode == 13) document.getElementById('btnSaveSubject').click()">
						<button type="button" class="btn" id="btnSaveSubject">Add</button>
					</div>
				</form>

				<form>
					<div style="margin-bottom: 20px">
						<h4 style="margin-left: 50px">Edit Or Remove Subject</h4>
						<label style="margin-left: 50px">Course :</label>
						<label id="showCourseInEditSubject"></label>
						<select id="subjectAllEditInSubject">
						</select>
						<br></br>
						<input class="textbox"type="text" placeholder="Subject" id="subjectNameEdit" onkeydown="if (event.keyCode == 13) document.getElementById('btnEditSubject').click()">
						<input class="textbox"type="text" placeholder="Subject : Description" id="subjectDescriptionEdit" onkeydown="if (event.keyCode == 13) document.getElementById('btnEditSubject').click()">
						<button type="button" class="btn" id="btnEditSubject">Edit</button>
						<button type="button" class="btn" id="btnRemoveSubject">Remove</button>
					</div>
				</form>
				
			</div>
			<div style="border-style : solid ; border-color: #FF8C00 ; margin-bottom: 20px">
				<div style="text-align: center">
					<h2>Topic</h2>
				</div>
			</div>
			<div id="topicDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00">
				<form>
					<div>
						<h4 style="margin-left: 50px">Add Topic</h4>
						<label style="margin-left: 50px">Course :</label>
						<label id="showCourseInAddTopic"></label>
						<label style="margin-left: 50px">Subject :</label>
						<label id="showSubjectInAddTopic"></label>
						<br></br>
						<input class="textbox"type="text" placeholder="Topic" id="topicName" onkeydown="if (event.keyCode == 13) document.getElementById('btnSaveTopic').click()">
						<input class="textbox"type="text" placeholder="Topic : Description" id="topicDescription" onkeydown="if (event.keyCode == 13) document.getElementById('btnSaveTopic').click()">
						<button type="button" class="btn" id="btnSaveTopic">Add</button>
					</div>
				</form>

				<form>
					<div style="margin-bottom: 20px">
						<h4 style="margin-left: 50px">Edit Or Remove Topic</h4>
						<label style="margin-left: 50px">Course :</label>
						<label id="showCourseInEditTopic"></label>
						<label style="margin-left: 50px">Subject :</label>
						<label id="showSubjectInEditTopic"></label>
						<select id="topicAllEditInTopic">
						</select>
						<br></br>
						<input class="textbox"type="text" placeholder="Subject" id="topicNameEdit" onkeydown="if (event.keyCode == 13) document.getElementById('btnEditTopic').click()">
						<input class="textbox"type="text" placeholder="Subject : Description" id="topicDescriptionEdit" onkeydown="if (event.keyCode == 13) document.getElementById('btnEditTopic').click()">
						<button type="button" class="btn" id="btnEditTopic">Edit</button>
						<button type="button" class="btn" id="btnRemoveTopic">Remove</button>
					</div>
				</form>
				
			</div>
			<option id="option"></option>
			<option id="option0"></option>
		</div>

	</div>


	<script>
	$(function() {

		function courseAllAddFunction(){
			var dataForm = {};
			dataForm.id = $("#courseAllEdit").val();
			var dataSend = JSON.stringify(dataForm);
			console.info(dataSend);
			$
					.ajax({
						url: "/EvaluateTool/application/courseGetAll",
						type: 'POST',
						data: {
							dataForm: null
						},
						success: function (data) {
							$("#courseAllEdit").empty();

							var addTopic = JSON.parse(data);
							var dummyOption = 0;
							var dummyRoomId = 0;
							var genOptionId = ("#option" + dummyOption);

							$.each(addTopic, function (i, item) {
								item.forEach(function (data) {
									var topicId = data.courseId;
									var name = data.courseName;


									$("#option").clone()
											.attr('id', 'option' + (++dummyOption)).text(
											name).val(topicId)
											.insertAfter(genOptionId).show().appendTo(
											$("#courseAllEdit"));
								});
							});
						}
					});
			$
					.ajax({
						url : "/EvaluateTool/application/courseGetDetail",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							var addCourse = JSON.parse(data);
							$.each(addCourse, function(i, item) {
								item.forEach(function(data) {
									var name = data.courseName;
									var description = data.courseDescription;
									document.getElementById("courseNameEdit").value = name;
									document.getElementById("courseDescriptionEdit").value = description;
									document.getElementById("showCourse").innerHTML = name;
									document.getElementById("showCourseInEditSubject").innerHTML = name;
									document.getElementById("showCourseInAddTopic").innerHTML = name;
									document.getElementById("showCourseInEditTopic").innerHTML = name;
								});
							});
//							var t = document.getElementById("courseAllEdit").value = 15;
							document.getElementById("courseAllEdit").value = parseInt(dataForm.id);
						},
						error : function(data) {
							var dataForm = {};
							dataForm.id = $("#courseAllEdit").val();
							var dataSend = JSON.stringify(dataForm);
							$
									.ajax({
										url : "/EvaluateTool/application/courseGetDetail",
										type : 'POST',
										data : {
											dataForm : dataSend
										},
										success : function(data) {
											var addCourse = JSON.parse(data);
											$.each(addCourse, function(i, item) {
												item.forEach(function(data) {
													var name = data.courseName;
													var description = data.courseDescription;
													document.getElementById("courseNameEdit").value = name;
													document.getElementById("courseDescriptionEdit").value = description;
													document.getElementById("showCourse").innerHTML = name;
													document.getElementById("showCourseInEditSubject").innerHTML = name;
													document.getElementById("showCourseInAddTopic").innerHTML = name;
													document.getElementById("showCourseInEditTopic").innerHTML = name;
												});
											});
										},
										error : function(data) {

										}
									});
						}
					});
		}

		function subjectAllAddFunction(){
				var dataForm = {};
				dataForm.id = $("#courseAllEdit").val();
				var idForUse = $("#subjectAllEditInSubject").val();
				var dataSend = JSON.stringify(dataForm);
				console.info(dataSend);
				$
						.ajax({
							url: "/EvaluateTool/application/courseGetSubject",
							type: 'POST',
							data: {
								dataForm: dataSend
							},
							success: function (data) {
								$("#subjectAllEditInSubject").empty();
								$('#subjectNameEdit').val('');
								$('#subjectDescriptionEdit').val('');

								var addSubject = JSON.parse(data);
								if(data.length<3){
									document.getElementById("showSubjectInAddTopic").innerHTML = null;
									document.getElementById("showSubjectInEditTopic").innerHTML = null;
									document.getElementById("topicNameEdit").value = null;
									document.getElementById("topicDescriptionEdit").value = null;
									$("#topicAllEditInTopic").empty();
								}
								var dummyOption = 0;
								var genOptionId = ("#option" + dummyOption);

								$.each(addSubject, function (i, item) {
									item.forEach(function (data) {
										var subjectId = data.subjectid;
										var name = data.subjectName;

										$("#option").clone()
												.attr('id', 'option' + (++dummyOption)).text(
												name).val(subjectId)
												.insertAfter(genOptionId).show().appendTo(
												$("#subjectAllEditInSubject"));
									});

									document.getElementById("subjectAllEditInSubject").value = parseInt(idForUse);
									var dataForm = {};
									dataForm.id = $("#subjectAllEditInSubject").val();
									var dataSend = JSON.stringify(dataForm);
									console.info(dataSend);

									$
											.ajax({
												url : "/EvaluateTool/application/subjectGetDetail",
												type : 'POST',
												data : {
													dataForm : dataSend
												},
												success : function(data) {
													var addSubject = JSON.parse(data);
													$.each(addSubject, function(i, item) {
														item.forEach(function(data) {
															var name = data.subjectName;
															var description = data.subjectDescription;
															document.getElementById("subjectNameEdit").value = name;
															document.getElementById("subjectDescriptionEdit").value = description;
															document.getElementById("showSubjectInAddTopic").innerHTML = name;
															document.getElementById("showSubjectInEditTopic").innerHTML = name;
														});
													});
												},
												error : function(data) {
												}
											});
									$
											.ajax({
												url: "/EvaluateTool/application/subjectGetTopic",
												type: 'POST',
												data: {
													dataForm: dataSend
												},
												success: function (data) {
													$("#topicAllEditInTopic").empty();

													var addTopic = JSON.parse(data);
													var dummyOption = 0;
													var dummyRoomId = 0;
													var genOptionId = ("#option" + dummyOption);

													$.each(addTopic, function (i, item) {
														item.forEach(function (data) {
															var topicId = data.topicid;
															var name = data.topicName;


															$("#option").clone()
																	.attr('id', 'option' + (++dummyOption)).text(
																	name).val(topicId)
																	.insertAfter(genOptionId).show().appendTo(
																	$("#topicAllEditInTopic"));
														});
													});

													var dataForm = {};
													dataForm.id = $("#topicAllEditInTopic").val();
													var dataSend = JSON.stringify(dataForm);
													console.info(dataSend);

													$
															.ajax({
																url : "/EvaluateTool/application/topicGetDetail",
																type : 'POST',
																data : {
																	dataForm : dataSend
																},
																success : function(data) {
																	var addTopic = JSON.parse(data);
																	$.each(addTopic, function(i, item) {
																		item.forEach(function(data) {
																			var name = data.topicName;
																			var description = data.topicDescription;
																			document.getElementById("topicNameEdit").value = name;
																			document.getElementById("topicDescriptionEdit").value = description;
																		});
																	});

																},
																error : function(data) {

																}
															});
												},error : function(data) {

												}
											});
								});

							},error : function(data) {

							}
						});
				$
						.ajax({
							url : "/EvaluateTool/application/courseGetDetail",
							type : 'POST',
							data : {
								dataForm : dataSend
							},
							success : function(data) {
								var addCourse = JSON.parse(data);
								$.each(addCourse, function(i, item) {
									item.forEach(function(data) {
										var name = data.courseName;
										var description = data.courseDescription;
										document.getElementById("showCourse").innerHTML = name;
										document.getElementById("showCourseInEditSubject").innerHTML = name;
										document.getElementById("showCourseInAddTopic").innerHTML = name;
										document.getElementById("showCourseInEditTopic").innerHTML = name;
									});
								});

							},
							error : function(data) {

							}
						});
		}

		function topicAllAddFunction(){
			var dataForm = {};
			dataForm.id = $("#subjectAllEditInSubject").val();
			var dataSend = JSON.stringify(dataForm);
			console.info(dataSend);
			document.getElementById("topicNameEdit").value = null;
			document.getElementById("topicDescriptionEdit").value = null;
			var idForUse = $("#topicAllEditInTopic").val();

			$
					.ajax({
						url: "/EvaluateTool/application/subjectGetTopic",
						type: 'POST',
						data: {
							dataForm: dataSend
						},
						success: function (data) {
							$("#topicAllEditInTopic").empty();

							var addTopic = JSON.parse(data);
							var dummyOption = 0;
							var dummyRoomId = 0;
							var genOptionId = ("#option" + dummyOption);

							$.each(addTopic, function (i, item) {
								item.forEach(function (data) {
									var topicId = data.topicid;
									var name = data.topicName;


									$("#option").clone()
											.attr('id', 'option' + (++dummyOption)).text(
											name).val(topicId)
											.insertAfter(genOptionId).show().appendTo(
											$("#topicAllEditInTopic"));
								});
							});

							document.getElementById("topicAllEditInTopic").value = parseInt(idForUse);
						}
					});


			$
					.ajax({
						url : "/EvaluateTool/application/subjectGetDetail",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							var addSubject = JSON.parse(data);
							$.each(addSubject, function(i, item) {
								item.forEach(function(data) {
									var name = data.subjectName;
									var description = data.subjectDescription;
									document.getElementById("subjectNameEdit").value = name;
									document.getElementById("subjectDescriptionEdit").value = description;
									document.getElementById("showSubjectInAddTopic").innerHTML = name;
									document.getElementById("showSubjectInEditTopic").innerHTML = name;
								});
							});

							var dataForm = {};
							dataForm.id = $("#topicAllEditInTopic").val();
							var dataSend = JSON.stringify(dataForm);
							console.info(dataSend);

							$
									.ajax({
										url : "/EvaluateTool/application/topicGetDetail",
										type : 'POST',
										data : {
											dataForm : dataSend
										},
										success : function(data) {
											var addTopic = JSON.parse(data);
											$.each(addTopic, function(i, item) {
												item.forEach(function(data) {
													var name = data.topicName;
													var description = data.topicDescription;
													document.getElementById("topicNameEdit").value = name;
													document.getElementById("topicDescriptionEdit").value = description;
												});
											});

										},
										error : function(data) {

										}
									});

						},
						error : function(data) {

						}
					});

		}

		var completedRoom = JSON.parse('${allCourse}');
		var dummyOption = 0;
		var genOptionId = ("#option" + dummyOption);
		$.each(completedRoom, function(i, item) {

			item.forEach(function(course) {

				var nameAndLastName = course.courseName;
				var examinerId = course.courseId;
				$("#option").clone()
						.attr('id', 'option' + (++dummyOption)).text(
						nameAndLastName).val(examinerId)
						.insertAfter(genOptionId).show().appendTo(
						$("#courseAllEdit"));
			});

			var dataForm = {};
			dataForm.id = $("#courseAllEdit").val();
			var dataSend = JSON.stringify(dataForm);
			console.info(dataSend);
			$
					.ajax({
						url : "/EvaluateTool/application/courseGetDetail",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							var addCourse = JSON.parse(data);
							$.each(addCourse, function(i, item) {
								item.forEach(function(data) {
									var name = data.courseName;
									var description = data.courseDescription;
									document.getElementById("showCourse").innerHTML = name;
									document.getElementById("showCourseInEditSubject").innerHTML = name;
									document.getElementById("showCourseInAddTopic").innerHTML = name;
									document.getElementById("showCourseInEditTopic").innerHTML = name;
									document.getElementById("courseNameEdit").value = name;
									document.getElementById("courseDescriptionEdit").value = description;
								});
							});

						},
						error : function(data) {

						}
					});
		});

		var dataForm = {};
		dataForm.id = $("#subjectAllEditInSubject").val();
		var dataSend = JSON.stringify(dataForm);
		console.info(dataSend);
		$
				.ajax({
					url : "/EvaluateTool/application/subjectGetDetail",
					type : 'POST',
					data : {
						dataForm : dataSend
					},
					success : function(data) {
						var addSubject = JSON.parse(data);
						$.each(addSubject, function(i, item) {
							item.forEach(function(data) {
								var name = data.subjectName;
								var description = data.subjectDescription;
								document.getElementById("subjectNameEdit").value = name;
								document.getElementById("subjectDescriptionEdit").value = description;
							});
						});

					},
					error : function(data) {

					}
				});

		var dataForm = {};
		dataForm.id = $("#courseAllEdit").val();
		var dataSend = JSON.stringify(dataForm);
		console.info(dataSend);

		$
				.ajax({
					url: "/EvaluateTool/application/courseGetSubject",
					type: 'POST',
					data: {
						dataForm: dataSend
					},
					success: function (data) {
						$("#subjectAllEditInSubject").empty();
						document.getElementById("showSubjectInAddTopic").innerHTML = null;
						document.getElementById("showSubjectInEditTopic").innerHTML = null;


						var addSubject = JSON.parse(data);
						var dummyOption = 0;
						var genOptionId = ("#option" + dummyOption);

						$.each(addSubject, function (i, item) {
							item.forEach(function (data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;


								$("#option").clone()
										.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
										.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllEditInSubject"));
							});
						});
						var dataForm = {};
						dataForm.id = $("#subjectAllEditInSubject").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url: "/EvaluateTool/application/subjectGetTopic",
									type: 'POST',
									data: {
										dataForm: dataSend
									},
									success: function (data) {
										$("#topicAllEditInTopic").empty();

										var addTopic = JSON.parse(data);
										var dummyOption = 0;
										var dummyRoomId = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addTopic, function (i, item) {
											item.forEach(function (data) {
												var topicId = data.topicid;
												var name = data.topicName;


												$("#option").clone()
														.attr('id', 'option' + (++dummyOption)).text(
														name).val(topicId)
														.insertAfter(genOptionId).show().appendTo(
														$("#topicAllEditInTopic"));
											});
										});

										var dataForm = {};
										dataForm.id = $("#topicAllEditInTopic").val();
										var dataSend = JSON.stringify(dataForm);
										console.info(dataSend);

										$
												.ajax({
													url : "/EvaluateTool/application/topicGetDetail",
													type : 'POST',
													data : {
														dataForm : dataSend
													},
													success : function(data) {
														var addTopic = JSON.parse(data);
														$.each(addTopic, function(i, item) {
															item.forEach(function(data) {
																var name = data.topicName;
																var description = data.topicDescription;
																document.getElementById("topicNameEdit").value = name;
																document.getElementById("topicDescriptionEdit").value = description;
															});
														});

													},
													error : function(data) {

													}
												});
									},
									error : function(data) {

									}
								});

						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetDetail",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										var addSubject = JSON.parse(data);
										$.each(addSubject, function(i, item) {
											item.forEach(function(data) {
												var name = data.subjectName;
												var description = data.subjectDescription;
												document.getElementById("subjectNameEdit").value = name;
												document.getElementById("subjectDescriptionEdit").value = description;
											});
										});

									},
									error : function(data) {

									}
						});
					},error : function(data) {

					}

		});

		$("#courseAllEdit").change(
					function() {
						document.getElementById("topicNameEdit").value = null;
						document.getElementById("topicDescriptionEdit").value = null;
						var dataForm = {};
						dataForm.id = $("#courseAllEdit").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);
						$
							.ajax({
								url: "/EvaluateTool/application/courseGetSubject",
								type: 'POST',
								data: {
									dataForm: dataSend
								},
								success: function (data) {
									$("#subjectAllEditInSubject").empty();
									$('#subjectNameEdit').val('');
									$('#subjectDescriptionEdit').val('');

									var addSubject = JSON.parse(data);
									if(data.length<3){
										document.getElementById("showSubjectInAddTopic").innerHTML = null;
										document.getElementById("showSubjectInEditTopic").innerHTML = null;
										document.getElementById("topicNameEdit").value = null;
										document.getElementById("topicDescriptionEdit").value = null;
										$("#topicAllEditInTopic").empty();
									}
									var dummyOption = 0;
									var genOptionId = ("#option" + dummyOption);

									$.each(addSubject, function (i, item) {
										item.forEach(function (data) {
											var subjectId = data.subjectid;
											var name = data.subjectName;

											$("#option").clone()
													.attr('id', 'option' + (++dummyOption)).text(
													name).val(subjectId)
													.insertAfter(genOptionId).show().appendTo(
													$("#subjectAllEditInSubject"));
										});

										var dataForm = {};
										dataForm.id = $("#subjectAllEditInSubject").val();
										var dataSend = JSON.stringify(dataForm);
										console.info(dataSend);

										$
												.ajax({
													url : "/EvaluateTool/application/subjectGetDetail",
													type : 'POST',
													data : {
														dataForm : dataSend
													},
													success : function(data) {
														var addSubject = JSON.parse(data);
														$.each(addSubject, function(i, item) {
															item.forEach(function(data) {
																var name = data.subjectName;
																var description = data.subjectDescription;
																document.getElementById("subjectNameEdit").value = name;
																document.getElementById("subjectDescriptionEdit").value = description;
															});
														});

														$
																.ajax({
																	url : "/EvaluateTool/application/subjectGetDetail",
																	type : 'POST',
																	data : {
																		dataForm : dataSend
																	},
																	success : function(data) {
																		var addSubject = JSON.parse(data);
																		$.each(addSubject, function(i, item) {
																			item.forEach(function(data) {
																				var name = data.subjectName;
																				document.getElementById("showSubjectInAddTopic").innerHTML = name;
																				document.getElementById("showSubjectInEditTopic").innerHTML = name;
																			});
																		});

																	},
																	error : function(data) {

																	}
																});

													},
													error : function(data) {
													}
												});
										$
												.ajax({
													url: "/EvaluateTool/application/subjectGetTopic",
													type: 'POST',
													data: {
														dataForm: dataSend
													},
													success: function (data) {
														$("#topicAllEditInTopic").empty();

														var addTopic = JSON.parse(data);
														var dummyOption = 0;
														var dummyRoomId = 0;
														var genOptionId = ("#option" + dummyOption);

														$.each(addTopic, function (i, item) {
															item.forEach(function (data) {
																var topicId = data.topicid;
																var name = data.topicName;


																$("#option").clone()
																		.attr('id', 'option' + (++dummyOption)).text(
																		name).val(topicId)
																		.insertAfter(genOptionId).show().appendTo(
																		$("#topicAllEditInTopic"));
															});
														});

														var dataForm = {};
														dataForm.id = $("#topicAllEditInTopic").val();
														var dataSend = JSON.stringify(dataForm);
														console.info(dataSend);

														$
																.ajax({
																	url : "/EvaluateTool/application/topicGetDetail",
																	type : 'POST',
																	data : {
																		dataForm : dataSend
																	},
																	success : function(data) {
																		var addTopic = JSON.parse(data);
																		$.each(addTopic, function(i, item) {
																			item.forEach(function(data) {
																				var name = data.topicName;
																				var description = data.topicDescription;
																				document.getElementById("topicNameEdit").value = name;
																				document.getElementById("topicDescriptionEdit").value = description;
																			});
																		});

																	},
																	error : function(data) {

																	}
																});
													},error : function(data) {

													}
												});
									});
								},error : function(data) {

								}
						});
						$
								.ajax({
									url : "/EvaluateTool/application/courseGetDetail",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										var addCourse = JSON.parse(data);
										$.each(addCourse, function(i, item) {
											item.forEach(function(data) {
												var name = data.courseName;
												var description = data.courseDescription;
												document.getElementById("showCourse").innerHTML = name;
												document.getElementById("showCourseInEditSubject").innerHTML = name;
												document.getElementById("showCourseInAddTopic").innerHTML = name;
												document.getElementById("showCourseInEditTopic").innerHTML = name;
											});
										});

									},
									error : function(data) {

									}
								});
			});

		$("#btnSaveCourse").click(
				function() {
						var dataForm = {};
						dataForm.courseName = $("#courseName").val();
						dataForm.courseDescription = $("#courseDescription").val();
						if (dataForm.courseName == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						
						console.info(dataSend);

						$
							.ajax({
								url : "/EvaluateTool/application/saveCourse",
								type : 'POST',
								data : {
									dataForm : dataSend
								},
								success : function(data) {
									$('#courseName').val('');
									$('#courseDescription').val('');
									swal({
									type:"success",
									title: "Approve Success....",
									confirmButtonText: "Yes",
									}, function(isConfirm){
//
									});
									courseAllAddFunction();
								},
								error : function(data) {
									swal({
												type:"error",
												title: "Can't Add...",
										}, function(isConfirm){

										});
								}
						});
			});

			$("#btnRemoveCourse").click(
					function() {
						var dataForm = {};
						dataForm.id = $("#courseAllEdit").val();
						var dataSend = JSON.stringify(dataForm);						
						console.info(dataSend);	

						$
							.ajax({
								url : "/EvaluateTool/application/deleteCourse",
								type : 'POST',
								data : {
									dataForm : dataSend
								},
							success : function(data) {
								if (data == "1") {
									swal({
											type:"success",
											title: "Approve Success....",
											confirmButtonText: "Yes",
									}, function(isConfirm){
										courseAllAddFunction();
									});
								}else{
									swal({
											type:"error",
											title: "Can't Delete...",
									}, function(isConfirm){

									});
								};

							},
							error : function(data) {
								swal({
											type:"error",
											title: "Can't Delete...",
									}, function(isConfirm){

									});
							}
						});

			});

			$("#btnEditCourse").click(
					function() {
						var dataForm = {};
						dataForm.courseNameEdit = $("#courseNameEdit").val();
						dataForm.courseDescriptionEdit = $("#courseDescriptionEdit").val();
						dataForm.id = $("#courseAllEdit").val();

						if (dataForm.courseNameEdit == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);
						$
								.ajax({
									url : "/EvaluateTool/application/editCourse",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {


										swal({
											type:"success",
											title: "Approve Success....",
											confirmButtonText: "Yes",
										}, function(isConfirm){
											courseAllAddFunction();
//											document.getElementById("courseAllEdit").value = parseInt(dataForm.id);
										});

									},
									error : function(data) {
										swal({
											type:"error",
											title: "Can't Add...",
										}, function(isConfirm){


										});
									}
								});

			});

			$("#btnEditSubject").click(
					function() {
						var dataForm = {};
						dataForm.subjectNameEdit = $("#subjectNameEdit").val();
						dataForm.subjectDescriptionEdit = $("#subjectDescriptionEdit").val();
						dataForm.idSubject = $("#subjectAllEditInSubject").val();
						dataForm.idCourse = $("#courseAllEdit").val();
						if (dataForm.subjectNameEdit == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);
						$
								.ajax({
									url : "/EvaluateTool/application/editSubject",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										swal({
											type:"success",
											title: "Approve Success....",
											confirmButtonText: "Yes",
										}, function(isConfirm){
											subjectAllAddFunction();
										});
									},
									error : function(data) {
										swal({
											type:"error",
											title: "Can't Add...",
										}, function(isConfirm){

										});
									}
								});
			});

		$("#btnEditTopic").click(
				function() {
					var dataForm = {};
					dataForm.topicNameEdit = $("#topicNameEdit").val();
					dataForm.topicDescriptionEdit = $("#topicDescriptionEdit").val();
					dataForm.idSubject = $("#subjectAllEditInSubject").val();
					dataForm.idTopic = $("#topicAllEditInTopic").val();

					if (dataForm.topicNameEdit == "") {
						var dataSend = JSON.stringify(null);

					}else{
						var dataSend = JSON.stringify(dataForm);
					};
					console.info(dataSend);
					$
							.ajax({
								url : "/EvaluateTool/application/editTopic",
								type : 'POST',
								data : {
									dataForm : dataSend
								},
								success : function(data) {
									swal({
										type:"success",
										title: "Approve Success....",
										confirmButtonText: "Yes",
									}, function(isConfirm){
										topicAllAddFunction();
									});
								},
								error : function(data) {
									swal({
										type:"error",
										title: "Can't Add...",
									}, function(isConfirm){

									});
								}
							});
				});

			$("#btnSaveSubject").click(
					function() {
						var dataForm = {};
						dataForm.subjectName = $("#subjectName").val();
						dataForm.subjectDescription = $("#subjectDescription").val();
						dataForm.id = $("#courseAllEdit").val();
						if (dataForm.subjectName == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);	
						$
							.ajax({
								url : "/EvaluateTool/application/saveSubject",
								type : 'POST',
								data : {
									dataForm : dataSend
								},
							success : function(data) {
									$('#subjectName').val('');
									$('#subjectDescription').val('');
									swal({
									type:"success",
									title: "Approve Success....",
									confirmButtonText: "Yes",
							}, function(isConfirm){
									subjectAllAddFunction();
								});
							},
							error : function(data) {
										swal({
													type:"error",
													title: "Can't Add...",
											}, function(isConfirm){

											});
									}
						});
			});

			$("#btnRemoveSubject").click(
					function() {
						var dataForm = {};
						dataForm.id = $("#subjectAllEditInSubject").val();
						var dataSend = JSON.stringify(dataForm);						
						console.info(dataSend);
						$
								.ajax({
								url : "/EvaluateTool/application/deleteSubject",
								type : 'POST',
								data : {
									dataForm : dataSend
								},
								success : function(data) {
									if (data == "1") {
										swal({
												type:"success",
												title: "Approve Success....",
												confirmButtonText: "Yes",
										}, function(isConfirm){
												subjectAllAddFunction();
										});
									}else{
										swal({
												type:"error",
												title: "Can't Delete...",
										}, function(isConfirm){

										});
									};

								},
								error : function(data) {
									swal({
												type:"error",
												title: "Can't Delete...",
										}, function(isConfirm){

										});
								}
						});
			});

			$("#btnSaveTopic").click(
					function() {
						var dataForm = {};
						dataForm.topicName = $("#topicName").val();
						dataForm.topicDescription = $("#topicDescription").val();
						dataForm.id = $("#subjectAllEditInSubject").val();
						if (dataForm.topicName == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);
						$
								.ajax({
									url : "/EvaluateTool/application/saveTopic",
									type : 'POST',
									data : {
										dataForm : dataSend
								},
								success : function(data) {
										$('#courseName').empty();
										$('#subjectName').val('');
										$('#topicName').val('');
										$('#courseDescription').val('');
										$('#topicDescription').val('');
										$('#subjectDescription').val('');
										swal({
										type:"success",
										title: "Approve Success....",
										confirmButtonText: "Yes",
								}, function(isConfirm){
										topicAllAddFunction();
									});
								},
								error : function(data) {
											swal({
														type:"error",
														title: "Can't Add...",
												}, function(isConfirm){

												});
										}
						});
			});

			$("#btnRemoveTopic").click(
					function() {
						var dataForm = {};
						dataForm.id = $("#topicAllEditInTopic").val();
						var dataSend = JSON.stringify(dataForm);						
						console.info(dataSend);
						$
								.ajax({
									url : "/EvaluateTool/application/deleteTopic",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
								success : function(data) {
									if (data == "1") {
										swal({
												type:"success",
												title: "Approve Success....",
												confirmButtonText: "Yes",
										}, function(isConfirm){
												topicAllAddFunction();
										});
									}else{
										swal({
												type:"error",
												title: "Can't Delete...",
										}, function(isConfirm){

										});
									};

								},
								error : function(data) {
									swal({
												type:"error",
												title: "Can't Delete...",
										}, function(isConfirm){

										});
								}
						});
			});

			$("#courseAllEdit").change(
					function() {
						var dataForm = {};
						dataForm.id = $("#courseAllEdit").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url : "/EvaluateTool/application/courseGetDetail",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										var addCourse = JSON.parse(data);
										$.each(addCourse, function(i, item) {
											item.forEach(function(data) {
												var name = data.courseName;
												var description = data.courseDescription;
												document.getElementById("courseNameEdit").value = name;
												document.getElementById("courseDescriptionEdit").value = description;
											});
										});

									},
									error : function(data) {

									}
						});

			});

			$("#subjectAllEditInSubject").change(
					function() {
						var dataForm = {};
						dataForm.id = $("#subjectAllEditInSubject").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);
//						document.getElementById("topicNameEdit").value = null;
//						document.getElementById("topicDescriptionEdit").value = null;
						$
								.ajax({
									url: "/EvaluateTool/application/subjectGetTopic",
									type: 'POST',
									data: {
										dataForm: dataSend
									},
									success: function (data) {
										if(data.length < 3){
											document.getElementById("topicNameEdit").value = null;
											document.getElementById("topicDescriptionEdit").value = null;
										}
										$("#topicAllEditInTopic").empty();

										var addTopic = JSON.parse(data);
										var dummyOption = 0;
										var dummyRoomId = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addTopic, function (i, item) {
											item.forEach(function (data) {
												var topicId = data.topicid;
												var name = data.topicName;


												$("#option").clone()
														.attr('id', 'option' + (++dummyOption)).text(
														name).val(topicId)
														.insertAfter(genOptionId).show().appendTo(
														$("#topicAllEditInTopic"));
											});
										});

										var dataForm = {};
										dataForm.id = $("#topicAllEditInTopic").val();
										var dataSend = JSON.stringify(dataForm);
										console.info(dataSend);

										$
												.ajax({
													url : "/EvaluateTool/application/topicGetDetail",
													type : 'POST',
													data : {
														dataForm : dataSend
													},
													success : function(data) {
														var addTopic = JSON.parse(data);
														$.each(addTopic, function(i, item) {
															item.forEach(function(data) {
																var name = data.topicName;
																var description = data.topicDescription;
																document.getElementById("topicNameEdit").value = name;
																document.getElementById("topicDescriptionEdit").value = description;
															});
														});

													},
													error : function(data) {

													}
												});
									}
								});


						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetDetail",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										var addSubject = JSON.parse(data);
										$.each(addSubject, function(i, item) {
											item.forEach(function(data) {
												var name = data.subjectName;
												var description = data.subjectDescription;
												document.getElementById("subjectNameEdit").value = name;
												document.getElementById("subjectDescriptionEdit").value = description;
											});
										});

									},
									error : function(data) {

									}
						});

						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetDetail",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										var addSubject = JSON.parse(data);
										$.each(addSubject, function(i, item) {
											item.forEach(function(data) {
												var name = data.subjectName;
												var description = data.subjectDescription;
												document.getElementById("showSubjectInAddTopic").innerHTML = name;
												document.getElementById("showSubjectInEditTopic").innerHTML = name;

											});
										});

									},
									error : function(data) {

									}
								});
			});


			$
					.ajax({
						url : "/EvaluateTool/application/subjectGetDetail",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							var addSubject = JSON.parse(data);
							$.each(addSubject, function(i, item) {
								item.forEach(function(data) {
									var name = data.subjectName;
									var description = data.subjectDescription;
									document.getElementById("showSubjectInAddTopic").innerHTML = name;
									document.getElementById("showSubjectInEditTopic").innerHTML = name;

								});
							});

						},
						error : function(data) {

						}
					});

			$("#topicAllEditInTopic").change(
					function() {
						var dataForm = {};
						dataForm.id = $("#topicAllEditInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url : "/EvaluateTool/application/topicGetDetail",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										var addTopic = JSON.parse(data);
										$.each(addTopic, function(i, item) {
											item.forEach(function(data) {
												var name = data.topicName;
												var description = data.topicDescription;
												document.getElementById("topicNameEdit").value = name;
												document.getElementById("topicDescriptionEdit").value = description;
											});
										});

									},
									error : function(data) {

									}
								});

					});

	});

	$("#room").click(
			function() {
				location.href = "/EvaluateTool/application/examinationRoom"
				+ "?yourId=" + encodeURIComponent(('${yourId}'))
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

	var fullname = '${name}'+'  '+'${lastName}';
	$("#fullname").html(fullname);

	$("#menuReSize").hide();
	$("#menulefthead").hide();
	$("#menulefthover").hide();
	$("#menuleftplus").hide();
	$("#contentcol2").removeClass("col-md-2 column");
	$("#contenthead").removeClass("col-md-10 column");
	$("#contenthead").addClass("col-md-12 column");
	$("#anotificationapprove").hide();
	$("#anotificationsubmitandcalcel").hide();
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

	</script>
</body>
</html>