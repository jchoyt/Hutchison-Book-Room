<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*" %><%@
    attribute name="id" required="true" %>
<%
    String player = request.getRemoteUser();

    String query = "select * from alt a join location l on (a.location = l.id) where a.id=?";

    InvasionConnection conn = new InvasionConnection();
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setInt(1,Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();
    if(rs.next())
    {
        System.out.println( "got here" );
        out.write("Name: " + rs.getString("name"));
        out.write("<br/>Level: Mod DB" );
        out.write("<br/>XP: " + rs.getString("xp"));
        out.write("<br/>AP: " + rs.getString("ap") + "/" + rs.getString("apmax"));
        out.write("<br/>HP: " + rs.getString("hp") + "/" + rs.getString("hpmax"));
        out.write("<br/>Character Points: " + rs.getString("cp"));
        out.write("<br/>Location: " + rs.getString("name") + " - (" + rs.getString("x") + ", " + rs.getString("y") + " on level " + rs.getString("level") + " of station " + rs.getString("station") + ")");
    }
    else
        out.write("DNE");

    out.write("<br/><br/><br/><a href=\"/map/index.jsp\">Back</a>");
    DatabaseUtility.close(rs);
    DatabaseUtility.close(ps);
    conn.close();
%></tbody>
    </table>

