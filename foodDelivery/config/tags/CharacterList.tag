<%@ tag import="java.util.*, invasion.dataobjects.*, invasion.util.*, java.sql.*" %><table border="0" cellpadding="2" cellspacing="0" width="700px">
        <thead>
            <tr><th>Name</th><th>Station</th><th>Level</th><th>AP</th><th>IP</th><th>HP</th><th>Location</th><th>Action</th></tr>
        </thead>
        <tbody>
<%
    String player = request.getRemoteUser();

    String query = "select a.id, a.name as alt, a.level, ap || '/' || apmax as apset, ip, hp || '/' || hpmax as hpset, s.name as sname, 'L' || l.level || ' (' || x || ',' || y || ')' as loc, ticksalive from alt a join location l on (a.location=l.id) join station s on (s.id=l.station) where username=? order by a.name";
    InvasionConnection conn = new InvasionConnection();
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1,player);
    ResultSet rs = ps.executeQuery();
    int slotsUsed = 0;
    while(rs.next())
    {
        String id = rs.getString("id");
        out.write( "<tr><td>");
        out.write( "<a href=\"/viewCharacter.jsp?id=" + id + "\">" + rs.getString( "alt" ) + "</a>");
        String sname = rs.getString( "sname" );
        out.write( "</td><td>");
        out.write( sname );
        out.write( "</td><td>");
        out.write( rs.getString( "level" ) );
        out.write( "</td><td>");
        out.write( rs.getString( "apset" ) );
        out.write( "</td><td>");
        out.write( rs.getString( "ip" ) );
        out.write( "</td><td>");
        out.write( rs.getString( "hpset" ));
        int ticksalive = rs.getInt("ticksalive");
        if( sname.equals("Dead") )
        {
            out.write( "</td><td colspan=\"2\">Dead</td>");
        }
        else if( ticksalive < 0 )
        {
            out.write( "</td><td>");
            out.write( rs.getString("loc"));
            out.write( "</td><td>Clone Growing (" + (-1 * ticksalive) + " ticks)");
        }
        else if( ticksalive == 0 )
        {
            out.write( "</td><td>");
            out.write( rs.getString("loc"));
            out.write( "</td><td><a class=\"link_button\" href=\"respawn.jsp?id="+ id +"\">Respawn</a>");
        }
        else
        {
            out.write( "</td><td>");
            out.write( rs.getString("loc"));
            out.write( "</td><td><a class=\"link_button\" href=\"connect.jsp?id="+ id +"\">Connect</a>");
        }
        out.write( "</td></tr>\n" );
        slotsUsed++;
    }
    DatabaseUtility.close(rs);
    DatabaseUtility.close(ps);
    conn.close();
%></tbody>
    </table>



