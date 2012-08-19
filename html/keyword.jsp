<%@ page import="org.mitre.mrald.util.*,java.sql.*" %>
<mrald:validate />
<%@include file='header.jsp'%>
<%
    String searchTerm = WebUtils.getRequiredParameter(request, "term");
%>
<div class="floating-text">
    <h1 >Keyword Search</h1>

</div>
<%
    Connection conn = new MraldConnection("db_preschool.props").getConnection();
    String query = "SELECT * from book where title  ~* ? or keywords  ~* ? or summary  ~* ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString( 1, searchTerm  );
    ps.setString( 2, searchTerm  );
    ps.setString( 3, searchTerm  );
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
        out.write( rs.getString("title") + "<br/>");
    }
%>
<br /><br />

<%@include file='footer.html'%>
