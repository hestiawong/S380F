
 <!DOCTYPE html>
 <html>
    <head>
        <title>Online Course Login</title>
    </head>
    <body>
        
        <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
	<a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>
        
        
            
        <c:if test="${param.error != null}">
            <p><fmt:message key="LoginFailed"></fmt:message></p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p><fmt:message key="LogoutMsg"></fmt:message></p>
        </c:if>
            
        
            <p style="font-size: larger"><fmt:message key="onlinecourselogin"></fmt:message></p>
        
        <form action="login" method="POST">
            <label for="username"><fmt:message key="Username"></fmt:message></label><br/>
            <input type="text" id="username" name="username" /><br/><br/>
            <label for="password"><fmt:message key="Password"></fmt:message></label><br/>
            <input type="password" id="password" name="password" /><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me"><fmt:message key="RememberMe"></fmt:message></label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="<fmt:message key="Login"/>"  />
        </form>

        [<a href="<c:url value="/createUser" />"><fmt:message key="CreateUser"></fmt:message></a>]
        <br/>
        [<a href="<c:url value="/course/visitor" />"><fmt:message key="Visitor"></fmt:message></a>]
        </fmt:bundle>
    </body>
</html>
