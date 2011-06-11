/*
 * Taken wholesale from "Best Practices for JDBC Programming - Improving maintainability and code quality"
 * By Derek Ashmore - http://java.sys-con.com/node/46653
 * With implied permission and modified to suit by Jeffrey Hoyt.
 */
package florisfood.util;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
import java.util.*;

public class DatabaseUtility {

    public final static String KEY = DatabaseUtility.class.getName();
    public final static Logger log = Logger.getLogger( KEY );
    // static{log.setLevel(Level.FINER);}


    public static void close(PreparedStatement pStmt) {
        log.entering(KEY, "close PreparedStatement");
        if (pStmt == null) {
            return;
        }
        try { pStmt.close(); } catch (SQLException e) {
            log.log(Level.WARNING,"Prepared statement close error",e);

        }
    }

    public static void close(Statement stmt) {
        log.entering(KEY, "close Statement");
        if (stmt == null) {
            return;
        }

        try { stmt.close(); } catch (SQLException e) {
            log.log(Level.WARNING,"Statement close error", e);
        }
    }

    public static void close(ResultSet rs) {
        log.entering(KEY, "close ResultSet");
        if (rs == null) {
            return;
        }

        try { rs.close(); } catch (SQLException e) {
            log.log(Level.WARNING,"ResultSet close error", e);
        }
    }

    public static void close(Connection conn) {
        log.entering(KEY, "close Connection");
        if (conn == null) {
            return;
        }

        try { conn.close(); } catch (SQLException e) {
            log.log(Level.WARNING,"Connecion close error", e);
        }
    }

    public static void close(Object dbObj) {
        if (dbObj == null) {
            return;
        }

        if (dbObj instanceof PreparedStatement) {
            close((PreparedStatement) dbObj);
        } else{
            if (dbObj instanceof Statement) {
                close((Statement) dbObj);
            } else{
                if (dbObj instanceof ResultSet) {
                    close((ResultSet) dbObj);
                } else{
                    if (dbObj instanceof CallableStatement) {
                        close( (CallableStatement) dbObj);
                    } else{
                        if (dbObj instanceof Connection) {
                            close((Connection) dbObj);
                        } else {
                            throw new IllegalArgumentException( "Close attempted on unrecognized Object!");
                        }
                    }
                }
            }
        }
    }

    public static void genericTable(ResultSet rs, Writer out)
    throws Exception
    {
        out.write("<table border=\"0\" cellpadding=\"0\"><thead><tr>");
        ResultSetMetaData rsmd = rs.getMetaData();
        int numberOfColumns = rsmd.getColumnCount();
        for ( int p = 0; p < numberOfColumns; p++ )
        {
        	out.write("<th>" + rsmd.getColumnName( p+1 ) + "</th>" );
        }
        out.write( "</tr></thead><tbody>" );
        /*
         *  Iterate through the ResultSet and extract the rows
         */
        boolean even=false;
        String formattedString;
        while ( rs.next() )
        {
            if( even )
            {
                out.write( "<tr class=\"selected\">" );
            }
            else out.write( "<tr>" );
            even = !even;
            for ( int i = 0; i < numberOfColumns; i++ )
            {
                out.write( "<td>" + rs.getString( i + 1 ) + "</td>" );
            }
            out.write( "</tr>\n" );
        }
        out.write("</tbody></table>\n");
    }
}


