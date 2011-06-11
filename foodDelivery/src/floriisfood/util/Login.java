/*
 *  Copyright 2010 Jeffrey Hoyt.  All rights reserved.
 */

package florisfood.util;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.security.*;
import java.util.*;
import java.security.MessageDigest;
import java.sql.*;

/**
 *  Description of the Class
 *
 *@author     jchoyt
 *@created    October 2, 2005
 */
public class Login {

    public final static String KEY = Login.class.getName();
    public final static Logger log = Logger.getLogger( KEY );
    static{log.setLevel(Level.FINER);}
    /**
     *  source of random bytes for the cyptography
     */
    private static final SecureRandom secureRandom = new SecureRandom();

    public static final String COOKIE_TAG = "chocolate_florisfood_cookie";
    public static final String LOGIN_OK = "OK";


    public static String registerPlayer(HttpServletRequest request)
    throws NoSuchAlgorithmException,  java.io.IOException,
             java.io.UnsupportedEncodingException {
        //
        // Retrieve the necessary values from the MsgObject.
        // (These are important no matter the operation)
        //
        String username = WebUtils.getRequiredParameter(request, "name");
        String password = WebUtils.getRequiredParameter(request, "passwd");
        String email = WebUtils.getRequiredParameter(request, "email");
        //
        // Create a Player Object in memory
        //
        String query = "select * from Player where username=?";
        //TODO get player
        InvasionConnection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = new InvasionConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return "Player already exists.";
            }
            DatabaseUtility.close(rs);
            DatabaseUtility.close(ps);

            query = "select * from Player where emailaddress=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return "That email address exists on file already.";
            }
            DatabaseUtility.close(rs);
            DatabaseUtility.close(ps);

            String md5Passwd = encodePassword(password, "SHA");

            query = "insert into player (username, password, emailaddress) values (?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, md5Passwd);
            ps.setString(3, email);
            ps.execute();

        }
        catch (SQLException e)
        {
            log.log(Level.WARNING, "Error registring the player ", e);
            return "Problem inserting the new player";
        }
        finally
        {
            DatabaseUtility.close(rs);
            DatabaseUtility.close(ps);
            conn.close();
        }

        return LOGIN_OK;
    }


    public static String encodePassword(String password, String algorithm) {
        byte []unencodedPassword = password.getBytes();
        MessageDigest md = null;
        try {
            // first create an instance, given the provider
            md = MessageDigest.getInstance(algorithm);
        } catch (Exception e) {
            // log.error("Exception: " + e);
            return password;
        }
        md.reset();
        // call the update method one or more times
        // (useful when you don't know the size of your data, e.g. stream)
        md.update(unencodedPassword);
        // now calculate the hash
        byte []encodedPassword = md.digest();
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < encodedPassword.length; i++) {
            if (((int) encodedPassword[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
        }
        return buf.toString();
    }


    public static String encodePassword(String password, byte [] seed) throws NoSuchAlgorithmException,  UnsupportedEncodingException {
        if (seed == null) {
            seed = new byte [12];
            secureRandom.nextBytes(seed);
        }

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(seed);
        md.update(password.getBytes("UTF8"));
        byte []digest = md.digest();
        byte []storedPassword = new byte [ digest.length + 12];

        System.arraycopy(seed, 0, storedPassword, 0, 12);
        System.arraycopy(digest, 0, storedPassword, 12, digest.length);

        return new sun.misc.BASE64Encoder().encode(storedPassword);
    }
}
