<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>
        <link rel="stylesheet" type="text/css" href="projectcss.css"/>
    </head>
    <body unload = "window.location.href = logout.asp';">
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
      <br/>
      <div class = "containe">
          <a href = "http://sportforthoughts.blogspot.com/?view=classic" class = "h" target="_blank">Great sports articles and diets</a><br/><br/>
          <a href = "http://www.yaeldror.co.il/" class = "h" target="_blank">Great diets articles include sport diets, Lose Weight diets and gain - weight diets</a><br/><br/>
          <a href = "https://www.wingate.org.il/Index.asp?CategoryID=636 " class = "h" target="_blank">sports articles by Wingate Institute</a> <br/><br/>
          <a href = "https://www.lbs.co.il/" class = "h" target="_blank">Fitness and body development</a> <br/><br/>
          <a href = "http://www.health.com/" class = "h" target="_blank">Diets website</a> <br/><br/>
          <a href = "https://www.webmd.com/diet/default.htm" class = "h" target="_blank">Diet and Weight management</a> <br/><br/>
          <a href = "https://www.halhigdon.com/" class = "h" target="_blank">Running trining plans</a> <br/><br/>
          <a href = "https://www.active.com/triathlon/articles/a-12-week-triathlon-training-plan-for-beginners" target="_blank" class = "h">Beginners triathlon trining plans</a> <br/><br/>
          
          <img src="triathlete.jpg" title = "go to sport" style = "text-align:right; margin-left:50%; margin-top: 15%;" usemap="#image-map1" class="pic" style = "z-index: 3;">
          <map name="image-map1">
              <area target="_self" href="sportpage.asp" coords="20,70,150,280" shape="rect" title="triathlon">
              <area target="_self" href="sportpage.asp" coords="150,70,315,280" shape="rect" title="triathlon">
              <area target="_self" href="sportpage.asp" coords="320,70,475,280" shape="rect" title="triathlon">
              <area target="_self" href="sportpage.asp" coords="150,20,380,80" shape="rect" title="triathlon">
          </map>
      
      
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