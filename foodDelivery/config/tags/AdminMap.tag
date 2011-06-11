<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*,java.util.logging.*" %><%@
attribute name="locid" required="true" %><%!

    InvasionConnection conn = null;
    int BOX_SIZE = 55;
    int MAP_SIDE = 15;
    int TOTAL_SIZE = BOX_SIZE * MAP_SIDE;
    Location center = null;
    StringBuilder centerLocData = new StringBuilder();
    /**
     *  Does the data retrieval
     */
    protected ResultSet getData() {
        int loc = Integer.parseInt( locid );
        System.out.println( loc );
        ResultSet rs = null;
        try {
            conn = new InvasionConnection();
            String query = "select x, y, station from location where id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(locid));
            rs = ps.executeQuery();
            int x = 0;
            int y = 0;
            int station = -1;
            if(rs.next())
            {
                x = rs.getInt(1);
                y = rs.getInt(2);
                station = rs.getInt(3);
            }
            DatabaseUtility.close(rs);
            DatabaseUtility.close(ps);
            int spread = (MAP_SIDE)/2;
            query = "select  id, station, level, x, y, l.name as locname, lt.name as typename, description, cssname from Location l join locationtype lt on (l.typeid = lt.typeid) where x between ? and ? and y between ? and ? and station = ? order by y,x";
            ps = conn.prepareStatement(query);
            ps.setInt(1, x - spread );
            ps.setInt(2, x + spread);
            ps.setInt(3, y - spread);
            ps.setInt(4, y + spread);
            ps.setInt(5, station);
            return ps.executeQuery();
        } catch (SQLException e) {
            DatabaseUtility.close(rs);
            conn.close();
            Logger log = Logger.getLogger( "AdminMap.tag" );
            log.log(Level.WARNING, "Error retrieving map data", e);
            return null;
        }
    }
%>

<div id="mapbox" style="position:relative;float:left;margin:2em;height:<%=TOTAL_SIZE%>px;width:<%=TOTAL_SIZE%>px" onmouseout="shloc('<%=locid%>')">
<%
    int x = 0;
    int y = 0;
    String cloc;
    ResultSet rs = getData();
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
            if (x < MAP_SIDE - 1) {
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


