<%@ tag import="java.io.*,java.util.*,org.mitre.mrald.taglib.*,org.mitre.mrald.util.*,java.sql.*" %>
<%
    String query = "select user_id, user_name from saife_user";
    MraldConnection conn = new MraldConnection("main");
    ResultSet rs =null;
    StringBuffer logInfo = new StringBuffer();
    long startTime = MiscUtils.logQuery("showDbs.tag", "main", query, logInfo);
    rs = conn.executeQuery(query);
    MiscUtils.logQueryRun(startTime, logInfo);
    while (rs.next())
    {
        int id = rs.getInt("user_id");
        String name = rs.getString("user_name");
        %>
        <option value="<%=id%>"><%=name%></option>
        <%	
    }
    rs.close();
    conn.close();
%>


 
