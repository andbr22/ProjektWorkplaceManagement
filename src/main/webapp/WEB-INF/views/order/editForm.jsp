<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Order Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form:form modelAttribute="workOrder" method="post">
        Order name
        <form:input path="orderName" class="form-control"/>
        Client name
        <form:input path="orderClient" class="form-control"/>
        Order description:
        <form:input path="orderDescription" class="form-control"/>
        Amount
        <form:input path="amount" class="form-control"/>
        <c:if test="${workOrder.readyToWork == null}">
            <div class="form-check">
            <input type="checkbox" name="workReady" class="form-check-input"/>
                <label class="form-check-label">Ready to process?</label>
                <input type="date" name="readyDate" value="${now.toLocalDate()}" class="form-control"/>
            </div>
        </c:if>
        <br/>
        <div class="form-check">
            <form:checkbox path="finished" class="form-check-input"/>
            <label class="form-check-label">Is Finished?</label>
        </div>
        <div class="form-check">
            <form:checkbox path="stopped" class="form-check-input"/>
            <label class="form-check-label">Is Stopped?</label>
        </div>
        <br/>
        <input type="submit" value="Edit Work Order" class="btn btn-primary"/>
        <a href="/order/" class="btn btn-primary">Return to all view</a>
    </form:form>
</div>
</body>
</html>
