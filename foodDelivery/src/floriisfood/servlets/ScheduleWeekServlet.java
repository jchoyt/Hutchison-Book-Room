/*
 *  Copyright 2010 Jeffrey Hoyt.  All rights reserved.
 */

package florisfood.servlets;

import javax.servlet.ServletOutputStream ;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import florisfood.util.*;

/**
 * Schedules out a week of Hutchison and Embry food deliveries
 *
 *@author     Jeffrey Hoyt
 *@version    1.0
 *@see        javax.servlet.http
 */

public class ScheduleWeekServlet extends HttpServlet
{

    public final static String KEY = ScheduleWeekServlet.class.getName();
    public final static Logger log = Logger.getLogger( KEY );
    static{log.setLevel(Level.FINER);}

    protected String[] dowQuery = {
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.sun=true and destination='Embry' group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Embry');",
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.mon=true group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Hutchison');",
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.tue=true group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Hutchison');",
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.wed=true group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Hutchison');",
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.thu=true group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Hutchison');",
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.fri=true group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Hutchison');",
        "insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.sat=true and destination='Embry' group by who order by max(dday) limit 1), (select max(dday) + interval '1 day' from schedule limit 1), 'Embry');"
    };



    /**
     *  Constructor for the PqmServlet object
     *
     *@since
     */
    public ScheduleWeekServlet()
    {
        super();
    }


    /**
     *  Description of the Method
     *
     *@param  config                Description of the Parameter
     *@exception  ServletException  Description of the Exception
     */
    public void init( ServletConfig config )
        throws ServletException
    {
        /*
         *  required for all Servlets
         */
        super.init( config );
    }

    /**
     *  Schedules out a full week (Sunday through Saturday)
     *
     *@param  req                   Description of the Parameter
     *@param  resp                  Description of the Parameter
     *@exception  ServletException  Description of the Exception
     *@exception  IOException       Description of the Exception
     */
    public void doPost( HttpServletRequest req, HttpServletResponse resp )
    {
        log.finer("dowQuery length is " + dowQuery.length );
        InvasionConnection conn = null;
        try
        {
            conn = new InvasionConnection();
            conn.setAutoCommit(false);
            ServletOutputStream out = resp.getOutputStream();
            for(int i = 0; i < 7; i++)
            {
                if( !checkHoliday( conn, out ) )
                {
                    int c = conn.executeUpdate( dowQuery[i] );
                    if( c != 1 )
                    {
                        out.println("Error scheduling a new day - all oerations aborted.");
                        throw new RuntimeException("Failed to insert holiday.");
                    }
                    else
                        out.println("next day scheduled.");
                }
            }
            conn.commit();
        }
        catch(Exception e)
        {
            log.throwing( KEY, "a useful message", e);
            throw new RuntimeException(e);
        }
        finally
        {
            conn.close();
        }

    }

    /**
     * If it's a holiday, insert "No School" otherwise, return false;
     * @param
     * @return
     *
     */
    protected boolean checkHoliday( InvasionConnection conn, ServletOutputStream out )
        throws SQLException, IOException
    {
        String query = "select count(*) from holiday where hday in (select max(dday) + interval '1 day' from schedule)";
        ResultSet rs = conn.executeQuery(query);
        rs.next();  //it's a count...there's ALWAYS a result
        if( rs.getInt(1) > 0 )
        {
            query = "insert into schedule values ((select max(dday) + interval '1 day' from schedule), 'No School', 'Hutchison')";
            int c = conn.executeUpdate( query );
            if( c != 1 )
            {
                throw new RuntimeException("Failed to insert holiday.");
            }
            DatabaseUtility.close(rs);
            out.println("No school.");
            return true;
        }
        else
        {
            DatabaseUtility.close(rs);
            return false;
        }
    }

    public void doGet( HttpServletRequest req, HttpServletResponse resp )
        throws IOException, ServletException
    {
        doPost( req, resp );
    }


}

