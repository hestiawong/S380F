<!DOCTYPE html>
<html>
    <body>
        
        <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
	<a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>
        
        <security:authorize access="hasRole('LECTURER')">    
            <a href="<c:url value="/userlist"/>"><fmt:message key="ManageUserAccount"></fmt:message></a><br /><br />
        </security:authorize>

        <security:authorize access="hasRole('LECTURER')">    
            [<a href="<c:url value="/course/createcourse" />"><fmt:message key="CreateCourse"></fmt:message></a>]
        </security:authorize>[<a href="<c:url value = "/course/comment/history"/>"><fmt:message key="CommentHistory"></fmt:message></a>]
        <br/><br/>

        [<a href="<c:url value = "/course/addPoll"/>"><fmt:message key="AddPoll"></fmt:message></a>]
        <br/><br/>
        <c:forEach items="${course}" var="course">
            <ul>
                <h3>${course.coursename} 
                    <security:authorize access="hasRole('LECTURER')">    
                        [<a href="<c:url value="/course/deletecourse/${course.coursename}" />"><fmt:message key="Delete"></fmt:message></a>]
                    </security:authorize>
                </h3>
                <c:forEach items="${course.lecture}" var="lecture">
                    <li><a href="<c:url value="/course/${lecture.id}" />">${lecture.lecturetitle}</a><security:authorize access="hasRole('LECTURER')">    
                            [<a href="<c:url value="/course/deletelecture/${lecture.id}" />"><fmt:message key="Delete"></fmt:message></a>]
                        </security:authorize></li>
                    </c:forEach>

            </ul>
        </c:forEach>


        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="<fmt:message key="LogOut"/>"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        </fmt:bundle>
    </body>
</html>