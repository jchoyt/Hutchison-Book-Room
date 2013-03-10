<%@ page import="org.mitre.mrald.util.*,java.sql.*,java.util.*,java.text.*" %>
<%!
    private static Set<String> list = null;

    private static java.util.Date lastUpdated = null;

    private static SimpleDateFormat f = new SimpleDateFormat( "EEE, d MMM yyyy HH:mm" );

    long ONEDAY = 1000 * 60 * 60 * 24;  //in milliseconds

    private static synchronized void makeKeywordList() throws SQLException
    {
        list = new TreeSet<String>();
        String query = "select distinct keyword from book where keyword is not null";
        MraldConnection mconn = new MraldConnection("db_hutchison.props");
        ResultSet rs = mconn.executeQuery(query);
        while(rs.next())
        {
            String phrase = rs.getString(1);
            if( phrase != null )
            {
                String[] keywords = phrase.split(",");
                for(String word : keywords)
                    list.add( word.trim() );
            }
        }
        mconn.close();
        if( list.size() == 0 )
        {
            list.add("No keywords");
        }
        lastUpdated = new java.util.Date();
    }
%>

<%
    if( lastUpdated == null || ( ( System.currentTimeMillis() - lastUpdated.getTime() ) > ONEDAY) )
    {
        makeKeywordList();
    }
    out.write("<div id=\"newpopup\" class=\"popup\" title=\"Current Keyword list\">");
    for(String word : list)
        out.println( word + "<br/>" );
    out.write("    <br/><br/><em>Last updated: " + f.format( lastUpdated ) + "</em></div>");
%>
