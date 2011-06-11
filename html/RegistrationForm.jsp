<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import = "org.mitre.mrald.util.User"%>
<%@ page import="org.mitre.mrald.util.Config" %>
<%
    String pageurl = request.getParameter( "pageurl" );
    User mraldUser = (User)session.getAttribute(Config.getProperty("cookietag"));
    String userStr= "";
    if (mraldUser != null)
        userStr = mraldUser.getEmail();
%>
<%@include file='header.html'%>
    <script language="Javascript">
        function checkForm(form)
        {
            var userName = form.userName.value;
            var old = form.password.value;
            var check = form.verifyPassword.value;

            if( (!userName) )
            {
                alert ("\nYou must enter a valid email address to continue.")
                return false;
            }
            else
	    if( (!old) )
            {
                alert ("\nYou must enter a valid password to continue.")
                return false;
            }
	    else if( (!check) )
            {
                alert ("\nYou must enter a new password continue.")
                return false;
            }
	    else if( old != check )
            {
                alert ("\nYou must enter matching passwords.")
                return false;
            }
            return true;
        }
    </script>
    <form action="FormSubmit" method="post" enctype="x-www-form-urlencoded" onSubmit="return checkForm(this)">
        <center>
            <input type="hidden" name="workflow" value="UserRegistration" /><input type="hidden" name="pageurl" value="<%=pageurl%>"><input type="hidden" name="loginAction" value="addUser">
            <br><br>
            <table cellspacing="1" cellpadding="3" border="0" width="550px">
                <tr><th colspan="2">User Registration</th></tr>
                <tr><td>Email Address:<font  color="#FF0000">*</font></td><td><input type="text" name="userName" size="30" maxlength="80" value=""></input></td></tr>
                <tr><td>Password:<font  color="#FF0000">*</font></td><td><input type="Password" name="password" size="30" maxlength="80" value=""></input></td></tr>
                <tr><td>Renter Password:<font  color="#FF0000">*</font></td><td><input type="Password" name="verifyPassword" size="30" maxlength="80" value=""></input></td></tr>
                <tr><td>First Name: </td><td><input type="text" name="firstName" size="30" maxlength="80" value=""></input></td></tr>
                <tr><td>Last Name: </td><td><input type="text" name="lastName" size="30" maxlength="80" value=""></input></td></tr>
                <tr><td colspan="2"><font  color="#FF0000">*</font>Fields marked with an asterisk are required</td></tr>
            </table>
            <br><br>
            <input type="submit" value="Register">
        </center>
    </form>
<%@include file='footer.html'%>

