<%-- 
    Document   : adminCheckClients
    Created on : Jan 14, 2021, 7:44:08 PM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='homepage.css'/>
        <link rel="stylesheet" href='userProfile.css'/>
         <link rel="stylesheet" href='adminCheckClients.css'/>
        <title>Reservations</title>
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
        <br> <br> <br>
        <div class="checkcontainer">
            <table border="1" style=" margin-left:150px;">
                <thead>
                    <tr> 
                        <th>Reservation ID </th>
                        <th>User name </th>
                        <th>Check in Date </th>
                        <th>Check out Date </th>
                        <th>Number of Guests </th>
                        <th>Price </th>
                    </tr> 
                </thead>
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
                    RS = Stmt.executeQuery("SELECT * FROM user where userID='"+user_id+"'");
                    if(RS.next()){
                        String hotelName = RS.getString("hotel_name");
                        RS = Stmt.executeQuery("SELECT * FROM reservation where hotelName LIKE '" + "%"+ hotelName + "%" + "'"); 
                        while(RS.next()){%>
                        <tbody>
                            <tr>
                                <td>
                                   <%=RS.getString("ReservationID")%>
                                </td>
                                <td>
                                    <%=RS.getString("userName")%>
                                </td>
                                <td>
                                    <%=RS.getString("checkInDate")%>
                                </td>
                                <td>
                                    <%=RS.getString("checkoutDate")%>
                                </td>
                                <td>
                                    <%=RS.getString("guestNum")%>
                                </td>
                                <td>
                                    <%=RS.getString("price")%>
                                </td>
                            </tr>
                        </tbody> 
                        <%}%>
            </table>
            <Br> 
            <div>
                <form action="adminSearchClient.jsp">
                    <div class="inline">Enter a client user name to contact</div> 
                    <div class="iStyle">
                             <input type="text" name = "client_name" placeholder="Client name.." required > 
                    </div>
                    <div class="dStyle">
                            <input type="submit" value="Search" required >
                    </div>
                </form> 
            </div>
            <div>
                <form action="cancelReservation">
                    <div class="inline"> Enter a reservation ID to cancel</div>
                    <div class="iStyle">
                    <input type="text" name = "reserve_id" placeholder="Reservation ID.." required > 
                    </div>
                    <div class="dStyle">
                           <input type="submit" value="Cancel" required >
                    </div>
                </form> 
            </div>
            
                
                   <% }
                }
                catch(Exception ex){
                }
            %>
        </div>
    </body>
</html>
