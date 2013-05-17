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
    Connection conn = new MraldConnection("db_preschool.props").getConnection();
    String query = "SELECT * from book where title  ~* ? or keywords  ~* ? or summary  ~* ? or author  ~* ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString( 1, searchTerm  );
    ps.setString( 2, searchTerm  );
    ps.setString( 3, searchTerm  );
    ps.setString( 4, searchTerm  );
    ResultSet rs = ps.executeQuery();
%>
    <table class="stripeMe">
        <thead style="display:fixed">
            <tr><th>Title</th><th>Author</th><th>Keywords</th><th>Summary</th><th>Shelving Location</th><th>Number of Copies</th>
            <% if(adminUser) out.write( "<th>Edit</th>" ); %>
            </tr>
        </thead>
        <tbody>
<%
    while(rs.next())
    {
        out.write( "<tr><td>" + rs.getString("title") +
                    "</td><td>" + rs.getString("author") +
                    "</td><td>" + rs.getString("keywords") +
                    "</td><td>" + rs.getString("summary") +
                    "</td><td>" + rs.getString("shelved") +
                    "</td><td>" + rs.getString("count"));
        if( adminUser )
        {
            out.write( "</td><td><a href=\"Update.jsp?datasource=db_preschool.props&tableName=book&isbn=" + rs.getString("isbn") +
                    "&SuccessUrl=index.jsp&message=Book successfully updated.\"><span class=\"ui-icon ui-icon-pencil\" style=\"padding:0px;\"></span></a>" +
                    "<a href=\"Delete.jsp?datasource=db_preschool.props&tableName=book&isbn=" + rs.getString("isbn") +
                    "&SuccessUrl=index.jsp&message=Book successfully deleted.\"><span class=\"ui-icon ui-icon-close\" style=\"padding:0px;\"></span></a>");
        }
        out.write("</td></tr>\n");
    }
%>
        </tbody>
    </table>
<br /><br />

<%@include file='footer.html'%>
