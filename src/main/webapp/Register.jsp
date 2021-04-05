<%--
  Created by IntelliJ IDEA.
  User: 11797
  Date: 2021/3/13
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/header.jsp"%>
This is my JSP page.<br>
<h1>New User Registration</h1>
<form method="post" action="/2019211001000729ChengXulin_war_exploded/register">
    <td> ID：<input type="text" name="id" ><br/></td>
    <td> Username：<input type="text" name="Username" ><br/></td>
    <td> password：<input type="password" name="password" ><br/> </td>
    <td> Email：<input type="email" name="Email" ><br/> </td>
    <td> Gender：<input type="radio" name="Gender" value="Male"/> Male <input type="radio" name="Gender" value="Female"/> Female<br/> </td>
    <td> Date of Birth：</td> <td><input type="date" name="Date" ><br/> </td>
<input type="submit" value="Register"/></b>
</form>
<%@include file="/footer.jsp"%>


