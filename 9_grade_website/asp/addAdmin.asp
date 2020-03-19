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

    add = Request.QueryString("userToAdmin") ' takes the username of the user to admin by sending it in the url
    t = "true" ' the field is string and is updated by true or nothing 
    strSQL = "UPDATE registers SET admin  = '" & t & "' WHERE username = '"& add &"';" 'update the specific field in the specific username

    Conn.Execute(strSQL)
    Conn.Close
    Set rs = Nothing
    Response.Redirect "adminpage.asp"
    %>
</body>
</html>