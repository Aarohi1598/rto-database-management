<%-- 
    Document   : data
    Created on : 13 Oct, 2019, 4:45:22 PM
    Author     : vmule
    "connected to vregistration.html"
--%>
<html>
<title>RTO</title>
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
</body>
</html>


<%@ page language="java" import="java.sql.*"%>

<%

    String adhar_no = request.getParameter("adhar_no");

    String app_name = request.getParameter("app_name");

    String email = request.getParameter("email");

    String age = request.getParameter("age");

    String gender = request.getParameter("gender");

    String chassis_no = request.getParameter("chassis_no");

   String model = request.getParameter("model_name");
   
   String reg_no = request.getParameter("reg_no"); 
    String color = request.getParameter("color"); 
    String category = request.getParameter("category"); 
    String fuel_type = request.getParameter("fuel_type"); 

    try {
     Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rto1","root","");  
        
        //Class.forName("oracle.jdbc.driver.OracleDriver");


        PreparedStatement ps = con.prepareStatement("insert into app1 values(?,?,?,?,?)");
        
        ps.setString(1, adhar_no);

        ps.setString(2, app_name);

        ps.setString(3, email);

        ps.setString(4, age);

        ps.setString(5, gender);
         ps.executeUpdate();

       PreparedStatement ps1 = con.prepareStatement("insert into vehicle1 values(?,?,?,?)");
       
        ps1.setString(1, chassis_no);

        ps1.setString(2, model);
    
        ps1.setString(3, reg_no);
        
        ps1.setString(4, color);

        ps1.executeUpdate();
       
        //delay to be given
        
        PreparedStatement ps2 = con.prepareStatement("insert into app2 values(?,?)");
        
        ps2.setString(1,adhar_no);
        ps2.setString(2,chassis_no);
        
        ps2.executeUpdate();
        
        PreparedStatement ps3 = con.prepareStatement("insert into vehicle2 values(?,?,?)");
        
        ps3.setString(1,model);
        ps3.setString(2,category);
        ps3.setString(3,fuel_type);
        
        ps3.executeUpdate();

        out.println(" registered successfully");

    } catch (Exception e) {

        out.println(e);

    } 

%>