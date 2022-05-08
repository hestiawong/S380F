
<html>
<body>
    
    <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
	<a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>
    
<h2><fmt:message key="UpdateUser"></fmt:message> ${WebUser.username}</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="WebUser">
    
    <form:label path="fullname"><fmt:message key="Fullname"></fmt:message></form:label><br/>
    <form:input type="text" path="fullname" required="required"/><br/><br/>
    
    <form:label path="address"><fmt:message key="Address"></fmt:message></form:label><br/>
    <form:input type="text" path="address" required="required"/><br/><br/>
    
    <form:label path="phone"><fmt:message key="Phone"></fmt:message></form:label><br/>
    <form:input type="text" path="phone" required="required"/><br/><br/>
    
    <form:label path="roles"><fmt:message key="Roles"></fmt:message></form:label><br/>
    <form:radiobutton path="roles" value="ROLE_LECTURER" />LECTURER
    <form:radiobutton path="roles" value="ROLE_STUDENT" />STUDENT
    <br /><br />
    <input type="submit" value="<fmt:message key="Update"></fmt:message>"/>
</form:form>
    
        </fmt:bundle>
    
</body>
</html>
