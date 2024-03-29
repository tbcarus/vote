<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ru">
<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHeader.jsp"/>
<div class="jumbotron pt-4">
    <div class="container">
        <section>
            <jsp:include page="fragments/bodyCommon.jsp"/>
            <hr>
            <h2>${param.id != null ? 'Edit vote' : 'To vote'}</h2>
            <jsp:useBean id="vote" type="ru.tbcarus.topjava.model.Vote" scope="request"/>
            <form method="post" action="votes/create-or-update">
                Vote ID: <input type="text" name="voteId" value="${vote.id}">
                <dl>
                    <dt><spring:message code="restaurant.restaurant"/>:</dt>
                    <dd>
                        <select name="restaurantId">
                            <c:forEach var="r" items="${requestScope.restaurants}">
                                <jsp:useBean id="r" type="ru.tbcarus.topjava.model.Restaurant"/>
                                <option value="${r.id}">${r.name}</option>
                            </c:forEach>
                        </select>
                    </dd>
                </dl>
                <button type="submit" name="button" name="vote"><spring:message code="common.save"/></button>
                <button onclick="window.history.back()" type="button"><spring:message code="common.cancel"/></button>
            </form>
        </section>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
