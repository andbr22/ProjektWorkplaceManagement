<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of all Users</title>
</head>
<body>
    <table border="1px">
            <tr>
                <td>Identity</td>
                <td>First name</td>
                <td>Last name</td>
                <td>is employee?</td>
                <td>Action</td>
            </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.userName}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.employee}</td>
                <td><a href="/user/edit/${user.id}">EDIT</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="/user/create">Add new user</a>
</body>
</html>
