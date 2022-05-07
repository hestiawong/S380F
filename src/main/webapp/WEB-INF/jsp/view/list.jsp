<!DOCTYPE html>
<html>
    <body>
        <security:authorize access="hasRole('LECTURER')">    
            <a href="<c:url value="/userlist" />">Manage User Accounts</a><br /><br />
        </security:authorize>

        <security:authorize access="hasRole('LECTURER')">    
            [<a href="<c:url value="/course/createcourse" />">Create Course</a>]
        </security:authorize>[<a href="<c:url value = "/course/comment/history"/>">Comment History</a>]
        <br/><br/>

        [<a href="<c:url value = "/course/addPoll"/>">Add Poll</a>]
        <br/><br/>
        <c:forEach items="${course}" var="course">
            <ul>
                <h3>${course.coursename} 
                    <security:authorize access="hasRole('LECTURER')">    
                        [<a href="<c:url value="/course/deletecourse/${course.coursename}" />">Delete</a>]
                    </security:authorize>
                </h3>
                <c:forEach items="${course.lecture}" var="lecture">
                    <li><a href="<c:url value="/course/${lecture.id}" />">${lecture.lecturetitle}</a><security:authorize access="hasRole('LECTURER')">    
                            [<a href="<c:url value="/course/deletelecture/${lecture.id}" />">Delete</a>]
                        </security:authorize></li>
                    </c:forEach>

            </ul>
        </c:forEach>


        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

    </body>
</html>