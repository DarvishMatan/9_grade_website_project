<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <%
    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")

    dim username
    dim password
    dim emaila

    username = Request.QueryString("user")
    password = Request.QueryString("pass")
    emaila = Request.QueryString("e")

    test = "SELECT * FROM registers WHERE username = '" &username& "';"
    Set rs = Conn.Execute(test)

    if rs.EOF then
        Set rs = Nothing
    else
        Conn.Close
        Set rs = Nothing
        Response.redirect "signupform.asp?login=usernameinDB&email="&emaila&""
    end if

    test = "SELECT * FROM registers WHERE email = '" &emaila& "';"
    Set rs = Conn.Execute(test)

    if rs.EOF then
        Set rs = Nothing
    else
        Conn.Close
        Set rs = Nothing
        Response.redirect "signupform.asp?login=emailinDB&user="&username&""
    end if
    strSQL = "INSERT INTO registers(username,passwor,email) VALUES ('" &username& "', '" &password & "','" &emaila& "');"
    Conn.Execute(strSQL)
    Conn.Close
    Set rs = Nothing
    Response.Redirect "loginpage.asp"
    %>
</body>
</html>