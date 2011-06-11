
<%@ taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%>
<%@ page import="org.mitre.mrald.util.*" %>
<mrald:validate />
<html>
<head>
  <%=Config.getProperty( "CSS" ) %>

  <title>MRALD Keyword Search</title>
 </head>
 <body>
<div id="header">
      <h1 class="headerTitle">
        <%=Config.getProperty( "TITLE" ) %> Keyword Search
      </h1>
    </div>
    <div class="subHeader">
    <span class="doNotDisplay">Navigation:</span>
    MRALD - Finding the gems in your data |
    <a href="index.jsp" target="_top">Home</a>
    |
    <a href="http://mitre.org">MITRE</a> | <a href="mailto:mrald-dev-list@lists.mitre.org">Contact Developers</a>
    </div>
<%
    response.setContentType( "text/html" );
    response.setHeader( "Content-Disposition", "inline;" );
    String searchTerm = WebUtils.getRequiredParameter(request, "term");
    String lineLimitStr = WebUtils.getOptionalParameter(request, "lineLimit");
    String sizeLimitStr = WebUtils.getOptionalParameter(request, "sizeLimit");
    String datasource = WebUtils.getRequiredParameter(request, "Datasource");

     String[] searchParams = {searchTerm};

    %>
<div class="floating-text">
    <h1 >Keyword Search</h1>
      <p>List of all tables that contain the term <b><%= searchParams[0].toString()%></b></p>
      <p></p>
    </div>
<center>
<%
    LatticeHtmlKeywordSearch keywd = new LatticeHtmlKeywordSearch();
    keywd.setLineLimit(lineLimitStr);
    keywd.setSizeLimit(sizeLimitStr);
    keywd.setDatasource( datasource );
    User user =  (User)pageContext.getSession().getAttribute( Config.getProperty( "cookietag" ) );
    keywd.setUser(user);
    keywd.search(searchParams, out);
    out.write("\n");
    out.close();
%>
<br /><br />
</center>
&nbsp;
      </body>
 </html>
