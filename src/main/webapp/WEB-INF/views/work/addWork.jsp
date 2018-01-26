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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form:form modelAttribute="work" method="post">
        Amount done
        <form:input path="amountDone" class="form-control"/>
        Estimate work hours
        <form:input path="estimateWorkHours" class="form-control"/></td>
        Shift
        <form:select path="shift" class="form-control">
            <form:option value="morning 8h"/>
            <form:option value="afternoon 8h"/>
            <form:option value="night 8h"/>
            <form:option value="day 12h"/>
            <form:option value="night 12h"/>
        </form:select>
        <hr/>
        <h3>Optional comment:</h3>
        Alert level
        <form:select path="comment.alertLevel" class="form-control">
            <form:option value="0"/>
            <form:option value="1"/>
            <form:option value="2"/>
        </form:select>
        Comment text
        <form:textarea path="comment.text" class="form-control"/><br/>
        <input type="submit" value="Commit" class="btn btn-primary">
    </form:form>
</div>
</body>
</html>
