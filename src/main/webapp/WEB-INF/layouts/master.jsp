<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" scope="request"
	value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
@IMPORT url("${contextPath}/resources/styles/css/bootstrap.min.css");
@IMPORT url("${contextPath}/resources/styles/css/bootstrap-select.css");
@IMPORT url("${contextPath}/resources/styles/css/semantic.css");
@IMPORT url("${contextPath}/resources/styles/css/alertify.core.css");
@IMPORT url("${contextPath}/resources/styles/css/alertify.default.css");
@IMPORT url("${contextPath}/resources/styles/css/sweet-alert.css");
@IMPORT url("${contextPath}/resources/styles/css/custombox.min.css");
@IMPORT url("${contextPath}/resources/styles/css/datepicker3.css");
@IMPORT url("${contextPath}/resources/styles/css/bootstrap-timepicker.min.css");
/*@IMPORT url("${contextPath}/resources/styles/css/alertify.bootstrap.css");*/
		#menuindropdownlist{
			margin:30px;
		}
		#menuindropdownlist:hover{
			cursor: pointer;
		}
		#listmenuoptioninline{
			display:inline;
		}
		#dropdownoption{
			width:350px;
			background-color: #f5f5f5;
		}
		#listmenuoptioninlinetitle{
			margin-left: 40px;
			display:inline;
		}
		.glyphicon:hover{
			cursor: pointer;
		}
		@font-face {
		   font-family: myFont;
		   src: url(${contextPath}/resources/styles/fonts/fontawesome-webfont.woff);
		}
		body{
			font-family: myFont;
		}
		.input-group-addon{
			color:white;
			background-color:#5C6166;
		}
</style>
<!--[if lt IE 8]>
	        <link rel="stylesheet" href="<c:url value="/resources/blueprint/ie.css" />" type="text/css" media="screen, projection" />
	<![endif]-->
<script type="text/javascript"
	src="<c:url value="/resources/javascript/jquery/jquery-1.11.1.min.js" />"></script>
