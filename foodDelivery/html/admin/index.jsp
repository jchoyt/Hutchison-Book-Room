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
        <a href="contactList.jsp?destination=Hutchison">List of contact info for all Hutchison deliverers</a><br/><br/>

        <a href="contactList.jsp?destination=Embry">List of contact info for all Embry deliverers</a><br/><br/>

        <a href="schedule">Schedule additional week of deliveries</a><br/><br/>
        <br/>
        <a href="..">Home</a> | <a href="logout.jsp">Logout</a>


    </center>
</body>
</html>
