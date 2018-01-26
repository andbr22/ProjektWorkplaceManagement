<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage all Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../../../style/simple.css">
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
        <th>Ready to realisation</th>
        <th>Finished</th>
        <th>Stopped</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${orders}" var="order">
        <c:choose>
            <c:when test="${order.readyToRealisation != null}"><tr class="table-secondary"></c:when>
            <c:when test="${order.getMaxAlertLevel()==0}"><tr></c:when>
            <c:when test="${order.getMaxAlertLevel()==1}"><tr class="table-warning"></c:when>
            <c:when test="${order.getMaxAlertLevel()==2}"><tr class="table-danger"></c:when>
            <c:otherwise><tr></c:otherwise>
        </c:choose>
            <td>${order.orderName}</td>
            <td>${order.orderClient}</td>
            <td>${order.orderDescription}</td>
            <td>${order.amount}</td>
            <td>${order.wholeEstimatedAmount}</td>
            <td>${order.created.toLocalDate()} ${order.created.toLocalTime()}</td>
            <td>${order.readyToWork.toLocalDate()} ${order.readyToWork.toLocalTime()}</td>
            <td>
                <c:choose>
                    <c:when test="${order.readyToRealisation == null}"><a href="/order/ReadyToRealisation/${order.id}">SET</a></c:when>
                    <c:otherwise>${order.readyToRealisation.toLocalDate()} ${order.readyToRealisation.toLocalTime()}</c:otherwise>
                </c:choose>
            </td>
            <td>${order.finished}</td>
            <td>
                <c:choose>
                    <c:when test="${order.readyToRealisation != null}"></c:when>
                    <c:when test="${order.stopped}"><a href="/order/StopStart/${order.id}"
                                                       class="red">Stopped</a></c:when>
                    <c:otherwise><a href="/order/StopStart/${order.id}" class="green">Started</a></c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${order.readyToRealisation == null}"><a href="/order/edit/${order.id}">EDIT</a> </c:if>
                <a href="/order/clone/${order.id}">CLONE</a>
                <a href="/work/viewOrder/${order.id}">DETAILS</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="container">
    <button onClick="window.print()" class="btn btn-secondary">Print</button>
    <a href="/order/create" class="btn btn-primary">Create new</a>
    <a href="/stat/findWorkOrders" class="btn btn-primary">Search for work orders</a>
</div>
</body>
</html>
