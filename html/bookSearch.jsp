<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="org.mitre.mrald.util.*" %><%@ taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%><mrald:validate />
<%
    User user = ( User ) pageContext.getSession().getAttribute( Config.getProperty( "cookietag" ) );
    int usertype = user == null ? 1 : user.getTypeId();
%>
    <jsp:include page="header.jsp" />
        <script type="text/javascript">
              $(document).ready(function(){
                $("#accordion").accordion();
              });
        </script>

        <form name="form" method="POST" action="FormSubmit" enctypev="x-www-form-urlencoded">
            <input value="true" name="showQuery" type="hidden"> <input type="hidden" value="none" name="outputSize">
            <input name="Schema" type="hidden" value=""/>
            <input name="Datasource" type="hidden" value="db_hutchison.props"/>
            <input name="form" type="hidden" value="Find Book"/>
            <input type="hidden" name="workflow" value="Building SQL"/>
            <div id="accordion">
                <h3 style="border:1px solid #6e2b32;background-image: url(images/hover_link_bg.jpg);margin:0px;padding:1em;"><a href="#" style="color:#fff;font-size:1em;">Filters</a></h3>
                <div style="padding:1.5em;">
                    <p>
                        <input name="Link1" type="hidden" value="PrimaryLink:colors.id~SecondaryLink:book.color" />
                        <input name="Link2" type="hidden" value="PrimaryLink:genres.id~SecondaryLink:book.genre" />
                        <input name="outputFormat21" type="hidden" value="fieldname:box~nicename:Box #~type:String" />
                        <input name="outputFormat22" type="hidden" value="fieldname:copy_count~nicename:# of <br>Copies~type:Numeric" />
                        <input name="outputFormat23" type="hidden" value="fieldname:minlevel~nicename:Min GRL~type:Numeric" />
                        <input name="outputFormat24" type="hidden" value="fieldname:maxlevel~nicename:Max GRL~type:Numeric" />
                        <input name="outputFormat25" type="hidden" value="fieldname:word_count~nicename:Word <br>Count~type:String" />
                        <input name="outputFormat26" type="hidden" value="fieldname:keyword~nicename:Keywords~type:String" />
                        <input name="outputFormat27" type="hidden" value="fieldname:name~nicename:Genre~type:String" />
                        <input name="outputFormat28" type="hidden" value="fieldname:color~nicename:Color~type:String" />
                        <input name="outputFormat210" type="hidden" value="fieldname:title~nicename:Title~type:String" />
                        <input name="outputFormat211" type="hidden" value="fieldname:author~nicename:Author/<br>Publisher~type:String" />
                        <input name="outputFormat212" type="hidden" value="fieldname:series~nicename:Series~type:String" />
                        <input name="outputFormat29" type="hidden" value="fieldname:id~nicename:Book ID~type:Numeric" />
                        <input name="outputFormat30" type="hidden" value="fieldname:notes~nicename:Notes~type:String" />


                        <%-- Filter - Range of Book Level --%>
                        <b>Range of Book Level</b>
                        <br />
                        <input type="hidden" name="BookRange1" />
                        <i>minimum</i>: <input name="BookRange1~Min" type="text" size="9" id="minlevel" onchange='$("#maxlevel").val($("#minlevel").val());' /><br />
                        <i>maximum</i>: <input name="BookRange1~Max" type="text" size="9"  id="maxlevel"/>
                        <br/><br/>

                        <%-- Filter - Genre --%>
                        <strong>Genre</strong>
                        <br />
                        <input type="hidden" name="FilterCategorical2" value="Table:genres~Field:id~Operator:=~Type:" />
                        <select name="FilterCategorical2">
                            <option value=""></option>
                            <mrald:dropDownList table="genres" pkColumn="id" listColumn="name" datasource="db_hutchison.props"/></select>
                        </select>
                        <br/><br/>

                        <%-- Filter - Number of copies
                        <strong>Number of copies is more than</strong><input type="text" name="Filter12" size="5"/>
                        <input type="hidden" name="Filter12" value="Table:book~Field:copy_count~Operator:&gt;~Type:String"/>
                        <br/><br/>--%>

                        <%-- Keyword search --%>
                        <strong>Keyword (only one per box)</strong>
                        <br/>
                        <input type="text" name="Filter1" size="15"/>
                        <input type="text" name="Filter1" size="15"/>
                        <input type="text" name="Filter1" size="15"/> <a onclick="loadPopup( 'keywordReport.jsp' );">(<u>Keyword list</u>)</a>
                        <input type="hidden" name="Filter1" value="Table:book~Field:keyword~Operator:pg contains~Type:String"/>
                        <br/><br/>

                        <%-- Filter - Color  --%>
                        <strong>Color</strong>
                        <br />
                        <input type="hidden" name="FilterCategorical1" value="Table:book~Field:color~Operator:=~Type:" />
                        <select name="FilterCategorical1">
                            <option value=""></option>
                            <%-- <mrald:dropDownList table="colors" pkColumn="id" listColumn="color" datasource="db_hutchison.props"/></select> --%>
                            <option value="1">Dark Blue</option>
                            <option value="2">Green</option>
                            <option value="6">Orange</option>
                            <option value="8">Red</option>
                            <option value="9">Yellow</option>
                            <option value="3">Light Blue</option>
                            <option value="4">Lime</option>
                            <option value="7">Purple</option>
                            <option value="5">Neon Red</option>
                            <option value="10">Black</option>
                        </select>
                        <br/><br/>

                        <%-- Filter - General filters --%>
                        <strong>Advanced Search</strong><br/>
                        <select name="Filter3" id="Filter3List">
                        <option />
                        <%-- <option value="Table:genres~Field:name~Type:String~SqlThread:1">Genre</option> --%>
                        <%-- <option value="Table:colors~Field:color~Type:String~SqlThread:1">Color</option> --%>
                        <option value="Table:book~Field:title~Type:String~SqlThread:1">Title</option>
                        <option value="Table:book~Field:author~Type:String~SqlThread:1">Author</option>
                        <option value="Table:book~Field:box~Type:String~SqlThread:1">Box Number</option>
                        <option value="Table:book~Field:copy_count~Type:Numeric~SqlThread:1">Number of Copies</option>
                        <option value="Table:book~Field:minlevel~Type:Numeric~SqlThread:1">Minimum Level</option>
                        <option value="Table:book~Field:maxlevel~Type:Numeric~SqlThread:1">Maximum Level</option>
                        <option value="Table:book~Field:word_count~Type:String~SqlThread:1">Word Count</option>
                        <option value="Table:book~Field:keyword~Type:String~SqlThread:1">Keywords</option>
                        <option value="Table:book~Field:series~Type:String~SqlThread:1">Series</option>
                        <% if( usertype == User.ADMIN_USER ){ %>
                            <option value="Table:book~Field:notes~Type:String~SqlThread:1">Notes</option>
                        <% } %>
                        </select>
                        <select name="Filter3">
                        <option />
                        <option value="Operator:pg contains">Contains
                              </option>
                        <option value="Operator:starts">Starts With
                              </option>
                        <option value="Operator:=">=
                              </option>
                        <option value="Operator:!=">Not equal (!=)
                              </option>
                        <option value="Operator:&lt;">&lt;
                              </option>
                        <option value="Operator:&gt;">&gt;
                              </option>
                        <option value="Operator:not like">Does Not Contain
                              </option>
                        <option value="Operator:not starts">Does Not Start With
                              </option>
                        </select>
                        <input name="Filter3" type="text" size="22" id="Filter3ListValue" />

                                <span id="popUp3">
                        <input name="dummy" type="hidden" />
                        </span>
                        <br />
                        <select name="Filter4" id="Filter4List">
                        <option />
                        <%-- <option value="Table:genres~Field:name~Type:String~SqlThread:1">Genre</option> --%>
                        <%-- <option value="Table:colors~Field:color~Type:String~SqlThread:1">Color</option> --%>
                        <option value="Table:book~Field:title~Type:String~SqlThread:1">Title</option>
                        <option value="Table:book~Field:author~Type:String~SqlThread:1">Author</option>
                        <option value="Table:book~Field:box~Type:String~SqlThread:1">Box Number</option>
                        <option value="Table:book~Field:copy_count~Type:Numeric~SqlThread:1">Number of Copies</option>
                        <option value="Table:book~Field:minlevel~Type:Numeric~SqlThread:1">Minimum Level</option>
                        <option value="Table:book~Field:maxlevel~Type:Numeric~SqlThread:1">Maximum Level</option>
                        <option value="Table:book~Field:word_count~Type:String~SqlThread:1">Word Count</option>
                        <option value="Table:book~Field:keyword~Type:String~SqlThread:1">Keywords</option>
                        <option value="Table:book~Field:series~Type:String~SqlThread:1">Series</option>
                        <% if( usertype == User.ADMIN_USER ){ %>
                            <option value="Table:book~Field:notes~Type:String~SqlThread:1">Notes</option>
                        <% } %>
                        </select>
                        <select name="Filter4">
                        <option />
                        <option value="Operator:pg contains">Contains
                              </option>
                        <option value="Operator:starts">Starts With
                              </option>
                        <option value="Operator:=">=
                              </option>
                        <option value="Operator:!=">Not equal (!=)
                              </option>
                        <option value="Operator:&lt;">&lt;
                              </option>
                        <option value="Operator:&gt;">&gt;
                              </option>
                        <option value="Operator:not like">Does Not Contain
                              </option>
                        <option value="Operator:not starts">Does Not Start With
                              </option>
                        <input name="Filter4" type="text" size="22" id="Filter4ListValue" />

                                <span id="popUp4">
                        <input name="dummy" type="hidden" />
                        </span>
                        <br />
                        <select name="Filter5" id="Filter5List">
                        <option />
                        <%-- <option value="Table:genres~Field:name~Type:String~SqlThread:1">Genre</option> --%>
                        <%-- <option value="Table:colors~Field:color~Type:String~SqlThread:1">Color</option> --%>
                        <option value="Table:book~Field:title~Type:String~SqlThread:1">Title</option>
                        <option value="Table:book~Field:author~Type:String~SqlThread:1">Author</option>
                        <option value="Table:book~Field:box~Type:String~SqlThread:1">Box Number</option>
                        <option value="Table:book~Field:copy_count~Type:Numeric~SqlThread:1">Number of Copies</option>
                        <option value="Table:book~Field:minlevel~Type:Numeric~SqlThread:1">Minimum Level</option>
                        <option value="Table:book~Field:maxlevel~Type:Numeric~SqlThread:1">Maximum Level</option>
                        <option value="Table:book~Field:word_count~Type:String~SqlThread:1">Word Count</option>
                        <option value="Table:book~Field:keyword~Type:String~SqlThread:1">Keywords</option>
                        <option value="Table:book~Field:series~Type:String~SqlThread:1">Series</option>
                        <% if( usertype == User.ADMIN_USER ){ %>
                            <option value="Table:book~Field:notes~Type:String~SqlThread:1">Notes</option>
                        <% } %>
                        </select>
                        <select name="Filter5">
                        <option />
                        <option value="Operator:pg contains">Contains
                              </option>
                        <option value="Operator:starts">Starts With
                              </option>
                        <option value="Operator:=">=
                              </option>
                        <option value="Operator:!=">Not equal (!=)
                              </option>
                        <option value="Operator:&lt;">&lt;
                              </option>
                        <option value="Operator:&gt;">&gt;
                              </option>
                        <option value="Operator:not like">Does Not Contain
                              </option>
                        <option value="Operator:not starts">Does Not Start With
                              </option>
                        </select>
                        <input name="Filter5" type="text" size="22" id="Filter5ListValue" />

                                <span id="popUp5">
                        <input name="dummy" type="hidden" />
                        </span>
                        <br />
                    </p>
                </div>
                <h3 style="border:1px solid #6e2b32;background-image: url(images/hover_link_bg.jpg);margin:0px;padding:1em;"><a href="#" style="color:#fff;;font-size:1em;">Output Options</a></h3>
                <div style="padding:1.5em;">
                    <p>
                        <div style="float:left;margin-right:10em;">
                            <input name="Select3" type="hidden" value="Table:book~Field:id~Order:1~SqlThread:1"></input>
                            <input name="Select1" type="checkbox" value="Table:genres~Field:name~Order:13~SqlThread:1" checked="">Genre</input> <br />
                            <input name="Select2" type="checkbox" value="Table:colors~Field:color~Order:15~SqlThread:1" checked="">Color</input> <br />
                            <input name="Select4" type="checkbox" value="Table:book~Field:title~Order:2~SqlThread:1" checked="">Title</input> <br />
                            <input name="Select5" type="checkbox" value="Table:book~Field:author~Order:3~SqlThread:1" checked="">Author</input> <br />
                            <input name="Select6" type="checkbox" value="Table:book~Field:box~Order:111~SqlThread:1" checked="">Box Number</input> <br />
                            <input name="Select12" type="checkbox" value="Table:book~Field:series~Order:117~SqlThread:1" checked="">Series</input><br />
                        </div><div style="float:left;margin-right:10em;">
                            <input name="Select7" type="checkbox" value="Table:book~Field:copy_count~Order:112~SqlThread:1"checked="" >Number of Copies</input> <br />
                            <input name="Select8" type="checkbox" value="Table:book~Field:minlevel~Order:113~SqlThread:1" checked="">Minimum Level</input> <br />
                            <input name="Select9" type="checkbox" value="Table:book~Field:maxlevel~Order:114~SqlThread:1" checked="">Maximum Level</input> <br />
                            <input name="Select10" type="checkbox" value="Table:book~Field:word_count~Order:115~SqlThread:1" checked="">Word Count</input> <br />
                            <input name="Select11" type="checkbox" value="Table:book~Field:keyword~Order:116~SqlThread:1" checked="">Keywords</input><br />

                        <input name="Select13" type="hidden" value="Table:book~Field:notes~Order:118~SqlThread:1" checked="">Keywords</input>

                            <%-- <sup>*</sup>Book ID is necessary if you wish to edit the books that match this query. --%>
                        </div><br clear="all"/>
                        <br/><hr/><br/>
                        Sort by
                        <select name="Sort1">
                            <option />
                            <option value="Table:genres~Field:name~Order:1~SqlThread:1">Genre</option>
                            <option value="Table:colors~Field:color~Order:1~SqlThread:1">Color</option>
                            <option value="Table:book~Field:title~Order:1~SqlThread:1">Title</option>
                            <option value="Table:book~Field:author~Order:1~SqlThread:1">Author</option>
                            <option value="Table:book~Field:box~Order:1~SqlThread:1">Box Number</option>
                            <option value="Table:book~Field:copy_count~Order:1~SqlThread:1">Number of Copies</option>
                            <option value="Table:book~Field:minlevel~Order:1~SqlThread:1">Minimum Level</option>
                            <option value="Table:book~Field:maxlevel~Order:1~SqlThread:1">Maximum Level</option>
                            <option value="Table:book~Field:word_count~Order:1~SqlThread:1">Word Count</option>
                            <option value="Table:book~Field:keyword~Order:1~SqlThread:1">Keywords</option>
                        </select>
                        <input name="Sort1" type="checkbox" value="OrderType:DESC" />Desc<br />
                        then by
                        <select name="Sort2">
                            <option />
                            <option value="Table:genres~Field:name~Order:2~SqlThread:1">Genre</option>
                            <option value="Table:colors~Field:color~Order:2~SqlThread:1">Color</option>
                            <option value="Table:book~Field:title~Order:2~SqlThread:1">Title</option>
                            <option value="Table:book~Field:author~Order:2~SqlThread:1">Author</option>
                            <option value="Table:book~Field:box~Order:2~SqlThread:1">Box Number</option>
                            <option value="Table:book~Field:copy_count~Order:2~SqlThread:1">Number of Copies</option>
                            <option value="Table:book~Field:minlevel~Order:2~SqlThread:1">Minimum Level</option>
                            <option value="Table:book~Field:maxlevel~Order:2~SqlThread:1">Maximum Level</option>
                            <option value="Table:book~Field:word_count~Order:2~SqlThread:1">Word Count</option>
                            <option value="Table:book~Field:keyword~Order:2~SqlThread:1">Keywords</option>
                        </select>
                        <input name="Sort2" type="checkbox" value="OrderType:DESC" />Desc<br />
                        then by
                        <select name="Sort3">
                            <option />
                            <option value="Table:genres~Field:name~Order:3~SqlThread:1">Genre</option>
                            <option value="Table:colors~Field:color~Order:3~SqlThread:1">Color</option>
                            <option value="Table:book~Field:title~Order:3~SqlThread:1">Title</option>
                            <option value="Table:book~Field:author~Order:3~SqlThread:1">Author</option>
                            <option value="Table:book~Field:box~Order:3~SqlThread:1">Box Number</option>
                            <option value="Table:book~Field:copy_count~Order:3~SqlThread:1">Number of Copies</option>
                            <option value="Table:book~Field:minlevel~Order:3~SqlThread:1">Minimum Level</option>
                            <option value="Table:book~Field:maxlevel~Order:3~SqlThread:1">Maximum Level</option>
                            <option value="Table:book~Field:word_count~Order:3~SqlThread:1">Word Count</option>
                            <option value="Table:book~Field:keyword~Order:3~SqlThread:1">Keywords</option>
                        </select>
                        <input name="Sort3" type="checkbox" value="OrderType:DESC" />Desc<br />
                        <div id="main-copy">
                            <input name="Link1" type="hidden" value="PrimaryLink:colors.id~SecondaryLink:book.color" />
                            <input name="Link2" type="hidden" value="PrimaryLink:genres.id~SecondaryLink:book.genre" />
                            <option value="Table:book~Field:title~Order:3~SqlThread:1">Title</option>
                            <option value="Table:book~Field:author~Order:3~SqlThread:1">Author</option>
                            <option value="Table:book~Field:box~Order:3~SqlThread:1">Box Number</option>
                            <option value="Table:book~Field:copy_count~Order:3~SqlThread:1">Number of Copies</option>
                            <option value="Table:book~Field:minlevel~Order:3~SqlThread:1">Minimum Level</option>
                            <option value="Table:book~Field:maxlevel~Order:3~SqlThread:1">Maximum Level</option>
                            <option value="Table:book~Field:word_count~Order:3~SqlThread:1">Word Count</option>
                            <option value="Table:book~Field:keyword~Order:3~SqlThread:1">Keywords</option>
                        </div>
                   </p>
                </div>
                <h3 style="border:1px solid #6e2b32;background-image: url(images/hover_link_bg.jpg);margin:0px;padding:1em;"><a href="#" style="color:#fff;font-size:1em;">Output Format</a></h3>
                <div style="padding:1.5em;">
                    <p>
                        <input type="radio" name="Format" value="browserHtml" checked="true"> Browser
                        <input type="radio" name="Format" value="excel" /> Excel
                    </p>
                </div>
            </div>
            <div align="center">
                <input type="submit" value="Retrieve Data"> <input type="reset" value="Reset Form">
            </div>
        </form>
<%@include file='footer.html'%>
