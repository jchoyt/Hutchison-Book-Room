<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*" %>
<%
        String query = "select typeid, name from Locationtype order by name";
        InvasionConnection conn = (InvasionConnection)request.getAttribute("conn");
        ResultSet rs = conn.executeQuery(query);
        while(rs.next())
        {
            out.write( "<option value=\"" + rs.getInt(1) + "\">" + rs.getString(2) + "</option>\n");
        }
        DatabaseUtility.close(rs);
%>
