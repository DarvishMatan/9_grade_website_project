<!DOCTYPE html>
<html lang = "he" xml:lang="he" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>healthy way</title>
        <link rel="stylesheet" type="text/css" href="projectcss.css"/>
        <link rel="stylesheet" type="text/css" href="diets.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
                // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function() {scrollFunction()};
            
            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
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
            function checkvalidation(){
                titlea.value = titlea.value.replace(/[']/g,'');
                art.value = art.value.replace(/[']/g,'');
                titlea.value = titlea.value.replace(/['"]+/g,'');
                art.value = art.value.replace(/['"]+/g,'');
    
    
            }
            function delete4(a){
                    var del=confirm("delete: "+a);
                    if (del==true)
                    window.location.href ="deleteSportUser.asp?ID="+a;
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
        <div><li style="float:right" class = "navbut"><a href="loginpage.asp" name = "loginback" id = "loginback">Login</a></div>
        </li>   
        </ul>
      </table>
      <button onclick="topFunction()" id="myBtn" title="Go to top"><i class = "fa fa-chevron-circle-up" style="font-size:48px;"></i></button>
      <br/><br/>
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

        Set Conn = Server.CreateObject("ADODB.Connection")
        Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")
        ' SQL Query
        strSQL = "SELECT sport FROM sports"
        ' Execute the query (the recordset rs contains the result)
        Set rs = Conn.Execute(strSQL)
        titlequr = "SELECT title FROM sports"
        set record = Conn.Execute(titlequr)
        authorqur = "SELECT author FROM sports"
        set recordst = Conn.Execute(authorqur)
        t = "SELECT t FROM sports"
        set recordtime = Conn.Execute(t)
        art = "SELECT ID FROM sports"
        set Idrs = Conn.execute(art)
        del = "SELECT * FROM sports"
        set r = Conn.execute(del)
        ' Loop the recordset rs
            if rs.EOF Then
                Response.write "<div>There are no articles</div>"
            Else 
            Do
           ' Write the value of the column FirstName
           Response.write "<a href = 'showSport.asp?article="&Idrs("ID")& "'><div class = 'articlesTitle' lang = 'he'>"& record("title") &" </div></a><br/>" 
           if (recordst("author") = session("username")) then
                response.write "<img style='cursor: pointer; float:right' src='trash.png' onclick=delete4("&r("ID")&") height='20px' width='20px' /></a>"
            end if
           Response.write "<div class = 'author' lang = 'he'>written by "& recordst("author") &" </div><br/>" 
           Response.write "<div class = 'author' lang = 'he'>published in "& recordtime("t") &" </div><br/><hr>" 
           ' Move to next record in rs
           rs.MoveNext
           recordst.MoveNext
           record.MoveNext 
           Idrs.MoveNext
           r.MoveNext
           recordtime.MoveNext
        ' Continue until end of recordset (EOF = End Of File)
           Loop While Not rs.EOF
           End If
    
        ' Close the database connection
        Conn.Close
        Set Conn = Nothing
        %>
        <%
        if session("login") = "IN" then
        response.write"<h5>write your article here</h5>"
        response.write"<form action='handlerSport.asp' method='post'>"
        response.write"<textarea type = 'text' minlength='8' maxlength='4294967295' class = 'insert' rows='1' cols='60' name = 'title' id ='titlea' placeholder='Write your title here' title = 'please write a string without text quotations' required></textarea>"&"<br/><br/>"
        response.write"<textarea rows='4' cols='100' minlength='20' maxlength='4294967295' placeholder='Write your article here' name = 'content' class = 'insert' id = 'art' required></textarea>"
        response.write"<input type = 'submit' value = 'submit your article' id = 'submitA' onclick='checkvalidation()'>"
        response.write"</form>"
        end if
        %>
    </body>
</html>