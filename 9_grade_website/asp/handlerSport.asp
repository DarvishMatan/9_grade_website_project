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
        
        dim title
        dim content
        dim date

        titl = Request.Form("title")
        conten = Request.Form("content")
        date = Now()
        strSQL = "INSERT INTO sports (title,author,sport,t) VALUES('"&titl&"','"&session("username")&"','"&conten&"','"&date&"')"
        response.write strSQL
        Conn.Execute(strSQL)
        Conn.Close
        Set Conn = Nothing
        Response.Redirect "afterupload.asp"
        %>

</body>
</html>