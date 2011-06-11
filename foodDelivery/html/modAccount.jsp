<%@ page import="florisfood.ui.*,org.json.*,florisfood.util.*,java.sql.*" %><%@
    taglib prefix="tags" tagdir="/WEB-INF/tags" %><%
    String loggedInUser = request.getRemoteUser();
    String query = "select * from deliverers where userid=?";
    InvasionConnection conn = null;
    ResultSet rs = null;
    try
    {
        conn = new InvasionConnection();
        rs = conn.psExecuteQuery(query, "Error", loggedInUser);
        if(rs.next())

        {
            //process

%>
<head>
    <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" href="${css}/main.css" rel="stylesheet" />
</head>
<body>
    <center><img alt="logo" src="${images}/banner.jpg"/>
        <br/><br/>
        Data for <b><%=rs.getString("firstname")%> <%=rs.getString("lastname")%> (<%=loggedInUser%>)</b>
        <br/><br/>
        <form action="modAccountProcess.jsp">
            <table>
                <thead>
                    <tr><th>Day of Week</th><th>Can Deliver?</th></tr>
                </thead>
                <tbody>
                <tr><td>Monday</td><td><input type="checkbox" name="mon" value="true" <% if(rs.getBoolean("mon")) out.write("checked=\"true\"");%>/></td></tr>
                <tr><td>Tuesday</td><td><input type="checkbox" name="tue" value="true" <% if(rs.getBoolean("tue")) out.write("checked=\"true\"");%>/></td></tr>
                <tr><td>Wednesday</td><td><input type="checkbox" name="wed" value="true" <% if(rs.getBoolean("wed")) out.write("checked=\"true\"");%>/></td></tr>
                <tr><td>Thursday</td><td><input type="checkbox" name="thu" value="true" <% if(rs.getBoolean("thu")) out.write("checked=\"true\"");%>/></td></tr>
                <tr><td>Friday</td><td><input type="checkbox" name="fri" value="true" <% if(rs.getBoolean("fri")) out.write("checked=\"true\"");%>/></td></tr>
                </tbody>
            </table>
            <br/>
            Email address: <input type="text" name="email" value="<%=rs.getString("email")%>"/><br/>
            Phone number: <input type="text" name="phone" value="<%=rs.getString("phone")%>"/><br/>
            Also volunteer for Embry?  <input type="checkbox" name="embry" value="<%=rs.getBoolean("embry")%>"/>
            <center><input type="submit" value="Update account" /></center>
        </form>
        <br/>
        <br/>
        <a href="index.jsp">Home</a>
    </center>
</body>
</html>

<%
        }
        else
        {
            throw new RuntimeException( "Can't find you in the database...how odd." );
        }
        DatabaseUtility.close(rs);
    }
    catch(SQLException e)
    {
        throw new RuntimeException(e);
    }
    finally
    {
        DatabaseUtility.close(rs);
        conn.close();
    }
%>
