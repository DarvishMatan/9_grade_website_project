<!DOCTYPE html>
<html>
    <head>
            <link rel="stylesheet" type="text/css" href="projectcss.css">
            <title>The Healthy Way</title>
            <script>
                    function myFunction() {
                        var x = document.getElementById("myInput");
                        if (x.type === "password") {
                            x.type = "text";
                        } 
                        else {
                            x.type = "password";
                        }
                    }
                    function checkvalidation(){
                    username.value = username.value.replace(/[']/g,'');
                    pass.value = art.value.replace(/[']/g,'');
                    username.value = username.value.replace(/['"]+/g,'');
                    pass.value = art.value.replace(/['"]+/g,'');
                    }
                    
                    </script>
    </head>
    <body unload = "window.location.href = logout.asp;">
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
            </br></br><br/>
            <center>
                <form action="handlersignin.asp" method="get">
                    <table id = "loginform" name = "loginform">
                        <tr>
                            <th colspan="2">
                                <div>
                                    Login
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td class="loginTableTd">
                                Username:
                            </td>
                            <td class="loginTableTd">
                                <input type="text" class = "input" name="username" id="username"  placeholder="Username" placeholder = "enter your username" pattern="{4,16}" required size="20">
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="loginTableTd">
                                Password:
                            </td>
                            <td class="loginTableTd">
                                <input type="password" name="pass" class = "input" id="pass" placeholder = "enter your password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" required size="20" id = "pass" name = "pass">
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <input type="submit" value="Login" class = "submitbut" id = "logbut" onclick="checkvalidation();">
                            </th>
                        </tr>
                        <br/>
                        <tr>
                            <td>
                                <div id="errorMsg"> *username or password failed</p>
                            </td>    
                        </tr>
                        <tr>
                            <td colspan="2" style = "text-align:center"><a class="l" href = "Contact_us.asp">Forgot my password?</a></td> 
                        </tr>
                        <tr>
                            <td colspan="2" id = "signupd">
                                <div class="account" >
                                    Don't have an account? - 
                                    <a name="account" href="signupform.asp">
                                        Click here to sign up
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </center>
            <%   
        If (Request.queryString("login") = "failed") Then
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