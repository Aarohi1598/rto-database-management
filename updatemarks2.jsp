<!--
updating test marks result for admin
-->
<html>
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
</style>
</head>
<h1 class="w3-margin w3-jumbo" align="center" style="background-color: darkcyan">REGIONAL TRANSPORT OFFICE</h1>
<body style="background-color: LightCyan">
<div class="navbar">
  <a href="http://localhost:8080/sl1_rto/updatemarks1.html">back</a>
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
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String adhar_no = request.getParameter("adhar_no");
    String marks = request.getParameter("marks");
      
    try {
     Class.forName("com.mysql.jdbc.Driver");  
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/rto1","root","");  
        Statement st ;
    ResultSet rs, rsselect;
    
    String value1=request.getParameter("adhar_no");
    String value2=request.getParameter("marks");
    Statement st2 = con1.createStatement();
    int i = st2.executeUpdate("update test set marks= '"+value2+"' where adhar_no='"+value1+"'");

        
        //ps.setString(1, reg_no);

         //ps.executeUpdate();
         out.println(" updated successfully");
    }
    catch (Exception e) {

        out.println(e);

    } 
%>
    </body>
</html>