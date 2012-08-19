<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@ page import="java.io.*, org.mitre.mrald.util.*, java.util.logging.*"
%><%@ page isErrorPage="true"%><html>
<%@include file='header.jsp'%>
      <center>
        <div class="floating-text" style="width:600px;">
        <p><b>404 error.</b>  Sorry, the page that you've requested just isn't here. If you were trying to follow a link, please recheck the address above and if it looks OK,  let the <a href="mailto:<%=Config.getProperty( "MAILTO" )%>">administrator</a> know.</p>
        <p>If you followed a link, use the browser back button to go back to the page you just came from.  To go to the main page, use the link above.</p>
        </div>
      </center>
<%@include file='footer.html'%>
