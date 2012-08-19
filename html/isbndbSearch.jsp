<%@taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%>
<%@page import="org.mitre.mrald.util.*,java.io.*,java.net.*" %>
<%@page import="edu.fcps.hutchison.*,java.util.*,org.xml.sax.*,org.xml.sax.helpers.*" %>
<%!
    public List <Book> searchIsbnDb( String searchString )
    throws Exception
    {
        URL url = new URL( searchString );
        URLConnection connection = url.openConnection();
        InputStream stream = connection.getInputStream();
        // Create SAX 2 parser...
        XMLReader xr = XMLReaderFactory.createXMLReader();
        // Set the ContentHandler...
        IsbnDbBookParser parser = new IsbnDbBookParser();
        xr.setContentHandler(parser);
        // Parse the file...
        xr.parse(new InputSource(stream));
        stream.close();

        return parser.getBooks();
    }
%>
<%
    //System.getProperties().put( "http.proxyHost", "gatekeeper.mitre.org" );
    //System.getProperties().put( "http.proxyPort", "80" );
    String searchType = WebUtils.getOptionalParameter( request, "searchType", "none" ); //defaults to "none"
    String searchString = "http://isbndb.com/";
    String searchValue = "";
    if( searchType.equals("isbn") )
    {
        searchString += "api/books.xml?access_key=26ALN2DU&index1=isbn&results=subjects,texts&value1=";
    }
    else if( searchType.equals("combined") )
    {
        searchString += "api/books.xml?access_key=26ALN2DU&results=subjects,texts&index1=combined&value1=";
    }
    // else throw new JspException("should be no way to get here");
    searchValue = WebUtils.getRequiredParameter( request, searchType );
    searchString += searchValue.replaceAll(" ", "+");
    // searchString = URLEncoder.encode( searchString, "UTF-8");
    MraldOutFile.logToFile( searchString );
    // Book book=null;
    List <Book> books;
    if( searchType.equals("none" ) )
    {
        books = new ArrayList <Book> ();
    }
    else
    {
        books = searchIsbnDb( searchString );
        if( books.size() == 0 )
        {
            books = searchIsbnDb( searchString );
        }
    }
