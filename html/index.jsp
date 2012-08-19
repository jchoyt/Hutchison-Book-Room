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
                    <h3>Top Navigation Bar Content</h3>
                    <p>This describes the purpose of the links across the top navigation bar.  These links will open up a new page.
                    <p><b><i>Home</i></b> - This link brings you back to this page.</p>
                    <p><b><i>Search</i></b> - This link takes you to a page used to search for books.  This is a very flexible search page which will allow you to search for books most any way you would like to.  If you are an administrator on this system, you can also update books here.  Any information, including summaries, book counts, shelving locations, etc. can be modified.  </p>
                    <p><b><i>Add a New Book</i></b> - This provides a form used to insert new books into the database.  The system is connected to a web-based database of books so you can retrieve most information about the book automatically from it's ISBN.</p>
                </div>
                <div id="sub_right">
                    <h3>Side "Quick Click" Links</h3>
                    <p>Descriptions of the quick links to the right.  These links (except for the logout) will open a small window over top of the current window.  This provides quick access to powerful functionality.</p>
                    <p><b><i>Global Search</i></b> - Enter a single word and the entire database will be searched for all instances of this word.  The search is case insensitive.</p>
                    <p><b><i>Backup Database</i></b> - This provides a text file which represents all data in the database.  This can be downloaded for safe-keeping.  Give it a minute to prepare the download.</p>
                    <p><b><i>Logout</i></b> - Logs out the current user and returns you to the login page.</p>
                </div>
<%@include file='footer.html'%>
<%-- :wrap=soft:noTabs=true:maxLineLen=200:indentSize=4:folding=indent: --%>
