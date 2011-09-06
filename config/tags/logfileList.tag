<%@ tag import="java.io.*, java.text.*, java.util.*, org.mitre.mrald.admin.*, org.mitre.mrald.util.*"%>


<%
    DecimalFormat numberFormatter = new DecimalFormat("#,##0.0" );
    SimpleDateFormat dateFormatter = new SimpleDateFormat( "d MMMM yyyy @ H:mm" );
    long now = System.currentTimeMillis();

        File errDir = new File( Config.getProperty( "LOGPATH" ) );
        String[] files = errDir.list( new LogFileFilter() );
        Arrays.sort( files );
        for ( int i = files.length - 1; i > 0; i-- )
        {
            StringBuilder ret = new StringBuilder(  );
            ret.append( " &nbsp; <a href=\"" );
            ret.append( Config.getProperty( "LOGURL" ) );
            ret.append( files[i] );
            ret.append( "\">" );
            ret.append( files[i] );
            ret.append( "</a>" );
            File errFile = new File( Config.getProperty( "LOGPATH" ), files[i] );
            ret.append( " &nbsp; ( " );
            ret.append( dateFormatter.format( new Date( errFile.lastModified()  ) ) );
            ret.append( ", ");
            ret.append(  numberFormatter.format(errFile.length() / 1024.0 ) );
            ret.append( " kb ) &nbsp;" );
            ret.append( Config.NEWLINE );
            ret.append( "<div style=\"border:1px solid black;padding:1em;\" id=\"" + i + "\"><input type=\"button\" value=\"Show Tail\" onclick=\"showLog('" + i + "', '" + files[i] + "');\" /></div>" );
            out.print( ret.toString() );
        }
%>

<%--
 * :mode=jsp:tabSize=4:indentSize=4:noTabs=true:
 * :folding=indent:collapseFolds=0:wrap=none:maxLineLen=80:
--%>

