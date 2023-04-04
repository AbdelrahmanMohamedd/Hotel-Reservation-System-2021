<%-- 
    Document   : homepage
    Created on : Jan 10, 2021, 1:57:59 AM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE HTML>
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
                else if( InDate < today || OutDate < today){ 
                    alert( msg + "  You Can't select a date in the PAST !!!");
                    return false; 
                }
                else {
                    return true;
                }
            }
        </script>

        <title>Reserve Now!</title>
        <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
        <link href="https://fonts.googleapis.com/css?family=Poppins:400" rel="stylesheet">
        <link rel="stylesheet" href='normalize.css'/>
        <link type="text/css" rel="stylesheet" href="bootstrap.min.css" />
        <link rel="stylesheet" href='reserveHotels.css'/>
    </head>
    <body>
        <div class="navbar">
            <div class="container">                   
                <a href="homepage.jsp">Home</a>
                <a href="userProfile.jsp">My profile</a>
                <a href="viewReservation.jsp">My Reservations</a>
                <a href="logout">Logout</a>                                                        
                <form style="color:black">
                    <input type="submit" value="Search" required >
                    <input type="text" placeholder="Search.." required >                          
                </form>                                                                                          
            </div>
        </div> 
<!--        RESERVATION FORM-->
<br>   <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            <form onsubmit="return validateDate()" action="reserve">
                                <div class="row no-margin">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <span class="form-label">Name</span>
                                            <input class="form-control" type="text" name="name" placeholder="Your name..." required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row no-margin">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">Check In</span>
                                                    <input class="form-control" name="checkin" type="date" id="indate" required>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">Check out</span>
                                                    <input class="form-control" name="checkout"type="date" id="outdate" required>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <span class="form-label">Guests</span>

                                                    <input class="form-control" type="number" name="guest" placeholder="..">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-btn">
                                            <button class="submit-btn">Reserve This room</button>
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
            String hotelName = request.getParameter("hotelname");
            String url = "jdbc:mysql://localhost:3306/hotelSystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            try{
                Con = DriverManager.getConnection(url, user, password);  
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT * FROM hotel,room where hotel.hotelName LIKE '" + "%"+ hotelName + "%" + "' and hotel.roomID=room.roomID");
                if(RS.next()){                                                       
                    HttpSession rooms = request.getSession(true);
                    rooms.setAttribute("session_hotelID",RS.getString("hotel.hotelID"));                   
                    rooms.setAttribute("session_hotelName",RS.getString("hotel.hotelName"));                   
                    rooms.setAttribute("session_roomID",RS.getString("hotel.roomID"));
                    rooms.setAttribute("session_hotelPrice",RS.getString("hotel.hotelExpectedPrice"));
                    String photo = RS.getString("room.roomPic");
                    %>  
            <!--  ROOM TABLE VIEW -->   
            <div>   
                <table  STYLE="margin-bottom:50px; align-content: center" class='roomtable' border="2"> 
                    <thead> 
                        <th>
                            <H2>Room Photo</H2>
                        </th>
                        <th>
                            <H2>Room Facilities</H2>
                        </th>
                    </thead>
                    <tbody> 
                        <tr> 
                            <td>
                               <img src=<%=photo%> alt="" width="500" height=400" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" >
                            </td>
                            <td> 
                                <div class='faciltytable'>
                                    <p>Room type: <%=RS.getString("room.roomType")%></p>
                                    <% if(RS.getString("room.AirCond").equals("1")){%>
                                    <p>Air conditioner</p> 
                                    <% } 
                                    if(RS.getString("room.WIFI").equals("1")){%>
                                    <p>WIFI</p> 
                                    <% }
                                    if(RS.getString("room.TV").equals("1")){%>
                                    <p>TV</p> 
                                    <%}
                                    if(RS.getString("room.Balcony").equals("1")){%>
                                    <p>Balcony</p> 
                                    <%}
                                    if(RS.getString("room.CoffeMachine").equals("1")){%>
                                    <p>Coffee Machine</p> 
                                    <% }
                                    if(RS.getString("room.PrivBath").equals("1")){%>
                                    <p>Private bath</p> 
                                    <%}
                                    if(RS.getString("room.Kitchen").equals("1")){%>
                                    <p>Kitchen</p> 
                                </div>
                            </td>
                        </tr>  
                   </tbody> 
                </table> 
             </div>    
                    <%}                    
                    }
                }
                catch(Exception ex){
                } 
                %> 
    </body> 
</html>


 