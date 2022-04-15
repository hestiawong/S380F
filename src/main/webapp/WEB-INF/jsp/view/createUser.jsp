
<html>
<body>
<h2>Create a User</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="WebUser">
    <form:label path="username">Username :</form:label><br/>
    <form:input type="text" path="username" required="required"/><br/><br/>
    <form:label path="password">Password :</form:label><br/>
    <form:input type="text" path="password" required="required"/><br/><br/>
    
    <form:label path="fullname">Fullname :</form:label><br/>
    <form:input type="text" path="fullname" required="required"/><br/><br/>
    
    <form:label path="address">Address :</form:label><br/>
    <form:input type="text" path="address" required="required"/><br/><br/>
    
    <form:label path="phone">Phone :</form:label><br/>
    <form:input type="text" path="phone" required="required"/><br/><br/>
    
    <form:label path="roles">Roles :</form:label><br/>
    <form:radiobutton path="roles" value="ROLE_LECTURER" />LECTURER
    <form:radiobutton path="roles" value="ROLE_STUDENT" />STUDENT
    <br /><br />
    <input type="submit" value="Create"/>
</form:form>
</body>
</html>
