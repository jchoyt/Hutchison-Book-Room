<%@ taglib uri="/WEB-INF/hutchison.tld" prefix="hutch"%>
<%@ taglib uri="/WEB-INF/mrald.tld" prefix="mrald"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="org.mitre.mrald.util.*" %>

<%-- <mrald:validate /> --%>
<%@include file='header.html'%>
<center>
    <form method="POST" name="FormInsert" action="FormSubmit" enctype="x-www-form-urlencoded">
        <input name="Schema" type="hidden" value=""/>
        <input name="Datasource" type="hidden" value="db_preschool.props"/>
        <input name="form" type="hidden" value="Add new Shelving Location"/>
        <input type="hidden" name="workflow" value="Building DDL"/>
        <input type="hidden" name="SuccessUrl" value="index.jsp"/>
        <input type="hidden" name="FailureUrl" value="failedInsert.jsp"/>
        <input type="text" length="30" name="Insert1" onchange="checkPkExists('shelved','shelved', this.value, 'shelved')"/>
        <input type="hidden" value="Table:shelved~Field:shelved~Order:1~Type:String" name="Insert1"/>
        <input type="submit" value="Add new Shelving Location"/>
    </form>
</center>
<%@include file='footer.html'%>
