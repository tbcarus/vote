<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="ru.tbcarus.topjava.model.Role" %>
<%@ page import="ru.tbcarus.topjava.util.DateTimeUtil" %>

<html lang="ru">
<head>
    <title><spring:message code="user.user"/></title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<section>
    <h3><a href="/vote"><spring:message code="app.home"/></a></h3>
    <hr>
    <h2>${param.id != null ? 'Edit user' : 'Add user'}</h2>
    <jsp:useBean id="user" type="ru.tbcarus.topjava.model.User" scope="request"/>
    <form method="post" action="create-or-update">
        <input type="hidden" name="id" value="${user.id}">
        <table border="0">
            <tr>
                <td><spring:message code="user.name"/>:</td>
                <td><input type="text" name="name" value="${user.name}"></td>
            </tr>
            <tr>
                <td><spring:message code="user.email"/>:</td>
                <td>
                    <c:if test="${user.email != null}">
                        <input type="text" name="email" value="${user.email}" disabled>
                    </c:if>
                    <c:if test="${user.email == null}">
                        <input type="text" name="email" value="email@example.com">
                    </c:if>
                </td>
            </tr>
            <tr>
                <td><spring:message code="user.active"/>:</td>
                <td>
                    <c:if test="${user.enabled}">
                        <input type="checkbox" name="enabled" checked>
                    </c:if>
                    <c:if test="${!user.enabled}">
                        <input type="checkbox" name="enabled">
                    </c:if>
                </td>
            </tr>
            <tr>
                <td><spring:message code="user.registered"/>:</td>
                <td><input type="datetime-local" name="registered" value="${DateTimeUtil.toString(user.registered)}" disabled></td>
            </tr>
            <tr>
                <td><ftm:message key="common.password"/></td>
                <td><input type="text" name="password" value="${user.password}"></td>
            </tr>
            <tr>
                <td rowspan="2"><ftm:message key="user.roles"/></td>
                <td>
                    <c:if test="${user.roles.contains(Role.USER)}">
                        <input type="checkbox" name="userRole" checked> User
                    </c:if>
                    <c:if test="${!user.roles.contains(Role.USER)}">
                        <input type="checkbox" name="userRole"> User
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>
                    <c:if test="${user.roles.contains(Role.ADMIN)}">
                        <input type="checkbox" name="adminRole" checked> Admin
                    </c:if>
                    <c:if test="${!user.roles.contains(Role.ADMIN)}">
                        <input type="checkbox" name="adminRole"> Admin
                    </c:if>
                </td>
            </tr>
        </table>
        <button type="submit" name="button" name="user"><spring:message code="common.save"/></button>
        <button onclick="window.history.back()" type="button"><spring:message code="common.cancel"/></button>
    </form>
</section>
</body>
</html>