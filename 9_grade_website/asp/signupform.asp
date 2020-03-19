<!DOCTYPE html>
<html>
    <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title> Healthy Way </title>
        <script>
            function checkpass() {
                if (document.getElementById("signupc").value != document.getElementById('pass').value) {
                    signupc.setCustomValidity('Password Must be Matching.');
                    input.value="invalid";/*in order that the color of the border will turn red */
                }
                else{
            // input is valid -- reset the error message
                    signupc.setCustomValidity('');
        }

                }
            function checkvalidation(){
                pass.value = pass.value.replace(/[']/g,'');
                signupc.value = art.value.replace(/[']/g,'');
                pass.value = pass.value.replace(/['"]+/g,'');
                signupc.value = art.value.replace(/['"]+/g,'');
                e.value = e.value.replace(/[']/g,'');
                e.value = e.value.replace(/['"]+/g,'');
                user.value = e.value.replace(/[']/g,'');
                user.value = e.value.replace(/['"]+/g,'');

        }
        
        </script>
    </head>
    <body unload = "window.location.href = logout.asp';">
            <link rel="stylesheet" type="text/css" href="projectcss.css">
            <ul>
                    <li><a class="active" href="yuvalhp.asp">Home</a></li>
                    <li class="dropdown">
                        <a href="Dietsweb.asp" class="dropbtn">Diets</a>
                    </li>
                    <li><a href="sportpage.asp">Sport</a></li>
                    <li><a href="links.asp">Read more</a></li>
                    <li><a href="Contact_us.asp">Contact Us</a></li>
                    <div><li style="float:right"><a href="loginpage.asp" name = "loginback" id = "loginback">Login</a></div>
                    </li>
            </ul> 
            <form action="test.asp" method="get">
                <center class = "formcenter">
        <table id = "signupf" name = "signupf">
            <h1 id = "signupcap">sign up</h1>
        <tr><td class = "sade">Username&nbsp;&nbsp;&nbsp;
        <input type="username" class = "input" value = "<%response.write request.queryString("user")%>" placeholder = "create your usename" pattern="{4,16}" title="Must contain 4-8 alphabet characters" required size="20" id = "user" name = "user"/></td></tr>
        <tr>
            <td>
                <p id="errorMsg">*username is already in database</p>
            </td>
        </tr>
        <tr><td class = "sade" ><br/>Password&nbsp;&nbsp;&nbsp;
            <input type="password" id="pass" name="pass" onkeyup='checkpass();' class = "input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="create your password" required>
        <tr><td class = "sade"><br/>Confirm your password&nbsp;&nbsp;&nbsp;
        <input type="password" class = "input" id = "signupc" onkeyup='checkpass();' pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" placeholder = "conifrm your password" pattern="[!-}]{8,16}" title = "please confirm your password correctly"  required/></td></tr>
        <tr><td class = "sade"><br/>E-mail adress&nbsp;&nbsp;&nbsp;
            <input type ="email" class = "input" value = "<%response.write request.queryString("email")%>" placeholder = "israelisraeli@gmail.com" required size="20" id = "e" name = "e">
            <p id="errorMsge">*email is already in database</p>
        </td>
     <tr><td>
     <input class = "submitbut" type="submit" id ="signupsub" value="Submit" onclick = "checkPass();checkvalidation();"/></td></tr>
     <tr>
         <td>
     <div class = "account">already register? -  <a href = "loginpage.asp" class = "account" id = "loginlink">click here</a></div>
    </td>
    </tr>
</form>
    </table>
    </center>
    <%   'the check in order to see the error message
        If (Request.queryString("login") = "emailinDB") Then
                Response.write("<script>errorMsge.style.visibility='visible';</script>") 
                Response.write("<script>errorMsge.style.display='block';</script>") 
        ElseIf (Request.queryString("login") = "usernameinDB") Then
            Response.write("<script>errorMsg.style.visibility='visible';</script>") 
            Response.write("<script>errorMsg.style.display='block';</script>") 
        End If
    %>
    <%
    if session("admin") = "true" then
            Response.write("<script>loginback.setAttribute('href','adminpage.asp')</script>")
            Response.write("<script>loginback.innerHTML ='Admin Page'</script>")
            Response.write("<script>signupd.style.visibility='hidden'</script>")
        
        elseif session("login") = "IN" then
            Response.write("<script>loginback.setAttribute('href','useroptions.asp')</script>")
            Response.write("<script>loginback.innerHTML ='User Functions'</script>")
            Response.write("<script>signupd.style.visibility='hidden'</script>")
        end if
%>
    </body>
</html>
