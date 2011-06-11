package edu.fcps.hutchison;

import javax.servlet.*;


public class InitServlet extends org.mitre.mrald.servlets.InitServlet
{


    public InitServlet()
    {
        super();
        System.out.println("In SAIFE initservlet");
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

    public void setLatticeFactory() {}
}
