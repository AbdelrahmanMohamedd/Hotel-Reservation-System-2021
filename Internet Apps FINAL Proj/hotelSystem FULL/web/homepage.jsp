<%-- 
    Document   : homepage
    Created on : Jan 10, 2021, 1:57:59 AM
    Author     : olasa
--%>

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
                else if( InDate < today || OutDate < today){ 
                    alert( msg + "  You Can't select a date in the PAST !!!");
                    return false; 
                }
                else {
                    return true;
                }
            }
        </script>
        <title>Home page</title>
        <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
        <link href="https://fonts.googleapis.com/css?family=Poppins:400" rel="stylesheet">
        <link rel="stylesheet" href='normalize.css'/>
        <link type="text/css" rel="stylesheet" href="bootstrap.min.css" />
        <link rel="stylesheet" href='homepage.css'/>
    </head>
    

    <body>
        <div class="navbar">
            <div class="container">                   
                <a href="#">Home</a>
                <a href="userProfile.jsp">My profile</a>
                <a href="viewReservation.jsp">My Reservations</a>
                <a href="logout">Logout</a>                                                        
                <form style="color:black">
                    <input type="submit" value="Search" required >
                    <input type="text" placeholder="Search.." required >                          
                </form>                                                                                          
            </div>
        </div>

        <div class="background">
            <div class="container">
                <div class="intro">
                    <h2 style=" font-family: Marker Felt, fantasy; font-size:100px;"> Reserve your Hotel</h2>                          
                </div>  
            </div>
        </div>
<!--        ////////////////RESERVATION FORM //////////////////////////////////-->
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            
                            <form onsubmit="return validateDate()" action="search.jsp">
                                <div class="row no-margin">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <span class="form-label">Destination</span>
                                            <input class="form-control" type="text" name="city" placeholder="Country, city..." required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row no-margin">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">Check In</span>
                                                    <input class="form-control" type="date" name="CheckIn" id="indate" required>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <span class="form-label">Check out</span>
                                                    <input class="form-control" type="date" name="CheckOut" id="outdate"  required>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <span class="form-label">Guests</span>
                                                    <select class="form-control" name="GuestNum" required>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                    <span class="select-arrow"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-btn">
                                            <button class="submit-btn">Check availability</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
