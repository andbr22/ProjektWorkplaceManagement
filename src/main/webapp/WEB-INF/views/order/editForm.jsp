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
</head>
<body>
<form:form modelAttribute="workOrder" method="post">
    <table>
        <tr>
            <td>Order name:</td>
            <td><form:input path="orderName"/></td>
        </tr>
        <tr>
            <td>Client name:</td>
            <td><form:input path="orderClient"/></td>
        </tr>
        <tr>
            <td>Order description:</td>
            <td><form:input path="orderDescription"/></td>
        </tr>
        <tr>
            <td>Amount:</td>
            <td><form:input path="amount"/></td>
        </tr>
        <tr>
            <td>Ready to process?</td>
            <td><input type="checkbox" name="workReady"></td>
        </tr>
        <tr>
            <td>Is Finished?</td>
            <td><form:checkbox path="finished"/></td>
        </tr>
        <tr>
            <td>Is Stopped?</td>
            <td><form:checkbox path="stopped"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Create new order"/></td>
        </tr>
    </table>
</form:form>
<a href="/order/">Return to all view</a>
</body>
</html>
