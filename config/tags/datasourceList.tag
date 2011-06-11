<%@ tag import="java.util.*,org.mitre.mrald.util.*,java.util.logging.*" %>
<%
	//System.out.println( "Datasources - DataSourceListTag - populating Meta Data -");

	Logger log = Logger.getLogger("datasourceList.tag");
	log.setLevel(Level.FINEST);
    User user = (User) getJspContext().getAttribute(Config.getProperty("cookietag"), PageContext.SESSION_SCOPE);
    String datasource = WebUtils.getOptionalParameter(request, "datasource", "main" );

    Set<String> datasourceNames = MetaData.getDatasourceNames();
    StringBuilder ret = new StringBuilder(  );
    String displayName;
    for(String name:datasourceNames)
    {
        displayName = WebUtils.getDatasourceDisplayName(name);

        if( displayName.equals("admin") && user.getTypeId() < 3 )
        {
            continue;
        }
        ret.append( "\n<option value=\"" );
        ret.append( name );
        ret.append( "\"" );
        if( name.equals( datasource ) )
        {
            ret.append( " selected=\"true\"" );
        }
        ret.append( ">");
        ret.append( displayName );
        ret.append( "</option>" );
        // ret.append( MetaData.getDbMetaData( name ).toString()  );
        // log.finer( MetaData.getDbMetaData( name ).toString() );

    }
%>

<%=ret.toString()%>


<%--
 * :mode=jsp:tabSize=4:indentSize=4:noTabs=true:
 * :folding=indent:collapseFolds=0:wrap=none:maxLineLen=80:
--%>
