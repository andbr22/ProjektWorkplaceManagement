<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 24.01.18
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Comment</title>
</head>
<body>
    ${comment.text}
    <hr>
    <script>
        document.write('<a href="' + document.referrer + '">Go Back</a>');
    </script>
</body>
</html>
