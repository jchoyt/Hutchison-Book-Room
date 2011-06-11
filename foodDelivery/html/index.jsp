<%@ page import="florisfood.util.*,java.sql.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><html>
<head>
    <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" href="${css}/main.css" rel="stylesheet" />
    <script type="text/javascript" src="${js}/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="${js}/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="${js}/jquery.validate.js"></script>
</head>
<body>
    <center><img alt="logo" src="${images}/banner.jpg"/>
        <br/><br/>
        <a href="hutch.jsp">Hutchison Elementary School food delivery</a>  (<a href="hutch-simple.jsp">simple version</a>)<br/>
        <br/>
        <a href="embry.jsp">Embry Rucker Community Shelter food delivery</a>  (<a href="embry-simple.jsp">simple version</a>)<br/>
        <br/>
        <a href="modAccount.jsp">View and modify my account</a> | <a href="logout.jsp">Logout</a><br/>
        <br/>
        <%
            if( request.isUserInRole("admin"))
            {
                out.write("<a href=\"admin\">Admin pages</a>");
            }
        %>
    </center>
</body>
</html>
