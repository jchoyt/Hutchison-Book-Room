<%@ page import="florisfood.ui.*,org.json.*,florisfood.util.*,java.sql.*,java.util.logging.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><%!
    public final static String KEY = "/modAccountProcess.jsp";
    public final static Logger log = Logger.getLogger( KEY );
    static{log.setLevel(Level.FINER);}%><%

    String query = "update deliverers set email=?, mon=?, tue=?, wed=?, thu=?, fri=?, phone=?, embry=? where userid=?";
    InvasionConnection conn = null;
    try
    {
        conn = new InvasionConnection();
        int count = conn.psExecuteUpdate(query, "Error message",
            WebUtils.getRequiredParameter( request, "email" ),
            Boolean.parseBoolean( WebUtils.getOptionalParameter(request, "mon", "false" ) ),
            Boolean.parseBoolean( WebUtils.getOptionalParameter(request, "tue", "false" ) ),
            Boolean.parseBoolean( WebUtils.getOptionalParameter(request, "wed", "false" ) ),
            Boolean.parseBoolean( WebUtils.getOptionalParameter(request, "thu", "false" ) ),
            Boolean.parseBoolean( WebUtils .getOptionalParameter(request, "fri", "false" ) ),
            WebUtils.getRequiredParameter( request, "phone" ),
            Boolean.parseBoolean( WebUtils.getOptionalParameter(request, "embry", "false" ) ),
            request.getRemoteUser()
        );
        if ( count != 1 ) log.warning( count + " entries updated instead of just one.  Database is likely hosed." );
    }
    catch(SQLException e)
    {
        log.throwing( KEY, "a useful message", e);
        throw new RuntimeException(e);
    }
    finally
    {
        conn.close();
    }

    response.sendRedirect( "modAccount.jsp" );
%>
