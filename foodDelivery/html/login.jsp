<%@ page import="florisfood.util.*" %><%

String message = WebUtils.getOptionalParameter(request, "message", null);
%><html>
<head>
    <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" href="${css}/main.css" rel="stylesheet" />
    <script type="text/javascript" src="${js}/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="${js}/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="${js}/jquery.validate.js"></script>
    <style type="text/css">
        label { width: 10em; float: left; }
        label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
        p { clear: both; }
        em { font-weight: bold; padding-right: 1em; vertical-align: top; }
    </style>
    <script>
        $(document).ready(function(){
          $("#loginForm").validate();
        });
    </script>
</head>
<body>
<div style="float:left;">
    <% if(message!=null)
    {%>
        <center><div class="ui-state-error ui-corner-all" style="padding:1em;width:350px;text-align:center;">
            <%=message%>
        </div></center>
    <%}%>
    <!-- login -->
    <div id="login" style="width:400px">
     <form class="cmxform" id="loginForm" method="post" action="<%= response.encodeURL("j_security_check") %>" >
     <fieldset>
       <legend>Deliverer Login</legend>
       <p>
         <label for="cname">User Name</label>
         <input id="cname" name="j_username" size="20" class="required" minlength="2" />
       </p>
       <p>
         <label for="passwd">Password</label>
         <input id="passwd" name="j_password" size="20" class="required" type="password" />
       </p>
       <p style="text-align:center">
         <input class="link_button ui-state-default ui-corner-all" type="submit" value="Submit"/><br/><br/>
         <%-- <a href="registration.jsp">Register a New Account</a> --%>
       </p>

     </fieldset>
     </form>
     </div>
    <img alt="floris UMC logo" src="${images}/banner.jpg" style="margin-left:75px;"/>
</div>
<div style="margin-left:420px;padding:1.5em;border:1px solid black;">
    <span style="font-size:1.3em;font-weight:bold;">'Truly I say to you, to the extent that you did it to one of these brothers of Mine, even the least of them, you did it to Me.' (Matthew 24:40)</span>
    <br/><br/>Mission statement here
</div>
<a href="http://english-186714478924.spampoison.com" style="display:none"><img src="http://pics5.inxhost.com/images/sticker.gif" border="0" width="80" height="15"/></a>
</body>
</html>
