/*
 *  Copyright 2010 Jeffrey Hoyt.  All rights reserved.
 */
package florisfood.ui;

import org.json.*;
import java.sql.*;
import florisfood.util.*;


public class DAO
{

    //{{{ Members
    //}}}

    //{{{ Constuctors
    //}}}

    //{{{ Methods
    public static JSONArray getSchedule( String which )
        throws Exception
    {
        String query = "select (select abbrev from dow where index = extract(dow from dday)) as dow, dday, firstname, lastname from schedule s join deliverers d on (s.who = d.userid) where s.destination='" + which + "' and dday > now() - 30 * interval '1 day' order by dday";
        InvasionConnection conn = null;
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try
        {
            conn = new InvasionConnection();
            rs = conn.executeQuery(query);
            while(rs.next())
            {
                JSONObject obj = new JSONObject();
                obj.put("start", rs.getString("dday"));
                obj.put("dow", rs.getString("dow"));
                obj.put("title", rs.getString("firstname") + " " + rs.getString("lastname"));
                array.put(obj);
            }
            DatabaseUtility.close(rs);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        finally
        {
            DatabaseUtility.close(rs);
            conn.close();
            return array;
        }
    }
    //}}}

    //{{{ Getters and Setters
    //}}}

}

// :wrap=none:noTabs=true:collapseFolds=1:folding=explicit:

