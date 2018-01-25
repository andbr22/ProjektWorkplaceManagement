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
</head>
<body>
    <table border="1px">
            <tr>
                <td>Order name</td>
                <td>Client name</td>
                <td>Order description</td>
                <td>Amount to make</td>
                <td>Amount done</td>
                <td>Created</td>
                <td>Ready to process</td>
                <td>Ready to realisation</td>
                <td>Finished</td>
                <td>Stopped</td>
                <td>Actions</td>
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
                    <c:choose>
                        <c:when test="${order.readyToRealisation == null}"><a href="/order/${order.id}/ReadyToRealisation">SET</a></c:when>
                        <c:otherwise>${order.readyToRealisation.toLocalDate()} ${order.readyToRealisation.toLocalTime()}</c:otherwise>
                    </c:choose>
                </td>
                <td>${order.finished}</td>
                <td>${order.stopped}</td>
                <td>
                    <c:if test="${order.readyToRealisation == null}"><a href="/order/edit/${order.id}">EDIT</a> </c:if>
                    <a href="/order/clone/${order.id}">CLONE</a>
                    <a href="/work/viewOrder/${order.id}">DETAILS</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="/order/create">Create new</a><br/>
    <a href="/stat/findWorkOrders">Search for work orders</a>
</body>
</html>
