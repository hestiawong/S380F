
<html>

    <body>
        <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
        <a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>
        
        <c:if test="${fn:length(lecture.attachments) > 0}">
            <b><fmt:message key="CourseMaterials"></fmt:message></b>
            <ul>
                <c:forEach items="${lecture.attachments}" var="attachment">
                    <li><a href="<c:url value="/course/${lecture.id}/attachment/${attachment.name}" />">
                            <c:out value="${attachment.name}" /></a>
                            <security:authorize access="hasRole('LECTURER')">
                            [<a href="<c:url value="/course/${lecture.id}/delete/attachment/${attachment.name}" />"><fmt:message key="Delete"></fmt:message></a>]
                        </security:authorize>

                    </li>
                </c:forEach><br/>
            </ul>
            <hr>
        </c:if>

        <c:if test="${fn:length(lecture.comments) > 0}">        
            <b><fmt:message key="Comments"></fmt:message></b>
            <c:forEach items="${lecture.comments}" var="comment">
                <br /><br />
                ${comment.username} : ${comment.comment}
                <security:authorize access="hasRole('LECTURER')">
                    [<a href="<c:url value="/course/${lecture.id}/delete/comment/${comment.id}" />"><fmt:message key="Delete"></fmt:message></a>]
                </security:authorize>
            </c:forEach><br /><br />
            <hr><br />
        </c:if>
        <form:form method="POST" action="comment/${lecture.id}" enctype="multipart/form-data" modelAttribute="AttachmentForm">   
            <form:label path="comment"><fmt:message key="Comment"></fmt:message></form:label><br/>
            <form:textarea path="comment" rows="3" cols="30" /><br/><br/>
            <input type="submit" value="Post"/>
        </form:form><br /><br />   
        <security:authorize access="hasRole('LECTURER')">
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="AttachmentForm"> 
                <b><fmt:message key="AddAttachments"></fmt:message></b><br />
                <input type="file" name="attachments" multiple="multiple"/><br/><br/>
                <input type="submit" value="<fmt:message key="Add"/>"  />
            </form:form>
        </security:authorize>    
        <a href="<c:url value="/course" />"><fmt:message key="ReturnToCourseList"></fmt:message></a>
        </fmt:bundle>
    </body>
</html>
