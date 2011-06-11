<%@ tag import="java.util.*,org.mitre.mrald.util.*,java.io.*,java.net.*" %>


      <table border="1" cellspacing="0" cellpadding="5" align="center">
        <tr>
          <th>Start Time</th>
          <th>Datasource</th>
          <th>Query</th>
        </tr>
    <%
        String sizeString = WebUtils.getOptionalParameter(request, "size", "10" );
        Stack<String> stack;
        if( sizeString.equals("all") )
        {
            stack = new Stack<String>();
        }
        else
        {
            int size = Integer.parseInt(sizeString);
            stack = new LimitedStack<String>(size);
        }

        String username="";
        Cookie[] cookies = request.getCookies();
        for ( int i = 0; i < cookies.length; i++)
        {
            String name = cookies[i].getName();
            if ( name.equalsIgnoreCase( Config.getProperty("cookietag") ) )
            {
                username = cookies[i].getValue();
            }
        }
        File logfile = new File( Config.getProperty( "LOGPATH" ), Config.getProperty( "DBLOGFILE") );
        if(!logfile.exists())
        {
          out.write("<tr><td colspan=\"2\">");
          out.write("No user queries have been logged yet.");
          out.write("</td></tr>");
        }
        else
        {
            BufferedReader br = new BufferedReader(new FileReader( logfile ) );
            String line, url;
            String startString="User: " + username;
            int queryEnd;
            /* populate the stack */
            while ((line = br.readLine()) != null)
            {
                try
               {
                  if (line.startsWith(startString))
                  {
                     queryEnd = line.indexOf( "Execute time:" ) ;
                     while(queryEnd<0)
                     {
                         line=line+br.readLine();
                         queryEnd = line.indexOf( "Execute time:" ) ;
                     }
                     stack.push(line);
                  }
               }
               catch (Exception e)
               {
                   out.write("<!--exception:"  +  Config.NEWLINE);
                   out.write( e.getMessage() );
                   out.write("-->" +  Config.NEWLINE);
               }
            }
            /* write out the stack */
            if( stack.empty() )
            {
                out.write("<tr><td colspan=\"2\">");
                out.write("No user queries have been logged yet.");
                out.write("</td></tr>");
            }
            else
            {
                while (!stack.empty())
                {
                    line = stack.pop();
                    /* write out the date */
                    out.write("<tr><td>");
                    out.write(line.substring(username.length() + 19, username.length()+48));
                    out.write("</td><td>");
                    /* get the datasource */
                    String datasource = line.substring( line.indexOf( "Datasource: " ) + 12, line.indexOf( "Query: " ) - 2 );
                    String displayName = WebUtils.getDatasourceDisplayName( datasource );
                    url = "directquery.jsp?datasource=" + datasource;
                    out.write( displayName + "</td><td>" );
                     /* get the query */
                    queryEnd = line.indexOf( "Execute time:" ) ;
                    String query = line.substring( line.indexOf( "Query:" ) + 7, queryEnd );
                    url = url + "&query=" + URLEncoder.encode( query, "UTF-8" );
                    out.write( "Query: &nbsp; <a href=\""+ url + "\">" );
                    out.write( query );
                    out.write( "</a>" );
                    out.write( line.substring( line.indexOf( "Execute time:" ) ) );
                    out.write( "</td></tr>" );
                }
            }
        }
        %>
      </table>

<%--
 * :mode=jsp:tabSize=4:indentSize=4:noTabs=true:
 * :folding=indent:collapseFolds=0:wrap=none:maxLineLen=80:
--%>

