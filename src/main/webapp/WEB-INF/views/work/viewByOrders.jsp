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
</head>
<body>
    <h2>Work Order</h2>
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
            <td>Action</td>
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
    <table border="1px">
            <tr>
                <td>Worker</td>
                <td>Shift</td>
                <td>Amount done</td>
                <td>Estimated Work Hours</td>
                <td>Day created</td>
                <td>Alert level</td>
                <td>Action</td>
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
<a href="/work/">Return to task list</a>
</body>
</html>
