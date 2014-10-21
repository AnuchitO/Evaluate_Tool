<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Droppable - Default functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
fieldset {
	background: yellow;
	width: 100%;
	height: 100%;
	margin: 10px 10px 10px 10px;
}

#draggable {
	width: 25%;
	height: 100px;
	padding: 0.5em;
	float: left;
	margin: 10px 10px 10px 10px;
}

#droppable {
	width: 250px;
	height: 250px;
	padding: 0.5em;
	float: left;
	margin: 20px;
}

#box {
	background: rgb(66, 184, 221);
	border: 5px solid grey;
	width: 46%;
	height: 250px;
	padding: 0.5em;
	float: left;
	margin: 10px 10px 10px 10px;
}

#button {
	width:15%;
}
</style>
<script>
	$(function() {
		$("#draggable").draggable().hide();
		$("#droppable").droppable(
				{
					drop : function(event, ui) {
						$(this).addClass("ui-state-highlight").find("p2").html(
								"Dropped!");
					}
				});

		$("#button").button().click(function() {
			$("#box").append($("#draggable").clone().draggable().show());
		})
	});
</script>
</head>
<body>

	<fieldset>

		<div id="droppable" class="ui-widget-header">
			<p2>Drop here</p2>
		</div>

		<button id="button">Create Object</button>

		<div id="box" class="ui-widget-header">
		</div>

		<div id="draggable" class="ui-widget-content">
			<p1>Drag me to target</p1>
		</div>

	</fieldset>



</body>
</html>