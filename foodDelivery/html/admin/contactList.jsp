<%@ page import="florisfood.util.*,java.sql.*,java.util.*,java.text.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><%
    String destination = WebUtils.getRequiredParameter(request, "destination");
    // String start = WebUtils.getRequiredParameter(request, "start");
%>
<html>
    <head>
        <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
        <link type="text/css" href="${css}/main.css" rel="stylesheet" />
        <script type="text/javascript" src="${js}/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="${js}/jquery-ui-1.7.2.custom.min.js"></script>
    </head>
    <body>
        <center>
        <% String query = "select dday as Date, firstname || ' ' || lastname as Deliverer, email, phone from deliverers d join schedule s on (d.userid=s.who) where dday >= now() - '1 day'::interval and dday <= now() + 7 * '1 day'::interval and destination=? order by dday";
                InvasionConnection conn = new InvasionConnection();
                ResultSet rs = conn.psExecuteQuery( query, "", destination );
                DatabaseUtility.genericTable(rs, out);
                DatabaseUtility.close(rs);
                %>
                <hr>
                Email:<br/>
                <%
                //now build the email
                rs = conn.psExecuteQuery( query, "", destination );
                List<String> email = new ArrayList<String>();
                List<String> schedule = new ArrayList<String>();
                SimpleDateFormat format = new SimpleDateFormat("EEE, MMM d, yyyy");
                while(rs.next())
                {
                    email.add(rs.getString("email"));
                    java.util.Date when = rs.getDate( "Date" );
                    schedule.add(format.format( when ) + " " + rs.getString("Deliverer"));
                    //process
                }
                DatabaseUtility.close(rs);
                %>
                <b>Subject:</b> <%=destination%> food delivery for this week <br/>
                <b>Body:</b> Here's the food delivery schedule for this week <br/>
                <%
                    for(String tuple : schedule)
                    {
                        out.write( tuple + "<br/>");
                    }
                %>

                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>
                <%
                    for(String deliverer : email)
                    {
                        out.write( deliverer + "<br/>");
                    }
                %>

            <br/>
            <a href=".">Back to Admin</a>
        </center>
    </body>
<html>
