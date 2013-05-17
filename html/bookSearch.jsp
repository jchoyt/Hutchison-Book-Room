<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="org.mitre.mrald.util.Config" %><%@ taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%><mrald:validate />
<%@include file='header.jsp'%>
        <script type="text/javascript">
              $(document).ready(function(){
                $("#accordion").accordion();
              });
        </script>

        <form name="form" method="POST" action="FormSubmit" enctypev="x-www-form-urlencoded">
            <input value="true" name="showQuery" type="hidden"> <input type="hidden" value="none" name="outputSize">
            <input name="Schema" type="hidden" value=""/>
            <input name="Datasource" type="hidden" value="db_preschool.props"/>
            <input name="form" type="hidden" value="Find Book"/>
            <input type="hidden" name="workflow" value="Building SQL"/>
            <div id="accordion">
                <h3 style="border:1px solid #6e2b32;background-image: url(images/hover_link_bg.jpg);margin:0px;padding:1em;"><a href="#" style="color:#fff;font-size:1em;">Filters</a></h3>
                <div style="padding:1.5em;">
                    <p>
                        <input name="outputFormat21" type="hidden" value="fieldname:isbn~nicename:ISBN~type:String"> <input name="outputFormat22" type="hidden" value="fieldname:series~nicename:Series~type:String"> <input name="outputFormat23" type="hidden" value="fieldname:title~nicename:Title~type:String"> <input name="outputFormat24" type="hidden" value="fieldname:seriesid~nicename:Series ID~type:Numeric"> <input name="outputFormat25" type="hidden" value="fieldname:author~nicename:Author~type:String"> <input name="outputFormat26" type="hidden" value="fieldname:keywords~nicename:Keywords~type:String"> <input name="outputFormat27" type="hidden" value="fieldname:summary~nicename:Summary~type:String"> <input name="outputFormat28" type="hidden" value="fieldname:publisher~nicename:Publisher~type:String"> <input name="outputFormat29" type="hidden" value="fieldname:shelved~nicename:Shelving Location~type:String"> <input name="outputFormat210" type="hidden" value="fieldname:count~nicename:Count~type:Numeric">
                            <strong>Shelving Location</strong>
                            <br/>
                            <input type="hidden" name="FilterCategorical1" value="Table:book~Field:shelved~Operator:=~Type:String"/>
                            <select name="FilterCategorical1">
                            <option value=""/>
                                        <mrald:dropDownList table="book" pkColumn="shelved" listColumn="shelved" datasource="db_preschool.props"/></select>
                            <br/><br/>
                            <strong>Number of copies is more than</strong><input type="text" name="Filter2" size="5"/>
                            <input type="hidden" name="Filter1" value="Table:book~Field:count~Operator:&gt;~Type:Numeric"/>
                            <br/><br/>
                            <strong>Keyword (only one)</strong>
                            <br/>
                            <input type="text" name="Filter1" size="15"/>
                            <input type="text" name="Filter1" size="15"/>
                            <input type="text" name="Filter1" size="15"/>
                            <input type="hidden" name="Filter1" value="Table:book~Field:keywords~Operator:pg contains~Type:String"/>
                            <br/><br/>
                            <strong>General Filters</strong> - Select field, operator, and filter value<br/>
                            <select name="Filter2" id="Filter2List">
                                <option/>
                                <option value="Table:book~Field:isbn~Type:String">
                                    ISBN</option>
                                <option value="Table:book~Field:title~Type:String">
                                    Title</option>
                                <option value="Table:book~Field:seriesid~Type:Numeric">
                                    Series ID</option>
                                <option value="Table:book~Field:author~Type:String">
                                    Author</option>
                                <option value="Table:book~Field:keywords~Type:String">
                                    Keywords</option>
                                <option value="Table:book~Field:summary~Type:String">
                                    Summary</option>
                                <option value="Table:book~Field:publisher~Type:String">
                                    Publisher</option>
                                <option value="Table:book~Field:shelved~Type:String">
                                    Shelving Location</option>
                                <option value="Table:book~Field:count~Type:Numeric">
                                    Count</option>
                                <option value="Table:book~Field:series~Type:String">
                                    Series</option>
                            </select> <select name="Filter2">
                                <option value="Operator:pg contains">
                                    Contains</option>
                                <option value="Operator:=">
                                    Equals (=)</option>
                                <option value="Operator:!=">
                                    Not equal (!=)</option>
                                <option value="Operator:&lt;">
                                    &lt;</option>
                                <option value="Operator:&gt;">
                                    &gt;</option>
                                <option value="Operator:&lt;=">
                                    &lt;=</option>
                                <option value="Operator:&gt;=">
                                    &gt;=</option>
                                <option value="Operator:IN">
                                    IN</option>
                                <option value="Operator:NOT IN">
                                    NOT IN</option>
                                <option value="Operator:IS NULL">
                                    IS NULL</option>
                                <option value="Operator:IS NOT NULL">
                                    IS NOT NULL</option>
                            </select> <input name="Filter2" type="text" size="22" id="Filter2ListValue"><br/>
                            <select name="Filter3" id="Filter3List">
                                <option/>
                                <option value="Table:book~Field:isbn~Type:String">
                                    ISBN</option>
                                <option value="Table:book~Field:title~Type:String">
                                    Title</option>
                                <option value="Table:book~Field:seriesid~Type:Numeric">
                                    Series ID</option>
                                <option value="Table:book~Field:author~Type:String">
                                    Author</option>
                                <option value="Table:book~Field:keywords~Type:String">
                                    Keywords</option>
                                <option value="Table:book~Field:summary~Type:String">
                                    Summary</option>
                                <option value="Table:book~Field:publisher~Type:String">
                                    Publisher</option>
                                <option value="Table:book~Field:shelved~Type:String">
                                    Shelving Location</option>
                                <option value="Table:book~Field:count~Type:Numeric">
                                    Count</option>
                                <option value="Table:book~Field:series~Type:String">
                                    Series</option>
                            </select> <select name="Filter3">
                                <option value="Operator:pg contains">
                                    Contains</option>
                                <option value="Operator:=">
                                    Equals (=)</option>
                                <option value="Operator:!=">
                                    Not equal (!=)</option>
                                <option value="Operator:&lt;">
                                    &lt;</option>
                                <option value="Operator:&gt;">
                                    &gt;</option>
                                <option value="Operator:&lt;=">
                                    &lt;=</option>
                                <option value="Operator:&gt;=">
                                    &gt;=</option>
                                <option value="Operator:IN">
                                    IN</option>
                                <option value="Operator:NOT IN">
                                    NOT IN</option>
                                <option value="Operator:IS NULL">
                                    IS NULL</option>
                                <option value="Operator:IS NOT NULL">
                                    IS NOT NULL</option>
                            </select> <input name="Filter3" type="text" size="22" id="Filter3ListValue"><br/>
                            <select name="Filter4" id="Filter4List">
                                <option/>
                                <option value="Table:book~Field:isbn~Type:String">
                                    ISBN</option>
                                <option value="Table:book~Field:title~Type:String">
                                    Title</option>
                                <option value="Table:book~Field:seriesid~Type:Numeric">
                                    Series ID</option>
                                <option value="Table:book~Field:author~Type:String">
                                    Author</option>
                                <option value="Table:book~Field:keywords~Type:String">
                                    Keywords</option>
                                <option value="Table:book~Field:summary~Type:String">
                                    Summary</option>
                                <option value="Table:book~Field:publisher~Type:String">
                                    Publisher</option>
                                <option value="Table:book~Field:shelved~Type:String">
                                    Shelving Location</option>
                                <option value="Table:book~Field:count~Type:Numeric">
                                    Count</option>
                                <option value="Table:book~Field:series~Type:String">
                                    Series</option>
                            </select> <select name="Filter4">
                                <option value="Operator:pg contains">
                                    Contains</option>
                                <option value="Operator:=">
                                    Equals (=)</option>
                                <option value="Operator:!=">
                                    Not equal (!=)</option>
                                <option value="Operator:&lt;">
                                    &lt;</option>
                                <option value="Operator:&gt;">
                                    &gt;</option>
                                <option value="Operator:&lt;=">
                                    &lt;=</option>
                                <option value="Operator:&gt;=">
                                    &gt;=</option>
                                <option value="Operator:IN">
                                    IN</option>
                                <option value="Operator:NOT IN">
                                    NOT IN</option>
                                <option value="Operator:IS NULL">
                                    IS NULL</option>
                                <option value="Operator:IS NOT NULL">
                                    IS NOT NULL</option>
                            </select> <input name="Filter4" type="text" size="22" id="Filter4ListValue"><br/>

                    </p>
                </div>
                <h3 style="border:1px solid #6e2b32;background-image: url(images/hover_link_bg.jpg);margin:0px;padding:1em;"><a href="#" style="color:#fff;;font-size:1em;">Output Options</a></h3>
                <div style="padding:1.5em;">
                    <p>
                        <div style="float:left;margin-right:10em;">
                            <input name="Select2" type="checkbox" value="Table:book~Field:title~Order:2" checked="">Title<br/>
                            <input name="Select3" type="checkbox" value="Table:book~Field:seriesid~Order:3" checked="">Series ID<br/>
                            <input name="Select4" type="checkbox" value="Table:book~Field:author~Order:4" checked="">Author<br/>
                            <input name="Select5" type="checkbox" value="Table:book~Field:keywords~Order:5" checked="">Keywords<br/>
                            <input name="Select6" type="checkbox" value="Table:book~Field:summary~Order:6" checked="">Summary<br/>
                        </div><div style="float:left;margin-right:10em;">
                            <input name="Select7" type="checkbox" value="Table:book~Field:publisher~Order:7" >Publisher<br/>
                            <input name="Select8" type="checkbox" value="Table:book~Field:shelved~Order:8" checked="">Shelving Location<br/>
                            <input name="Select9" type="checkbox" value="Table:book~Field:count~Order:9" checked="">Count<br/>
                            <input name="Select1" type="checkbox" value="Table:book~Field:isbn~Order:9.5" checked="">ISBN<sup>*</sup><br/>
                            <input name="Select10" type="checkbox" value="Table:book~Field:series~Order:10">Series<br/>
                            <sup>*</sup>ISBN is necessary if you wish to edit the books that match this query.
                        </div><br clear="all"/>
                        <br/><hr/><br/>
                        Sort by <select name="Sort1">
                            <option value="" selected="true"/>
                            <option value="Table:book~Field:isbn~Order:1">ISBN</option>
                            <option value="Table:book~Field:title~Order:1">Title</option>
                            <option value="Table:book~Field:seriesid~Order:1">Series ID</option>
                            <option value="Table:book~Field:author~Order:1">Author</option>
                            <option value="Table:book~Field:keywords~Order:1">Keywords</option>
                            <option value="Table:book~Field:summary~Order:1">Summary</option>
                            <option value="Table:book~Field:publisher~Order:1">Publisher</option>
                            <option value="Table:book~Field:shelved~Order:1">Shelving Location</option>
                            <option value="Table:book~Field:count~Order:1">Count</option>
                            <option value="Table:book~Field:series~Order:1">Series</option>
                        </select> <input name="Sort1" type="checkbox" value="OrderType:DESC">Desc
                        then by <select name="Sort2">
                            <option value="" selected="true"/>
                            <option value="Table:book~Field:isbn~Order:2">ISBN</option>
                            <option value="Table:book~Field:title~Order:2">Title</option>
                            <option value="Table:book~Field:seriesid~Order:2">Series ID</option>
                            <option value="Table:book~Field:author~Order:2">Author</option>
                            <option value="Table:book~Field:keywords~Order:2">Keywords</option>
                            <option value="Table:book~Field:summary~Order:2">Summary</option>
                            <option value="Table:book~Field:publisher~Order:2">Publisher</option>
                            <option value="Table:book~Field:shelved~Order:2">Shelving Location</option>
                            <option value="Table:book~Field:count~Order:2">Count</option>
                            <option value="Table:book~Field:series~Order:2">Series</option>
                        </select> <input name="Sort2" type="checkbox" value="OrderType:DESC">Desc
                        then by <select name="Sort3">
                            <option value="" selected="true"/>
                            <option value="Table:book~Field:isbn~Order:3">ISBN</option>
                            <option value="Table:book~Field:title~Order:3">Title</option>
                            <option value="Table:book~Field:seriesid~Order:3">Series ID</option>
                            <option value="Table:book~Field:author~Order:3">Author</option>
                            <option value="Table:book~Field:keywords~Order:3">Keywords</option>
                            <option value="Table:book~Field:summary~Order:3">Summary</option>
                            <option value="Table:book~Field:publisher~Order:3">Publisher</option>
                            <option value="Table:book~Field:shelved~Order:3">Shelving Location</option>
                            <option value="Table:book~Field:count~Order:3">Count</option>
                            <option value="Table:book~Field:series~Order:3">Series</option>
                        </select> <input name="Sort3" type="checkbox" value="OrderType:DESC">Desc
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