</head>
<body>
	<!-- Container -->
	<div class="container">
		<!-- row clearfix -->
		<div class="row clearfix">
			<!-- col-md-12 column -->
			<div class="col-md-12 column">
				<nav role="navigation" style="background-color:#ffa100;border-color:#ff8d00" class="navbar navbar-default  navbar-fixed-top" id="navbar-example">
					<div class="navbar-header">
						<button data-target=".bs-example-js-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> </div>
						<div class="navbar-collapse bs-example-js-navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
							<ul class="nav navbar-nav">
								<!-- Name Project -->
								<li ><a><b id="nameproject" style="color:black;font-size:18pt">Evaluate Tool</b></a></li></ul>
								<!-- End Name Project -->
								<!-- Nav Bar Right -->
								<ul class="nav navbar-nav  navbar-right" style="margin-right:20px">
									<!-- Name and Pic Profile Account -->
										<li class="dropdown"><a><img src="${contextPath}/resources/images/user.png" width="32px" height="32px"/><b style="color:black"><span id="fullname"></span></b></a>
										</li>
									<!-- End Name and Pic Profile Account -->
									<!-- DropDown Approve -->
									<li id="headdropdownapprovepermission"  class="dropdown"> <a id="anotificationapprove" data-toggle="dropdown"><img id="imgnotificationapprove" class="glyphicon" src="${contextPath}/resources/images/approve.png" width="32px" height="30px"/><span id="badgenotificationapprove" style="color:black;background-color:white;position:relative;right:10px;bottom:10px" class="badge"></span></a>
										<ul class="dropdown-menu"  style="height:415px;overflow-y: scroll;"  id="dropdownapprovepermission">
											<li><b><span style="font-size:11pt">  มอบหน้าที่ให้เป็น  Modulator</b></span><hr/></li>
											<li class="dropdown-submenu">
												<div id="dropdownoption">
													<div id="listrequestapprove" value="">
														
													</div>							
												</div>
											</li>
											<hr/>
											<li><center>
												<a href="#" id="showlistallapprove" tabindex="-1">ดูทั้งหมด</a>
											</center></li>
										</ul>
									</li>
									<!-- End DropDown Approve -->
									<!-- DropDown Submit And Cancel -->
									<li id="headdropdownsubmitandcancel" > 
										<a id="anotificationsubmitandcalcel"><img id="imgnotificationsubmitandcalcel" class="glyphicon" src="${contextPath}/resources/images/notification.png" width="32px" height="30px"/>
											<span id="badgenotificationsubmitandcalcel" style="color:black;background-color:white;position:relative;right:10px;bottom:10px" class="badge"></span>
										</a>
										<ul id="dropdownsubmitandcancel" class="dropdown-menu" style="height:360px;overflow-y: scroll;">
											<li><b><span style="font-size:11pt">การแจ้งเตือน</b></span><hr/></li>
											<li class="dropdown-submenu">
												<div id="dropdownoption">
												<div id="listrequestsubmitandcancel" value="">
													</div>
												</div>
											</li>
											<hr/>
											<li><center>
												<a href="#" id="showlistallsbmitandcancel" tabindex="-1">ดูทั้งหมด</a>
											</center></li>
										</ul>
									</li>
									<!-- End DropDown Submit And Cancel -->
									<!-- DropDown Config -->
									<li id="headdropdownconfig" class="dropdown"> <a id="anotificationconfig" ><img id="imgnotificationconfig" class="glyphicon" src="${contextPath}/resources/images/config.png" width="32px" height="30px"/></a>
										<ul id="dropdownconfig" class="dropdown-menu">
											<li class="dropdown-submenu">
												<div id="dropdownoption">
													<div >
														<div style="margin-left:40px" class="ui feed">
															<div class="event">
																<div class="content" hidden id="confighome">
																	<div class="summary">
																		<a href="#"><p><img class="glyphicon" src="${contextPath}/resources/images/home.png" width="20px" height="32px"/></p></a>
																		Home
																	</div>
																</div>
																<div class="content" hidden id="configroom">
																	<div class="summary">
																		<a id="room" href="#"><p><img class="glyphicon" src="${contextPath}/resources/images/room.png" width="20px" height="32px"/></p></a>					Room
																	</div>
																</div>
																<div class="content" hidden id="configreport">
																	<div lass="summary">
																		<a id="report" href="#"><p><img class="glyphicon" src="${contextPath}/resources/images/report.png" width="35px" height="32px"/></p></a>
																		Report
																	</div>
																</div>
															</div>
														</div>	
													</div>
													<div >
														<div style="margin-left:40px" class="ui feed">
															<div class="event">
																<div class="content" hidden id="confighistory">
																	<div class="summary">
																		<a href="#"><p><img class="glyphicon" src="${contextPath}/resources/images/history.png" width="20px" height="32px"/></p></a>
																		History
																	</div>
																</div>
																<div class="content" hidden id="configmanager">
																	<div style="width:100px"class="summary">
																		<a href="#"><p><img class="glyphicon" src="${contextPath}/resources/images/manager.png" width="20px" height="32px"/></p></a>
																		Manager
																	</div>
																</div>

															</div>
														</div>	
													</div>
												</div>
											</li>
											<hr/>
											<li><div style="margin-left:75%" tabindex="-1"><a ><button id="logOut" class="ui orange tiny button">Logout</button></a></div></li>
										</ul>
									</li>
									<!-- End DropDown Config -->
								</ul>
								<!-- End Nav Bar Right -->
							</div>
							<!-- /.nav-collapse -->
						</nav>
						<!-- Menu Left Plus -->
						<div id="menuleftplus" style="width:100px;position:fixed;top:50%;left:0px;z-index:2"><img class="glyphicon" id="imgmenuleftplus" src="${contextPath}/resources/images/plus.png" width="32px" height="30px" onclick="openmenuplus()" /><b hidden id="extendimgmenuplus">Plus</b></div>
						<!-- End Menu Left Plus -->
						<!-- Menu Left -->
						<div id="menulefthover" style="width:100px;position:fixed;top:50%;left:0px;z-index:2"><img class="glyphicon" id="imgmenuleft" src="${contextPath}/resources/images/menu.png" width="32px" height="30px" onclick="openmenuleft()" /><b hidden id="extendimgmenuleft">Menu</b></div>
						<div id="menulefthead" style="position:fixed;z-index:1" >
							<div id="menuleft" hidden style="margin-top:100px">
								<div style="width:150px;background-color:#eee" class="ui vertical labeled icon menu">
									<a class="red item">
										<img class="glyphicon" src="${contextPath}/resources/images/002.png" width="32px" height="30px" />
										Mail
									</a>
									<a class="teal item">
										<img class="glyphicon" src="${contextPath}/resources/images/002.png" width="32px" height="30px" />
										Lab
									</a>
									<a class="green item">
										<img class="glyphicon" src="${contextPath}/resources/images/002.png" width="32px" height="30px" />
										Favorites
									</a>
									<a id="menuleftbtnCompleteExamination" class="green item">
										<div id="showbtnCompleteExamination">
										<img id="btnCompleteExamination" class="glyphicon" src="${contextPath}/resources/images/002.png" width="32px" height="30px" />
										</div>
										Complete
									</a>
								</div>
							</div>
						</div>
						<!-- End Menu Left -->
						<!-- Content Data -->
						<div id="contentcol2" class="col-md-2 column">
							<div hidden id="fromadd" style="height:700px;width:280px;margin-top:100px;z-index:5;margin-bottom:20px;position:fixed;background-color: rgb(176, 225, 223)" class="ui form segment">
								<span>เพิ่มห้อง <div style="margin-bottom:10px;float:right"class="ui green huge submit button">เพิ่ม</div></span>
								<div class="field">
									<input placeholder="ชื่อห้อง" name="nameroom" type="text">
								</div>
								<div class="field">
									<textarea placeholder="คำอธิบาย" name="description"></textarea>
								</div>
								<div class="field">
									<div class="ui black button floating dropdown labeled icon" style="height:25px">
										<i class="dropdown icon"></i>
										<span id="nameExaminer" class="text" style="font-size:8pt">ผู้เข้าสอบ</span>
										<p id="validExaminer" style="color:white;background-color:red"></p>
										<div class="menu">
											<div class="item">Arabic</div>
											<div class="item">Chinese</div>
											<div class="item">Danish</div>
											<div class="item">Dutch</div>
											<div class="item">English</div>
										</div>
									</div>
								</div>
								<div class="field">
									<div id="dropdownaa" class="ui black button dropdown labeled  icon " style="height:25px">
										<i class="dropdown icon"></i>
										<span id="nameCommitti" class="text" style="font-size:8pt">หัวหน้าห้องสอบ</span>
										<p id="validCommitti" style="color:white;background-color:red"></p>
										<div class="menu">
											<div class="item">Arabic</div>
											<div class="item">Chinese</div>
											<div class="item">Danish</div>
											<div class="item">Dutch</div>
											<div class="item">English</div>
										</div>
									</div>
								</div>
								<div class="field">
									<div class="input-daterange input-group" id="datepicker">
										<span class="input-group-addon" style="color:black">Start Date</span>
										<input type="text" class="input-sm form-control" name="startDate" />
									</div>
								</div>
								<div class="field">
									<div class="bootstrap-timepicker pull-right">
									<span class="input-group-addon" >Start Time</span>
										<input id="timepicker3" type="text" class="input-sm form-control" name="startTime">
									</div>
								</div><br/>
								<div class="field">
									<div class="bootstrap-timepicker pull-right">
									<span class="input-group-addon">End Time</span>
										<input id="timepicker4" type="text" class="input-sm form-control" name="endTime">
									</div>
								</div>
							
						</div>
						</div>
						<div id="contenthead" class="col-md-10 column">
							<div style="margin-top:100px;margin-bottom:10%;" class="panel panel-warning">
								<div class="panel-heading" style="background-color:#ffa100;border-color:#ff8d00">
								</div>
								<div class="panel-body">
									<!-- <button class="ui teal tiny button" onclick="notificationapprove()">notificationapprove</button> -->
				<!-- 					<button id="btnnotificationsubmitandcalcel" class="ui orange tiny button"  onclick="notificationsubmitandcalcel()">notificationsubmitandcalcel</button>
									<button id="btnnotificationsubmitandcalcel" class="ui orange tiny button"  onclick="processPercent()">Percent</button> -->
									<!-- <br/><hr/> -->
									<tiles:insertAttribute name="body" />
								</div>
							</div>
						</div>
						<!-- End Content Data -->
						<!-- Footer -->
						<!-- <nav role="navigation" style="background-color:#eee" class="navbar navbar-default  navbar-fixed-bottom" id="navbar-example"><center>
							<b style="color:black;font-size:12pt">&copy 2014 Evaluate Tool</b>
						</center></nav> -->
						<!-- End Footer -->
					</div>
					<!-- col-md-12 column -->
				</div>
				<!-- row clearfix -->
			</div>
			<!-- End Container -->
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/bootstrap-select.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/semantic.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/alertify.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/sweet-alert.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/custombox.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/bootstrap-timepicker.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/progressbar.min.js"></script>
<!--	<script type="text/javascript"
		src="${contextPath}/resources/sockjs-0.3.4.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/stomp.js"></script>-->
	<script type="text/javascript">
			$("#anotificationconfig").click(function(){
				$("#dropdownconfig").slideToggle(400);
			});
	</script>
</body>
</html>