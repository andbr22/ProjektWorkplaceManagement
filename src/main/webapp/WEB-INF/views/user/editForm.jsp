<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit existing user</title>
</head>
<body>
<form:form modelAttribute="user" method="post">
    <table>
        <tr hidden="hidden"><td>Identity:</td><td><form:input path="userName"/></td></tr>
        <tr><td>First name:</td><td><form:input path="firstName"/></td></tr>
        <tr><td>Last name:</td><td><form:input path="lastName"/></td></tr>
        <tr><td>Password:</td><td><form:input path="password"/></td></tr>
        <tr><td>Is still employee?</td><td><form:checkbox path="employee"/></td></tr>
    </table>
    <input type="submit" value="Edit user"/>
</form:form>
</body>
</html>
