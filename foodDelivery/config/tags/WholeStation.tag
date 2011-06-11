<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*" %>
<div id="mapbox" style="position:relative;float:left;margin:2em;" onmouseout="shloc('${locid}')">
<%
    String stationid = WebUtils.getRequiredParameter( request, "id" );
    InvasionConnection conn = new InvasionConnection();
    int BOX_SIZE = 15;
    String query = "select  id, station, level, x, y, l.name as locname, lt.name as typename, description, cssname from Location l join locationtype lt on (l.typeid = lt.typeid) where station = ? and  x between 0 and 50 and y between 0 and 50 order by y,x";
    int x = 0;
    int y = 0;
    String cloc;
    ResultSet rs = conn.psExecuteQuery(query, "", Integer.decode(stationid));
    if( rs ==null )
    {
        out.write("Error retrieving map data;");
    }
    else
    {
        while(rs.next())
        {
            cloc = rs.getString("id");
            out.write("   <div class=\"me " + rs.getString("cssname") + "\" style=\"left: " + Integer.toString(x*BOX_SIZE) + "px; top:");
            out.write(Integer.toString(y*BOX_SIZE) + "px;\" onmouseover=\"shloc('" + cloc);
            out.write("')\" onclick=\"edit(" + cloc + ");\">");
            out.write("\n\t<div style=\"display:none\" id=\"desc-" + cloc + "\">");
            out.write("<b>Type:</b> " + rs.getString("typename"));
            out.write("<br/><b>Location:</b> " + rs.getString("station") + " -" + rs.getString("level") + "(" + rs.getString("x") + ", " + rs.getString("y") + ")" );
            out.write("<br/><b>Name:</b> " + rs.getString("locname"));
            out.write("<br/><b>Description:</b> " + rs.getString("description"));
            out.write("</div>\n</div>\n");
            if (x < 50) {
                x++;
            } else {
                x = 0; y++;
            }

        }
    }
    DatabaseUtility.close(rs);
    conn.close();
%>
</div>

