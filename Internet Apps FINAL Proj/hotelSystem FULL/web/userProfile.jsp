<%-- 
    Document   : userProfile
    Created on : Jan 8, 2021, 5:24:35 PM
    Author     : olasa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>

<html>
    <script type="text/javascript">
        function sendajax() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("pass").value;
            var confirmPassword = document.getElementById("confpass").value;

            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("show_response").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "updateProfile?username=" + username + "&pass=" + password + "&confpass=" + confirmPassword, true);
            xmlhttp.send();
        }
    </script>

        <head>
            <title>Profile Page</title>
            <link rel="icon" href="womanLogo.png" type="image/png">    <!-- page title logo --> 
            <link rel="stylesheet" href='normalize.css'/>
            <link rel="stylesheet" href='userProfile.css'/>
        </head>
            <body>
                <div class="navbar">
                    <div class="container">                   
                        <a href="homepage.jsp">Home</a>
                        <a href="#">My profile</a>
                        <a href="viewReservation.jsp">My Reservations</a>
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
                RS = Stmt.executeQuery("SELECT * FROM user where userID='"+id+"'");
                if(RS.next()){
                    String user_name = RS.getString("DisplayName"); %>
                    <br><br><br><br><br><br>
                    <table  style="margin-left:200px ;" class="t1">
                        <thead>
                            <tr>
                                <th>
                                   <h2 > Hello <%out.print(user_name);%></h2>
                                </th> 
                            </tr>
                        </thead>
               <% }
                %>
                <tbody>
                    <tr>
                        <td>
                            <form>
                                <div class="inline">
                                    Name
                                </div> 
                                <div class="iStyle">
                                    <input type="text" name="username" id="username" value="" placeholder="Display Name.."  minlength="5" maxlength="45" required>
                                </div>
                                <div class="inline">
                                    password
                                </div>
                                <div class="iStyle">
                                    <input type="password" name="pass" id="pass" value="" placeholder="New Password.." minlength="4" maxlength="45" required>
                                </div>
                                <div class="inline">
                                    Confirm password
                                </div>
                                <div class="iStyle">
                                    <input type="password" name="confpass" id ="confpass" value="" placeholder="Confirm password.."  minlength="4" maxlength="45" required>
                                </div>
                                <div class="dStyle">
                                    <input type="button" value="Update" onclick="sendajax()" />
                                    <div id="show_response">  </div>
                                </div>
                            </form>
                        </td>
                    </tr> 
                </tbody>  
                
                
            </body>            
</html>
