<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>
        <link rel="stylesheet" type="text/css" href="contactus.css"/>
        <link rel="stylesheet" type="text/css" href="projectcss.css"/>
        <script>
          // Initialize google maps
          function myMap() {
            var myCenter = new google.maps.LatLng(32.253283, 34.914799);/*the location, i used the google maps api and by google maps located my house coordanates*/
            var mapCanvas = document.getElementById("map");
            var mapOptions = {center: myCenter, zoom: 12};/*visibilty of the map*/
            var map = new google.maps.Map(mapCanvas, mapOptions);/*settings maps*/ 
            var marker = new google.maps.Marker({position:myCenter});/*loc in web*/
            marker.setMap(map);/*set the marker var as map*/
          }
          function checkvalidation(){
                fname.value = fname.value.replace(/[']/g,'');
                lname.value = lname.value.replace(/[']/g,'');
                lname.value = lname.value.replace(/['"]+/g,'');
                fname.value = fname.value.replace(/['"]+/g,'');
                subjec.value = subjec.value.replace(/['"]+/g,'');
                subjec.value = subjec.value.replace(/[']/g,'');
            }
          </script>
    </head>
    <body style = "background-color: #b3aca7;" unload = "window.location.href = logout.asp';">
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
      <br/><br/>
      <div style = "height:100%">
        <div style="text-align:center">
        </div>
        <div class="row">
          <div class="column">
            <div id="map" style="width:80%;height:400px; margin-top:6%;"></div>
          </div>
          <div class="column">
            <form action="questionshandle.asp" method = "get">
              <label for="fname">First Name</label>
              <input type="text" id="fname" name="fname" placeholder="Your name..">
              <label for="lname">Last Name</label>
              <input type="text" id="lname" name="lname" placeholder="Your last name..">
              <% 
                if  (session("login") <> "IN") then
                  response.write"<br/><label for='lname'>E-mail adress</label><br/>"
                  response.write"<input type='email' name='email' placeholder='Your E-mail'>"
                  end If
              %>
              <label for="subjec">description</label>
              <textarea id="subjec" name="subjec" placeholder="Write about something... :)" style="height:140px;"></textarea>
              <input type="submit" value="Submit" onclick="checkvalidation();">
            </form>
          </div>
        </div>
      </div>
      
      
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASYXhW8v209aBYcWvXUKHsghUJUmOtUzY&callback=myMap"></script>
      <!--
      I got the key in api google
      -->
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