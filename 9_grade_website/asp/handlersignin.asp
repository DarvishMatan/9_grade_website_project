<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Redirecting...</title>
</head>
<body>
    <%
    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")
    usernam = Request.QueryString("username")
    password = Request.QueryString("pass")

    strSQL = "SELECT * FROM registers WHERE username = '" &usernam& "';"
    Set rs = Conn.Execute(strSQL)
    If (rs.EOF < 0) then
        Set rs = Nothing
        Conn.Close
        Set Conn = Nothing
        Response.redirect "loginpage.asp?login=failed"

    elseIf rs("passwor") = password then 
        If (rs("admin") = "true") then
        session("email") = ""
        session ("login") = "IN"
        session ("username") = request.QueryString("username")
        session("admin") = "true"
        session.Timeout = 60
        response.redirect"yuvalhp.asp"

        else
        session("email") = ""
        session ("login") = "IN"
        session ("username") = request.QueryString("username")
        session.Timeout = 60
        Response.Redirect "yuvalhp.asp"
        end if

    Else 
        Response.Redirect "loginpage.asp?login=failed"
    End If

    Set rs = Nothing
    Conn.Close
    Set Conn = Nothing

    %>
</body>
</html>