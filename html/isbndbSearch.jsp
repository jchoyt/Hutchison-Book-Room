<%@taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%>
<%@page import="org.mitre.mrald.util.*,java.io.*,java.net.*" %>
<%@page import="edu.fcps.hutchison.*,java.util.*" %>

<%
    // System.getProperties().put( "http.proxyHost", "gatekeeper.mitre.org" );
    // System.getProperties().put( "http.proxyPort", "80" );
%>
<%-- <mrald:validate doAdminCheck="yes" /> --%>
<%@include file='header.html'%>
<%-- <body onload="document.FormInsert.Insert1.focus();"> --%>
        <center>
            <div class="floating-text" style="width:750px;margin:auto;margin-top:1em;">
                <form method="POST" name="FormInsert" action="FormSubmit" enctype="x-www-form-urlencoded">
                    <input type="hidden" name="FailureUrl" value="failedInsert.jsp"/>
                    <input type="hidden" name="SuccessUrl" value="isbndbSearch.jsp"/>
                    <input type="hidden" name="workflow" value="Building DDL"/>
                    <input type="hidden" value="Table:book~Field:author~Order:2~Type:String" name="Insert2"/>
                    <input type="hidden" value="Table:book~Field:color~Order:1~Type:String" name="Insert1"/>
                    <input type="hidden" value="Table:book~Field:keyword~Order:5~Type:String" name="Insert5"/>
                    <input type="hidden" value="Table:book~Field:level~Order:7~Type:String" name="Insert7"/>
                    <input type="hidden" value="Table:book~Field:seriesid~Order:3~Type:Numeric" name="Insert3"/>
                    <input type="hidden" value="Table:book~Field:summary~Order:6~Type:String" name="Insert6"/>
                    <input type="hidden" value="Table:book~Field:word_count~Order:4~Type:String" name="Insert4"/>
                    <input type="hidden" value="Table:book~Field:box~Order:8~Type:String" name="Insert8"/>
                    <input type="hidden" value="Table:book~Field:copy_count~Order:9~Type:Numeric" name="Insert9"/>
                    <input type="hidden" value="Table:book~Field:f~Order:10~Type:String" name="Insert10"/>
                    <input type="hidden" value="Table:book~Field:title~Order:11~Type:String" name="Insert11"/>
                    <input name="Datasource" type="hidden" value="db_hutchison.props"/>
                    <input name="form" type="hidden" value="Insert Book"/>
                    <table>
                    <tr><td>Title: </td><td><input name="Insert11" type="text" size="50" value="" /></td></tr>
                    <tr><td>Author(s): </td><td><input name="Insert2" type="text" size="50" value="" /></td></tr>
                    <tr><td>Box number: </td><td><input name="Insert8" type="text" size="50"></td></tr>
                    <tr><td>Color: </td><td><select name="Insert1">
                        <option>none</option>
                        <option>Dark Blue</option>
                        <option>Green</option>
                        <option>Light Blue</option>
                        <option>Lime</option>
                        <option>Neon Red</option>
                        <option>Orange</option>
                        <option>Purple</option>
                        <option>Red</option>
                        <option>Yellow</option>
                    </select></td></tr>
                    <tr><td>Word count: </td><td><input name="Insert4" type="text" size="50" value="" /></td></tr>
                    <tr><td>Copy count: </td><td><input name="Insert9" type="text" size="50" value="1" /></td></tr>
                    <tr><td>Level: </td><td><input name="Insert7" type="text" size="50" value="" /></td></tr>
                    <tr><td>Keywords: </td><td><input name="Insert5" type="text" size="50" value="" /></td></tr>
                    <tr><td>Genre: </td><td><input name="Insert10" type="text" size="50" value="F" /></td></tr>
                    <%--<tr>
                    <td colspan="2" align="left">

                    <b>Any fields marked with an asterisk are required</b>
                    </td>
                    </tr> --%>
                    </table>
                    <div style="text-align: center">
                        <input type="submit" value="Submit" />
                        <br />
                        <br />
                        <input type="reset" value="Reset Form" />
                    </div>
                </form>
            </div>
        </center>
<%@include file='footer.html'%>
