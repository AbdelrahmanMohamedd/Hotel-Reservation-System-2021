<%-- 
    Document   : updateHotelInfo
    Created on : Jan 14, 2021, 10:57:47 PM
    Author     : olasa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='normalize.css'/>
        <link rel="stylesheet" href='userProfile.css'/>
        <title>update hotel info </title>
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
                <br><br><br><br><br><br>

     <table  style="margin-left:200px ;" class="t1">
         <tbody>
            <tr> 
                <td> 
                    <form action="updateHotelInfo"> 
                        <div class="iStyle">
                            <lable>
                                 Hotel expected Price
                            </lable>
                            <input type="text" name="hPrice"  value="" placeholder="price for the day.." required>
                        </div> 
                        <div class="iStyle">
                            <lable>
                                Hotel info
                            </lable>
                            <input type="text" name="hInfo"  value="" placeholder="Hotel info.." required>
                        </div> 
                        <div class="iStyle">
                            <lable>
                                 Location
                            </lable>
                            <input type="text" name="hLocation"  value="" placeholder="location link.." required>
                        </div>  
                        <div class="iStyle">
                            <lable>
                                  Photo
                            </lable>
                            <input type="text" name="hPhoto"  value="" placeholder="photo link.." required>
                        </div> 
                        <div class="dStyle">
                            <input type="submit" value="Update"/>
                        </div>
                    </form> 
                </td>  
            </tr>
         </tbody> 
    </body>
</html>
