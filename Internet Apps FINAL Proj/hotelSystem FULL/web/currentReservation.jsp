<%-- 
    Document   : currentReservation
    Created on : Jan 15, 2021, 1:46:00 AM
    Author     : olasa
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='normalize.css'/>
        <link rel="stylesheet" href='userProfile.css'/>
        <link rel="stylesheet" href='currentReservation.css'/>
        <title>Current reservations</title>
             <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
    </head>
    <body>
        <div class="navbar">
            <div class="container">                   
                <a href="adminHomePage.jsp">Home</a>
                <a href="updateHotelInfo.jsp">Hotel Info</a>
                <a href="updateRoomInfo.jsp">Room Info</a>
                <a href="logout">Logout</a>                                                        
                <form>
                    <input type="submit" value="Search" required >
                    <input type="text" placeholder="Search.." required >                          
                </form>                                                                                          
            </div>
        </div>
<!--        TABLE -->
        <div class="currRescontainer">
            <h3>List of current reservations</h3> 
            <table border="1" class="t1">
                    <thead>
                        <tr>
                            <th>reservation ID</th> 
                            <th>check In Date</th> 
                            <th>check out Date</th>
                            <th>Guest Number</th>
                            <th>User name</th>
                            <th>price</th>
                        </tr>   
                    </thead> 
        
        <%
            String url = "jdbc:mysql://localhost:3306/hotelSystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
          //  String checkInDate = request.getParameter("checkInDate");
            SimpleDateFormat ft =new SimpleDateFormat ("yyyy-MM-dd"); 
            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String Line ="SELECT * FROM hotelsystem.reservation";
                RS = Stmt.executeQuery(Line);
                while (RS.next()) {
                String checkInDate =RS.getString("checkInDate");   
                String checkOutDate =RS.getString("checkoutDate");
                
                java.util.Date Today =new java.util.Date();
                Timestamp currentDate = new Timestamp(Today.getTime());  
                
                java.util.Date checkInDatee = ft.parse(checkInDate);
                Timestamp checkInDateee = new Timestamp(checkInDatee.getTime());
                
                java.util.Date checkOutDatee = ft.parse(checkOutDate);
                Timestamp checkOutDateee = new Timestamp(checkOutDatee.getTime());
                long now = currentDate.getTime() ;
                long Chin = checkInDateee.getTime();
                long Chout = checkOutDateee.getTime(); 

                if( now > Chin && now < Chout ){
                      
        %> 
                <tbody>
                    <tr>
                        <td><%=RS.getString("reservationID")%></td>
                        <td><%=RS.getString("checkInDate")%></td>
                        <td><%=RS.getString("checkoutDate")%></td>
                        <td><%=RS.getString("guestNum")%></td>
                        <td><%=RS.getString("userName")%></td>
                        <td><%=RS.getString("price")%></td>             
                    </tr>   
                </tbody>
                 

                <%}}%>
            </table>
        </div>

       
         <%  } catch (Exception ex) {
                System.err.println("Exception: " + ex);
            }
        %>
        

    </body>
</html>
