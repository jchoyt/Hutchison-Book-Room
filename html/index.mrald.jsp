<%@ taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%>
<%@ taglib uri="/WEB-INF/lattice.tld" prefix="lattice"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="org.mitre.mrald.util.Config" %>
<mrald:validate />
<html>
  <head>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
    <meta name="generator" content="HTML Tidy, see www.w3.org" />
    <title>
      <%=Config.getProperty( "TITLE" ) %>
    </title>
    <%=Config.getProperty( "CSS" ) %>
    <link rel="stylesheet" type="text/css" href="./gila-print.css" media="print" />
    <script language="JavaScript" type="text/javascript" src="<%=Config.getProperty( "BaseUrl" ) %>/tree.js"></script>
    <script language="JavaScript">
        <!--
        pic1= new Image();
        pic1.src="<%=Config.getProperty( "BaseUrl" )%>/images/waiting.gif";
        //-->
    </script>
  </head>
  <body>
    <div id="header">
      <h1 class="headerTitle">
        <%=Config.getProperty( "TITLE" ) %>
      </h1>
    </div>
    <div class="subHeader">
    <span class="doNotDisplay">Navigation:</span>
    MRALD - Finding the gems in your data |
    <a href="index.jsp" target="_top">Home</a>
    |
    <a href="http://mitre.org">MITRE</a> | <a href="mailto:mrald-dev-list@lists.mitre.org">Contact Developers</a>
    </div>
    <jsp:include page="header.jsp" />
    <jsp:include page="rightSideBar.jsp" />
    <jsp:include page="leftSideBar.jsp" />
    <!-- side bars -->
    <div id="main-copy">
      <h1 id="introduction" style="border-top: none; padding-top: 0;">Pre-built forms
          <a href="help/index-help.html#forms" target="_blank"><img alt="help" src="images/green-help.jpeg" /></a>
      </h1>
      <mrald:FormsList formType="Public" />
      <br />
      <h1>Special purpose forms
          <a href="help/index-help.html#special" target="_blank"><img alt="help" src="images/green-help.jpeg" /></a>
      </h1>
      <p>
        <a href="directquery.jsp">DirectQuery</a>
<%--         <br />
        <a href="dqUpload.jsp">Upload multiple queries</a> --%>
      </p>
    </div>

    <br>

<!-- End of center column content -->
  </body>
</html>