<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="ru.tbcarus.topjava.util.DateTimeUtil" %>

<html lang="ru">
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script src="resources/js/tbcarus.common.js" defer></script>
<script src="resources/js/tbcarus.users.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron pt-4">
    <div class="container">
        <jsp:include page="fragments/bodyCommon.jsp"/>
        <c:set var="selectedUser" value="${requestScope.user}"/>
        <jsp:useBean id="selectedUser" class="ru.tbcarus.topjava.model.User" scope="request"/>
        <h3 class="text-center"><spring:message code="user.title"/></h3>
        <button class="btn btn-primary" onclick="add()">
            <span class="fa fa-plus"></span>
            <spring:message code="common.add"/>
        </button>
        <a href="users/create"><spring:message code="user.add"/> - новая страница</a>
        <br><br>
        <table class="table table-striped mt-3" id="datatable">
            <thead>
            <tr>
                <th><spring:message code="user.name"/></th>
                <th><spring:message code="user.email"/></th>
                <th><spring:message code="user.active"/></th>
                <th><spring:message code="user.registered"/></th>
                <th><spring:message code="user.roles"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" tabindex="-1" id="editRow">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle">
                    <%--                    <spring:message code="user.add"/>--%>
                </h4>
                <button type="button" class="close" data-dismiss="modal" onclick="closeNoty()">&times;</button>
            </div>
            <div class="modal-body">
                <form id="detailsForm">
                    <input type="hidden" id="id" name="id">

                    <div class="form-group">
                        <label for="name" class="col-form-label"><spring:message code="user.name"/></label>
                        <input type="text" class="form-control" id="name" name="name"
                               placeholder="<spring:message code="user.name"/>">
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-form-label"><spring:message code="user.email"/></label>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="<spring:message code="user.email"/>">
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-form-label"><spring:message code="user.password"/></label>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="<spring:message code="user.password"/>">
                    </div>

                    <div class="form-group">
                        <c:if test="${user.enabled}">
                            <input type="checkbox" id="enabled" name="enabled" checked> Enabled
                        </c:if>
                        <c:if test="${!user.enabled}">
                            <input type="checkbox" id="enabled" name="enabled"> Enabled
                        </c:if>
                    </div>

                    <div class="form-group">
                        <c:if test="${user.roles.contains(Role.USER)}">
                            <input type="checkbox" id="userRole" name="userRole" checked> User
                        </c:if>
                        <c:if test="${!user.roles.contains(Role.USER)}">
                            <input type="checkbox" id="userRole" name="userRole"> User
                        </c:if>
                    </div>
                    <div class="form-group">
                        <c:if test="${user.roles.contains(Role.ADMIN)}">
                            <input type="checkbox" id="adminRole" name="adminRole" checked> Admin
                        </c:if>
                        <c:if test="${!user.roles.contains(Role.ADMIN)}">
                            <input type="checkbox" id="adminRole" name="adminRole"> Admin
                        </c:if>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()">
                    <span class="fa fa-close"></span>
                    <spring:message code="common.cancel"/>
                </button>
                <button type="button" class="btn btn-primary" onclick="save()">
                    <span class="fa fa-check"></span>
                    <spring:message code="common.save"/>
                </button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
<script type="text/javascript">
    const i18n = [];
    i18n["addTitle"] = '<spring:message code="user.add"/>';
    i18n["editTitle"] = '<spring:message code="user.edit"/>';

    <c:forEach var="key" items='<%=new String[]{"common.deleted","common.saved","common.enabled","common.disabled","common.errorStatus","common.confirm", "common.update", "common.delete"}%>'>
    i18n["${key}"] = "<spring:message code="${key}"/>";
    </c:forEach>
</script>
</html>