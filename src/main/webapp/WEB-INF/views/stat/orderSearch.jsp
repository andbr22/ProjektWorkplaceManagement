<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 24.01.18
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Work order search</title>
</head>
<body>
    <form method="post">
        <table>
            <tr>
                <td>Client name</td>
                <td>Order name</td>
                <td>Between dates</td>
            </tr>
            <tr>
                <td><input type="radio" name="choice" value="client"/></td>
                <td><input type="radio" name="choice" value="order"/></td>
                <td><input type="radio" name="choice" value="dates"/></td>
            </tr>
            <tr>
                <td><input name="client"/></td>
                <td><input name="order"/></td>
                <td><input type="date" name="start"/><br/><input type="date" name="end"/></td>
            </tr>
        </table>
        <input type="submit"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</body>
</html>
