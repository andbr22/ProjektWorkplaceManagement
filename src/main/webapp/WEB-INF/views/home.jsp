<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 23.01.18
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mock home</title>
</head>
<body>
<table border="1px">
    <tr>
        <td>Worker</td>
        <td>Shift supervisor</td>
        <td>Monitor</td>
        <td>Admin</td>
        <td>Other</td>
    </tr>
    <tr>
        <td>
            <a href="/work/">Active orders, ready to work</a><br/>
        </td>
        <td>
            <a href="/order/">Orders management</a><br/>
        </td>
        <td>
            <a href="/stat/">Stats</a>
        </td>
        <td>
            <a href="/user/">Worker management</a>
        </td>
        <td>
            <a href="/register">Add new Admin</a><br/>
            Only admin can add other workers<br/>
            <a href="/login">Login</a><br/>
            <a href="/logout">Logout</a><br/>
        </td>
    </tr>
</table>

</body>
</html>
