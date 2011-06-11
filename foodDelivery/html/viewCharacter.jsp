<%@ page import="florisfood.util.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><%
    String id = WebUtils.getRequiredParameter(request, "id");
%><html>
<head>
    <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" href="${css}/main.css" rel="stylesheet" />
    <script type="text/javascript" src="${js}/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="${js}/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="${js}/jquery.validate.js"></script>
</head>
<body>
    <center><img alt="logo" src="${images}/banner.png"/>
        <br/><br/>
        <tags:CharacterInfo id="<%=id%>"/>
        <h1>What I did on my summer vacation....</h1>
        <table>
            <tbody>
                <tr><th>What?</th><th>How Many?</th></tr>
                <tags:CharBadges id="<%=id%>"/>
            </tbody>
        </table>
    </center>
</body>
</html>
