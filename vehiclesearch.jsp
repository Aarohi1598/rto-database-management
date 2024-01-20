<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
</style>
</head>
<h1 class="w3-margin w3-jumbo" align="center" style="background-color: darkcyan">REGIONAL TRANSPORT OFFICE</h1>
<body style="background-color: LightCyan">
<div class="navbar">
  <a href="http://localhost:8080/sl1_rto/index.html">Home</a>
  <!--<a href="#">About</a>-->
  <div class="dropdown">
    <button class="dropbtn">Online Services 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/sl1_rto/vehiclesearch.html">Details of Vehicle</a>
      <a href="http://localhost:8080/sl1_rto/licensesearch.html">Details of License </a>
      <a href="http://localhost:8080/sl1_rto/challanlicense.html">Details of e-challan </a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Informative 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/sl1_rto/info1.html">LL/DL/Renewal of DL </a>
      <a href="https://www.acko.com/articles/general-info/things-to-know-about-puc-certificate/">PUC</a>
      <a href="http://localhost:8080/sl1_rto/rules.html">Rules </a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Application
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/sl1_rto/llogin21.html">License Application</a>
      <a href="http://localhost:8080/sl1_rto/vregistration.html">Vehicle Registration</a>
    </div>
  </div> 
  
  <div class="dropdown">
    <button class="dropbtn">Login
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/sl1_rto/admin.jsp">Admin</a>
    </div>
  </div> 
</div>
<br><br><br>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <% 
              
            Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rto1","root","");  
        Statement st ;
        ResultSet rs, rsselect;
               
        String value=request.getParameter("chassis_no");
        
        if(value=="'null'"){
            out.println("not registered");
        }
        else{

            Statement st2 = con.createStatement();
            rsselect = st2.executeQuery("select * from app1, vehicle1, app2 where app1.adhar_no=app2.adhar_no and vehicle1.chassis_no=app2.chassis_no and app2.chassis_no='"+value+"'");
             
        while(rsselect.next()) {
            
            %>
            <table border="1"> 
                <caption>SEARCH RESULT</caption>
                
                <tr>
                    <th>AADHAR NUMBER</th>
                    <th>APPLICANT NAME</th>
                    <th>EMAIL</th>
                    <th>DATE OF BIRTH</th>
                    <th>GENDER</th>
                    <th>CHASSIS NUMBER</th>
                    <th>MODEL NAME</th>
                    <th>REGISTRATION NUMBER</th>
                    <th>MODEL COLOR</th>
                </tr>
    <tr>   
        <td><%= rsselect.getString("adhar_no") %></td> 
        <td><%= rsselect.getString("app_name") %> </td>
        <td><%= rsselect.getString("email") %> </td>
        <td><%= rsselect.getString("age") %> </td>
        <td><%= rsselect.getString("gender") %> </td>
        <td><%= rsselect.getString("chassis_no") %> </td>
        <td><%= rsselect.getString("model_name") %> </td>
        <td>   <%= rsselect.getString("reg_no") %> </td>
        <td><%= rsselect.getString("color") %> </td>
       
    </tr>
            </table> 
        <p>NOTE: 
            If the registration number column contains the value as NULL, the registration process of your vehicle is not yet complete.<br>
                PLEASE CHECK AGAIN LATER.</p>
            
            
            <%
        }
}

       
     %>
 
 
    </body>
</html>
