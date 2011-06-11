<%@ taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="org.mitre.mrald.util.*" %><%@ page import="java.util.Enumeration" %><%
    String tableName = WebUtils.getRequiredParameter( request, "tableName" );
    String datasource = WebUtils.getRequiredParameter( request, "datasource" );
    String successRedir = WebUtils.getOptionalParameter( request, "SuccessUrl", "index.jsp" );
    Enumeration names = request.getParameterNames();
    //make sure some sort of restriction was submitted
    names.nextElement();
    names.nextElement();
    if( !names.hasMoreElements() )
    {
        throw new JspException( "A table name and a primary key limitation must "+
          "be provided to this JSP.  If you don't, a list of all matching tuples "+
          "will be returned and the update will fail." );
    }
%>
<%-- <mrald:validate /> --%>
<%@include file='header.html'%>
            <script language="JavaScript1.2" type="text/javascript" src="CalendarPopup.js">
            </script>
            <br />
            <form name="FormUpdate" method="POST" action="FormSubmit" enctype="x-www-form-urlencoded" onsubmit="return checkForm( this )">
                <input type="hidden" name="form" value="test" />
                <input type="hidden" name="workflow" value="Delete SQL" />
                <input type="hidden" name="Format" value="delete" />
                <input type="hidden" name="Datasource" value="<%=datasource%>"/>
                <input type="hidden" name="SuccessUrl" value="<%=successRedir%>"/>
                <table>
                    <tr>
                        <th class="title" colspan="3">Form Details</th>
                    </tr>
                    <mrald:updateList action="Delete" />
                </table>
                <br />
                <center>
                    <input type="submit" value="Delete" /> &nbsp; <input type="reset" value="Reset Form" />
                </center>
            </form>
<%@include file='footer.html'%>