%>
<%-- <mrald:validate doAdminCheck="yes" /> --%>
<%@include file='header.html'%>
<%-- <body onload="document.FormInsert.Insert1.focus();"> --%>
        <center>
            <% if( books.size() > 1 )
            {
                out.write( books.size() + " matching books found - pick one" );
            }
            else if( books.size() == 0 && !searchType.equals("none" ) )
            {
                out.write ( "<br/><br/>No matching books found." );
            }
            if( searchType.equals("none" ) )
            {
            %>
            <div class="floating-text" style="width:750px;margin:auto;margin-top:1em;">
                <form method="POST" name="FormInsert" action="FormSubmit" enctype="x-www-form-urlencoded">
                    <input type="hidden" name="FailureUrl" value="failedInsert.jsp"/>
                    <input type="hidden" name="SuccessUrl" value="isbndbSearch0.jsp"/>
                    <input type="hidden" name="workflow" value="Building DDL"/>
                    <input type="hidden" value="Table:book~Field:author~Order:2~Type:String" name="Insert2"/>
                    <input type="hidden" value="Table:book~Field:isbn~Order:1~Type:String" name="Insert1"/>
                    <input type="hidden" value="Table:book~Field:keywords~Order:5~Type:String" name="Insert5"/>
                    <input type="hidden" value="Table:book~Field:publisher~Order:7~Type:String" name="Insert7"/>
                    <input type="hidden" value="Table:book~Field:seriesid~Order:3~Type:Numeric" name="Insert3"/>
                    <input type="hidden" value="Table:book~Field:summary~Order:6~Type:String" name="Insert6"/>
                    <input type="hidden" value="Table:book~Field:title~Order:4~Type:String" name="Insert4"/>
                    <input type="hidden" value="Table:book~Field:shelved~Order:8~Type:String" name="Insert8"/>
                    <input type="hidden" value="Table:book~Field:count~Order:9~Type:Numeric" name="Insert9"/>
                    <input type="hidden" value="Table:book~Field:series~Order:10~Type:String" name="Insert10"/>
                    <input name="Datasource" type="hidden" value="db_hutchison.props"/>
                    <input name="form" type="hidden" value="Insert Book"/>
                    <table><tr><td><font color="#FF0000">*</font>ISBN: </td><td><input name="Insert1" type="text" size="50" value="" /></td></tr>
                    <tr><td><font color="#FF0000">*</font>Title: </td><td><input name="Insert4" type="text" size="50" value="" /></td></tr>
                    <tr><td>Series: </td><td><input name="Insert10" type="text" size="50" value="" /></td></tr>
                    <tr><td>Count: </td><td><input name="Insert9" type="text" size="50" value="1" /></td></tr>
                    <tr><td>Author(s): </td><td><input name="Insert2" type="text" size="50" value="" /></td></tr>
                    <tr><td>Publisher: </td><td><input name="Insert7" type="text" size="50" value="" /></td></tr>
                    <tr><td>Keywords: </td><td><input name="Insert5" type="text" size="75" value="" /></td></tr>
                    <tr><td>Shelving Location: </td><td><select name="Insert8"><mrald:dropDownList datasource="db_hutchison.props" table="shelved" listColumn="shelved" pkColumn="shelved"/></select></td></tr>
                    <tr><td>Summary: </td><td><textarea name="Insert6" cols="75" rows="10"></textarea></td></tr>
                    <tr>
                    <td colspan="2" align="left">
                    <font color="#FF0000">*</font>
                    <b>Any fields marked with an asterisk are required</b>
                    </td>
                    </tr></table>
                    <div style="text-align: center">
                        <input type="submit" value="Submit" />
                        <br />
                        <br />
                        <input type="reset" value="Reset Form" />
                    </div>
                </form>
            </div>
            <%
            }
            else
            {
                for(Book book : books ){%>
                <div class="floating-text" style="width:750px;margin:auto;margin-top:1em;">
                    <form method="POST" name="FormInsert" action="FormSubmit" enctype="x-www-form-urlencoded">
                        <input name="Datasource" type="hidden" value="db_hutchison.props"/>
                        <input name="form" type="hidden" value="Insert Book"/>
                        <input type="hidden" name="FailureUrl" value="failedInsert.jsp"/>
                        <input type="hidden" name="SuccessUrl" value="isbndbSearch0.jsp"/>
                        <input type="hidden" name="workflow" value="Building DDL"/>
                        <input type="hidden" value="Table:book~Field:author~Order:2~Type:String" name="Insert2"/>
                        <input type="hidden" value="Table:book~Field:isbn~Order:1~Type:String" name="Insert1"/>
                        <input type="hidden" value="Table:book~Field:keywords~Order:5~Type:String" name="Insert5"/>
                        <input type="hidden" value="Table:book~Field:publisher~Order:7~Type:String" name="Insert7"/>
                        <input type="hidden" value="Table:book~Field:seriesid~Order:3~Type:Numeric" name="Insert3"/>
                        <input type="hidden" value="Table:book~Field:summary~Order:6~Type:String" name="Insert6"/>
                        <input type="hidden" value="Table:book~Field:title~Order:4~Type:String" name="Insert4"/>
                        <input type="hidden" value="Table:book~Field:shelved~Order:8~Type:String" name="Insert8"/>
                        <input type="hidden" value="Table:book~Field:count~Order:9~Type:Numeric" name="Insert9"/>
                        <input type="hidden" value="Table:book~Field:series~Order:10~Type:String" name="Insert10"/>
                        <table><tr><td><font color="#FF0000">*</font>ISBN: </td><td><input name="Insert1" type="text" size="50" value="<%=book.getIsbn()%>" /></td></tr>
                        <tr><td><font color="#FF0000">*</font>Title: </td><td><input name="Insert4" type="text" size="50" value="<%=book.getTitle()%>" /></td></tr>
                        <tr><td>Series: </td><td><input name="Insert10" type="text" size="50" value="" /></td></tr>
                        <tr><td>Count: </td><td><input name="Insert9" type="text" size="50" value="1" /></td></tr>
                        <tr><td>Author(s): </td><td><input name="Insert2" type="text" size="50" value="<%=book.getAuthorText()%>" /></td></tr>
                        <tr><td>Publisher: </td><td><input name="Insert7" type="text" size="50" value="<%=book.getPublisher()%>" /></td></tr>
                        <tr><td>Keywords: </td><td><input name="Insert5" type="text" size="75" value="" /></td></tr>
                        <tr><td>Shelving Location: </td><td><select name="Insert8"><mrald:dropDownList datasource="db_hutchison.props" table="shelved" listColumn="shelved" pkColumn="shelved"/></select></td></tr>
                        <tr><td>Summary: </td><td><textarea name="Insert6" cols="75" rows="10"><%=book.getSummary()%></textarea></td></tr>
                        <tr>
                        <td colspan="2" align="left">
                        <font color="#FF0000">*</font>
                        <b>Any fields marked with an asterisk are required</b>
                        </td>
                        </tr></table>
                        <div style="text-align: center">
                            <input type="submit" value="Submit" />
                            <br />
                            <br />
                            <input type="reset" value="Reset Form" />
                        </div>
                    </form>
                </div>
                <%}
            }%>

        </center>
<%@include file='footer.html'%>
