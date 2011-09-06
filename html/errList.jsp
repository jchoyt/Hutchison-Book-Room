<%@ page import="org.mitre.mrald.util.Config" %>
<%@ taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%>
<html>
  <head>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
    <title><%=Config.getProperty( "TITLE" ) %>- Error Files</title>
    <%=Config.getProperty( "CSS" ) %>
  </head>
  <body>
    <div id="header">
      <h1 class="headerTitle">Error File Manager</h1>
    </div>
    <form action="AdminControl.jsp?action=deleteErrFiles" method="POST">
      <center>
        <div class="floating-text">Below is a list of all the error files MRALD has dumped. The files are listed in order by date, starting with the newest files.
        <br />
        <br />
        To view the contents of a file, click on the link. To delete a file or set of files, check the Delete checkbox and use the Submit button below: any checked files will be deleted and you will be returned to the home page.
        <i>Note that files older than one week are automatically checked for deletion.</i>
        <hr width="75%" />
        <center>
          <mrald:errFileList />
          <br />
          <input type="SUBMIT" name="Submit" value="Submit" />
          <input type="RESET" value="Reset Form" />
        </center>
        </div>
      </center>
    </form>
  </body>
</html>
