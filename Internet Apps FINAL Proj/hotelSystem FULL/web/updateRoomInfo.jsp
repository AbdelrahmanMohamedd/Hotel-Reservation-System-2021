<%-- 
    Document   : updateRoomInfo
    Created on : Jan 15, 2021, 1:01:17 AM
    Author     : olasa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='normalize.css'/>
        <link rel="stylesheet" href='userProfile.css'/>
        <title>Room Info</title>
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
        
        <form action="updateRoom.jsp">
            <div class="dStyle">
                <input type="submit" value="Update Room"/>
            </div>
        </form>

        <form action="addRoom.jsp">
            <div class="dStyle" >
                <input type="submit" value="Add New Room"/>
            </div>
        </form>
    </body>
</html>
