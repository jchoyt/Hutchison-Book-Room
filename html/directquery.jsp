<%@ page import="org.mitre.mrald.util.Config" %><%@
taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%><%@
taglib prefix="tags" tagdir="/WEB-INF/tags" %><%
  String query = request.getParameter( "query" );
  if ( query == null || query.equals( "null" ) )
    query = "select ";
%>
<mrald:validate doAdminCheck="yes" />
<%@include file='header.jsp'%>
    <script type="text/javascript" language="Javascript1.2" >
        function setProcessing()
        {
            document.getElementById("notify").innerHTML='<div class="processing"><p class="processingTitle">Processing your query ...</p><img src="images/waiting.gif"/></div>';
        }

        var http = getHTTPObject();
        var isBusy = false;

        function getQueries() {
            try
            {
                if (isBusy)
                {
                    http.onreadystatechange = function () {}
                    http.abort();
                }
                http.open("GET", "ShortQueryHistory.jsp", true);
                isBusy = true;
                http.onreadystatechange = useHttpResponse;
                if ( !callInProgress(http) ) {
                    http.send(null);
                } else {
                    alert("I'm busy. Wait a moment");
                }
            }
            catch(e)
            {
                alert("error: " + e);
            }
        }

        function useHttpResponse() {
            if (http.readyState != 4) return;
            isBusy = false;
            if (http.readyState == 4) {
                var ldiv = document.getElementById("popUp");
                var textout = http.responseText;
                ldiv.innerHTML = textout;
             }
        }

        function getHTTPObject()
        {
            var xmlhttp;
            try
            {
               var browser = navigator.appName;
               /* alert("browser" + browser); */
               if(browser == "Microsoft Internet Explorer")
               {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                else
                {
                    xmlhttp = new XMLHttpRequest();
                }
             }
             catch(E)
             {
                 alert("not found" + E);
             }
             return xmlhttp;
        }

        function callInProgress(http) {
            switch ( http.readyState )
            {
                case 1, 2, 3:
                return true;
                break;
                // Case 4 and 0
                default:
                return false;
                break;
            }
        }
    </script>
        <div id="header">
            <h1 class="headerTitle">DirectQuery Data Retrieval Form</h1>
        </div>
        <form method="POST" name="form" action="FormSubmit" enctype="x-www-form-urlencoded">
            <div id="outer" style="float:left">
                <p class="sideBarTitle" style="margin-top:0;">Include in Results
                <a href="UserGuide/UserGuide.html#UseStep5" target="_blank">
                    <img alt="help" src="images/green-help.jpeg" />
                </a>
                </p>
                <p class="sideBarText">
                <input value="true" name="showQuery" type="checkbox" checked="checked" />
                The query
                <br /></p>
                <p class="sideBarTitle">Output size limit</p>
                <p class="sideBarText">
                <input type="radio" value="none" name="outputSize" />
                None
                <br />
                <input type="radio" value="lines" name="outputSize" checked="checked" />
                <input name="outputLinesCount" type="text" size="6" value="500" />
                Lines
                <br />
                <input type="radio" value="mb" name="outputSize" />
                <input name="outputMBSize" type="text" size="5" value="1" />
                MB</p>
                <p class="sideBarTitle">Format</p>
                <p class="sideBarText">
                <strong>Browser</strong>
                <br />
                <input type="radio" name="Format" value="browserHtml" checked="checked" />
                HTML
                <br />
                <input type="radio" name="Format" value="browserLinks" />
                HTML with Links
                <br />
                <input type="radio" name="Format" value="browserCsv" />
                CSV (
                <input name="browserFormatDelimiter" type="text" value="," size="2" />
                )
                <br />
                <input type="radio" name="Format" value="browserText" />
                Text (tab delimited)
                <br />
                <input type="radio" name="Format" value="XmlRaw" />
                XML
				 <br />
        		<input type="radio" name="Format" value="MITRE_PA" />
        		Pathalizer
                <br/>
                <strong>File</strong>
                <br />
                <input type="radio" name="Format" value="fileCsv" />
                CSV (
                <input name="fileFormatDelimiter" type="text" value="," size="2" />
                )
                <br />
                <input type="radio" name="Format" value="fileText" />
                Text (tab delimited)</p>
                <p class="sideBarText">
                <input type="radio" name="Format" value="excel" />
                Excel</p>
            </div>
            <center>
                <div class="floating-text" style="width:750px;text-align:center;">
                <input type="hidden" name="form" value="directquery" />
                <input type="hidden" name="workflow" value="Direct SQL" />
                <%-- <h1 style="border-top:none;">SQL query</h1> --%>
                <strong>Target database:</strong>
                <select name="Datasource">
                    <tags:datasourceList />
                </select>
                <br />
                <textarea name="query" rows="11" cols="80" wrap="soft"><%=query %></textarea>
                <br />
                Use any valid SELECT statement for the target database
                <br />
                <br />
                <center id="notify" ><span /></center>
                <input value="Retrieve Data" type="submit"  onclick="setProcessing();return true;"/>
                <br />
                <br />
                <a onclick="getQueries();">Show me my last 10 queries</a>
                <span id="popUp"><input type="hidden" name="dummy"/></span>
                </div>
            </center>
        </form>
<%@include file='footer.html'%>

