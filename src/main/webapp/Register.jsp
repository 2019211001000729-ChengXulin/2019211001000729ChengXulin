<%--
  Created by IntelliJ IDEA.
  User: 11797
  Date: 2021/3/13
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>New User Registration</h1>
<form method="post" action="register" >
    <b>
    Username：<input type="text" name="Username" ><br/>
    password：<input type="password" name="password" ><br/>
    Email：<input type="email" name="Email" ><br/>
    Gender：<input type="radio" name="gender" value="male">Male <input type="radio" name="gender" value="female">Female<br/>
    Date of Birth：</td> <td><input type="date" name="Date" ><br/>
    <input type="submit" value="Register"/></b>
</form>

</body>
</html>
