<%-- 
    Document   : adminHomePage
    Created on : Jan 10, 2021, 2:57:26 AM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>

<html>
    <head>
        <title> Admin Home page</title>
             <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
        <link rel="stylesheet" href='normalize.css'/>
        <link rel="stylesheet" href='homepage.css'/>
        <link rel="stylesheet" href='userProfile.css'/>
    </head>
    <body>
        <div class="navbar">
            <div class="container">                   
                <a href="#">Home</a>
                <a href="updateHotelInfo.jsp">Hotel Info</a>
                <a href="updateRoomInfo.jsp">Room Info</a>
                <a href="logout">Logout</a>                                                        
                <form>
                    <input type="submit" value="Search" required >
                    <input type="text" placeholder="Search.." required >                          
                </form>                                                                                          
            </div>
        </div>

        <div class="background">
            <div class="container">
                <div class="intro">
                    <h2> Admin Controls </h2>                             
                </div>  
            </div>
        </div>
        <%
            String user_id = request.getSession().getAttribute("session_ID").toString();
            String url = "jdbc:mysql://localhost:3306/hotelSystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT * FROM user where userID='" + user_id + "'");
                if (RS.next()) {
                    String hotelName = RS.getString("hotel_name");
                    if (hotelName.equals("")) {%>
        <form action="addAdminHotelName">
            <div class="inline">Please Enter your hotel name</div>
            <div class="iStyle">
                <input type="text" name="hotelName" value="" required>
            </div>
            <div class="dStyle">
                <input type="submit" value="Add My Hotel" >
            </div>
        </form>                       
        <%} else {%>

        <form action="adminCheckClients.jsp">
            <div class="dStyle">
                <input  type = "submit" value = "Check clients in and out">
            </div>
        </form>
        <form action="currentReservation.jsp">
            <div class="dStyle">
                <input  type = "submit" value = "View current Reservation">
            </div>
        </form> 

        <form action="historyReservation.jsp">
            <div class="dStyle">
                <input  type = "submit" value = "View Reservation history">
            </div>
        </form>      
        
        <form action="hotelRating.jsp">
            <div class="dStyle">
                <input  type = "submit" value = "View Hotel Rating">
            </div>
        </form>
 
        <%}
                }
            } catch (Exception ex) {
            }


        %>
    </body>
</html>

