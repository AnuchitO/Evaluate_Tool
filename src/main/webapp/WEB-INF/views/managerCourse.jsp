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
	margin-left: 50px;
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
				<a onclick="showRoom()" style="text-decoration: none ; color: #000000">
					<div style="text-align: center">
						<h2>Course</h2>
					</div>
				</a>
			</div>
			<div id="courseDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00 ">
				<form>
					<div>
						<h4 style="margin-left: 50px">Add Course</h4>
						<input class="textbox"type="text" placeholder="Cource" id="courseName">
						<input class="textbox"type="text" placeholder="Cource : Description" id="courseDescription">
						<button type="button" class="btn" id="btnSaveCourse">Add</button>
					</div>
				</form>
				<form>
					<h4 style="margin-left: 50px">Remove Course</h4>
					<div style="margin-bottom: 20px">
						<select id="courseAllRemove">
						</select>										
						<button type="button" class="btn" id="btnRemoveCourse">Remove</button>
					</div>
				</form>
				<form>
					<h4 style="margin-left: 50px">Edit Course</h4>
					<div style="margin-bottom: 20px">
						<select id="courseAllEdit">
						</select>
						<input class="textbox"type="text" placeholder="Cource" id="courseNameEdit">
						<input class="textbox"type="text" placeholder="Cource : Description" id="courseDescriptionEdit">
						<button type="button" class="btn" id="btnEditCourse">Edit</button>
					</div>
				</form>
			</div>
			<div style="border-style : solid ; border-color: #FF8C00 ; margin-bottom: 20px">
				<a onclick="showSubject()" style="text-decoration: none ; color: #000000"">
					<div style="text-align: center">
						<h2>Subject</h2>
					</div>
				</a>
			</div>
			<div id="subjectDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00" >
				<form>
					<div>
						<h4 style="margin-left: 50px">Add Subject</h4>
						<select id="courseAllAddInSubject">
						</select>
						<input class="textbox"type="text" placeholder="Subject" id="subjectName">
						<input class="textbox"type="text" placeholder="Subject : Description" id="subjectDescription">
						<button type="button" class="btn" id="btnSaveSubject">Add</button>
					</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
						<h4 style="margin-left: 50px">Remove Subject</h4>
						<select id="courseAllRemoveInSubject">
						</select>
						<select id="subjectAllRemoveInSubject">
						</select>
						<button type="button" class="btn" id="btnRemoveSubject">Remove</button>
					</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
						<h4 style="margin-left: 50px">Edit Subject</h4>
						<select id="courseAllEditInSubject">
						</select>
						<select id="subjectAllEditInSubject">
						</select>
						<br></br>
						<input class="textbox"type="text" placeholder="Subject" id="subjectNameEdit">
						<input class="textbox"type="text" placeholder="Subject : Description" id="subjectDescriptionEdit">
						<button type="button" class="btn" id="btnEditSubject">Edit</button>
					</div>
				</form>
				
			</div>
			<div style="border-style : solid ; border-color: #FF8C00 ; margin-bottom: 20px">
				<a onclick="showTopic()" style="text-decoration: none ; color: #000000"">
					<div style="text-align: center">
						<h2>Topic</h2>
					</div>
				</a>
			</div>
			<div id="topicDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00">
				<form>
					<div>
						<h4 style="margin-left: 50px">Add Topic</h4>
						<select id="courseAllAddInTopic">
						</select>
						<select id="subjectAllAddInTopic">
						</select>
						<br></br>
						<input class="textbox"type="text" placeholder="Topic" id="topicName">
						<input class="textbox"type="text" placeholder="Topic : Description" id="topicDescription">
						<button type="button" class="btn" id="btnSaveTopic">Add</button>
					</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
						<h4 style="margin-left: 50px">Remove Topic</h4>
						<select id="courseAllRemoveInTopic">
						</select>
						<select id="subjectAllRemoveInTopic">
						</select>
						<select id="topicAllRemoveInTopic">
						</select>
						<button type="button" class="btn" id="btnRemoveTopic">Remove</button>
					</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
						<h4 style="margin-left: 50px">Edit Topic</h4>
						<select id="courseAllEditInTopic">
						</select>
						<select id="subjectAllEditInTopic">
						</select>
						<select id="topicAllEditInTopic">
						</select>
						<br></br>
						<input class="textbox"type="text" placeholder="Subject" id="topicNameEdit">
						<input class="textbox"type="text" placeholder="Subject : Description" id="topicDescriptionEdit">
						<button type="button" class="btn" id="btnEditTopic">Edit</button>
					</div>
				</form>
				
			</div>
			<option id="option"></option>
			<option id="option0"></option>
		</div>

	</div>


	<script>
	$(function() {

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
								$("#courseAllRemove"));
			});
		});


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
		});

		$.each(completedRoom, function(i, item) {

			item.forEach(function(course) {

				var nameAndLastName = course.courseName;
				var examinerId = course.courseId;
				$("#option").clone()
						.attr('id', 'option' + (++dummyOption)).text(
						nameAndLastName).val(examinerId)
						.insertAfter(genOptionId).show().appendTo(
						$("#courseAllEditInSubject"));
			});
		});

		$.each(completedRoom, function(i, item) {

			item.forEach(function(course) {

				var nameAndLastName = course.courseName;
				var examinerId = course.courseId;
				$("#option").clone()
						.attr('id', 'option' + (++dummyOption)).text(
								nameAndLastName).val(examinerId)
						.insertAfter(genOptionId).show().appendTo(
								$("#courseAllAddInSubject"));
			});
		});

		var completedRoom = JSON.parse('${allCourse}');
		var dummyOption = 0;
		var genOptionId = ("#option" + dummyOption);

		$.each(completedRoom, function(i, item) {

			item.forEach(function(course) {

				var nameAndLastName = course.courseName;
				var examinerId = course.courseId;
				$("#option2").clone()
						.attr('id', 'option' + (++dummyOption)).text(
								nameAndLastName).val(examinerId)
						.insertAfter(genOptionId).show().appendTo(
								$("#courseAllRemoveInSubject"));
			});
		});

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
								$("#courseAllAddInTopic"));
			});
		});

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
								$("#courseAllRemoveInTopic"));
			});
		});

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
						$("#courseAllEditInTopic"));
			});
		});

		var dataForm = {};
		dataForm.id = $("#courseAllEditInSubject").val();
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
					}

				});


		var dataForm = {};
		dataForm.id = $("#courseAllRemoveInTopic").val();
		var dataSend = JSON.stringify(dataForm);
		console.info(dataSend);

		$
				.ajax({
					url : "/EvaluateTool/application/courseGetSubject",
					type : 'POST',
					data : {
						dataForm : dataSend
					},
					success : function(data) {
						$("#subjectAllRemoveInTopic").empty();

						var addSubject = JSON.parse(data);
						var dummyOption = 0;
						var dummyRoomId = 0;
						var genOptionId = ("#option" + dummyOption);

						$.each(addSubject, function(i, item) {
							item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;


								$("#option").clone()
										.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
										.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllRemoveInTopic"));
							});
						});

						var dataForm = {};
						dataForm.id = $("#subjectAllRemoveInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetTopic",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										$("#topicAllRemoveInTopic").empty();

										var addTopic = JSON.parse(data);
										var dummyOption = 0;
										var dummyRoomId = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addTopic, function(i, item) {
											item.forEach(function(data) {
												var topicId = data.topicid;
												var name = data.topicName;


												$("#option").clone()
														.attr('id', 'option' + (++dummyOption)).text(
														name).val(topicId)
														.insertAfter(genOptionId).show().appendTo(
														$("#topicAllRemoveInTopic"));
											});
										});

									},
									error : function(data) {
										$("#topicAllRemoveInTopic").empty();
									}
								});

					},
					error : function(data) {

					}
				});

		var dataForm = {};
		dataForm.id = $("#courseAllEditInTopic").val();
		var dataSend = JSON.stringify(dataForm);
		console.info(dataSend);

		$
				.ajax({
					url : "/EvaluateTool/application/courseGetSubject",
					type : 'POST',
					data : {
						dataForm : dataSend
					},
					success : function(data) {
						$("#subjectAllEditInTopic").empty();

						var addSubject = JSON.parse(data);
						var dummyOption = 0;
						var dummyRoomId = 0;
						var genOptionId = ("#option" + dummyOption);

						$.each(addSubject, function(i, item) {
							item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;


								$("#option").clone()
										.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
										.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllEditInTopic"));
							});
						});

						var dataForm = {};
						dataForm.id = $("#subjectAllEditInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetTopic",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										$("#topicAllEditInTopic").empty();

										var addTopic = JSON.parse(data);
										var dummyOption = 0;
										var dummyRoomId = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addTopic, function(i, item) {
											item.forEach(function(data) {
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
										$("#topicAllEditInTopic").empty();
									}
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
						url : "/EvaluateTool/application/courseGetDetail",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							$("#topicAllRemoveInTopic").empty();
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


			$("#subjectAllRemoveInSubject").empty();
			var dataForm = {};
			dataForm.id = $("#courseAllRemoveInSubject").val();
			var dataSend = JSON.stringify(dataForm);
			console.info(dataSend);

			$
					.ajax({
						url : "/EvaluateTool/application/courseGetSubject",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {

							var addSubject = JSON.parse(data);
							var dummyOption = 0;
							var genOptionId = ("#option" + dummyOption);


							$.each(addSubject, function(i, item) {
								item.forEach(function(data) {
									var subjectId = data.subjectid;
									var name = data.subjectName;

									$("#option").clone()
											.attr('id', 'option' + (++dummyOption)).text(
											name).val(subjectId)
											.insertAfter(genOptionId).show().appendTo(
											$("#subjectAllRemoveInSubject"));
								});
							});

						},
						error : function(data) {

						}
			});

		var dataForm = {};
		dataForm.id = $("#courseAllAddInTopic").val();
		var dataSend = JSON.stringify(dataForm);
		console.info(dataSend);

		$
				.ajax({
					url : "/EvaluateTool/application/courseGetSubject",
					type : 'POST',
					data : {
						dataForm : dataSend
					},
					success : function(data) {
						$("#subjectAllAddInTopic").empty();

						var addSubject = JSON.parse(data);
						var dummyOption = 0;
						var dummyRoomId = 0;
						var genOptionId = ("#option" + dummyOption);


						$.each(addSubject, function(i, item) {
							item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;

								$("#option").clone()
										.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
										.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllAddInTopic"));
							});
						});

					},
					error : function(data) {

					}
				});

		var dataForm = {};
		dataForm.id = $("#courseAllEditInSubject").val();
		var dataSend = JSON.stringify(dataForm);
		console.info(dataSend);

		$
				.ajax({
					url : "/EvaluateTool/application/courseGetSubject",
					type : 'POST',
					data : {
						dataForm : dataSend
					},
					success : function(data) {
						$("#subjectAllAddInTopic").empty();
						var addSubject = JSON.parse(data);
						$.each(addSubject, function(i, item) {
							item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;
								$("#option").clone()
										.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
										.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllAddInTopic"));
							});
						});

					},
					error : function(data) {

					}
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
						swal({   title: "Are you sure?",     
							 type: "warning",   
							 showCancelButton: true,
							 confirmButtonColor: "#DD6B55",   
							 confirmButtonText: "Yes, approve it!",   
							 cancelButtonText: "No, cancel pls!",   
							 closeOnConfirm: false,   
							 closeOnCancel: false 
							 }, function(isConfirm){   
							 	if (isConfirm) {
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
					                       			location.reload();
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
							 	} else {
							 		swal({
							 			type:"error",
							 			title: "Cancelled",
							 			text:"Click OK for Cancel",
							 			closeOnConfirm:false,
							 			confirmButtonText:"OK"
							 		});
							 	} 
							 });
			

			});

			$("#btnRemoveCourse").click(
					function() {
						var dataForm = {};
						dataForm.id = $("#courseAllRemove").val();
						var dataSend = JSON.stringify(dataForm);						
						console.info(dataSend);	

						swal({   title: "Are you sure?",     
								 type: "warning",   
								 showCancelButton: true,
								 confirmButtonColor: "#DD6B55",   
								 confirmButtonText: "Yes, approve it!",   
								 cancelButtonText: "No, cancel pls!",   
								 closeOnConfirm: false,   
								 closeOnCancel: false 
								 }, function(isConfirm){   
								 	if (isConfirm) {
								 		$
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
								                       			location.reload();
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
								 	} else {
								 		swal({
								 			type:"error",
								 			title: "Cancelled",
								 			text:"Click OK for Cancel",
								 			closeOnConfirm:false,
								 			confirmButtonText:"OK"
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

						swal({   title: "Are you sure?",
							type: "warning",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Yes, approve it!",
							cancelButtonText: "No, cancel pls!",
							closeOnConfirm: false,
							closeOnCancel: false
						}, function(isConfirm){
							if (isConfirm) {
								$
										.ajax({
											url : "/EvaluateTool/application/editCourse",
											type : 'POST',
											data : {
												dataForm : dataSend
											},
											success : function(data) {
												$('#courseNameEdit').val('');
												$('#courseDescriptionEdit').val('');
												swal({
													type:"success",
													title: "Approve Success....",
													confirmButtonText: "Yes",
												}, function(isConfirm){
													location.reload();
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
							} else {
								swal({
									type:"error",
									title: "Cancelled",
									text:"Click OK for Cancel",
									closeOnConfirm:false,
									confirmButtonText:"OK"
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
						dataForm.idCourse = $("#courseAllEditInSubject").val();

						if (dataForm.subjectNameEdit == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);

						swal({   title: "Are you sure?",
							type: "warning",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Yes, approve it!",
							cancelButtonText: "No, cancel pls!",
							closeOnConfirm: false,
							closeOnCancel: false
						}, function(isConfirm){
							if (isConfirm) {
								$
										.ajax({
											url : "/EvaluateTool/application/editSubject",
											type : 'POST',
											data : {
												dataForm : dataSend
											},
											success : function(data) {
												$('#courseNameEdit').val('');
												$('#courseDescriptionEdit').val('');
												swal({
													type:"success",
													title: "Approve Success....",
													confirmButtonText: "Yes",
												}, function(isConfirm){
													location.reload();
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
							} else {
								swal({
									type:"error",
									title: "Cancelled",
									text:"Click OK for Cancel",
									closeOnConfirm:false,
									confirmButtonText:"OK"
								});
							}
						});


			});

		$("#btnEditTopic").click(
				function() {
					var dataForm = {};
					dataForm.topicNameEdit = $("#topicNameEdit").val();
					dataForm.topicDescriptionEdit = $("#topicDescriptionEdit").val();
					dataForm.idTopic = $("#topicAllEditInTopic").val();
					dataForm.idSubject = $("#subjectAllEditInTopic").val();

					if (dataForm.topicNameEdit == "") {
						var dataSend = JSON.stringify(null);

					}else{
						var dataSend = JSON.stringify(dataForm);
					};
					console.info(dataSend);

					swal({   title: "Are you sure?",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "Yes, approve it!",
						cancelButtonText: "No, cancel pls!",
						closeOnConfirm: false,
						closeOnCancel: false
					}, function(isConfirm){
						if (isConfirm) {
							$
									.ajax({
										url : "/EvaluateTool/application/editTopic",
										type : 'POST',
										data : {
											dataForm : dataSend
										},
										success : function(data) {
											$('#courseNameEdit').val('');
											$('#courseDescriptionEdit').val('');
											swal({
												type:"success",
												title: "Approve Success....",
												confirmButtonText: "Yes",
											}, function(isConfirm){
												location.reload();
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
						} else {
							swal({
								type:"error",
								title: "Cancelled",
								text:"Click OK for Cancel",
								closeOnConfirm:false,
								confirmButtonText:"OK"
							});
						}
					});


				});

			$("#btnSaveSubject").click(
					function() {
						var dataForm = {};
						dataForm.subjectName = $("#subjectName").val();
						dataForm.subjectDescription = $("#subjectDescription").val();
						dataForm.id = $("#courseAllAddInSubject").val();
						if (dataForm.subjectName == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);	
						swal({   title: "Are you sure?",     
							 type: "warning",   
							 showCancelButton: true,
							 confirmButtonColor: "#DD6B55",   
							 confirmButtonText: "Yes, approve it!",   
							 cancelButtonText: "No, cancel pls!",   
							 closeOnConfirm: false,   
							 closeOnCancel: false 
							 }, function(isConfirm){   
							 	if (isConfirm) {
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
				                       			location.reload();
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
							 	} else {
							 		swal({
							 			type:"error",
							 			title: "Cancelled",
							 			text:"Click OK for Cancel",
							 			closeOnConfirm:false,
							 			confirmButtonText:"OK"
							 		});
							 	} 
							 });
			});

			$("#courseAllRemoveInSubject").change(
					function() {
						$("#subjectAllRemoveInSubject").empty();
						var dataForm = {};						
						dataForm.id = $("#courseAllRemoveInSubject").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);	

				$
					.ajax({
						url : "/EvaluateTool/application/courseGetSubject",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {

							var addSubject = JSON.parse(data);
							var dummyOption = 0;
							var genOptionId = ("#option" + dummyOption);


							$.each(addSubject, function(i, item) {
								item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;
								
							$("#option").clone()
								.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
								.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllRemoveInSubject"));
							});
						});

						},
						error : function(data) {
							
						}
				});

			});

			$("#btnRemoveSubject").click(
					function() {
						var dataForm = {};
						dataForm.id = $("#subjectAllRemoveInSubject").val();
						var dataSend = JSON.stringify(dataForm);						
						console.info(dataSend);

						swal({   title: "Are you sure?",     
								 type: "warning",   
								 showCancelButton: true,
								 confirmButtonColor: "#DD6B55",   
								 confirmButtonText: "Yes, approve it!",   
								 cancelButtonText: "No, cancel pls!",   
								 closeOnConfirm: false,   
								 closeOnCancel: false 
								 }, function(isConfirm){   
								 	if (isConfirm) {
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
								                       			location.reload();
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
								 	} else {
								 		swal({
								 			type:"error",
								 			title: "Cancelled",
								 			text:"Click OK for Cancel",
								 			closeOnConfirm:false,
								 			confirmButtonText:"OK"
								 		});
								 	} 
								 });
			});

			$("#courseAllAddInTopic").change(
					function() {
						var dataForm = {};						
						dataForm.id = $("#courseAllAddInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);	

				$
					.ajax({
						url : "/EvaluateTool/application/courseGetSubject",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							$("#subjectAllAddInTopic").empty();
							var addSubject = JSON.parse(data);
							var dummyOption = 0;
							var genOptionId = ("#option" + dummyOption);


							$.each(addSubject, function(i, item) {
								item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;
								
							$("#option").clone()
								.attr('id', 'option' + (++dummyOption)).text(
										name).val(subjectId)
								.insertAfter(genOptionId).show().appendTo(
										$("#subjectAllAddInTopic"));
							});
						});

						},
						error : function(data) {
							
						}
				});

			});

			$("#courseAllEditInSubject").change(
					function() {
						var dataForm = {};
						dataForm.id = $("#courseAllEditInSubject").val();
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

													},
													error : function(data) {

													}
												});
									});
								}
						});
			});

			$("#courseAllRemoveInTopic").change(
					function() {
						var dataForm = {};						
						dataForm.id = $("#courseAllRemoveInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

				$
					.ajax({
						url : "/EvaluateTool/application/courseGetSubject",
						type : 'POST',
						data : {
							dataForm : dataSend
						},
						success : function(data) {
							$("#subjectAllRemoveInTopic").empty();

							var addSubject = JSON.parse(data);
							var dummyOption = 0;
							var genOptionId = ("#option" + dummyOption);

							$.each(addSubject, function(i, item) {
								item.forEach(function(data) {
								var subjectId = data.subjectid;
								var name = data.subjectName;

								
								$("#option").clone()
									.attr('id', 'option' + (++dummyOption)).text(
											name).val(subjectId)
									.insertAfter(genOptionId).show().appendTo(
											$("#subjectAllRemoveInTopic"));
							});
						});

							var dataForm = {};						
						dataForm.id = $("#subjectAllRemoveInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetTopic",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										$("#topicAllRemoveInTopic").empty();

										var addTopic = JSON.parse(data);
										var dummyOption = 0;
										var dummyRoomId = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addTopic, function(i, item) {
											item.forEach(function(data) {
											var topicId = data.topicid;
											var name = data.topicName;

											
											$("#option").clone()
												.attr('id', 'option' + (++dummyOption)).text(
														name).val(topicId)
												.insertAfter(genOptionId).show().appendTo(
														$("#topicAllRemoveInTopic"));
										});
									});

									},
									error : function(data) {
										$("#topicAllRemoveInTopic").empty();
									}
								});

						},
						error : function(data) {
							
						}
				});

			});

			$("#courseAllEditInTopic").change(
					function() {
						var dataForm = {};
						dataForm.id = $("#courseAllEditInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
							.ajax({
								url : "/EvaluateTool/application/courseGetSubject",
								type : 'POST',
								data : {
									dataForm : dataSend
								},
								success : function(data) {
									$("#subjectAllEditInTopic").empty();

									var addSubject = JSON.parse(data);
									var dummyOption = 0;
									var genOptionId = ("#option" + dummyOption);

									$.each(addSubject, function(i, item) {
										item.forEach(function(data) {
											var subjectId = data.subjectid;
											var name = data.subjectName;


											$("#option").clone()
													.attr('id', 'option' + (++dummyOption)).text(
													name).val(subjectId)
													.insertAfter(genOptionId).show().appendTo(
													$("#subjectAllEditInTopic"));
										});
									});

									var dataForm = {};
									dataForm.id = $("#subjectAllEditInTopic").val();
									var dataSend = JSON.stringify(dataForm);
									console.info(dataSend);

									$
											.ajax({
												url : "/EvaluateTool/application/subjectGetTopic",
												type : 'POST',
												data : {
													dataForm : dataSend
												},
												success : function(data) {
													$("#topicAllEditInTopic").empty();

													var addTopic = JSON.parse(data);
													var dummyOption = 0;
													var dummyRoomId = 0;
													var genOptionId = ("#option" + dummyOption);

													$.each(addTopic, function(i, item) {
														item.forEach(function(data) {
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
																	$('#topicNameEdit').val('');
																	$('#topicDescriptionEdit').val('');
																}
															});

												},
												error : function(data) {
													$("#topicAllEditInTopic").empty();
													$('#topicNameEdit').val('');
													$('#topicDescriptionEdit').val('');
												}
									});

								},
								error : function(data) {

								}
						});

			});

			$("#btnSaveTopic").click(
					function() {
						var dataForm = {};
						dataForm.topicName = $("#topicName").val();
						dataForm.topicDescription = $("#topicDescription").val();
						dataForm.id = $("#subjectAllAddInTopic").val();
						if (dataForm.topicName == "") {
							var dataSend = JSON.stringify(null);

						}else{
							var dataSend = JSON.stringify(dataForm);
						};
						console.info(dataSend);	
						swal({   title: "Are you sure?",     
							 type: "warning",   
							 showCancelButton: true,
							 confirmButtonColor: "#DD6B55",   
							 confirmButtonText: "Yes, approve it!",   
							 cancelButtonText: "No, cancel pls!",   
							 closeOnConfirm: false,   
							 closeOnCancel: false 
							 }, function(isConfirm){   
							 	if (isConfirm) {
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
													location.reload();
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
							 	} else {
							 		swal({
							 			type:"error",
							 			title: "Cancelled",
							 			text:"Click OK for Cancel",
							 			closeOnConfirm:false,
							 			confirmButtonText:"OK"
							 		});
							 	} 
							 });
			});

			$("#subjectAllRemoveInTopic").change(
					function() {
						var dataForm = {};						
						dataForm.id = $("#subjectAllRemoveInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
								.ajax({
									url : "/EvaluateTool/application/subjectGetTopic",
									type : 'POST',
									data : {
										dataForm : dataSend
									},
									success : function(data) {
										$("#topicAllRemoveInTopic").empty();

										var addTopic = JSON.parse(data);
										var dummyOption = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addTopic, function(i, item) {
											item.forEach(function(data) {
											var topicId = data.topicid;
											var name = data.topicName;


											$("#option").clone()
												.attr('id', 'option' + (++dummyOption)).text(
														name).val(topicId)
												.insertAfter(genOptionId).show().appendTo(
														$("#topicAllRemoveInTopic"));
										});
									});

									},
									error : function(data) {

									}
						});

			});

			$("#subjectAllEditInTopic").change(
					function() {
						var dataForm = {};
						dataForm.id = $("#subjectAllEditInTopic").val();
						var dataSend = JSON.stringify(dataForm);
						console.info(dataSend);

						$
							.ajax({
							url : "/EvaluateTool/application/subjectGetTopic",
							type : 'POST',
							data : {
								dataForm : dataSend
							},
							success : function(data) {
								$("#topicAllEditInTopic").empty();

								var addTopic = JSON.parse(data);
								var dummyOption = 0;
								var genOptionId = ("#option" + dummyOption);

								$.each(addTopic, function(i, item) {
									item.forEach(function(data) {
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

					});

			$("#btnRemoveTopic").click(
					function() {
						var dataForm = {};
						dataForm.id = $("#topicAllRemoveInTopic").val();
						var dataSend = JSON.stringify(dataForm);						
						console.info(dataSend);		

						swal({   title: "Are you sure?",     
								 type: "warning",   
								 showCancelButton: true,
								 confirmButtonColor: "#DD6B55",   
								 confirmButtonText: "Yes, approve it!",   
								 cancelButtonText: "No, cancel pls!",   
								 closeOnConfirm: false,   
								 closeOnCancel: false 
								 }, function(isConfirm){   
								 	if (isConfirm) {
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
								                       			location.reload();
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
								 	} else {
								 		swal({
								 			type:"error",
								 			title: "Cancelled",
								 			text:"Click OK for Cancel",
								 			closeOnConfirm:false,
								 			confirmButtonText:"OK"
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

	var i =2;
	var j =2;
	var k =2;
	$("#courseDiv").hide();
	$("#subjectDiv").hide();
	$("#topicDiv").hide();

		function showRoom(){
			if(i == 1){
				$("#courseDiv").hide();
				i++;
			}else{
				$("#courseDiv").slideDown(800);
				i--;
			}

		}

		function showSubject(){
			if(j == 1){
				$("#subjectDiv").hide();
				j++;
			}else{
				$("#subjectDiv").slideDown(800);
				j--;
			}

		}

		function showTopic(){
			if(k == 1){
				$("#topicDiv").hide();
				k++;
			}else{
				$("#topicDiv").slideDown(800);
				k--;
			}

		}

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

	$("#menuReSize").hide();
	$("#menulefthead").hide();
	$("#menulefthover").hide();
	$("#menuleftplus").hide();
		$("#contentcol2").removeClass("col-md-2 column");
	$("#contenthead").removeClass("col-md-10 column");
	$("#contenthead").addClass("col-md-12 column");


	</script>
</body>
</html>