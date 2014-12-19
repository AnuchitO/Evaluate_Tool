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
	margin-top: 20px;
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
						<h3>Course</h3>
						<input class="textbox"type="text" placeholder="Cource" id="courseName">
						<input class="textbox"type="text" placeholder="Cource : Description" id="courseDescription">
						<button type="button" class="btn" id="btnSaveCourse">Add</button>
					</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
						<select id="courseAll">
							<option id="option0"></option>
						</select>										
						<button type="button" class="btn" id="btnRemoveCourse">Remove</button>
					</div>
				</form>
			</div>
			<div id="subjectDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00" >
				<form>
					<div>
					<h3>Subject</h3>
					<select id="courseAllInSubject">
						<option id="option1"></option>
					</select>	
					<input class="textbox"type="text" placeholder="Subject" id="SubjectName">
					<input class="textbox"type="text" placeholder="Subject : Description" id="SubjectDescription">
					<button type="button" class="btn" id="btnSaveSubject">Add</button>
				</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
					<select id="courseAllInSubject2">
						<option id="option2"></option>
					</select>	
					<select id="courseAllInSubject3">
						
					</select>											
					<button type="button" class="btn" id="btnRemoveSubject">Remove</button>
				</div>
				</form>
				
			</div>
			<div id="topicDiv" style="border-style: solid ; margin-bottom: 20px ; background-color: #FFFFFF ;
				border-color: #FF8C00">
				<form>
					<div>
					<h3>Topic</h3>
					<select id="courseAllInSubject4">
						<option id="option4"></option>
					</select>	
					<select id="courseAllInSubject5">

					</select>	
					<br></br>
					<input class="textbox"type="text" placeholder="Topic" id="TopictName">
					<input class="textbox"type="text" placeholder="Topic : Description" id="TopicDescription">
					<button type="button" class="btn" id="btnSaveTopic">Add</button>
				</div>
				</form>
				<form>
					<div style="margin-bottom: 20px">
					<select id="courseAllInSubject6">
						<option id="option6"></option>
					</select>		
					<select id="courseAllInSubject7">
						<option id="option7"></option>
					</select>	
					<select id="courseAllInSubject8">
						<option id="option8"></option>
					</select>									
					<button type="button" class="btn" id="btnRemoveTopic">Remove</button>
				</div>
				</form>
				
			</div>
			<option id="option"></option>
		</div>
	</div>

	<script>
	$(function() {

			var completedRoom = JSON.parse('${allCourse}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			var genRoomId = ("#roomId" + dummyRoomId);

			$.each(completedRoom, function(i, item) {

				item.forEach(function(course) {

					var nameAndLastName = course.courseName;
					var examinerId = course.courseId;
					$("#option0").clone()
							.attr('id', 'option' + (++dummyOption)).text(
									nameAndLastName).val(examinerId)
							.insertAfter(genOptionId).show().appendTo(
									$("#courseAll"));
				});
			});

			var completedRoom = JSON.parse('${allCourse}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			var genRoomId = ("#roomId" + dummyRoomId);

			$.each(completedRoom, function(i, item) {

				item.forEach(function(course) {

					var nameAndLastName = course.courseName;
					var examinerId = course.courseId;
					$("#option1").clone()
							.attr('id', 'option' + (++dummyOption)).text(
									nameAndLastName).val(examinerId)
							.insertAfter(genOptionId).show().appendTo(
									$("#courseAllInSubject"));
				});
			});	

			var completedRoom = JSON.parse('${allCourse}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			var genRoomId = ("#roomId" + dummyRoomId);

			$.each(completedRoom, function(i, item) {

				item.forEach(function(course) {

					var nameAndLastName = course.courseName;
					var examinerId = course.courseId;
					$("#option2").clone()
							.attr('id', 'option' + (++dummyOption)).text(
									nameAndLastName).val(examinerId)
							.insertAfter(genOptionId).show().appendTo(
									$("#courseAllInSubject2"));
				});
			});

			var completedRoom = JSON.parse('${allCourse}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			var genRoomId = ("#roomId" + dummyRoomId);

			$.each(completedRoom, function(i, item) {

				item.forEach(function(course) {

					var nameAndLastName = course.courseName;
					var examinerId = course.courseId;
					$("#option4").clone()
							.attr('id', 'option' + (++dummyOption)).text(
									nameAndLastName).val(examinerId)
							.insertAfter(genOptionId).show().appendTo(
									$("#courseAllInSubject4"));
				});
			});

			var completedRoom = JSON.parse('${allCourse}');
			var dummyOption = 0;
			var dummyRoomId = 0;
			var genOptionId = ("#option" + dummyOption);
			var genRoomId = ("#roomId" + dummyRoomId);

			$.each(completedRoom, function(i, item) {

				item.forEach(function(course) {

					var nameAndLastName = course.courseName;
					var examinerId = course.courseId;
					$("#option6").clone()
							.attr('id', 'option' + (++dummyOption)).text(
									nameAndLastName).val(examinerId)
							.insertAfter(genOptionId).show().appendTo(
									$("#courseAllInSubject6"));
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
												 			type:"warning",
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
						dataForm.id = $("#courseAll").val();
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
													 			type:"warning",
													 			title: "Can't Delete...",
												 		}, function(isConfirm){
								                       
												 		});
													};
													
												},
												error : function(data) {
													swal({
													 			type:"warning",
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
						dataForm.id = $("#courseAllInSubject").val();
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
													 			type:"warning",
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
			// $
			// 		.ajax({
			// 			url : "/EvaluateTool/application/saveSubject",
			// 			type : 'POST',
			// 			data : {
			// 				dataForm : dataSend
			// 			},
			// 			success : function(data) {
			// 				alert(data);
			// 			},
			// 			error : function(data) {
			// 				alert("Fail");
			// 			}
			// 		});

			});

			$("#courseAllInSubject2").change(
					function() {
							$("#courseAllInSubject3 option").each(
								function(){
									$(this).remove();
							});

						var dataForm = {};						
						dataForm.id = $("#courseAllInSubject2").val();
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

							var addRoom = JSON.parse(data);
							var dummyOption = 0;
							var dummyRoomId = 0;
							var genOptionId = ("#option" + dummyOption);	


							$.each(addRoom, function(i, item) {
								item.forEach(function(data) {
								var roomId = data.subjectid;
								var name = data.subjectName;
								
							$("#option").clone()
								.attr('id', 'option' + (++dummyOption)).text(
										name).val(roomId)
								.insertAfter(genOptionId).show().appendTo(
										$("#courseAllInSubject3"));
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
						dataForm.id = $("#courseAllInSubject3").val();
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
													 			type:"warning",
													 			title: "Can't Delete...",
												 		}, function(isConfirm){
								                       
												 		});
													};
													
												},
												error : function(data) {
													swal({
													 			type:"warning",
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

			// $
					// .ajax({
					// 	url : "/EvaluateTool/application/deleteSubject",
					// 	type : 'POST',
					// 	data : {
					// 		dataForm : dataSend
					// 	},
			// 			success : function(data) {
			// 				location.reload();
			// 			},
			// 			error : function(data) {
			// 				alert("Fail");
			// 			}
			// 		});

			});

			$("#courseAllInSubject4").change(
					function() {
						var dataForm = {};						
						dataForm.id = $("#courseAllInSubject4").val();
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
							$("#courseAllInSubject5").empty();
							$("#courseAllInSubject5 option").each(
								function(){
									$(this).empty();
							});
							var addRoom = JSON.parse(data);
							var dummyOption = 0;
							var dummyRoomId = 0;
							var genOptionId = ("#option" + dummyOption);	


							$.each(addRoom, function(i, item) {
								item.forEach(function(data) {
								var roomId = data.subjectid;
								var name = data.subjectName;
								
							$("#option").clone()
								.attr('id', 'option' + (++dummyOption)).text(
										name).val(roomId)
								.insertAfter(genOptionId).show().appendTo(
										$("#courseAllInSubject5"));
							});
						});

						},
						error : function(data) {
							
						}
					});

			});

			$("#courseAllInSubject6").change(
					function() {
						var dataForm = {};						
						dataForm.id = $("#courseAllInSubject6").val();
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
							$("#courseAllInSubject7").empty();

							var addRoom = JSON.parse(data);
							var dummyOption = 0;
							var dummyRoomId = 0;
							var genOptionId = ("#option" + dummyOption);

							$.each(addRoom, function(i, item) {
								item.forEach(function(data) {
								var roomId = data.subjectid;
								var name = data.subjectName;

								
								$("#option").clone()
									.attr('id', 'option' + (++dummyOption)).text(
											name).val(roomId)
									.insertAfter(genOptionId).show().appendTo(
											$("#courseAllInSubject7"));
							});
						});

							var dataForm = {};						
						dataForm.id = $("#courseAllInSubject7").val();
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
										$("#courseAllInSubject8").empty();

										var addRoom = JSON.parse(data);
										var dummyOption = 0;
										var dummyRoomId = 0;
										var genOptionId = ("#option" + dummyOption);

										$.each(addRoom, function(i, item) {
											item.forEach(function(data) {
											var roomId = data.topicid;
											var name = data.topicName;

											
											$("#option").clone()
												.attr('id', 'option' + (++dummyOption)).text(
														name).val(roomId)
												.insertAfter(genOptionId).show().appendTo(
														$("#courseAllInSubject8"));
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

			$("#btnSaveTopic").click(
					function() {
						var dataForm = {};
						dataForm.TopictName = $("#TopictName").val();
						dataForm.TopicDescription = $("#TopicDescription").val();
						dataForm.id = $("#courseAllInSubject5").val();
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
													 			type:"warning",
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
			// $
			// 		.ajax({
			// 			url : "/EvaluateTool/application/saveTopic",
			// 			type : 'POST',
			// 			data : {
			// 				dataForm : dataSend
			// 			},
			// 			success : function(data) {
			// 				alert(data);
			// 			},
			// 			error : function(data) {
			// 				alert("Fail");
			// 			}
			// 		});

			});

			$("#courseAllInSubject7").change(
					function() {
						var dataForm = {};						
						dataForm.id = $("#courseAllInSubject7").val();
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
							$("#courseAllInSubject8").empty();

							var addRoom = JSON.parse(data);
							var dummyOption = 0;
							var dummyRoomId = 0;
							var genOptionId = ("#option" + dummyOption);

							$.each(addRoom, function(i, item) {
								item.forEach(function(data) {
								var roomId = data.topicid;
								var name = data.topicName;

								
								$("#option").clone()
									.attr('id', 'option' + (++dummyOption)).text(
											name).val(roomId)
									.insertAfter(genOptionId).show().appendTo(
											$("#courseAllInSubject8"));
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
						dataForm.id = $("#courseAllInSubject8").val();
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
													 			type:"warning",
													 			title: "Can't Delete...",
												 		}, function(isConfirm){
								                       
												 		});
													};
													
												},
												error : function(data) {
													swal({
													 			type:"warning",
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

			// $
			// 		.ajax({
			// 			url : "/EvaluateTool/application/deleteTopic",
			// 			type : 'POST',
			// 			data : {
			// 				dataForm : dataSend
			// 			},
			// 			success : function(data) {
			// 				alert(data);
			// 			},
			// 			error : function(data) {
			// 				alert("Fail");
			// 			}
			// 		});

			});

	});

	</script>
</body>
</html>