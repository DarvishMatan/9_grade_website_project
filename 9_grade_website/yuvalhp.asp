<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>
        <link rel="stylesheet" type="text/css" href="projectcss.css"/>
    </head>
    <body unload = "window.location.href = logout.asp';" style = "overflow-x: hidden; overflow-y:hidden;">
        <table>
      <ul>
        <li class = "navbut"><a class="active" href="yuvalhp.asp">Home</a></li>
        <li class="dropdown">
                <a href="Dietsweb.asp" class="dropbtn">Diets</a>
        <li class = "navbut"><a href="sportpage.asp">Sport</a></li>
        <li class = "navbut"><a href="links.asp">Read more</a></li>
        <li class = "navbut"><a href="Contact_us.asp">Contact Us</a></li>
        <div><li style="float:right" class = "navbut"><a href="loginpage.asp" name = "loginback" id = "loginback">Login</a></div>
        </li>   
        </ul>
      </table>
      <img src="b.JPG" title = "go to sport" height="20%;" width="20%;" style="width: 100%; height: auto; ">
      
<div id = "cont"> <!--container for the welcome message -->

        <div class = "hp" id = "wel">Welcome to The Healthy Way,</div>
         <div class  ="hp">in this site you can make your life healthier, more quality and happier.</div>
        <p class = "hp" >
            <% 'message with the user name and time mention
                dim h
                h=hour(now())
                if (session ("login") = "IN") then
                    if (h < 12) then
                        response.write("good morning, " & session("username"))
                        response.write(".")

                    ElseIf(h<=17) then
                        response.write("good afternoon, " & session("username"))
                        response.write(".")
                    else
                        response.write("good evening, " & session("username"))
                        response.write(".")
                    End if
                End if
            %>
        </p>
    </div>

    <%
    if session("admin") = "true" then 'check if user is admin by session
    Response.write("<script>loginback.setAttribute('href','adminpage.asp')</script>")
    Response.write("<script>loginback.innerHTML ='Admin Page'</script>")
    Response.write("<script>signupd.style.visibility='hidden'</script>")

elseif session("login") = "IN" then  'check if user is signin by session
    Response.write("<script>loginback.setAttribute('href','useroptions.asp')</script>")
    Response.write("<script>loginback.innerHTML ='User Functions'</script>")
    Response.write("<script>signupd.style.visibility='hidden'</script>")
end if
    %>
    </body>
</html>
