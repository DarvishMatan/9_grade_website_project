<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
</head>
<body>
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
    Set Conn = Server.CreateObject("ADODB.Connection")'connection
    Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")

    dim change
    dim passwordc

    change = Request.QueryString("change")
    passwordc = Request.QueryString("confirm")

    strSQL = "SELECT * FROM registers WHERE email = '" &change& "';"
    Set rs = Conn.Execute(strSQL)

    if rs.EOF then
        test = "UPDATE registers SET email  = '" & change & "' WHERE username = '"& session("username") &"';"
        Conn.Execute(test)
    else
        Conn.Close
        Set rs = Nothing
        Response.redirect "useroptions.asp?update=failedemail"
    end If
    Conn.Close
    Set rs = Nothing
    Response.Redirect "yuvalhp.asp"
    %>

</body>
</html>