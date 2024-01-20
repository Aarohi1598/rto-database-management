<!--
regisrtation number of vehicle by admin
!-->
<!DOCTYPE html>
<html>
<title>RTO</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

input[type=text], select, textarea {
  width: 50%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

input[type=signup] {
  background-color: Green;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=signup]:hover {
  background-color: Green;
}

.container {
  border-radius: 5px;
  background-color: LightCyan;
  padding: 20px;
}

header{
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: Black;
}
</style>
</head>
<h1 class="w3-margin w3-jumbo" align="center" style="background-color: darkcyan">REGIONAL TRANSPORT OFFICE</h1>
<body style="background-color: LightCyan">
<div class="navbar">
  <a href="http://localhost:8080/sl1_rto/llogin1.html">Home</a>
  <a href="http://localhost:8080/sl1_rto/admin.jsp">Log Out</a>
</div>

<script>
	function validateForm() {
	var x = document.forms["myForm"]["fname"].value;
	if (x == "") {
	alert("Name must be filled out");
    	return false;
  	}
}
</script>

<header>VEHICLE REGISTRATION STATUS</header>

<div class="container"> 
<form name="myForm" action="http://localhost:8080/sl1_rto/updatevehicle3.jsp" >
<center>
  <div class="row">
	<div class="col-25">
      		<label for="cid">Vehicle's Chassis number:</label>
    	</div>
    	<div class="col-75">
            <input type="text" id="chassis_no" name="chassis_no" onsubmit="return validateForm()" method="post" minlength="12" required>
    	</div>
  	</div>
<br><br>

<div class="row">
	<div class="col-25">
      		<label for="cid">Enter registration number:</label>
    	</div>
    	<div class="col-75">
            <input type="text" id="reg_no" name="reg_no" onsubmit="return validateForm()" method="post" required>
    	</div>
  	</div>
<br><br>
</center>
    
<center>
        <input type="submit" value="SUBMIT"><br><br>
        <input type="reset" value="Reset">
    </center>
    
</form>
</div>
    
</body> 
</html>
