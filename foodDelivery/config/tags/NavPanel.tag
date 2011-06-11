<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*,java.util.logging.*" %><%!


    InvasionConnection conn = null;
    int locid = -1337;
    int BOX_SIZE = 55;
    int MAP_SIDE = 5;
    int TOTAL_SIZE = BOX_SIZE * MAP_SIDE;
    Location center = null;
    StringBuilder centerLocData = new StringBuilder();
    /**
     *  Does the data retrieval
     */
    protected ResultSet getData() {
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String query = "select x, y, station from location where id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, locid);
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
            Logger log = Logger.getLogger( "NavPanel.tag" );
            log.log(Level.WARNING, "Error retrieving map data", e);
            return null;
        }
    }
%>
<script type="text/javascript">
			function shloc(id)
			{
			    show = "#desc-" + id;
			    contents = $(show).html();
			    $("#descbox").html(contents);
			};
</script>
<div class="descbox" id="descbox">&nbsp;</div>
<div id="mapbox" style="position:relative;" onmouseout="shloc('<%=locid%>')">
<%
    Whatzit wazzit =(Whatzit) session.getAttribute(Whatzit.KEY);
    if( wazzit == null )
    {  //nobody is logged in
        response.sendRedirect("/index.jsp");
        return;
    }
    locid = wazzit.getAlt().getLocation();
    if( locid == -1337 )
    {
        out.write("There has been an error and you seem to be lost in some unknown location.  You're basically screwed.");
        return;
    }
    conn = new InvasionConnection();
    int x = 0;
    int y = 0;
    int boxNum = 0;
    String cloc;
    ResultSet rs = getData();
    if( rs ==null )
    {
        out.write("There has been an error and you seem to be lost in some unknown location.  You're basically screwed.");
    }
    else
    {
        while(rs.next())
        {
            boxNum = x + ( y * 5 );
            cloc = rs.getString("id");
            out.write("   <div class=\"me " + rs.getString("cssname") + "\" style=\"left: " + Integer.toString(x*BOX_SIZE) + "px; top:");
            out.write(Integer.toString(y*BOX_SIZE) + "px;\" onmouseover=\"shloc('" + cloc);
            out.write("')\">");
            /* movement */
            out.write( WebUtils.getMovementClass(boxNum) );
            /* metadata - hidden until mouseover */
            out.write("<div style=\"display:none\" id=\"desc-" + cloc + "\">");
            out.write("<strong>Name:</strong> " + rs.getString("locname"));
            out.write("<br/><strong>Type:</strong> " + rs.getString("typename"));
            out.write("<br/><strong>Location:</strong> " + rs.getString("x") + ", " + rs.getString("y") + " (S" + rs.getString("station") + "L" + rs.getString("level") + ")" );
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
<script type="text/javascript">
    shloc('<%=locid%>');
</script>
</div>


