<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm work order realisation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        Are you sure you want confirm order?<br>
        You wont be able to edit it any further.<br>
        <form method="post">
            <input type="submit" value="Confirm realisation" class="btn btn-primary"/>
            <a href="/order/" class="btn btn-primary">Return to order list</a>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</body>
</html>
