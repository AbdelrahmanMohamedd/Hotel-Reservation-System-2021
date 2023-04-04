<%-- 
    Document   : updateReservation
    Created on : Jan 14, 2021, 4:23:06 AM
    Author     : olasa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
        <link href="https://fonts.googleapis.com/css?family=Poppins:400" rel="stylesheet">
        <link rel="stylesheet" href='normalize.css'/>
        <link type="text/css" rel="stylesheet" href="bootstrap.min.css" />
        <link rel="stylesheet" href='viewReservation.css'/>
        <link rel="stylesheet" href='reservehotel.css'/>
        <link rel="stylesheet" href='homepage.css'/>
    </head>
    <body>
        <%
            String updateID = request.getParameter("update_id");
            HttpSession session4 = request.getSession(true);
            session4.setAttribute("session_updateID",updateID);
        %>
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
                
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            <form action="updateReservation">
                                <div class="row no-margin">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <span class="form-label">Name</span>
                                            <input class="form-control" type="text" name="name" placeholder="Your name..." required >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row no-margin">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">Check In</span>
                                                    <input class="form-control" name="checkin" type="date" required>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">Check out</span>
                                                    <input class="form-control" name="checkout"type="date" required>
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
                                            <button class="submit-btn">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</html>
