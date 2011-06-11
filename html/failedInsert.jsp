<%--
 :mode=jsp:tabSize=2:indentSize=2:noTabs=true:
 :folding=indent:collapseFolds=0:wrap=soft:maxLineLen=80:
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import="org.mitre.mrald.util.Config" %>
<%@ taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%>
<html>
  <head>
    <meta name="generator" content="HTML Tidy, see www.w3.org">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <title>
      MRALD Error Files
    </title>
      <%=Config.getProperty( "CSS" ) %>
   </head>
  <body>
      <div id="header">
      <h1 class="headerTitle">
        <%=Config.getProperty( "TITLE" ) %>
      </h1>
    </div>
   <script language="JavaScript1.2" type="text/javascript" src="<%=Config.getProperty( "BaseUrl" ) %>/navi.js"></script>
  <br></br>
  <br></br>
  <br></br>
  <br></br>
  <CENTER>
      <table summary="" width="650" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="bord">
            <table summary="" width="100%" border="0" cellspacing="1" cellpadding="2">
              <tr>
                <th>Insert Failure</th></tr>
           <tr><td style="padding:1em" align="center">
           Failure during row creation.  You can use the browser back button to try again, report the error to the <a href="mailto:<%=Config.getProperty("MAILTO")%>?subject=Problem at <%=Config.getProperty("BaseUrl")%>">administrator</a>, or go back to the <a href="index.html">main page</a> and do something different.
             </td></tr></table></td></tr></table>
        </CENTER>
  </body>
</html>


