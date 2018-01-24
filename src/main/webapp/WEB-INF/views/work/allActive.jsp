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
                        <c:if test="${order.readyToWork.isBefore(now)}">
                            <a href="/work/add/${order.id}">WORK</a>
                        </c:if>
                        <a href="/work/viewOrder/${order.id}">DETAILS</a>
                    </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
