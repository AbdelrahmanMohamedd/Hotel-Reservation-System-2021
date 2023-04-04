<%-- 
    Document   : signup
    Created on : Jan 7, 2021, 12:58:51 AM
    Author     : olasa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
     <script src="https://www.google.com/recaptcha/api.js" async defer></script>
     <script type="text/javascript">
        function sendajax() {
            var email = document.getElementById("email").value;
            var name = document.getElementById("name").value;
            var username = document.getElementById("username").value;
            var type1 = document.getElementById("user").value;
            var type2 = document.getElementById("admin").value;
            
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("show_response").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "AddAccount?email=" + email+ "&name=" + name + "&username=" + username+ "&type=" + type1+ "&type=" + type2 , true);
            xmlhttp.send();
            //if (!grecaptcha.getResponse()) {
                  //alert("You need to prove that you're not a robot");
                //} else {
                 // document.getElementById('signupform').submit();
                //}
        }
        
        
    </script>
    <head>
        <title> sign up </title>
        <link rel="stylesheet"href="signup.css"/>
    </head>
    <body>
        <form  id="signupform"  >
            <div class="signup">                
                <img class="photo" src="login.jpg" >
                    <div class=here>Hotel Reservation</div>
                        <div class="radiob">
                            <input type="radio" name="type" value="user" id="user" />
                                <label for="user">User</label> 
                            <input type="radio" name="type" value="admin" id="admin" />
                                <label for="admin">Admin</label>
                        </div>
                    <div class="username">
                        <p>Name</p>
                            <input type="text" name="name" id="name" placeholder="Your Display name" value="" minlength="5" maxlength="45" required>
                        <p> username</p>
                            <input type="text" name="username" id="username" placeholder=" username" value="" minlength="5" maxlength="45" required>
                        <p> Email</p>
                            <input type="email" name="email" value="" id="email" placeholder=" Email" minlength="5" maxlength="45" required ><br>
                        <br><div class="g-recaptcha" data-sitekey="6LdpPiQaAAAAAHN6B2MpTaIKs_4cbA_Fezvuj8D4"></div>
                    </div><br> 
                    <div class="submit"><input type="button" value="sign up" onclick="sendajax()">
                        <div id="show_response">  </div>
                    </div>               
                <br>
            </div>        
        </form>     
    </body>
</html>
