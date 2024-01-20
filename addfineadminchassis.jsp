<%-- 
add fine usnig chassis
--%>
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
</style>
</head>
<h1 class="w3-margin w3-jumbo" align="center" style="background-color: darkcyan">REGIONAL TRANSPORT OFFICE</h1>
<body style="background-color: LightCyan">
<div class="navbar">
  <a href="http://localhost:8080/sl1_rto/llogin1.html">Home</a>
  <a href="http://localhost:8080/sl1_rto/admin.jsp">Log Out</a>
</div>
</body>
</html>


<%@ page language="java" import="java.sql.*"%>

<%

    String fine_id = request.getParameter("fine_id");

    String status = request.getParameter("status");
    String doi = request.getParameter("doi");

    String amt = request.getParameter("amt");

    String reg_no = request.getParameter("reg_no");
    
    try {
     Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rto1","root","");  
        
        //Class.forName("oracle.jdbc.driver.OracleDriver");


       // PreparedStatement ps = con.prepareStatement("insert into lic1 values(?,?,?)");
        
       // ps.setString(1, adhar_no);
       String query = "{CALL p3(?,?,?,?,?)}";
       CallableStatement stmt = con.prepareCall(query);
               stmt.setString(1, fine_id);
               stmt.setString(2, status);
               stmt.setString(3, amt);
               stmt.setString(4, doi);
               stmt.setString(5, reg_no);
        
               ResultSet rs = stmt.executeQuery();
       
       //  ps.executeUpdate();

       /*PreparedStatement ps1 = con.prepareStatement("insert into fine2 values(?,?,?)");
       
        ps1.setString(1, chassis_no);

        ps1.setString(2, "--");
        ps1.setString(3, fine_id);
    
        ps1.executeUpdate();*/
       
        //delay to be given
        out.println("Inserted successfully");

    } catch (Exception e) {

        //out.println(e);
        out.println("REGISTRATION NUMBER NOT VALID");

    } 

%>