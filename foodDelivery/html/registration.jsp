<%@ page import="florisfood.util.*" %>
<html>
<head>
    <link type="text/css" href="${css}/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" href="${css}/main.css" rel="stylesheet" />
    <style type="text/css">
        label { float:left; width:45%; margin-right:0.5em; padding-top:0.2em; text-align:right; font-weight:bold; }
        p { clear: both; }
    </style>
    <script type="text/javascript" src="${js}/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="${js}/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="${js}/jquery.validate.js"></script>
    <script>
        $(document).ready(function(){
              $("#registrationForm").validate(
                  {
                      messages: {
                          name: {
                              remote: "This username is in use.  Please pick another one.",
                          }
                      }
                  }
              });
        );
    </script>

</head>
<body>
    <center>
        <img alt="logo" src="${images}/banner.png"/>
    </center>
    <br/><br/>
    <!-- registration -->
    <div aria-labelledby="ui-dialog-title-registration" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable" style="overflow: hidden; display: block; outline-color: -moz-use-text-color; outline-style: none; outline-width: 0px; height: auto; width: 625px;margin:auto;">
        <div style="-moz-user-select: none;" unselectable="on" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
            <span style="-moz-user-select: none;" unselectable="on" id="ui-dialog-title-registration" class="ui-dialog-title">&nbsp;</span>
        </div>
        <div id="registration" class="ui-dialog-content ui-widget-content" style="border: 0pt none ; background: transparent none repeat scroll 0% 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; height: auto; min-height: 104px; width: auto;">
            <form class="cmxform" id="registrationForm" method="post" action="registrationProcess.jsp" enctype="x-www-form-urlencoded" >
                <fieldset>
                  <legend>Register a new account (many characters can be used on one account)<sup>1</sup></legend>
                  <p>
                    <label for="cname">User Name<sup>2</sup></label>
                    <input id="cname" name="name" size="15" remote="checkUsernameAvail.jsp" class="required" minlength="2" />
                  </p>             <p>
                    <label for="cemail">E-Mail<sup>3</sup></label>
                    <input id="cemail" name="email" size="15"  class="required email" />
                  </p>
                  <p>
                    <label for="passwd1">Password</label>
                    <input id="passwd1" name="passwd" size="15" class="required" type="password" />
                  </p>
                  <p>
                    <label for="passwd2">Confirm Password</label>
                    <input id="passwd2" name="verifyPassword" equalTo="#passwd1" size="15"  type="password" />
                  </p>
                  <center><input type="submit" value="Register"/></center>
                </fieldset>
                <sup>1</sup>By creating an account, you agree to be bound by the <a href="tos.html">terms of service and certify that you are at least 13 years of age.</a>.<br/>
                <sup>2</sup>You are only allowed one user account.  You may have multiple characters per account.<br/>
                <sup>3</sup>Read the disclaimer and privacy policy.  Short version is "this is for emergency use only."<br/>
            </form>
        </div>
    </div>
</body>
</html>
