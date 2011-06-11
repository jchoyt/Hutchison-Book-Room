<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*" %><%@
    attribute name="id" required="true" %><%
    String query = "select * from stats where altid=?";

    InvasionConnection conn = new InvasionConnection();
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setInt(1,Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
        out.write("<tr><td>");
        out.write( Stats.getStatName(rs.getInt("statid")) );
        out.write("</td><td>");
        out.write( rs.getString("count"));
        out.write("</td></tr>\n");
    }
    DatabaseUtility.close(rs);
    DatabaseUtility.close(ps);
    conn.close();
%>
