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
            Set Conn = Server.CreateObject("ADODB.Connection") 'connection
            Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")
        
            dim change
            dim user 

            user = Request.QueryString("user") ' storage the values of the field of the username to update his password
            change = Request.QueryString("pass") 'the new password

            strSQL = "SELECT * FROM registers WHERE username = '" &user& "';" 'SQL query
            Set rs = Conn.Execute(strSQL)
            If (rs.EOF < 0) then ' if there is no field with the inserted username, reload the page
                Set rs = Nothing
                Conn.Close
                Set Conn = Nothing
                Response.redirect "adminpage.asp?change=failed"
                end if
                test = "UPDATE registers SET passwor  = '" & change & "' WHERE username = '"& user &"';"
                Conn.Execute(test)
                Conn.Close
                Set rs = Nothing
                Response.redirect "adminpage.asp"
            %>

</body>
</html>