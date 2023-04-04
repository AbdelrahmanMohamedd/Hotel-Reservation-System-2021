<%-- 
    Document   : adminSearchClient
    Created on : Jan 14, 2021, 7:46:32 PM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href='homepage.css'/>
        <title>client info</title>
             <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
    </head>
    <body>
        <div class="navbar">
            <div class="container">                   
                <a href="adminHomePage.jsp">Home</a>
                <a href="updateHotelInfo.jsp">Hotel Info</a>
                <a href="logout">Logout</a>                                                        
                <form>
                    <input type="submit" value="Search" required >
                    <input type="text" placeholder="Search.." required >                          
                </form>                                                                                          
            </div>
        </div>
        <%
            String client_name = request.getParameter("client_name");
            String url = "jdbc:mysql://localhost:3306/hotelSystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT * FROM reservation where userName LIKE '" + "%"+ client_name + "%" + "'");
                if(RS.next()){
                    String userID = RS.getString("userID");
                    RS = Stmt.executeQuery("SELECT * FROM user where userID='"+userID+"'");
                    if(RS.next()){%>
                    <p>Client name: <%=(RS.getString("DisplayName"))%></p>
                    <p>Client Email: <%=(RS.getString("userEmail"))%></p>
                    <%}                    
                }
            }
            catch(Exception ex){
            }
        %>
    </body>
</html>
