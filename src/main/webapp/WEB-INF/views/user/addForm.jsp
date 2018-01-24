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
</head>
<body>
    <form:form modelAttribute="user" method="post">
        <table>
            <tr><td>Identity:</td><td><form:input path="userName"/></td>
            <tr><td>First name:</td><td><form:input path="firstName"/></td></tr>
            <tr><td>Last name:</td><td><form:input path="lastName"/></td></tr>
            <tr><td>Password:</td><td><form:input path="password"/></td></tr>
        </table>
        <input type="submit" value="Add new user"/>
    </form:form>
</body>
</html>
