<!DOCTYPE html>
<html>
    <body>

        <fmt:setLocale value="${param.locale}"/>
        <fmt:bundle basename="messages">
            <fmt:message key="ViewWebsitein"></fmt:message>
	<a href="?locale=en"><fmt:message key="English"></fmt:message></a>
        <a href="?locale=zh_HK"><fmt:message key="Chinese"></fmt:message></a>
        
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="addPoll">
            <form:label path="question"><fmt:message key="Question"></fmt:message></form:label><br/>
            <form:input type="question" path="question" required="required"/><br/><br/>
            
            <form:label path="answer0"><fmt:message key="Answer"></fmt:message></form:label><br/>
            <form:input type="text" path="answer0" required="required"/><br/><br/>

            <form:label path="answer1"><fmt:message key="Answer"></fmt:message></form:label><br/>
            <form:input type="text" path="answer1" required="required"/><br/><br/>

            <form:label path="answer2"><fmt:message key="Answer"></fmt:message></form:label><br/>
            <form:input type="text" path="answer2" required="required"/><br/><br/>

            <form:label path="answer3"><fmt:message key="Answer"></fmt:message></form:label><br/>
            <form:input type="text" path="answer3" required="required"/><br/><br/>

            <br /><br />
            <input type="submit" value="<fmt:message key="Add"></fmt:message>"/>
        </form:form>
        <br/>
        </fmt:bundle>
    </body>
</html>