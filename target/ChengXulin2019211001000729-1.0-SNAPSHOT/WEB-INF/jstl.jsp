<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lab1.Dog" %>
<%@ page import="com.lab1.Person" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 5/18/2021
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- add tab lib in to jsp page -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Demo #1 - week 12</title>
</head>
<body>
<h1>Looping Tags-c:forEach c:forToken<h1>
    <h2>c:forEach- use var  - fixed Number of times </h2>

    <ul>
        <c:forEach var="i" begin="1" end="10"><!-- no step == step 1-->
        <li>${i}</li>
        </c:forEach>
    </ul>
    <h2>c:forEach- use var  - fixed Number of times </h2>

    <ul>
        <c:forEach var="i" begin="1" end="10" step="2">
            <li>${i}</li>
        </c:forEach>
    </ul>
    <h2>c:forEach -use items - collection times </h2>
        <%
//create array list ,map
    //array
    String[] firstName={"Bill","Scott","Larry"};
    //arraylist
    ArrayList<String> lastName=new ArrayList<String>();
    lastName.add("Ellison");
    lastName.add("Gates");
    lastName.add("McNealy");
//map
    HashMap<String,String> companyName=new HashMap<String,String>();
    companyName.put("Ellison","sun");
    companyName.put("Gates","Orecle");
    companyName.put("McNealy","MicroSoft");

//set attribute in any one scope
    request.setAttribute("first",firstName);//array
    request.setAttribute("last",lastName);//arraylist- 0,1,2,3,....
    request.setAttribute("company",companyName);//map

%>
    <h2> get items from - Array</h2>
    <ul>
        <c:forEach var="a" items="${first}">
        <li>${a}</li>
        </c:forEach>
    </ul>
    <h2> get items from - List</h2>
    <ul>
        <c:forEach var="l" items="${last}">
        <li>${l}</li>
        </c:forEach>
    </ul>
    <h2> get items from - Map</h2>
    <ul>
        <c:forEach var="m" items="${company}">
        <li>${m.key}-->${m.value}</li>
        </c:forEach>
    </ul>

    <h2>c:forEach -use items - get items from collection of bean - ArrayList of Person </h2>
    <%

        //person 1
            Dog dog1=new Dog();
            dog1.setName("Tommy");
             Person person1=new Person();
                person1.setName("Tom");
                person1.setDog(dog1);

                //person 2
            Dog dog2=new Dog();
            dog2.setName("Sammy");
             Person person2=new Person();
                person2.setName("Sam");
                person2.setDog(dog2);

                //person 3
            Dog dog3=new Dog();
            dog3.setName("Pommy");
             Person person3=new Person();
                person3.setName("Pom");
                person3.setDog(dog3);

                //list of person
                List<Person> personList=new ArrayList<Person>();
                personList.add(person1);
                personList.add(person2);
                personList.add(person3);
                //set in any one scope
                request.setAttribute("personList",personList);

        %>
    <ul>
    <c:forEach var="p" items="${personList}">
        <li>${p.name} s' Dog name -->${p.dog.name}</li>
    </c:forEach>
    </ul>




    <h2>c:forToken -use items - get times from string -One,Two,Three,Four.Five.Six</h2>
    <ul>
        <c:forTokens var="s"
                     items="One,Two,Three,Four.Five.Six" delims=",.">
        <li>${s}</li>
        </c:forTokens>
    </ul>
    <hr>
    <h1>General Tags-c:out, c:set,c:remove,c:catch </h1>
    <h2>Use of c:out</h2>
    <c:set var="username" value="ADMIN" scope="session"/><!-- session.setAttribute("username","ADMIN")-->
    <h1>Welcome,<c:out value="<font color=red>${username}</font>" default="Guest" escapeXml="false"/><!-- get from session
    if value is null -- it print nothing
    if username is null -- print Guest- use default

-->
    </h1>
    <h2>Use of c:set - var - set scoped variable-set attribute</h2>
    <c:set var="foo" value="in page" scope="page"/>
    <c:set var="foo" value="in request" scope="request"/>
    <c:set var="foo" value="in session" scope="session"/>
    <c:set var="foo" value="in application" scope="application"/>

    Att (use java code):<%=pageContext.findAttribute("foo")%><br>
    Att (use EL code):${foo}<br>
    Att (use JSTL code):<c:out value="${foo}"/> <br>


    <h2>Use of c:set - target - set bean property</h2>
    <%
            //person 3
            Dog dog4=new Dog();
            //dog4.setName("Jimmy");//change to
             Person person4=new Person();
                //person4.setName("Jim");//change to c:set
              //  person4.setDog(dog4);
       request.setAttribute("p4",person4);
       request.setAttribute("d4",dog4);
        %>
     <c:set target="${d4}" property="name" value="Jimmy"/>
    <c:set target="${p4}" property="name" value="Jim"/>
    <c:set target="${p4}" property="dog" value="${d4}"/>

    ${p4.name} s' DOg name : ${p4.dog.name}
    <h2>c:remove- remove  attribute </h2>

    <h2>att before remove</h2>
    att :<c:out value="${pageScope.foo}"/><br>
    att :<c:out value="${requestScope.foo}"/><br>
    att :<c:out value="${sessionScope.foo}"/><br>
    att :<c:out value="${applicationScope.foo}"/><br>
    <c:remove var="foo" scope="request"/><!-- no scope == remove from all scope-->
    <h2>Att after remove</h2>
    att :<c:out value="${pageScope.foo}"/><br>
    att :<c:out value="${requestScope.foo}"/><br>
    att :<c:out value="${sessionScope.foo}"/><br>
    att :<c:out value="${applicationScope.foo}"/><br>


    <h2>c:catch- catch exception </h2>
    <c:catch var="msg">
    <%=1/0%>
    </c:catch>
    Exception message : ${msg}





    <hr>
    <h1>Conditional  Tags-c:if,c:choose,c:when, c:otherwise</h1>
    <h2>c:if- test one condition </h2>
    <h2>c:choose,c:when, c:otherwise- switch case </h2>
    <hr>
    <h1>URL Related Tags - c:param,c:redirect,c:url,c:import</h1>
    <h2>use of c:import</h2>
    <h2>use of c:url & c:param-make url </h2>
    <h2>use of c:redirect</h2>

</body>
</html>
