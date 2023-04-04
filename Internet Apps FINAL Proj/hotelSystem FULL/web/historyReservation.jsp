<%-- 
    Document   : historyReservation
    Created on : Jan 15, 2021, 2:07:22 AM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <script type="text/javascript">  
            function validateDate() {
                const todaysDate = new Date().getTime() / (1000 * 60 * 60 * 24);
                var msg = "Make sure with your dates !";
                const today = Math.trunc( todaysDate );
                const InDate = new Date(document.getElementById("indate").value).getTime() / (1000 * 60 * 60 * 24);
                const OutDate = new Date(document.getElementById("outdate").value).getTime() / (1000 * 60 * 60 * 24);
                if (InDate > OutDate) {
                    alert( msg + "  CheckOUT Can't be before CheckIN !");
                    return false;
                }
                else {
                    return true;
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400" rel="stylesheet">
        <link rel="stylesheet" href='normalize.css'/>
        <link type="text/css" rel="stylesheet" href="bootstrap.min.css" />
        <link rel="stylesheet" href='historyReservation.css'/>
        <!--   dont uncomment     <link rel="stylesheet" href='homepage.css'/>-->
        <title>Reservation history</title>
        <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
    </head>
    <body>
        <div class="navbar">
            <div class="container">                   
                <a href="adminHomePage.jsp">Home</a>
                <a href="updateHotelInfo.jsp">Hotel Info</a>
                <a href="updateRoomInfo.jsp">Room Info</a>
                <a href="logout">Logout</a>                                                        
                <form style="color:black">
                    <input type="submit" value="Search" required >
                    <input type="text" placeholder="Search.." required >                          
                </form>                                                                                          
            </div>
        </div>   
        <br><br>        
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            
                            <form onsubmit="return validateDate()" action="historyReservation.jsp">
                                <div class="row no-margin">
                                   
                                    <div class="col-md-7">
                                        <div class="row no-margin">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">From Date</span>
                                                    <input class="form-control" type="date" name="fromDate" id="indate" required>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">To Date</span>
                                                    <input class="form-control" type="date" name="toDate" id="outdate" required>
                                                </div>
                                            </div>                    
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-btn">
                                            <button class="submit-btn">show Reservation History</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div> 
            <%
            String url = "jdbc:mysql://localhost:3306/hotelSystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate"); 
                try{              
               Con = DriverManager.getConnection(url, user, password);
               Stmt = Con.createStatement();              
               RS = Stmt.executeQuery("SELECT * FROM hotelsystem.reservation where checkInDate BETWEEN '" + fromDate + "' and  '" + toDate + "'");%>
              
        
            <div class="reservcontainer">
                <br> <br><br><br> 
                <h2>All reservation in this period</h2> <br>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Reservation ID </th>
                            <th>User name </th>
                            <th> Room ID </th>
                            <th>Check in Date </th>
                            <th>Check out Date </th>
                            <th>Number of Guests </th>
                            <th>Price </th>
                        </tr>
                    </thead> 
                    <%while (RS.next()) {%>
                    <tbody>
                        <tr>
                            <td><%=RS.getString("reservationID")%></td>
                            <td><%=RS.getString("userName")%></td>
                            <td><%=RS.getString("roomID")%></td>
                            <td><%=RS.getString("checkInDate")%></td>
                            <td><%=RS.getString("checkoutDate")%></td>
                            <td><%=RS.getString("guestNum")%></td>
                            <td><%=RS.getString("price")%></td>  
                        </tr>
                    </tbody>
                    <%}%>
                </table>
                 <br> <br> <br> <br>  <br>
            </div> 
               
        
        <%    } catch (Exception ex) {
                System.err.println("Exception: " + ex);
            }
        %>
    </body>
</html>
