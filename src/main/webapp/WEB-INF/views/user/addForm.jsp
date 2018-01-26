<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new user</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form:form modelAttribute="user" method="post">
        Identity
        <form:input path="userName" class="form-control"/>
        First name
        <form:input path="firstName" class="form-control"/>
        Last name
        <form:input path="lastName" class="form-control"/>
        Password
        <form:password path="password" class="form-control"/>
        <br/>
        <input type="submit" value="Add new user" class="btn btn-primary"/>
    </form:form>
</div>
</body>
</html>
