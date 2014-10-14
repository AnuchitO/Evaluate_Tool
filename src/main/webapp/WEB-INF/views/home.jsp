<hr/>
<h1>Evaluate  Tool</h1>
<h3 class="alt">jQuery, Apache Tiles, JSP</h3>
<p>
	<a href="hotels/main">Begin</a>
</p>





<!DOCTYPE html>
<html>
<head>
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

<button type="button" id="btnTest">Button</button>

</body>
</html>
