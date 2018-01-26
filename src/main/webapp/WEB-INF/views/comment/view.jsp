<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 24.01.18
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Comment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${comment.alertLevel==0}"><p>${comment.text}</p></c:when>
            <c:when test="${comment.alertLevel==1}"><p class="table-warning">${comment.text}</p></c:when>
            <c:otherwise><p class="table-danger">${comment.text}</p></c:otherwise>
        </c:choose>
        <hr>
        <script>
            document.write('<a href="' + document.referrer + '" class="btn btn-primary">Go Back</a>');
        </script>
    </div>
</body>
</html>
