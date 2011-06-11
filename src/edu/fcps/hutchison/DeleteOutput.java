/*
 *  Copyright 2008 The MITRE Corporation (http://www.mitre.org/). All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.fcps.hutchison;

import org.mitre.mrald.output.HTMLOutput;
import java.io.IOException;
import java.sql.SQLException;
import org.mitre.mrald.util.Config;
import org.mitre.mrald.util.MiscUtils;
import org.mitre.mrald.util.MraldError;

/**
 *  This class does the actual deletes from the database
 *
 *@author     Gail hamilton
 *@created    February 2, 2004
 *@version    1.0
 */

public class DeleteOutput extends HTMLOutput
{
    /**
     *  This method prepares the output file for the HTML format data
     *
     *@since
     */
    public @Override void printBody( )
        throws IOException, SQLException
    {
        System.out.println("In DeleteOutput.printBody()");
        String urlToGet = "SuccessUrl";
        String redirectURL = msg.getValue( urlToGet )[0];
        if ( redirectURL.equals( Config.EMPTY_STR ) )
        {
            redirectURL = "success.jsp";
        }
        msg.setRedirect( redirectURL );
    }


     /**
     *  This is method connects to the database and runs the specified query
     *
     *@param  msg  Description of Parameter
     *@since       1.2
     */
    public @Override void runUserQuery( )
    {
        try
        {
            StringBuffer logInfo = new StringBuffer();
            long startTime = MiscUtils.logQuery( userID, datasource, dbQuery, logInfo );
            int deleteCount = stmt.executeUpdate( dbQuery );
            /*
             *  RETURN success status
             */
            MiscUtils.logQueryRun( startTime, logInfo );
        }
        catch ( SQLException se )
        {
            throw new MraldError( se, msg );
        }
    }


    /**
     *  This method outputs the header so that the file is recognized as an HTML
     *  file
     *
     *@param  msg                         Description of the Parameter
     *@exception  OutputManagerException  Description of the Exception
     *@since
     */
    protected @Override void prepareHeaders( )
    {
        msg.setContentType( "text/html" );
        msg.setHeader( "Content-Disposition", "inline;" );
    }


    protected @Override void getFormatInfo(  ) {}

}

