<%-- 
    Document   : updateRoom
    Created on : Jan 15, 2021, 1:13:37 AM
    Author     : olasa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href='normalize.css'/>
        <link rel="stylesheet" href='userProfile.css'/>
        <title>Update toom info</title>
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
                    <form action="addRoom"> 
                                <div class="iStyle">
                                    <lable>
                                        Room type
                                    </lable>
                                    <input type="text" name="rType"  value="" placeholder="Room Type.." required>
                                </div>  
                                <div class="iStyle">
                                     <lable>
                                        Air conditioner
                                    </lable>
                                    <input type="text" name="airCInfo"  value="" placeholder="Please insert 1 if the room has air conditioner/ 0 if no.." required >
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        WIFI
                                    </lable>
                                    <input type="text" name="wifiInfo"  value="" placeholder="Please insert 1 if the room has wifi/ 0 if no.." required >
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        TV
                                    </lable>
                                    <input type="text" name="TVInfo"  value="" placeholder="Please insert 1 if the room has TV/ 0 if no.." required>
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        Balcony
                                    </lable>
                                    <input type="text" name="bInfo"  value="" placeholder="Please insert 1 if the room has balcony/ 0 if no.." required>
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        Coffee Machine
                                    </lable>
                                    <input type="text" name="coffeInfo"  value="" placeholder="Please insert 1 if the room has coffee machine/ 0 if no.." required>
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        Private bath
                                    </lable>
                                    <input type="text" name="bathInfo"  value="" placeholder="Please insert 1 if the room has Private bath/ 0 if no.." required>
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        Kitchen
                                    </lable>
                                    <input type="text" name="kInfo"  value="" placeholder="Please insert 1 if the room has kitchen/ 0 if no.." required>
                                </div> 
                                <div class="iStyle">
                                     <lable>
                                        Photo
                                    </lable>
                                    <input type="text" name="rPhoto"  value="" placeholder="photo link.." required>
                                </div>

                                <div class="dStyle">
                                    <input type="submit" value="Add Room"/>
                                </div>
                            </form>
                        </td>  
                     </tr>
            </tbody> 
    </body>
</html>
