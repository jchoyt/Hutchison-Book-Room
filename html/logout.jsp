<!DOCTYPE html PUBLIC "-//IETF//DTD HTML 2.0//EN">
<%-- This jsp clears the cookie to the client machine containing their username --%>

<%@ page import="org.mitre.mrald.util.User, org.mitre.mrald.util.Config"%>
<%
     /*
      *  set the cookie on the client browser
      */
     Cookie c = new Cookie( Config.getProperty( "cookietag" ), null );
     c.setMaxAge(0);
     response.addCookie( c );
     /*
      *  trash the User object in the session
      */
     User user = ( User ) pageContext.getAttribute( Config.getProperty( "cookietag" ), pageContext.SESSION_SCOPE );
     System.out.println(user);
     pageContext.removeAttribute( Config.getProperty( "cookietag" ) );
     user = ( User ) pageContext.getAttribute( Config.getProperty( "cookietag" ), pageContext.SESSION_SCOPE );
     System.out.println(user);
     /*
      *  redirect the user to the index page\
      */
     response.sendRedirect( Config.getProperty("URL" ) );
%>

