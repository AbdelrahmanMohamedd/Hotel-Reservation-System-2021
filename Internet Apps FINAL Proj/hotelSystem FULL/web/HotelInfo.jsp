<%-- 
    Document   : HotelInfo
    Created on : 12-Jan-2021, 21:56:50
    Author     : ag
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='HotelInfo.css'/> 
        <title>Hotel info</title>
        <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript">
            function CheckReview() {
                var checked1 = document.getElementById('rate-1').checked;
                var checked2 = document.getElementById('rate-2').checked;
                var checked3 = document.getElementById('rate-3').checked;
                var checked4 = document.getElementById('rate-4').checked;
                var checked5 = document.getElementById('rate-5').checked;
                if(Boolean(checked1) || Boolean(checked2) || Boolean(checked3) || Boolean(checked4) || Boolean(checked5) ) {
                  alert("Thanks for Rating us !");
                 return true;
                }
                else if(!Boolean(checked1) && !Boolean(checked2) && !Boolean(checked3) && !Boolean(checked4) && !Boolean(checked5) ) {
                  alert("Don't forget to rate using stars");
                  return false;
                }
            }
        </script>
    </head>
    <body>
        <%  
        String url = "jdbc:mysql://localhost:3306/hotelSystem";
        String user = "root";
        String password = "root";
        Connection Con = null;
        Statement Stmt = null;
        ResultSet RS = null;
        String hotelid = request.getParameter("hotelid");
        
         try{
            Con = DriverManager.getConnection(url, user, password);
            Stmt = Con.createStatement();
            String Line;
            Line= "SELECT * FROM hotel where hotelID = '" + hotelid +"'";
            RS = Stmt.executeQuery(Line);
            while (RS.next()){
             String hotelInfor = RS.getString("hotel.MoreInfo");
             String hotelName = RS.getString("hotel.hotelName");
             String hotelpic =RS.getString("hotel.hotelPhotos");
            %> 
            <br><br>
            <div class="TableContainer"> 
                <table border="1" class="t1">
                    <tbody> 
                        <tr> 
                            <td>  
                               <div style="width: 60%; float:left">
                                   <h1>More Information about </h1>
                                   <h2 style="text-decoration: underline;" > "<%= hotelName %>"</h2> 
                                   <h5 align="left" ><%= hotelInfor %></h5>
                                </div> 
                                <div style="width:40%; float:right">
                                    <br>
                                    <br>
                                    <img  style="border-radius:15px; margin-right: 10px; " src=<%=hotelpic%> alt="" width="400" height="400" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" > 
                                </div> 
                            </td>  
                        </tr>
                        <tr>
                            <td> 
                                <div  align="left" >
                                    <form action="SetReview" onsubmit="return CheckReview()" > 
                                        <div>
                                            <h3> - Your opinion is very valuable to us to improve the quality of our service </h3>
                                            <h4> So please Leave your Review below ... </h4> 
                                        </div> 
                                        <div class="row">
                                            <div style="float: left; width: 35%;">
                                               <input class="commentTXTbox" type="text" name="comment" value="" placeholder="Leave your comment here..." required > 
                                            </div>
                                            <div style="float: left; width: 40%;">
                                                <div class="container">
                                                    <div class="star-widget  ">
                                                        <input type="radio" name="rate" value="5" id="rate-5"><label for="rate-5" class="fas fa-star"></label>
                                                        <input type="radio" name="rate" value="4" id="rate-4"><label for="rate-4" class="fas fa-star"></label>
                                                        <input type="radio" name="rate" value="3" id="rate-3"><label for="rate-3" class="fas fa-star"></label>
                                                        <input type="radio" name="rate" value="2" id="rate-2"><label for="rate-2" class="fas fa-star"></label>
                                                        <input type="radio" name="rate" value="1" id="rate-1"><label for="rate-1" class="fas fa-star"></label>
                                                    </div>
                                                </div><br>  
                                            </div>
                                            <div style="float: left;    width: 15%;">
                                                <input type="submit" class="Reviewbtn" value="Send Review">
                                                <input type="hidden" name="hotelid"   value= <%=hotelid%> >
                                            </div>
                                        </div> 
                                    </form>  
                                </div>      
                            </td>
                        </tr>  
                    </tbody> 
                </table> <br> <br> <br> 
            </div>                           
        <% }
        }
        catch(Exception ex){
            System.err.println("Exception: " + ex);
        }
        %>
    </body>
</html>
 