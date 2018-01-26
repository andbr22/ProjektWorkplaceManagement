<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 24.01.18
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View By Order</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <h2>Work Order</h2>
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
            <th>Action</th>
        </tr>
        <tr>
            <td>${order.orderName}</td>
            <td>${order.orderClient}</td>
            <td>${order.orderDescription}</td>
            <td>${order.amount}</td>
            <td>${order.wholeEstimatedAmount}</td>
            <td>${order.created.toLocalDate()} ${order.created.toLocalTime()}</td>
            <td>${order.readyToWork.toLocalDate()} ${order.readyToWork.toLocalTime()}</td>
            <td>${order.readyToRealisation.toLocalDate()} ${order.readyToRealisation.toLocalTime()}</td>
            <td>${order.finished}</td>
            <td>${order.stopped}</td>
            <td><a href="/order/finish/${order.id}">FINISHED</a></td>
        </tr>
    </table>
    <h2>Work Tasks</h2>
    <table class="table">
            <tr>
                <th>Worker</th>
                <th>Shift</th>
                <th>Amount done</th>
                <th>Estimated Work Hours</th>
                <th>Day created</th>
                <th>Alert level</th>
                <th>Action</th>
            </tr>
        <c:forEach items="${works}" var="work">
            <tr>
                <td>${work.worker.firstName} ${work.worker.lastName}</td>
                <td>${work.shift}</td>
                <td>${work.amountDone}</td>
                <td>${work.estimateWorkHours}</td>
                <td>${work.added.toLocalDate()} ${work.added.toLocalTime()}</td>
                <td>
                    ${work.comment.alertLevel}
                    <c:if test="${work.comment == null}">0</c:if>
                </td>
                <td>
                    <c:if test="${work.comment != null}">
                        <a href="/comment/${work.comment.id}">Show comment</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="container">
        <a href="/work/" class="btn btn-primary">Return to task list</a>
    </div>
</body>
</html>
