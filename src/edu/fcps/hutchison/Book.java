/*
 * :mode=java:tabSize=4:indentSize=4:noTabs=true:
 * :folding=indent:collapseFolds=0:wrap=none:maxLineLen=80:
 *
 * $Source$
 * Copyright (C) 2006 Jeffrey Hoyt
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package edu.fcps.hutchison;

import java.io.*;
import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;


/**
 * @author    jchoyt
 */

public class Book
{

    public static final String NEWLINE = System.getProperty("line.separator");

    /**  Title property.  */
    protected String title = null;

    /**  Keywords property.  */
    protected String keywords = "";

    /**  Summary property.  */
    protected String summary = null;

    /**  Publisher property.  */
    protected String publisher = null;

    /**  Isbn property.  */
    protected String isbn = "";


    /**  Series property.  */
    protected Series series = null;

    /**  AuthorText property.  */
    protected String authorText = null;

    /**  Constructor for the Book object */
    public Book() { }


    /**
     *  Set title property.
     *
     * @param  title  New title property.
     */
    public void setTitle(String title)
    {
        this.title = title;
    }


    /**
     *  Set keywords property.
     *
     * @param  keywords  New keywords property.
     */
    public void setKeywords(String keywords)
    {
        this.keywords = keywords;
    }

    public void appendKeyword(String keyword)
    {
        if( keywords.length() != 0 )
        {
            keywords += ", ";
        }
        this.keywords += keyword;
    }


    /**
     *  Set summary property.
     *
     * @param  summary  New summary property.
     */
    public void setSummary(String summary)
    {
        this.summary = summary;
    }


    /**
     *  Set publisher property.
     *
     * @param  publisher  New publisher property.
     */
    public void setPublisher(String publisher)
    {
        this.publisher = publisher;
    }


    /**
     *  Set isbn property.
     *
     * @param  isbn  New isbn property.
     */
    public void setIsbn(String isbn)
    {
        this.isbn = isbn;
    }


    /**
     *  Set series property.
     *
     * @param  series  New series property.
     */
    public void setSeries(Series series)
    {
        this.series = series;
    }


    /**
     *  Set authorText property.
     *
     * @param  authorText  New authorText property.
     */
    public void setAuthorText(String authorText)
    {
        this.authorText = authorText;
    }


    /**
     *  Get title property.
     *
     * @return    Title property.
     */
    public String getTitle()
    {
        return this.title;
    }


    /**
     *  Get keywords property.
     *
     * @return    Keywords property.
     */
    public String getKeywords()
    {
        return this.keywords;
    }


    /**
     *  Get summary property.
     *
     * @return    Summary property.
     */
    public String getSummary()
    {
        return this.summary;
    }


    /**
     *  Get publisher property.
     *
     * @return    Publisher property.
     */
    public String getPublisher()
    {
        return this.publisher;
    }


    /**
     *  Get isbn property.
     *
     * @return    Isbn property.
     */
    public String getIsbn()
    {
        return this.isbn;
    }


    /**
     *  Get series property.
     *
     * @return    Series property.
     */
    public Series getSeries()
    {
        return this.series;
    }


    /**
     *  Get authorText property.
     *
     * @return    AuthorText property.
     */
    public String getAuthorText()
    {
        return this.authorText;
    }

    public String toString()
    {
        StringBuilder ret = new StringBuilder();
        ret.append( "ISBN: " + isbn  );
        ret.append( NEWLINE );
        ret.append( "Title: " + title );
        ret.append( NEWLINE );
        ret.append( "Author(s): " + authorText );
        ret.append( NEWLINE );
        ret.append( "Summary: " + summary );
        ret.append( NEWLINE );
        ret.append( "Keywords: " + keywords );
        ret.append( NEWLINE );
        ret.append( "Publisher: " + publisher );
        ret.append( NEWLINE );
        ret.append( "Series: Not Implemented" );
        return ret.toString();
    }


}

/**
 *  Description of the Class
 *
 * @author    jchoyt
 */
class Series
{
}

