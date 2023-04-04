<%-- 
    Document   : search.jsp
    Created on : Jan 12, 2021, 6:14:19 PM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page import= "java.time.LocalDate" %>
<%@page import ="java.time.temporal.ChronoUnit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='search.css'/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,300,700" rel="stylesheet">
        <title>Hotels Page</title>  
        <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
    </head>
    <body>
        <div class="navbar">
                    <div class="container">                   
                        <a href="homepage.jsp">Home</a>
                        <a href="userProfile.jsp">My profile</a>
                        <a href="viewReservation.jsp">My Reservations</a>
                        <a href="logout">Logout</a>                                                        
                        <form>
                             <input type="submit" value="Search"/>
                            <input type="text" placeholder="Search.."/>                          
                        </form>                                                                                          
                    </div>
        </div> <br>
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                  <thead>
                    <tr>
                      <th>Photo</th>
                      <th>Hotel Name</th>
                      <th>User Comment</th>
                      <th>User Rating</th>
                      <th>Price</th>
                      <th>Stars rating</th>
                      <th>View on Map </th>
                       <th>Learn More!</th>
                    </tr>
                  </thead>
                </table>
            </div>

        <%
            String url = "jdbc:mysql://localhost:3306/hotelSystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            int GuestNumber= Integer.parseInt( request.getParameter("GuestNum")); 
            String city = request.getParameter("city");
            String checkin = request.getParameter("CheckIn");
            String checout = request.getParameter("CheckOut");
            LocalDate dateBefore = LocalDate.parse(checkin);
            LocalDate dateAfter = LocalDate.parse(checout);
            long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
            try {
                Con = DriverManager.getConnection(url, user, password);  
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("SELECT * FROM hotel,room where hotel.City LIKE '" + "%"+ city + "%" + "' and hotel.roomID=room.roomID and room.isAvailable=1");  
                while (RS.next()) {
                    String HotelID =RS.getString("hotel.hotelID");
                    String hotelName = RS.getString("hotel.HotelName");
                    String userRating = RS.getString("hotel.userRating");
                    String userComment = RS.getString("hotel.userComments");
                    String hprice = RS.getString("hotel.hotelExpectedPrice");
                    long newPrice = Long.parseLong(hprice) * noOfDaysBetween * GuestNumber;
                    String price  = String.valueOf(newPrice);
                    String photo = RS.getString("hotel.hotelPhotos");
                    int stars = Integer.parseInt(RS.getString("hotel.hotelStars"));
                    String location = RS.getString("hotel.location");     
                    %>         
                    <br>
        <div class="hoteltable"> 
            <div class="tbl-content">
               
              <table class='HotelRows' cellpadding="0" cellspacing="0" border="0">
               
                <tbody> 
                   <tr>
                      <td>
                          <img src=<%=photo%> alt="" width="175" height="175" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" > 
                      </td>
                      <td>
                          <form action="reserveHotel.jsp">
                                 <p><%=hotelName%></p>
                                 <div class="hotelname">    
                                  <input class="inputres" name="hotelname" type="text"  value= <%=hotelName%> />
                                </div>    
                                <input type="submit" class="reservebutton" value="Reserve a room" />
                          </form>
                           
                      </td>
                      <td>
                          <p><%=userComment%></p>
                      </td>
                      <td>
                          <p><%=userRating%></p>
                      </td>
                      <td> 
                          <p> <%=price%></p>
                      </td>
                      <td>
                          <p><%  for(int i=0;i<stars;i++){ out.print("★");} %></p>
                      </td>
                      <td>
                          <p><iframe src=<%=location%> width="150" height="125" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" title="Location"></iframe></p>
                      </td>
                       <td>
                          <form action='HotelInfo.jsp'> 
                                <div class="HotelID">    
                                    <input class="inputres" name="hotelid" type="text"  value= <%=HotelID%> />
                                </div>    
                                <input type="submit" class="dropbtn" value="More Info!" > 
                          </form>                        
                       </td>                      
                   </tr>                   
                </tbody>               
              </table>                     
            </div>        
        </div>
        <%}
            } catch (Exception ex) {
                System.err.println("Exception: " + ex);
            }
        %>
    </body>
</html>









 
  
 

 