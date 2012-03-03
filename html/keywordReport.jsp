<%@ page import="org.mitre.mrald.util.*,java.sql.*,java.util.*" %><%
    Set<String> list = new TreeSet<String>();
    response.setContentType( "text/csv" );
    response.setHeader( "Content-Disposition", "attachment; filename=BookRoomKeywords.csv;" );

    String query = "select keyword from book";
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
        out.println("No keywords");
    }
    for(String word : list)
        out.println( word );
%>
