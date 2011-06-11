<%@ page import="florisfood.ui.*,org.json.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><%
    JSONArray array = DAO.getSchedule("Hutchison");
    out.write(String.valueOf(array));
    %>


