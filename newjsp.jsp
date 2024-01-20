<%-- 
    Document   : newjsp
    Created on : 10 Oct, 2019, 3:21:27 PM
    Author     : vmule
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <% 
              
            Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rto1","root","");  
        Statement st ;
        ResultSet rs, rsselect;
        
   //  st = con.createStatement();
//            rs = st.executeQuery("select * from rcbin"); //rs contains all of the database contents fetched by query
          
//            System.out.print(rs);
//            System.out.print("after st");
            PreparedStatement stmt=con.prepareStatement("insert into rcbin(`reg_no`,`lic_id`) values(?,?)");     
               
            
                      
    //stmt.setString(1,"john");   
    //stmt.setString(2,"doe"); 
            
            int i=stmt.executeUpdate();
             //con.close();


        // select
            Statement st2 = con.createStatement();
                         rsselect = st2.executeQuery("select * from rcbin");
             
        while(rsselect.next()) {
            
            %>
            
            <p><%= rsselect.getString("reg_no") %> 
        || 
           <%= rsselect.getString("lic_id") %> 
       
            </p>
            
            
            
            <%
        }

       
     %>
 
 
    </body>
</html>
