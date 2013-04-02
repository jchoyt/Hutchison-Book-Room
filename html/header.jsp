<%@ page import="org.mitre.mrald.util.*, java.util.*" %><%
    User user = ( User ) pageContext.getSession().getAttribute( Config.getProperty( "cookietag" ) );
    int usertype = user == null ? 1 : user.getTypeId();
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="generator" content="HTML Tidy, see www.w3.org" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- HiFi News | Template created by Dieter Schneider 2006 | www.csstemplateheaven.com -->
        <title>
            Hutchison Elementary School Book Room
        </title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="jquery-ui-1.7.2.custom.css" />
        <script src='js/jquery-1.3.2.min.js' type='text/javascript'></script>
        <script src='js/jquery.hotkeys.min.js' type='text/javascript'></script>
        <script src='js/popups.js' type='text/javascript'></script>
        <script src='js/jquery-ui-1.7.2.custom.min.js' type='text/javascript'></script>

    </head>
    <body>
        <div id="container">
            <div id="header">
                <img src="images/main_graphics.png" style="float:right;z-index: 100;position:absolute;top:0px;right:0px;"/>
                <h1>
                    Hutchison Elementary School Book Room
                </h1>
                <h2>
                    Fairfax County Public School System
                </h2>
            </div>
            <div id="linkbar">
                <div id="navcontainer">
                    <ul id="navlist">
                        <li id="active">
                            <a href="index.jsp" id="current">Home</a>
                        </li>
                        <li>
                            <a href="bookSearch.jsp">Search</a>
                        </li>
                        <li>
                            <a onclick="loadPopup( 'keywordReport.jsp' );return false;" href="">Keywords</a>
                        </li>
                        <%  if (usertype == User.ADMIN_USER )
                        {
                        %>
                        <li>
                            <a href="isbndbSearch0.jsp">Add a New Book</a>
                        </li>
                        <%-- <li>
                            <a onclick="loadPopup( 'addShelfLocPopup.html' );return false;" href="">Add Shelving Location</a>
                        </li> --%>
                        <li>
                            <a onclick="loadPopup( 'saveDb.jsp' );return false;" href="">Backup Database</a>
                        </li>
                        <li>
                            <a href="upload.html">Label Generator</a>
                        </li>
                        <%
                        }
                        %>
                        <li>
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="left">
                <div id="popup"></div>
