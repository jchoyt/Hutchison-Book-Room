<%@ page import="org.mitre.mrald.util.*,java.sql.*" %>
<mrald:validate />
<%@include file='header.html'%>
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
    String query = "SELECT * from book where title  ~* ? or keyword  ~* ? or author  ~* ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString( 1, searchTerm  );
    ps.setString( 2, searchTerm  );
    ps.setString( 3, searchTerm  );
    ResultSet rs = ps.executeQuery();
%>
    <table class="stripeMe">
        <thead style="display:fixed">
            <tr><th>Title</th><th>Author</th><th>Color</th><th>Box Number</th><th>Word Count</th><th>Number of Copies</th>
            <% if(adminUser) out.write( "<th>Edit</th>" ); %>
            </tr>
        </thead>
        <tbody>
<%
    while(rs.next())
    {
        out.write( "<tr><td>" + rs.getString("title") +
                    "</td><td>" + rs.getString("author") +
                    "</td><td>" + rs.getString("color") +
                    "</td><td>" + rs.getString("box") +
                    "</td><td>" + rs.getString("word_count") +
                    "</td><td>" + rs.getString("copy_count")
                    );
        if( adminUser )
        {
            out.write( "</td><td><a href=\"Update.jsp?datasource=db_hutchison.props&tableName=book&id=" + rs.getString("id") +
                    "&SuccessUrl=index.jsp&message=Book successfully updated.\"><span class=\"ui-icon ui-icon-pencil\" style=\"padding:0px;\"></span></a>" +
                    "<a href=\"Delete.jsp?datasource=db_hutchison.props&tableName=book&id=" + rs.getString("id") +
                    "&SuccessUrl=index.jsp&message=Book successfully deleted.\"><span class=\"ui-icon ui-icon-close\" style=\"padding:0px;\"></span></a>");
        }
        out.write("</td></tr>\n");
    }
%>
        </tbody>
    </table>
<br /><br />

<%@include file='footer.html'%>
