<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>
        <link rel="stylesheet" type="text/css" href="projectcss.css"/>
        <script>
                function checkpass() {
                    if (document.getElementById("changep").value != document.getElementById('changepass').value) {
                        changepass.setCustomValidity('Password Must be Matching.');
                        input.value="invalid";/*in order that the color of the border will turn red */
                    }
                    else{
                // input is valid -- reset the error message
                changepass.setCustomValidity('');
            }
    
                    }
                    function checkvalidation(){
                    changep.value = changep.value.replace(/[']/g,'');
                    changepass.value = changepass.value.replace(/[']/g,'');
                    changep.value = changep.value.replace(/['"]+/g,'');
                    changepass.value = changepass.value.replace(/['"]+/g,'');
                    user.value = user.value.replace(/['"]+/g,'');
                    user.value = user.value.replace(/[']/g,'');
                    changee.value = changee.value.replace(/[']/g,'');
                    changee.value = changee.value.replace(/['"]+/g,'');
                    }
                </script>
    </head>
    <body unload = "window.location.href = logout.asp';">
        <table>
      <ul>
        <li class = "navbut"><a class="active" href="yuvalhp.asp">Home</a></li>
        <li class="dropdown">
                <a href="Dietsweb.asp" class="dropbtn">Diets</a>
        <li class = "navbut"><a href="sportpage.asp">Sport</a></li>
        <li class = "navbut"><a href="links.asp">Read more</a></li>
        <li class = "navbut"><a href="Contact_us.asp">Contact Us</a></li>
        <div><li style="float:right" class = "navbut"><a href="useroptions.asp" name = "loginback" id = "loginback">User Options</a></div>
        </li>   
        </ul>
      </table>
      <br/><br/>
    </div>
    <div class = "containerChange" name = "containerChange">
        <p>Change Your Email Adress</p>
        <form action = "updateemail.asp">
                <input type ="email" class = "input" placeholder = "israelisraeli@gmail.com" required size="20" id = "changee" name = "change">
                <input type ="submit" class = "changebut"  value="Change Email" onclick = "checkvalidation();">
        <p id = "errorMsg">*This Email has already been taken, try another </p>
        </form>
        <form action = "updateusername.asp">
        <p>Change your username</p>
        <input type="username" class = "input" placeholder = "Change your username" pattern="[A-z]{4,16}" title="Must contain 4-8 alphabet characters" required size="20" id = "user" name = "userc"/></td></tr>
                <input type ="submit" class = "changebut" onclick = "checkvalidation();" value="Change" style = "width: 130px;">
    </form>
    <p id = "errorMsge">*This username is taken </p>
    <br/><br/>
        <form action = "logout.asp">
        <input type ="submit" class = "changebut"  value="Sign Out">
        
     </form>

     <form action = "updatepassword.asp">
        <p>change your password</p>    

        <input type="password" id="changep" name="uppass" onkeyup="checkpass();" class = "input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="create your password" required><br/>
        <input type="password" class = "input" id = "changepass" onkeyup="checkpass();" placeholder = "conifrm your password" pattern="[!-}]{8,16}" title = "please confirm your password correctly"  required/></td></tr>
                    <input type ="submit" class = "changebut"  onclick = "checkvalidation();" value="Change" style = "width: 130px;">
        </form>
    </div>


    </table>
                <% 
                if (Request.QueryString("update") = "failedemail") then
                Response.write("<script>errorMsg.style.visibility='visible';</script>")
                Response.write("<script>errorMsg.style.display='block';</script>")
                elseIf(Request.QueryString("update") = "faileduser") then
                Response.write("<script>errorMsge.style.visibility='visible';</script>")
                Response.write("<script>errorMsge.style.display='block';</script>")
                end if
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
