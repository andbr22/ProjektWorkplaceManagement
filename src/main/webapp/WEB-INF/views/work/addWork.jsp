<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 24.01.18
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Work </title>
</head>
<body>
    <form:form modelAttribute="work" method="post">
        <table>
            <tr>
                <td>Amount done:</td>
                <td><form:input path="amountDone"/></td>
            </tr>
            <tr>
                <td>Estimate work hours:</td>
                <td><form:input path="estimateWorkHours"/></td>
            </tr>
            <tr>
                <td>Shift:</td>
                <td>
                    <form:select path="shift">
                        <form:option value="morning 8h"/>
                        <form:option value="afternoon 8h"/>
                        <form:option value="night 8h"/>
                        <form:option value="day 12h"/>
                        <form:option value="night 12h"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td colspan="2">Optional comment:</td>
            </tr>
            <tr>
                <td>Alert level</td>
                <td>
                    <form:select path="comment.alertLevel">
                        <form:option value="0"/>
                        <form:option value="1"/>
                        <form:option value="2"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>Comment text:</td>
                <td><form:textarea path="comment.text"/></td>
            </tr>

        </table>
        <input type="submit" value="Commit">
    </form:form>
</body>
</html>
