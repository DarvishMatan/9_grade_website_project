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
        
            change = Request.QueryString("userc")
        
            strSQL = "SELECT * FROM registers WHERE username = '" &change& "';"
            Set rs = Conn.Execute(strSQL)
        
            if rs.EOF then
                test = "UPDATE registers SET username  = '" & change & "' WHERE username = '"& session("username") &"';"
                session("username") = change    
                Conn.Execute(test)
            else
                Conn.Close
                Set rs = Nothing
                Response.redirect "useroptions.asp?update=faileduser"
            end If
            Conn.Close
            Set rs = Nothing
            Response.Redirect "yuvalhp.asp"
            %>

</body>
</html>