<!DOCTYPE html>
<html style = "background-image:'' ;background-color: #555555; ">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>

        <link rel="stylesheet" type="text/css" href="signout.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        
        <script>
            window.onscroll = function() {scrollFunction()};// the button for go up to the top of the page
            
            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {// works by pixels
                    document.getElementById("myBtn").style.visibility = "visible";
                } else {
                    document.getElementById("myBtn").style.visibility = "hidden";
                }
            }
            
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
                function delete1(a){ // concatenate the user to delete in the url by the function window.location.herf (works like response.redirect)
                    var del=confirm("delete: "+a); // confirm alert
                    if (del==true) // on confirm else - do nothing
                    window.location.href ="deleteHandler.asp?userToDelete="+a;
                }
                function admin1(a){
                    var del=confirm("To admin: "+a);
                    if (del==true)
                        window.location.href ="addAdmin.asp?userToAdmin="+a;
                }
                function delete2(a){
                    var del=confirm("delete: "+a);
                    if (del==true)
                    window.location.href ="deleteQues.asp?ID="+a;
                }
                function delete3(a){
                    var del=confirm("delete: "+a);
                    if (del==true)
                    window.location.href ="deleteSport.asp?ID="+a;
                }
                function delete4(a){
                    var del=confirm("delete: "+a);
                    if (del==true)
                    window.location.href ="deleteDiet.asp?ID="+a;
                }
                /* this function checks if there are characters which can make an error in the database like quotations */
                function checkvalidation(){
                    adminChange.value = adminChange.value.replace(/[']/g,'');
                    adminChange.value = adminChange.value.replace(/['"]+/g,'');
                    adminChang.value = adminChang.value.replace(/[']/g,'');
                    adminChang.value = adminChang.value.replace(/['"]+/g,'');
                    }
            </script>
    </head>
    <body unload = "window.location.href = logout.asp';">
    <button onclick="topFunction()" id="myBtn" title="Go to top"><i class = "fa fa-chevron-circle-up" style="font-size:48px;"></i></button>    
    <!-- the navigation bar  -->
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
      <div>
            <%
            ' check admin by session admin
            if session("admin") = "true" then
               Response.write("<script>loginback.setAttribute('href','adminpage.asp')</script>")
               Response.write("<script>loginback.innerHTML ='Admin Page'</script>")
               Response.write("<script>signupd.style.visibility='hidden'</script>")
           
           elseif session("login") = "IN" then
               Response.write("<script>loginback.setAttribute('href','useroptions.asp')</script>")
               Response.write("<script>loginback.innerHTML ='User Functions'</script>")
               Response.write("<script>signupd.style.visibility='hidden'</script>")
           end if 

        ' here I concated the sql query and than I printed the result by using response.write
            Set Conn = Server.CreateObject("ADODB.Connection")
            Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")
            dim strSQL
            dim str
            str="<table border>"
            strSQL="SELECT * FROM registers"
            set rs=Conn.Execute(strSQL)
            str = str&"<tr><th>username</th><th>password</th><th>E-mail adress</th><th>admin</th></tr>"
            Do While Not rs.EOF
                str=str& " <tr><td>" & rs("username") & "</td>"
                str=str& " <td>" & rs("passwor") & "</td>"
                str=str& " <td>" & rs("email") & "</td>"
                str=str& " <td>" & rs("admin") & "</td>"
                str=str& "<td><img style='cursor: pointer;' src='trash.png' onclick=delete1('"&rs("username")&"') height='20px' width='20px' /></a></td>"
                str=str& "<td><img style='cursor: pointer;' src='admin.png' onclick=admin1('"&rs("username")&"') height='20px' width='20px'/></td></tr>"
                rs.MoveNext
            Loop
            str=str&"</table>"


            str1="<table border>"
            test="SELECT * FROM ques"
            set res=Conn.Execute(test)
            str1 = str1&"<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>description</th><th>E-mail adress (not sined up)</th><th>username</th></tr>"
            Do While Not res.EOF
                str1=str1& " <tr><td>" & res("ID") & "</td>"
                str1=str1& " <td>" & res("firstname") & "</td>"
                str1=str1& " <td>" & res("lastname") & "</td>"
                str1=str1& " <td>" & res("description") & "</td>"
                str1=str1& " <td>" & res("email") & "</td>"
                str1=str1& " <td>" & res("writer") & "</td>"
                str1=str1& "<td><img style='cursor: pointer;' src='trash.png' onclick=delete2("&res("ID")&") height='20px' width='20px' /></a></td></tr>"
                res.MoveNext
            Loop
            str1=str1&"</table>"

            str2="<table border>"
                test="SELECT * FROM sports"
                set rec=Conn.Execute(test)
                str2 = str2&"<tr><th>ID</th><th>Title</th><th>Author</th><th>Sport</th><th>published in</th></tr>"
                Do While Not rec.EOF
                    str2=str2& " <tr><td>" & rec("ID") & "</td>"
                    str2=str2& " <td>" & rec("title") & "</td>"
                    str2=str2& " <td>" & rec("author") & "</td>"
                    str2=str2& " <td>" & rec("sport") & "</td>"
                    str2=str2& " <td>" & rec("t") & "</td>"
                    str2=str2& "<td><img style='cursor: pointer;' src='trash.png' onclick=delete3("&rec("ID")&") height='20px' width='20px' /></a></td></tr>"
                    rec.MoveNext
                Loop
                str2=str2&"</table>"


            str3="<table border>"
                test="SELECT * FROM diets"
                set record=Conn.Execute(test)
                str3 = str3&"<tr><th>ID</th><th>Title</th><th>Author</th><th>Sport</th><th>published in</th></tr>"
                Do While Not record.EOF
                    str3=str3& " <tr><td>" & record("ID") & "</td>"
                    str3=str3& " <td>" & record("title") & "</td>"
                    str3=str3& " <td>" & record("author") & "</td>"
                    str3=str3& " <td>" & record("content") & "</td>"
                    str3=str3& " <td>" & record("t") & "</td>"
                    str3=str3& "<td><img style='cursor: pointer;' src='trash.png' onclick=delete4("&record("ID")&") height='20px' width='20px' /></a></td></tr>"
                    record.MoveNext
                Loop
                str3=str3&"</table>"
            Conn.Close
            Set Conn = Nothing
    %>
</head>
<body>
        <center><h1><span class="form-text">site details</span></h1><hr/></center>
        <center><h1><span class="form-text">Registers</span></h1></center>
            <% response.write("<div id='con' name='con'>" & str & "</div>") %>
            <br/>
            <form action = 'adminupdatepassword.asp' style = "margin-left: 1%;">
                <div style = "color: rgb(92, 148, 143)">change password</div>
                <br/>
                <span class = "what">username to change</span> <input type='text' id="adminChange" name='user' pattern='{4,16}'  placeholder='the username to change his password' required><br/>
                <span class = "what">change password</span> <input type='text' id="adminChang" name = 'pass' placeholder = 'create another password' pattern='(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}' title = 'please write the new password'  required/>
                <div id="errorMsg" style = "color: rgba(157, 255, 0, 0.767)"><br/> *username or password failed</div>
            </td>
        </tr><br/>
        <input type ='submit' class = 'changebutt' onclick="checkvalidation();" id="adminChan"  value='Change' style = 'width: 80px;height: 30px;'>
    </form>
            <br/>
            <center><h1><span class="form-text">contact messages</span></h1><hr/></center>
            <% response.write("<p id='con' name='con'>" & str1 & "</p>") %>
            
            <center><h1><span class="form-text">sport articles</span></h1><hr/></center>
            <% response.write("<p id='con' name='con'>" & str2 & "</p>") %>

            <center><h1><span class="form-text">Diets articles</span></h1><hr/></center>
            <% response.write("<p id='con' name='con'>" & str3 & "</p>") %>
            <center>
            <form action = "logout.asp">
                    <input type ="submit" class = "changebut"  value="Sign Out" style = "width: 200px;">
                 </form>
                </center>
                <%   
        If (Request.queryString("change") = "failed") Then 'visibility of the error message
            Response.write("<script>errorMsg.style.visibility='visible';</script>") 
            Response.write("<script>errorMsg.style.display='block';</script>") 
        End If
    %>
</body>
    
</html>