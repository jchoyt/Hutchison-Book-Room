<%@ taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="org.mitre.mrald.util.*" %><%@ page import="java.util.Enumeration" %><%
    String tableName = WebUtils.getRequiredParameter( request, "tableName" );
    String datasource = WebUtils.getRequiredParameter( request, "datasource" );
    String successRedir = WebUtils.getOptionalParameter( request, "SuccessUrl", "success.jsp" );
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

<mrald:validate doAdminCheck="yes" />

<%@include file='header.jsp'%>
            <script language="JavaScript1.2" type="text/javascript" src="CalendarPopup.js">
            </script>
            <br />
            <form name="FormUpdate" method="POST" action="FormSubmit" enctype="x-www-form-urlencoded" onsubmit="return checkForm( this )">
                <input type="hidden" name="form" value="test" />
                <input type="hidden" name="workflow" value="Update SQL" />
                <input type="hidden" name="Format" value="confirm" />
                <input type="hidden" name="Datasource" value="<%=datasource%>"/>
                <input type="hidden" name="SuccessUrl" value="<%=successRedir%>"/>
                <table cellpadding="0" cellspacing="0" border="0" width="95%">
                    <tr>
                        <td>
                            <table cellpadding="5" cellspacing="1" border="0" width="100%">
                                <tr>
                                    <th class="title" colspan="3">Form Details</th>
                                </tr>
                                <mrald:updateList action="Update" />
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <input type="submit" value="Update" />
                <br />
                <br />
                <input type="reset" value="Reset Form" />
            </form>
<%@include file='footer.html'%>

