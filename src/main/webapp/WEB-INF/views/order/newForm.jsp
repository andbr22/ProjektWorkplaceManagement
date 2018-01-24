<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Work Order</title>
</head>
<body>
    <div>
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
                    <td><input type="checkbox" name="ready"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Create new order"/></td>
                </tr>
            </table>
        </form:form>
    </div>

    <a href="/order/">Return to all view</a>
</body>
</html>
