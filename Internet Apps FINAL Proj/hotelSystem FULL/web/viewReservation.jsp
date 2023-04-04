<%-- 
    Document   : viewReservation
    Created on : Jan 13, 2021, 3:03:04 AM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href='userProfile.css'/>
         <link rel="stylesheet" href='normalize.css'/>
         <link rel="stylesheet" href='viewReservation.css'/>
        <title>My reservation</title>
             <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
    </head>
    <body>
        <div class="navbar">
                    <div class="container">                   
                        <a href="homepage.jsp">Home</a>
                        <a href="userProfile.jsp">My profile</a>
                        <a href="#">My Reservations</a>
                        <a href="logout">Logout</a>                                                        
                        <form>
                             <input type="submit" value="Search"/>
                            <input type="text" placeholder="Search.." required>                          
                        </form>                                                                                          
                    </div>
                </div>
        
        
       <%
           Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/hotelsystem";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet RS = null;
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String id = request.getSession().getAttribute("session_ID").toString();
                RS = Stmt.executeQuery("SELECT * FROM reservation where userID='"+id+"'");
                %>
                
        <div class="currRescontainer">      
            <br><br><br><br><br><br><br><br> 
               <h2>Your Reservations</h2> <br>
                <table border="1" class="t1">
                   <thead>
                        <tr>
                            <th>Reservation ID </th>
                            <th>User name </th>
                            <th>Hotel name </th>
                            <th>Check in Date </th>
                            <th>Check out Date </th>
                            <th>Number of Guests </th>
                            <th>Price </th>
                       </tr>
                 </thead>
                <%  while (RS.next()) {%>
                 <tbody>
                    <td>
                        <%=RS.getString("ReservationID")%>
                    </td>
                    <td>
                        <%=RS.getString("userName")%>
                    </td>
                    <td>
                        <%=RS.getString("hotelName")%>
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
              </tbody>  
              <%}%> 
            </table>
            
            <br>
            <br>
            <form action="cancelReservation" method="POST">
                <div class="inline">Enter Reservation ID you want to cancel</div>
                <div class="iStyle"> <input type="text" name="reserve_id" value="" required></div>
                <div class="dStyle"><input type="submit" value="Cancel" /></div>
            </form> 
            <br>
            <br>
            <form action="updateReservation.jsp" method="POST">
                <div class="inline"> Enter Reservation ID you want to Update</div>
                <div class="iStyle"> <input type="text" name="update_id" value="" required></div>
                <div class="dStyle"> <input type="submit" value="Update" /></div>
            </form> 
        </div> 
    </body>
</html>
