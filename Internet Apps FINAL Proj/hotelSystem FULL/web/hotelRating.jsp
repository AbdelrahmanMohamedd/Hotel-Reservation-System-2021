<%-- 
    Document   : hotelRating
    Created on : Jan 27, 2021, 5:39:43 PM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Rating Page</title>
        <link rel="stylesheet" href='userProfile.css'/>
        <link rel="stylesheet" href='normalize.css'/>
    </head>
    <body>
       <div class="navbar">
                    <div class="container">                   
                        <a href="adminHomePage.jsp">Home</a>
                <a href="updateHotelInfo.jsp">Hotel Info</a>
                <a href="updateRoomInfo.jsp">Room Info</a>
                <a href="logout">Logout</a>                                                         
                        <form>
                             <input type="submit" value="Search"/>
                            <input type="text" placeholder="Search.."/>                          
                        </form>                                                                                          
                    </div>
                </div>
        <div style="margin-left: 190px; color:white;">
             <h2>Hotel Rating</h2> <br>
                <table border="1" >
                   <tr>
                       <th>User name </th>
                       <th>Rating </th>
                       <th>comment </th>
                   </tr>
        <%
           Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/hotelsystem";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet RS = null;
                try{
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String id = request.getSession().getAttribute("session_ID").toString();
                RS = Stmt.executeQuery("SELECT * FROM user where userID='"+id+"'");
                if(RS.next()){
                String hotel_name =  RS.getString(("hotel_name"));
                RS = Stmt.executeQuery("SELECT * FROM hotel where hotelName LIKE '"+"%"+hotel_name+"%"+"'");
                while(RS.next()){
                String userRating = RS.getString("userRating");
                String userComments = RS.getString("userComments");
                String username = null;
                RS = Stmt.executeQuery("SELECT * FROM reservation where hotelName LIKE '"+"%"+hotel_name+"%"+"'");
                if(RS.next()){                   
                    username = RS.getString("userName");
                }%>
                    <tr>
                        <td>
                           <%=username%> 
                        </td>
                        <td>
                           <%=userRating%> 
                        </td>
                        <td>
                           <%=userComments%> 
                        </td>
                    </tr>
               </table>
            </div>
                <%
                }
                }
                }
                catch(Exception ex){               
        }%>
    </body>
</html>
