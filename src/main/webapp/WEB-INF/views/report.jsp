<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Tool</title>
<style>
a {
	cursor: pointer;
}

div {
	margin-right: 20px;
}
table>thead>tr>th {
	text-align: center;
}
table>tbody>tr>td {
	text-align: center;
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
						<li><a id="logOut">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1 col-md-1 col-sm-offset-3 col-md-offset-3">
				<label>Examiner</label>
			</div>
			<div class="col-sm-3 col-md-3">
				<select id="pickExaminer" class="selectpicker" data-width="100%">
					<option>ALL</option>
				</select>
			</div>
			<div class="col-sm-1 col-md-1">
				<button>Sumary</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5 col-md-5 col-sm-offset-3 col-md-offset-3">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Examiner</th>
							<th>Score</th>
							<th>Percent</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Patipol Sirisuppakij</td>
							<td>80 of 100</td>
							<td>80%</td>
						</tr>
						<tr>
							<td>Anuchit Prasertsang</td>
							<td>45 of 60</td>
							<td>75%</td>
						</tr>
						<tr>
							<td>Chutimon Chaiyo</td>
							<td>80 of 80</td>
							<td>100%</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>