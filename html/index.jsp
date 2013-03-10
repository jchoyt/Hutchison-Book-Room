<%@ taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="org.mitre.mrald.util.*" %>

<mrald:validate />
<%@include file='header.jsp'%>
<%
    String message = WebUtils.getOptionalParameter( request, "message", null ); //defaults to "none"
    if( message != null )
    {
        %>
        <div class="popup"><h3><%=message%></h3></div>
        <%
    }
%>
                <div id="sub_left">
                    <h3>Quick Search</h3>
                    Use the box below to enter a single word and the entire database will be searched for all instances of this word.  The search is case insensitive.<br/>
                    .<br/>
                    <center>
                    <form method="POST" action="global.jsp" id="global" enctype="x-www-form-urlencoded">
                        <input type="text" name="term" id="searchterm"/>
                        <input type="submit" value="Find Books"/>
                    </form>
                    </center>
                </div>
                <div id="sub_right">
                    <h3>Navigation Bar Content</h3>
                    <p><b><i>Home</i></b> - Brings you back to this page.</p>
                    <p><b><i>Search</i></b> - Loads a book search page.  This is a very flexible search page which will allow you to search for books most any way you would like to.</p>
                    <p><b><i>Keywords</i></b> - A list of the current keywords.  Updated daily.
                    <%  if (usertype == User.ADMIN_USER )
                    {
                    %>
                    <p><b><i>Add a New Book</i></b> - Used to insert new books into the database.</p>
                    <p><b><i>Backup Database</i></b> - A text file which represents all data in the database.  This can be downloaded for safe-keeping.  Give it a minute to prepare the download.  Right click on the new link and choose "Save As..."</p>
                    <%
                    }
                    %>
                    <p><b><i>Logout</i></b> - Logs out the current user and returns to the login page.</p>
                    <br/>
<%@include file='footer.html'%>
<%-- :wrap=soft:noTabs=true:maxLineLen=200:indentSize=4:folding=indent: --%>
