<%@ page import="org.mitre.mrald.util.*,java.sql.*" %>
<mrald:validate />
<%@include file='header.jsp'%>
<script src="jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".stripeMe tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
        $(".stripeMe tr:even").addClass("alt");
    });
</script>
<%
    User mraldUser = (User)session.getAttribute(Config.getProperty("cookietag"));
    boolean adminUser = mraldUser.getTypeId() == User.ADMIN_USER;

    String searchTerm = WebUtils.getRequiredParameter(request, "term");
    Connection conn = new MraldConnection("db_hutchison.props").getConnection();
    String query = "SELECT title, author, minlevel, maxlevel, c.color, box, word_count, copy_count, b.id, b.sol, keyword, series, g.name as genre, notes from book b join colors c on (b.color = c.id) join genres g on (g.id = b.genre) where title  ~* ? or keyword  ~* ? or author  ~* ? or series ~* ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString( 1, searchTerm  );
    ps.setString( 2, searchTerm  );
    ps.setString( 3, searchTerm  );
    ps.setString( 4, searchTerm  );
    ResultSet rs = ps.executeQuery();
%>

    <table class="stripeMe">
        <thead style="display:fixed">
            <tr><th>Title</th><th>Author/<br>Publisher</th><th>Genre</th><th>Color</th><th>Box #</th><th># of <br>Copies</th><th>GRL</th><th>Word <br>Count</th><th>SOL</th><th>Keywords</th><th>Series</th>
            <% if(adminUser) out.write( "<th>Notes</th><th>&nbsp; Edit &nbsp;</th>" ); %>
            </tr>
        </thead>
        <tbody>
<%
    while(rs.next())
    {
        out.write( "<tr><td>" + rs.getString("title") +
                    "</td><td>" + rs.getString("author") +
                    "</td><td>" + rs.getString("genre") +
                    "</td><td>" + rs.getString("color") +

                    "</td><td>" + rs.getString("box") +
                    "</td><td>" + rs.getString("copy_count"));
        int minL = rs.getInt("minlevel");
        int maxL = rs.getInt("maxlevel");
        if( minL == maxL)
        {
            if( minL == 0 )
            {
                out.write( "</td><td>" );
            }
            else out.write( "</td><td>" + rs.getInt("minlevel"));

        } else {
            out.write( "</td><td>" + rs.getInt("minlevel") + "-" + rs.getInt("maxlevel"));
        }
        out.write("</td><td>" + rs.getString("word_count") +
                    "</td><td>" + rs.getString("sol") +
                    "</td><td>" + rs.getString("keyword") +
                    "</td><td>" + rs.getString("series") );
        if( adminUser )
        {
            out.write( "</td><td>" + rs.getString("notes"));
            out.write( "</td><td><a href=\"Update.jsp?datasource=db_hutchison.props&tableName=book&id=" + rs.getString("id") +
                    "&SuccessUrl=index.jsp&message=Book successfully updated.&fKey1=genre&fKeyTable1=genres&fKeyList1=name&fKeyId1=id&fKeyDataSource1=db_hutchison.props&fKey2=color&fKeyTable2=colors&fKeyList2=color&fKeyId2=id&fKeyDataSource2=db_hutchison.props\">Edit</a>" +
                    "<a href=\"Delete.jsp?datasource=db_hutchison.props&tableName=book&id=" + rs.getString("id") +
                    "&SuccessUrl=index.jsp&message=Book successfully deleted.\">Delete</a>");
                    /*
                    <span class=\"ui-icon ui-icon-pencil\" style=\"padding:0px;\"></span>
                    <span class=\"ui-icon ui-icon-close\" style=\"padding:0px;\"></span>
                    */
        }
        out.write("</td></tr>\n");
    }
%>
        </tbody>
    </table>
<br /><br />

<%@include file='footer.html'%>
