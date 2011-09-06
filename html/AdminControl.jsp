<%@ page import="org.mitre.mrald.admin.*,org.mitre.mrald.util.*,java.util.*" %><%
  String action = WebUtils.getRequiredParameter(request, "action");
  if(action.equals("deleteErrFiles"))
  {
      AdminUtil.removeErrFiles(pageContext);
      return;
  }
   else if(action.equals("rotateLogs"))
  {
      AdminUtil.rotateLogs(pageContext);
      return;
  }
  else if(action.equals("reloadDatabases"))
  {
      MetaData.reload();
      response.sendRedirect( Config.getProperty( "AdminUrl" ) );
      return;
  }
  else if(action.equals("createBackups"))
  {
      AdminUtil.createBackups();
      response.sendRedirect( Config.getProperty( "AdminUrl" ) );
      return;
  }
  else
  {
      response.sendRedirect(Config.getProperty("URL" ));
  }
%>
