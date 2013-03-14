<%@ taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%>
<%@ page import="org.mitre.mrald.util.*,java.io.*,java.net.*" %>
<%@ page import="java.util.*,org.xml.sax.*,org.xml.sax.helpers.*" %>
<%

String command = "/usr/bin/pg_dump hutchison";
MraldOutFile.appendToFile( "Executing: " + command );
Runtime runtime = Runtime.getRuntime();
Process proc = runtime.exec( command );
            // put a BufferedReader on the ls output

            InputStream inputstream = proc.getInputStream();
            InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
            BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
            // check for ls failure
            // read the ls output
            final String file = "hutchison.sql";
            File sqlFile = new File(Config.getProperty("LOGPATH"), file);
            sqlFile.delete();
            String line;
            while ((line = bufferedreader.readLine()) != null) {
                MraldOutFile.appendToFile( file, line );
            }
try {
    if (proc.waitFor() != 0) {
        MraldOutFile.appendToFile( "exit value = " + proc.exitValue());
        throw new JspException("An error occurred running the backup command.  Tell your sysadmin to check the log files");
    }
}
catch (InterruptedException e) {
    MraldOutFile.logToFile( e );
    throw new JspException( e );
}
%>

<div id="newpopup" class="popup" title="Download Database Script">
    <h3>The database has been exported - click <a href="logs/hutchison.sql" target="_blank">here</a> to download it.  The file will open in a new window.</h3>
</div>
