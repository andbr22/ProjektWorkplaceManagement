<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 24.01.18
  Time: 09:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Active Work Order</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <table class="table">
            <tr>
                <th>Order name</th>
                <th>Client name</th>
                <th>Order description</th>
                <th>Amount to make</th>
                <th>Amount done</th>
                <th>Created</th>
                <th>Ready to process</th>
                <th>Actions</th>
            </tr>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.orderName}</td>
                <td>${order.orderClient}</td>
                <td>${order.orderDescription}</td>
                <td>${order.amount}</td>
                <td>${order.wholeEstimatedAmount}</td>
                <td>${order.created.toLocalDate()} ${order.created.toLocalTime()}</td>
                <td>${order.readyToWork.toLocalDate()} ${order.readyToWork.toLocalTime()}</td>
                    <td>
                        <c:if test="${order.readyToWork.isBefore(now)}">
                            <a href="/work/add/${order.id}">WORK</a>
                        </c:if>
                        <a href="/work/viewOrder/${order.id}">DETAILS</a>
                    </td>
            </tr>
        </c:forEach>
    </table>
    <div class="container">
        <a href="/logout" class="btn btn-danger">Logout</a>
        <a href="/work/workerPassword" class="btn btn-secondary">Change password</a>
    </div>
</body>
</html>
