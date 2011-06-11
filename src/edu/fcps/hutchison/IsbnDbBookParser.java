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
 *  This class uses the SAX parser to parse the results of a query to http://isbndb.com. The expanded results from the
 *  <code>results=texts,subjects</code> is handled<br/>
 *  Example of xml file to be parsed:
 <pre>
 <?xml version="1.0" encoding="UTF-8"?>
<ISBNdb server_time="2005-07-29T03:02:22">
    <BookList total_results="1">
        <BookData book_id="paul_laurence_dunbar" isbn="0766013502">
            <Title>Paul Laurence Dunbar</Title>
            <TitleLong>Paul Laurence Dunbar: portrait of a poet</TitleLong>
            <AuthorsText>Catherine Reef</AuthorsText>
            <PublisherText publisher_id="enslow_publishers">
    Berkeley Heights, NJ: Enslow Publishers, c2000.
   </PublisherText>
            <Summary>
    A biography of the poet who faced racism and devoted himself
    to depicting the black experience in America.
   </Summary>
            <Notes>
    "Works by Paul Laurence Dunbar": p. 113-114.
    Includes bibliographical references (p. 124) and index.
   </Notes>
            <UrlsText></UrlsText>
            <AwardsText></AwardsText>
            <Prices>
                <Price store_id="alibris" is_in_stock="1" is_new="0"
                        check_time="2005-07-29T01:18:18" price="14.92"/>
                <Price store_id="amazon" is_in_stock="1" is_new="1"
                        check_time="2005-07-29T01:18:20" price="26.60" />
            </Prices>
        </BookData>
    </BookList>
</ISBNdb></pre>
 *
 * @author    jchoyt
 */
public class IsbnDbBookParser extends DefaultHandler
{
    /**  The current book to be populated */
    private Book book;
    /**  A List of books that has been processed so far */
    private List <Book> books;
    /**  Buffer for collecting data from the "characters" SAX event. */
    private CharArrayWriter contents = new CharArrayWriter();



    /**
     *  Override methods of the DefaultHandler class to gain notification of SAX Events. See org.xml.sax.ContentHandler
     *  for all available events.
     *
     * @param  namespaceURI      the Namespace URI, or the empty string if the element has no Namespace URI or if Namespace processing is not being performed
     * @param  localName         the local name (without prefix), or the empty string if Namespace processing is not being performed
     * @param  qName             the qualified name (with prefix), or the empty string if qualified names are not available
     * @param  attr              the attributes attached to the element. If there are no attributes, it shall be an empty Attributes object. The value of this object after startElement returns is undefined
     * @exception  SAXException  any SAX exception, possibly wrapping another exception
     */
    public void startElement(String namespaceURI,
                             String localName,
                             String qName,
                             Attributes attr)
        throws SAXException
    {

        contents.reset();

        if (localName.equals("BookList"))
        {
            books = new ArrayList <Book> ();
        }

        if (localName.equals("BookData"))
        {
            book = new Book();
            books.add( book );
            book.setIsbn( attr.getValue( "isbn" ) );
        }

    }


    /**
     *  Description of the Method
     *
     * @param  namespaceURI      Description of Parameter
     * @param  localName         Description of Parameter
     * @param  qName             Description of Parameter
     * @exception  SAXException  Description of Exception
     */
    public void endElement(String namespaceURI,
                           String localName,
                           String qName)
        throws SAXException
    {

        if (localName.equals("Title"))
        {
            book.setTitle( contents.toString().trim() );;
        }

        if (localName.equals("AuthorsText"))
        {
            book.setAuthorText( contents.toString().trim() );;
        }

        if (localName.equals("Summary"))
        {
            book.setSummary( contents.toString().trim() );;
        }

        if (localName.equals("Subject"))
        {
            //TODO: this needs to be more intelligent
            String summary = contents.toString().trim();
            int lastDashes = summary.lastIndexOf("--");
            String keyword = summary.substring( lastDashes + 3 );
            if( !book.getKeywords().contains( keyword ) )
            {
                book.appendKeyword( keyword );
            }
        }

        if (localName.equals("PublisherText"))
        {
            book.setPublisher( contents.toString().trim() );;
        }
    }

    public List <Book> getBooks()
    {
        return books;
    }

    /**
     *  Description of the Method
     *
     * @param  ch                Description of Parameter
     * @param  start             Description of Parameter
     * @param  length            Description of Parameter
     * @exception  SAXException  Description of Exception
     */
    public void characters(char[] ch, int start, int length)
        throws SAXException
    {
        contents.write(ch, start, length);
    }


    // /**
    //  *  The main program for the IsbnDbBookParser class
    //  *
    //  * @param  argv  The command line arguments
    //  */
    // public static void main(String[] argv)
    // {
    //     try
    //     {
            // Create SAX 2 parser...
    //         XMLReader xr = XMLReaderFactory.createXMLReader();
            // Set the ContentHandler...
    //         IsbnDbBookParser ex4 = new IsbnDbBookParser();
    //         xr.setContentHandler(ex4);
            // Parse the file...
    //         xr.parse(new InputSource(new FileReader(argv[0])));

    //         List <Book> books = ex4.getBooks();
    //         for(Book b : books)
    //         {
    //             System.out.println(b.toString());
    //             System.out.println( Book.NEWLINE );
    //         }
    //     }
    //     catch (Exception e)
    //     {
    //         e.printStackTrace();
    //     }

    // }

}

