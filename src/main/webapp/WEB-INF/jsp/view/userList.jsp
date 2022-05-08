
<body>
    <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
	<a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>

<a href="<c:url value="/course" />"><fmt:message key="ReturnToCourseList"></fmt:message></a>
<h2><fmt:message key="Users"></fmt:message></h2>
<a href="<c:url value="/createUser" />"><fmt:message key="CreateAUser"></fmt:message></a><br /><br />
<c:choose>
    <c:when test="${fn:length(WebUsers) == 0}">
        <i><fmt:message key="NoUser"></fmt:message></i>
    </c:when>
    <c:otherwise>
    <table>
        <tr>
            <th><fmt:message key="Username"></fmt:message></th>
            <th><fmt:message key="Password"></fmt:message></th>
            <th><fmt:message key="Roles"></fmt:message></th>
            <th><fmt:message key="Fullname"></fmt:message></th>
            <th><fmt:message key="Phone"></fmt:message></th>
            <th><fmt:message key="Address"></fmt:message></th>
        </tr>
        <c:forEach items="${WebUsers}" var="user">
        <tr>
            <td>${user.username}</td><td>${user.password}</td><td>${user.roles}</td><td>${user.fullname}</td><td>${user.phone}</td><td>${user.address}</td>
            <td>
            [<a href="<c:url value="/userlist/delete/${user.username}" />"><fmt:message key="Delete"></fmt:message></a>]
            </td>
            <td>
            [<a href="<c:url value="/userlist/edit/${user.username}" />"><fmt:message key="Edit"></fmt:message></a>]
            </td>
        </tr>
        </c:forEach>
    </table>
    </c:otherwise>
</c:choose>
        </fmt:bundle>
</body>
