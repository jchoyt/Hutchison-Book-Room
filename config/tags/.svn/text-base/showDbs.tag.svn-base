<%@ tag import="java.io.*,java.util.*,org.mitre.mrald.taglib.*,org.mitre.mrald.util.*,java.sql.*" %>
<%
    String query = "select dr_id, dr_name, allows_retention from designated_repository_lkup";
    MraldConnection conn = new MraldConnection("main");
    ResultSet rs =null;
    StringBuffer logInfo = new StringBuffer();
    long startTime = MiscUtils.logQuery("showDbs.tag", "main", query, logInfo);
    rs = conn.executeQuery(query);
    MiscUtils.logQueryRun(startTime, logInfo);
    while (rs.next())
    {
        String name = rs.getString("dr_name");
        boolean retain = rs.getBoolean("allows_retention");
        %>
        <input name="submit_<%=name%>" type="checkbox"/> <%=name%> 
        (<input name="retain_<%=name%>" type="checkbox" checked="<%=retain%>"/> file retention permitted)<br/>
        <%	
    }
    rs.close();
    conn.close();
%>


 
