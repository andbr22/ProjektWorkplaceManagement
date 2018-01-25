<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 25.01.18
  Time: 09:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change worker password</title>
</head>
<body>
    <div>
        ${message}
    </div>
    <form method="post">
        <table>
            <tr>
                <td>Old password:</td>
                <td><input type="password" name="oldPass"/></td>
            </tr>
            <tr>
                <td>New password:</td>
                <td><input type="password" name="newPass"/></td>
            </tr>
            <tr>
                <td>Repeat new password:</td>
                <td><input type="password" name="repeatPass"/></td>
            </tr>
        </table>
    </form>
</body>
</html>
