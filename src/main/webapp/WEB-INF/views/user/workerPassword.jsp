<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 25.01.18
  Time: 09:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change worker password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    ${message}
</div>
<div class="container">
    <form method="post">
        Old password
        <input type="password" name="oldPass" class="form-control"/>
        New password
        <input type="password" name="newPass" class="form-control"/>
        Repeat new password
        <input type="password" name="repeatPass" class="form-control"/>
        <br/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Change Password" class="btn btn-primary"/>
    </form>
</div>
</body>
</html>
