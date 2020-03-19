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
                    </script>
                    </head>
        <body>
                <button onclick="topFunction()" id="myBtn" title="Go to top"><i class = "fa fa-chevron-circle-up" style="font-size:48px;"></i></button>
        <%
        response.write "<meta charset='UTF-8'>"&"<meta name='viewport' content='width=device-width, initial-scale=1'>"
        Set Conn = Server.CreateObject("ADODB.Connection")
        Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("projectdb.mdb")
        dim what_article
        what_article = Request.QueryString("article")
        ' SQL Query
        titlequr = "SELECT title FROM sports WHERE ID = "&what_article&""
        set record = Conn.Execute(titlequr)
        authorqur = "SELECT author FROM sports WHERE ID = "&what_article&""
        set recordst = Conn.Execute(authorqur)
        t = "SELECT t FROM sports WHERE ID = "&what_article&""
        set recordtime = Conn.Execute(t)
        strSQL = "SELECT sport FROM sports WHERE ID = "&what_article&"" ' Execute the query (the recordset rs contains the result)
        set rs = Conn.Execute(strSQL)

           Response.write "<div class = 'articlesTitle' lang = 'he'>&nbsp&nbsp"& record("title") &" </div><br/>" 
           Response.write "<div class = 'author' lang = 'he'>&nbsp&nbsp&nbspwritten by:&nbsp&nbsp&nbsp&nbsp "& recordst("author") &" </div><br/>" 
           Response.write "<div class = 'author' lang = 'he'>&nbsp&nbsp&nbsppublished in &nbsp&nbsp&nbsp "& recordtime("t") &" </div><br/>" 
           Response.Write "<script>articles.style.display = 'block'</script>"
           Response.Write "<article lang = 'he' class = 'articles'><br/>&nbsp" & rs("sport") & " </article><br/>"
        Conn.Close

        Set Conn = Nothing
            %>
            <form action = 'sportpage.asp'>
                    <div class='containerw'>
                        <button class='button'><span>Back</span>
                        </button>
                    </div>
                </form> 
    </body>
</html>