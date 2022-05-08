<html>
    <body>
<fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
        <a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>

<h2><fmt:message key="CreateCourse"></fmt:message></h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="course">
    <form:label path="coursename" ><fmt:message key="CourseName"></fmt:message></form:label><br/>
    <form:input type="text" path="coursename" required="required"/><br/><br/>
    <form:label path="lecturetitle"><fmt:message key="LectureTitle"></fmt:message></form:label><br/>
    <form:input type="text" path="lecturetitle" required="required"/><br/><br/>
    <br /><br />
    <b><fmt:message key="Attachments"></fmt:message></b><br />
    <input type="file" name="attachments" multiple="multiple" /><br /><br />
    <input type="submit" value="<fmt:message key="Create"></fmt:message>"/>
</form:form>
    </fmt:bundle>
</body>
</html>
