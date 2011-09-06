<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="org.mitre.mrald.util.*" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<mrald:validate doAdminCheck="yes" />
<html>
  <head>
  <script language="JavaScript" type="text/javascript" >
    var passedid;
    var passedfile;
    function showLog(id ,file) {
        var url = '../tailLogFile.jsp?file=' + file;
        passedid = id;
        passedfile = file;
        if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
        req.onreadystatechange = processRequest;
        try
        {
            req.open("GET", url, true);
            req.send(null);
        }
        catch(E)
        {
            alert("Couldn't perform check" + E);
        }
    }

    function processRequest() {
        if (req.readyState == 4) {
            if(req.status == 200)
            {
              parseMessages();
            }
        }
    }

    function parseMessages() {
        //alert(req.responseText);
        sampleResponse = req.responseText;
        obj = document.getElementById(passedid);
        obj.innerHTML = "<input type=\"button\" value=\"Hide Tail\" onclick=\"hideLog('" + passedid + "', '" + passedfile + "');\" /><br/>" + sampleResponse;
    }

    function hideLog(id, file) {
        obj = document.getElementById(passedid);
        obj.innerHTML = "<input type=\"button\" value=\"Show Tail\" onclick=\"showLog('" + id + "', '" + file + "');\" />";
    }

  </script>
    <meta name="generator" content="HTML Tidy, see www.w3.org">
    <title>
      Admin log utilities
    </title>
    <%=Config.getProperty( "CSS" ) %>
  </head>
  <body>
    <div class="floating-text" style="width:1000px;margin:auto;margin-top:5em;">
      <h1 id="introduction" style="border-top: none; padding-top: 0;">Log file utilities</a></h1>
        <!--add a link to rotate the log files -->
        <a href="../AdminControl.jsp?action=rotateLogs">Rotate log files</a>
        <br />
        <!--link to manage err files -->
        <a href="../errList.jsp">Manage err files</a>
      <h1>Log Files (click to view)</h1>
      <!-- link to all log files -->
      <tags:logfileList/>
    </div>

    <br>

<!-- End of center column content -->
  </body>
</html>


