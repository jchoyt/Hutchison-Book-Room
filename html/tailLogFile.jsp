<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.util.*,java.io.*,org.mitre.mrald.util.*" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    String logDir = Config.getProperty( "LOGPATH" );
    String filename = WebUtils.getRequiredParameter( request, "file" );
    int bytesPerLineWAG = 100;
    String size = WebUtils.getOptionalParameter(request, "size", "50" );
    int lines = Integer.parseInt( size );
    List <String> queue = new ArrayList <String> ();
    File file = new File( logDir, filename );
    if( !file.exists() )
    {
        out.print( filename + " does not exist" );
    }
    else
    {
        long fileLength = file.length();
        long bytesToRead = lines * bytesPerLineWAG;
        FileReader filereader = new FileReader(file);
        BufferedReader buffreader = new BufferedReader(filereader);
        if(fileLength > bytesToRead)
        {
            //skip
            buffreader.skip( fileLength - bytesToRead );
        }
        String line = buffreader.readLine();
        /* throw first (likely partial) line away, put the rest in the queue */
        while( (line = buffreader.readLine()) != null)
        {
            queue.add( line );
        }
        /* print out the specified number of lines from the end of the queue */
        int queueSize = queue.size();
        int start = 0;
        if(queueSize > lines)
        {
            start = queueSize - lines;
        }
        for( int i = start; i < queueSize; i++ )
        {
            out.print( queue.get(i) );
            out.print( "<br/>" );
        }
    }
%>
