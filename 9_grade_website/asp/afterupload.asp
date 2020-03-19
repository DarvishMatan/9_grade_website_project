<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>
        <link rel="stylesheet" type="text/css" href="projectcss.css"/>

    </head>
    <body unload = "window.location.href = logout.asp';" id = "aftersign"></body>
        <table>
      <ul>
        <li class = "navbut"><a class="active" href="yuvalhp.asp">Home</a></li>
        <li class="dropdown">
            <a href="Dietsweb.asp" class="dropbtn">Diets</a>
        </li>
        <li class = "navbut"><a href="sportpage.asp">Sport</a></li>
        <li class = "navbut"><a href="links.asp">Read more</a></li>
        <li class = "navbut"><a href="Contact_us.asp">Contact Us</a></li>
        <div><li style="float:right" class = "navbut"><a href="loginpage.asp" name = "loginback" id = "loginback">Login</a></div>
        </li>   
        </ul>
      </table>

      <br/>
      <div id = "Aftersignup">
          <table>
            <tr>
                <td><h3>Thank you for your upload</h3></td>
            </tr>
            <tr><td><span>you can see your article in the diet or sport pages!</span></td></tr>
          </table>
         </div>
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