<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Examiner Board</title>
<style>
.bs-sidebar {
	background-color: #D8D8D8;
}
.panel-heading {
	text-align: center;
}
</style>
</head>
<body>
	<div class="row">
		<pre class="bg-primary"><strong>Evaluate Tool</strong></pre>
	</div>
	<div class="row">
		<div class="col-md-12 col-sm-12">
			<div id="container" class="row">
				<div class="col-md-2 col-sm-2">
					<div class="bs-sidebar">
						<ul class="nav bs-sidenav">
							<li><a id="Object-Oriented" href="#">Object-Oriented</a></li>
							<li><a id="Java" href="#">Java</a></li>
							<li><a id="JDBC" href="#">JDBC</a></li>
							<li><a id="Hibernate" href="#">Hibernate</a></li>
							<li><a id="HTML" href="#">HTML + CSS</a></li>
							<li><a id="Servlet" href="#">Servlet + JSP</a></li>
							<li><a id="Spring" href="#">Spring</a></li>
							<li><a id="Javascript" href="#">Javascript + Json</a></li>
							<li><a id="ExtJS" href="#">ExtJS</a></li>
							<li><a id="SVN" href="#">SVN</a></li>
							<li><a id="SQL" href="#">SQL</a></li>
						</ul>
					</div>
				</div>
				<div id="card" class="col-md-10 col-sm-10"></div>

				<div id="objectData">
					<div id="card1" class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Abstraction</h3>
							</div>
							<div class="panel-body">grade C : Understand abstraction concept</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Encapsulation</h3>
							</div>
							<div class="panel-body">grade C : Understand encapsulation concept</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Inheritance</h3>
							</div>
							<div class="panel-body">grade C : Understand inheritance concept</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Polymorphism</h3>
							</div>
							<div class="panel-body">grade C : Understand polymorphism concept</div>
						</div>
					</div>
				</div>
				<div id="javaData">
					<div id="card1" class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Assignments</h3>
							</div>
							<div class="panel-body">grade B : Understand default value of variable, scope of variable wrapper class</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(function() {
		$("#objectData").hide();
		$("#javaData").hide();
		var subject;
		$("#Object-Oriented").click(function() {
			$("#javaData").hide();
			$("#objectData").fadeIn('slow').appendTo($("#card"));
			subject = $(this).text();
		});
		$("#Java").click(function() {
			$("#objectData").hide();
			$("#javaData").fadeIn('slow').appendTo($("#card"));
			subject = $(this).text();
		});
		$("#JDBC").click(function() {
			alert("JDBC");
		});
		$("#Hibernate").click(function() {
			alert("Hibernate");
		});
		$("#HTML").click(function() {
			alert("HTML");
		});
		$("#Servlet").click(function() {
			alert("Servlet");
		});
		$("#Spring").click(function() {
			alert("Spring");
		});
		$("#Javascript").click(function() {
			alert("Javascript");
		});
		$("#ExtJS").click(function() {
			alert("ExtJS");
		});
		$("#SVN").click(function() {
			alert("SVN");
		});
		$("#SQL").click(function() {
			alert("SQL");
		});
		$(".panel").click(function() {
			var title = $(this).children().eq(0).text();
			var detail = $(this).children().eq(1).text();
			window.location.href = '/EvaluateTool/exam?subject='+subject+'&title='+title+'&detail='+detail;
		});
	});
	</script>
</body>
</html>