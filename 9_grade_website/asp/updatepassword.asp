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
        
            change = Request.QueryString("uppass")
                test = "UPDATE registers SET passwor  = '" & change & "' WHERE username = '"& session("username") &"';"
                Conn.Execute(test)
                Conn.Close
                Set rs = Nothing
                Response.redirect "yuvalhp.asp"
            %>

</body>
</html>