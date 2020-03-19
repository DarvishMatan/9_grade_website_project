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
        dim emailadress

        username = Request.QueryString("title")
        password = Request.QueryString("author")
        emailadress = Request.QueryString("sport")

        strSQL = "INSERT INTO ques(firstname,lastname,description) VALUES ('" & username & "', '" &password & "','" & emailadress & "');"
        Conn.Execute(strSQL)
        Conn.Close
        Set Conn = Nothing
        Response.Redirect "aftersignup.html"
        %>

</body>
</html>