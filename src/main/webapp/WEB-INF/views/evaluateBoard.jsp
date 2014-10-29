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

		<label id="examinerId" value="e001">Examiner : Pite</label> <label
			id="committeeId" value="c001">Committee : P'Aod</label>

		<div id="formBoard">
			<div class="panel-group" id="accordion"></div>
		</div>

		<div id="panelScore" class="panel panel-primary">
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

		<!------------Model------------>

		<div id="panelCollapse0" class="panel panel-primary"></div>
		<div id="panelHeading0" class="panel-heading" data-toggle="collapse"
			data-parent="#accordion" href="#collapse0" data-target="#collapse0">
		</div>
		<h4 id="panelTitle0" class="panel-title">
			<span class="badge pull-right"></span>
		</h4>
		<div id="collapse0" class="panel-collapse collapse"></div>
		<div id="panelBody0" class="panel-body"></div>
		<ul id="navpills0" class="nav nav-pills nav-stacked">
		</ul>
		<li id="listNavpills0" class="lialert" onClick="javascript:showModal(this);"></li> <a id="linkToScore0" href="#"></a>

		<!------------Model------onClick="javascript:$('#modalScore').modal('show');"------>

		<div class="modal fade" id="modalScore" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title textSubject"></h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="panel panel-primary">
									<div class="panel-head">
										<label id="subject" class="text"></label><label id="title" class="textTitle"></label>
									</div>
									<div class="panel-body">
										<label id="detail" class="textDescription"></label>
										<textarea id="message" class="form-control" rows="3"
											placeholder="comment here"></textarea>

										<div class="btn-group">
											<button id="btn0" type="button" class="btn btn-default"
												value="0">0</button>
											<button id="btn03" type="button" class="btn btn-default"
												value="0.3">0.3</button>
											<button id="btn05" type="button" class="btn btn-default"
												value="0.5">0.5</button>
											<button id="btn08" type="button" class="btn btn-default"
												value="0.8">0.8</button>
											<button id="btn1" type="button" class="btn btn-default"
												value="1">1</button>
										</div>

										<button id="buttonSubmit" type="button"
											class="btn btn-primary">Submit</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="score" value="" />
	</div>

	<script>
	
		function showModal(ele) {
			$("#modalScore").modal("show");
			var textDescription = $("#"+ele.id).children('a').text();
			var textSubject = $("#"+ele.id).parent('ul').parent('div').parent('div').parent('div').children('div').children('h4').text();
			$(".textSubject").text(textSubject);
			$(".textDescription").text(textDescription);
		}
	
		$(function() {
			$("#panelScore").hide();
			$("#panelCollapse0").hide();
			$("#panelHeading0").hide();
			$("#panelTitle0").hide();
			$("#panelBody0").hide();
			$("#navpills0").hide();
			$("#listNavpills0").hide();
			var course = JSON.parse("{\"subject\":[{\"topic\":[{\"id\":1,\"description\":\"C Understand abstraction concept.\",\"name\":\"Abstraction\",\"score\":0.8},{\"id\":2,\"description\":\"C Understand encapsulation concept.\",\"name\":\"Encapsulation\",\"score\":0},{\"id\":3,\"description\":\"C Understand inheritance concept.\",\"name\":\"Inheritance\",\"score\":0},{\"id\":4,\"description\":\"C Understand polymorphism concept.\",\"name\":\"Polymorphism\",\"score\":0}],\"id\":1,\"name\":\"Object-Oriented\"},{\"topic\":[{\"id\":5,\"description\":\"C Can declare variable and class in java.\",\"name\":\"Declaration & Access control\",\"score\":0},{\"id\":6,\"description\":\"B Understand default value of variable, scope of variable wrapper class.\",\"name\":\"Assignments\",\"score\":0},{\"id\":7,\"description\":\"C Understand and can use basic operator ( =, ==, !=, <,>,>=,<=, +=,-=,*=,/=,++,--).\",\"name\":\"Operators\",\"score\":0},{\"id\":8,\"description\":\"C Understand the mechanism of  condition statement such as If...else, switch and every type of loop\",\"name\":\"Flow Control - Exceptions\",\"score\":0},{\"id\":9,\"description\":\"C Understand and know how to use java I/O, Serialize concept, Date, Number, and Currency.\",\"name\":\"Strings - IO - Formatting - Parsing\",\"score\":0},{\"id\":10,\"description\":\"C Understand collection hierarchy and can use collection in real life.\",\"name\":\"Generics and Collections\",\"score\":0},{\"id\":11,\"description\":\"C Understand benefit of annotation.\",\"name\":\"Annotation\",\"score\":0}],\"id\":2,\"name\":\"Java\"},{\"topic\":[{\"id\":12,\"description\":\"A Understand What is JDBC?\",\"name\":\"JDBC Introduction\",\"score\":0},{\"id\":13,\"description\":\"B Establishing a Connection with DriverManager.\",\"name\":\"JDBC Connection and DataSource\",\"score\":0},{\"id\":14,\"description\":\"C Understand type of statement.\",\"name\":\"Statement\",\"score\":0},{\"id\":15,\"description\":\"C Understand What is ResultSet?\",\"name\":\"ResultSet API\",\"score\":0},{\"id\":16,\"description\":\"C Understand benefit of Prepared Statement.\",\"name\":\"PreparedStatement API\",\"score\":0},{\"id\":17,\"description\":\"C Understand Database Transaction\",\"name\":\"JDBC Transaction\",\"score\":0},{\"id\":18,\"description\":\"C Understand What is Store Procedure and What is Callable Statement do?\",\"name\":\"Calling Stored Procedure from JDBC\",\"score\":0}],\"id\":3,\"name\":\"JDBC\"},{\"topic\":[{\"id\":19,\"description\":\"A Understand What is ORM ?\",\"name\":\"ORM Concepts\",\"score\":0},{\"id\":20,\"description\":\"C Understand hibernate XML mapping.\",\"name\":\"Hibernate XML Mapping\",\"score\":0},{\"id\":21,\"description\":\"C Understand data relationship. (1-1, 1-*, *-1, *-*).\",\"name\":\"Hibernate Relationship\",\"score\":0},{\"id\":22,\"description\":\"C Can use Criteria class for query data , Can use Projection Class for aggregate function \",\"name\":\"Query data by Hibernate\",\"score\":0},{\"id\":23,\"description\":\"C Can Insert, Update, Delete data with HibernateTemplate.\",\"name\":\"Manipulate Data with Hibernate\",\"score\":0},{\"id\":24,\"description\":\"C Understand How to config hibernate mapping by annotation.\",\"name\":\"Hiberbate annotation\",\"score\":0},{\"id\":25,\"description\":\"C Can use detached criteria to Query Data from database.\",\"name\":\"Detach Criteria\",\"score\":0},{\"id\":26,\"description\":\"B Can Insert, Update and Delete data with HQL.\",\"name\":\"HQL\",\"score\":0},{\"id\":27,\"description\":\"C Understand and Can write sub query in HQL.\",\"name\":\"Sub Query\",\"score\":0}],\"id\":4,\"name\":\"Hibernate\"},{\"topic\":[{\"id\":28,\"description\":\"C Can create simple static webpage (image,table,link,button,form)\",\"name\":\"HTML\",\"score\":0},{\"id\":29,\"description\":\"A Understand xhtml standard coding and know how to use it.\",\"name\":\"XHTML Syntax\",\"score\":0},{\"id\":30,\"description\":\"B Can use style sheet to set font, color and size in web page.\",\"name\":\"CSS Font, Color, Size\",\"score\":0},{\"id\":31,\"description\":\"C Understand and can use static,  relative, absolute, fixed position in each situation.\",\"name\":\"CSS Position, Box Model, Display\",\"score\":0}],\"id\":5,\"name\":\"HTML + CSS\"},{\"topic\":[{\"id\":32,\"description\":\"C Understand MVC Concept. \",\"name\":\"MVC Concept\",\"score\":0},{\"id\":33,\"description\":\"C Install and config tomcat port \",\"name\":\"Sevlet Container\",\"score\":0},{\"id\":34,\"description\":\"C Understand concept of Servlet (GET,POST) & JSP \",\"name\":\"Servlet & JSP\",\"score\":0},{\"id\":35,\"description\":\"C Understand HttpSession and Cookies concept. \",\"name\":\"HttpSession and Cookies\",\"score\":0},{\"id\":36,\"description\":\"A Can use JSTL core(c tag), function(fn tag). \",\"name\":\"JSTL\",\"score\":0},{\"id\":37,\"description\":\"C Understand the benefit of Tag Files. \",\"name\":\"Tag Files\",\"score\":0}],\"id\":6,\"name\":\"Servlet + JSP\"},{\"topic\":[{\"id\":38,\"description\":\"C Can create new bean configuration. \",\"name\":\"Spring Configuration\",\"score\":0},{\"id\":39,\"description\":\"B Can config Hibernate to use with Spring Framework. \",\"name\":\"Hibernate with Spring Framework\",\"score\":0},{\"id\":40,\"description\":\"C Can configuration Spring by annotation \",\"name\":\"Spring Annotations\",\"score\":0},{\"id\":41,\"description\":\"C Can config & create Simple Web Application by Spring \",\"name\":\"Spring MVC\",\"score\":0},{\"id\":42,\"description\":\"B Can create new view in tile configuration. \",\"name\":\"Apache Tiles\",\"score\":0},{\"id\":43,\"description\":\"B Can add more message to message file. \",\"name\":\"Spring Message Source\",\"score\":0},{\"id\":44,\"description\":\"C Can use spring message. \",\"name\":\"Spring Tags\",\"score\":0}],\"id\":7,\"name\":\"Spring\"},{\"topic\":[{\"id\":45,\"description\":\"A Understand Javascript syntax and scope of variable \",\"name\":\"Javascript syntax\",\"score\":0},{\"id\":46,\"description\":\"C Understand and know basic Javascript function. \",\"name\":\"Javascript Functions\",\"score\":0},{\"id\":47,\"description\":\"B Can use javascript event. \",\"name\":\"Javascript Event\",\"score\":0},{\"id\":48,\"description\":\"B Understand benefit of JSON. \",\"name\":\"JSON\",\"score\":0},{\"id\":49,\"description\":\"B Use javascript access dom element. \",\"name\":\"DOM\",\"score\":0}],\"id\":8,\"name\":\"Javascript + Json\"},{\"topic\":[{\"id\":50,\"description\":\"A Can use form(Textfield, Datefield, Button) component. \",\"name\":\"Form (Textfield, Datefield, Button)\",\"score\":0},{\"id\":51,\"description\":\"B Can use ExtJS ComboBox and Softsquare ComboBox \",\"name\":\"Combo box (ExtJS combobox, Softsquare combobox)\",\"score\":0},{\"id\":52,\"description\":\"A Can use ExtJS Dialog, Window, Field set, Panel, Message box \",\"name\":\"Dialog, Window, Field set, Panel, Message box\",\"score\":0},{\"id\":53,\"description\":\"C Can use ExtJS Editor Grid Panel and Softsquare Editor Grid Panel. \",\"name\":\"Grid\",\"score\":0},{\"id\":54,\"description\":\"B Can use ExtJS TabPanel. \",\"name\":\"Tab\",\"score\":0},{\"id\":55,\"description\":\"B Can use ExtJS tree. \",\"name\":\"Tree\",\"score\":0}],\"id\":9,\"name\":\"ExtJS\"},{\"topic\":[{\"id\":56,\"description\":\"C Understand advantage and concept of SVN and how to synchronize document from SVN. \",\"name\":\"SVN\",\"score\":0}],\"id\":10,\"name\":\"SVN\"},{\"topic\":[{\"id\":57,\"description\":\"B Can use DML , Query from multiple table and oracle buildin function. \",\"name\":\"SQL Statement\",\"score\":0},{\"id\":58,\"description\":\"B Can create stored procedure and function \",\"name\":\"PL/SQL\",\"score\":0}],\"id\":11,\"name\":\"SQL\"}]}");
			$("#topicList").click(function() {
				var dummyPanel = 0;
				var dummyHead = 0;
				var dummyCollapse = 0;
				var dummyTitle = 0;
				var dummyBody = 0;
				var dummyNavpills = 0;
				var dummyList = 0;
				var dummyLink = 0;
				var sizeTopic = 0;
				var genIdPanel = $("#panelCollapse"+ dummyPanel);
				var genIdHead = $("#panelHeading" + dummyHead);
				var genIdTitle = $("#panelTitle" + dummyTitle);
				var genIdCollapse = $("#collapse"+ dummyCollapse);
				var genIdBody = $("#panelBody" + dummyBody);
				var genIdNavpills = $("#navpills"+ dummyNavpills);
				var genIdListNav = $("#listNavpills"+ dummyList);
				var genIdLink = $("#linkToScore" + dummyLink);
				$("#panelScore").hide();
				$("#accordion").empty();
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
								$("#listNavpills0").clone().attr('id','listNavpills'+ (++dummyList))
												.insertAfter(genIdListNav).show()
												.appendTo($("#navpills"+ dummyNavpills));
								$("#linkToScore0").clone().attr('id','linkToScore'+ (++dummyLink))
												.text(sendTitle+ " : "+ sendDescription)
												.insertAfter(genIdLink).show()
												.appendTo($("#listNavpills"+ dummyList));
							}
							sizeTopic++;
					});
				});
			});
			$("#presenting").click(function() {
				$("#accordion").empty();
				$("#panelScore").fadeIn('slow').appendTo($("#formBoard"));
			});
			$(".lialert").click(function() {
				$("#accordion").empty();
				$("#panelScore").fadeIn('slow').appendTo($("#formBoard"));
			});
			$("#aaa").click(
					function() {
						var data = {};
						data.examinerId = $("#examinerId").attr('value');
						data.committeeId = $("#committeeId").attr('value');

						var dataSend = JSON.stringify(data);

						$.ajax({
							url : "/EvaluateTool/committeeBoard",
							type : 'POST',
							data : {
								data : dataSend
							},
							success : function(data) {

							},
							error : function(data, status, er) {
								alert("error: " + data + " status: " + status
										+ " er:" + er);
							}
						});
						$("#modalScore").modal("show");
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