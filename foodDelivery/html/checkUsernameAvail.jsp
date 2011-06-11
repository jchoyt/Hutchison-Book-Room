<%@ page import="org.hibernate.*, org.hibernate.cfg.Configuration, java.util.*, florisfood.dataobjects.*, florisfood.util.*" %><%
    String username = WebUtils.getRequiredParameter(request, "name");
    System.out.println( "Checking for " + username );
    Session sess=null;
    Transaction tx = null;
    try {
        sess = HibernateUtil.getSessionFactory().getCurrentSession();
        tx = sess.beginTransaction();
        String query = "from Player where username=?";
        Player player = (Player)sess.createQuery(query).setString(0, username).uniqueResult();
        if( player == null )
            out.write( "true" );
        else
            out.write( "false");
    } catch (Exception e) {
        if (tx != null) {
            tx.rollback();
            sess.close();
            }
        throw e;
    }
%>
