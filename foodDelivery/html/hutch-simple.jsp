<%@ page import="florisfood.ui.*,florisfood.util.*,org.json.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><html>
<head>
    <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" href="${css}/main.css" rel="stylesheet" />
</head>
<body>
    <center><img alt="logo" src="${images}/banner.jpg"/>
        <br/><br/>
        <h2>Hutchison Elementary Delivery Schedule</h2>
        <table>
            <thead>
                <tr><th>Day of Week</th><th>Date</th><th>Deliverer</th></tr>
            </thead>
            <tbody>
            <%
                JSONArray array = DAO.getSchedule("Hutchison");
                JSONObject obj = new JSONObject();
                obj.put("items", array);
                VelocityUtil.applyTemplate(obj, "schedule.vm", out);
            %>
            </tbody>
        </table>
        <a href="index.jsp">Home</a> | <a href="logout.jsp">Logout</a>
    </center>
</body>
</html>

