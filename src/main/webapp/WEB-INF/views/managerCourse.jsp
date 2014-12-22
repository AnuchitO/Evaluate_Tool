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
		<div class="col-sm-3 col-md-12 col-md-offset-0">
			<div id="courseDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00">
				<form>
					<div>
						<h2 style="text-align: center">Course</h2>
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
			<div id="subjectDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00" >
				<form>
					<div>
					<h2 style="text-align: center">Subject</h2>
					<h4 style="margin-left: 50px">Add Subject</h4>
					<select id="courseAllAddInSubject">
					</select>	
					<input class="textbox"type="text" placeholder="Subject" id="SubjectName">
					<input class="textbox"type="text" placeholder="Subject : Description" id="SubjectDescription">
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
						<input class="textbox"type="text" placeholder="Subject" id="SubjectNameEdit">
						<input class="textbox"type="text" placeholder="Subject : Description" id="SubjectDescriptionEdit">
						<button type="button" class="btn" id="btnEditSubject">Edit</button>
					</div>
				</form>
				
			</div>
			<div id="topicDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00">
				<form>
					<div>
					<h2 style="text-align: center">Topic</h2>
					<h4 style="margin-left: 50px">Add Topic</h4>
					<select id="courseAllAddInTopic">
					</select>	
					<select id="subjectAllAddInTopic">
					</select>	
					<br></br>
					<input class="textbox"type="text" placeholder="Topic" id="TopictName">
					<input class="textbox"type="text" placeholder="Topic : Description" id="TopicDescription">
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


			$("#subjectAllRemoveInSubject option").each(
					function(){
						$(this).remove();
					});

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

			$("#btnSaveSubject").click(
					function() {
						var dataForm = {};
						dataForm.SubjectName = $("#SubjectName").val();
						dataForm.SubjectDescription = $("#SubjectDescription").val();
						dataForm.id = $("#courseAllAddInSubject").val();
						if (dataForm.SubjectName == "") {
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
												$('#SubjectName').val('');
												$('#SubjectDescription').val('');
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
							$("#subjectAllRemoveInSubject option").each(
								function(){
									$(this).remove();
							});

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
							$("#subjectAllAddInTopic option").each(
								function(){
									$(this).empty();
							});
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

			$("#btnSaveTopic").click(
					function() {
						var dataForm = {};
						dataForm.TopictName = $("#TopictName").val();
						dataForm.TopicDescription = $("#TopicDescription").val();
						dataForm.id = $("#subjectAllAddInTopic").val();
						if (dataForm.TopictName == "") {
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
												$('#CourseName').empty();											
												$('#SubjectName').val('');
												$('#TopictName').val('');												
												$('#CourseDescription').val('');
												$('#TopicDescription').val('');
												$('#SubjectDescription').val('');
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
							alert("Fail");
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

	});

	</script>
</body>
</html>