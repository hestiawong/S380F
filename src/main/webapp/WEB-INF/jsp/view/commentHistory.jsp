<html>
    <body>
                <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
        <a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>
        
        <h1><fmt:message key="CommentHistory"></fmt:message></h1>
        
            <c:forEach items = "${lectures}" var = "lecture">
                <h3>${lecture.coursename}(<a href="<c:url value="/course/${lecture.id}"/>">${lecture.lecturetitle}</a>) :</h3>
                <c:forEach items="${comments}" var="comment">
                    <c:if test = "${lecture.id == comment.lecture_id}">
                        ${comment.username} : ${comment.comment}<br/><br/>
                    </c:if>
                </c:forEach> 
            </c:forEach> 
        <a href="<c:url value="/course" />"><fmt:message key="ReturnToCourseList"></fmt:message></a>          
        
        </fmt:bundle>
        
    </body>
</html>
