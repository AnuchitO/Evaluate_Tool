<hr/>
<h1>Evaluate  Tool</h1>
<h3 class="alt">jQuery, Apache Tiles, JSP</h3>
<p>
	<a href="hotels/main">Begin</a>
</p>





<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#btnTest").click(function(){
	  $.ajax({
		    url: "ajaxtest",
		    type: 'POST',		   
		    data: {
		    		first:"Anu&chit",
		    		name:"Nong"

		    		},
		    success: function(data) {
		        alert(data); 
		    },
		    error:function(data,status,er) {
		        alert("error: "+data+" status: "+status+" er:"+er);
		    }
		});	  
  });
});
</script>
</head>
<body>

<form  id="form1">
  <!--div class="form-group" id="formGroup1" -->
    <input type="text" class="form-control" value="Search1" id="Search1"/>
    <input type="text" class="form-control" value="Search2" id="Search2"/>
    <input type="text" class="form-control" value="Search3" id="Search3"/>
  <!-- /div -->
  <button type="submit" class="btn btn-default">SubmitA</button>
</form>


<!--div class="list-group" id="list1">
  <a href="#" class="list-group-item active">
    Cras justo odio
  </a>
  <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
  <a href="#" class="list-group-item">Morbi leo risus</a>
  <a href="#" class="list-group-item">Porta ac consectetur ac</a>
  <a href="#" class="list-group-item">Vestibulum at eros</a>
</div-->

<div class="panel panel-default" id="panel1-conter">
  <!-- Default panel contents -->
  <div class="panel-heading">Panel heading</div>
  <div class="panel-body">
    <p style="display:none">AAA</p>
    <input type="text" class="form-control" value="Search2" id="Search2"/>
  </div>
</div>

<button type="button" id="btnTest">Button</button>

</body>
</html>
