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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <table class="table">
            <tr>
                <th>Identity</th>
                <th>First name</th>
                <th>Last name</th>
                <th>is employee?</th>
                <th>Action</th>
            </tr>
        <c:forEach items="${users}" var="user">
            <c:choose>
                <c:when test="${user.employee}"><tr></c:when>
                <c:otherwise><tr class="table-secondary"></c:otherwise>
            </c:choose>
                <td>${user.userName}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.employee}</td>
                <td><a href="/user/edit/${user.id}">EDIT</a></td>
            </tr>
        </c:forEach>
    </table>
    <div class="container">
        <a href="/user/create" class="btn btn-primary">Add new user</a>
    </div>
</body>
</html>
