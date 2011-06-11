<%@ page import="florisfood.util.*, java.util.logging.*" %><%
System.out.println( "here" );
String KEY = "registrationProcess.jsp";
Logger log = Logger.getLogger( KEY );
// log.setLevel(Level.FINER);

log.entering( KEY, "body");

String loginResult = null;
try {
    loginResult = Login.registerPlayer( request );
    log.finer( loginResult );
}
catch ( NullPointerException e) {
    loginResult = e.getMessage();
    log.throwing( KEY, "body", e );
}
if( loginResult.equals( Login.LOGIN_OK ))
{
    response.sendRedirect( "map/index.jsp" );
    return;
}
%>
<jsp:forward page="login.jsp" >
    <jsp:param name="message" value="<%=loginResult%>" />
</jsp:forward>
