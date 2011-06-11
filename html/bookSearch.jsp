r<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="org.mitre.mrald.util.Config" %><%@ taglib uri="/WEB-INF/tlds/mrald.tld" prefix="mrald"%><mrald:validate />
<%@include file='header.html'%>
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
                        <input name="outputFormat21" type="hidden" value="fieldname:level~nicename:Level~type:String">
                        <input name="outputFormat22" type="hidden" value="fieldname:box~nicename:Box Number~type:String">
                        <input name="outputFormat23" type="hidden" value="fieldname:title~nicename:Title~type:String">
                        <input name="outputFormat24" type="hidden" value="fieldname:word_count~nicename:Word Count~type:String">
                        <input name="outputFormat25" type="hidden" value="fieldname:author~nicename:Author~type:String">
                        <input name="outputFormat26" type="hidden" value="fieldname:keyword~nicename:Keywords~type:String">
                        <input name="outputFormat27" type="hidden" value="fieldname:id~nicename:ID~type:String">
                        <input name="outputFormat29" type="hidden" value="fieldname:color~nicename:Color~type:String">
                        <input name="outputFormat210" type="hidden" value="fieldname:copy_count~nicename:Number of Copies~type:String">
                            <strong>Color</strong>
                            <br/>
                            <input type="hidden" name="FilterCategorical1" value="Table:book~Field:color~Operator:=~Type:String"/>
                            <select name="FilterCategorical1">
                            <option value=""/>
                                        <mrald:dropDownList table="colors" pkColumn="id" listColumn="color" datasource="db_hutchison.props"/></select>
                            <br/><br/>
                            <strong>Number of copies is more than</strong><input type="text" name="Filter12" size="5"/>
                            <input type="hidden" name="Filter12" value="Table:book~Field:copy_count~Operator:&gt;~Type:String"/>
                            <br/><br/>
                            <strong>Keyword (only one)</strong>
                            <br/>
                            <input type="text" name="Filter1" size="15"/>
                            <input type="text" name="Filter1" size="15"/>
                            <input type="text" name="Filter1" size="15"/>
                            <input type="hidden" name="Filter1" value="Table:book~Field:keyword~Operator:pg contains~Type:String"/>
                            <br/><br/>
                            <strong>General Filters</strong> - Select field, operator, and filter value<br/>
                            <select name="Filter2" id="Filter2List">
                                <option/>
                                <option value="Table:book~Field:level~Type:String">
                                    Level</option>
                                <option value="Table:book~Field:title~Type:String">
                                    Title</option>
                                <option value="Table:book~Field:word_count~Type:String">
                                    Word Count</option>
                                <option value="Table:book~Field:author~Type:String">
                                    Author</option>
                                <option value="Table:book~Field:keyword~Type:String">
                                    Keywords</option>
                                <option value="Table:book~Field:summary~Type:String">
                                    Summary</option>
                                    Publisher</option>
                                <option value="Table:book~Field:color~Type:String">
                                    Color</option>
                                <option value="Table:book~Field:copy_count~Type:String">
                                    Number of Copies</option>
                                <option value="Table:book~Field:box~Type:String">
                                    Box Number</option>
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
                                <option value="Table:book~Field:level~Type:String">
                                    Level</option>
                                <option value="Table:book~Field:title~Type:String">
                                    Title</option>
                                <option value="Table:book~Field:word_count~Type:String">
                                    Word Count</option>
                                <option value="Table:book~Field:author~Type:String">
                                    Author</option>
                                <option value="Table:book~Field:keyword~Type:String">
                                    Keywords</option>
                                <option value="Table:book~Field:summary~Type:String">
                                    Summary</option>
                                    Publisher</option>
                                <option value="Table:book~Field:color~Type:String">
                                    Color</option>
                                <option value="Table:book~Field:copy_count~Type:String">
                                    Number of Copies</option>
                                <option value="Table:book~Field:box~Type:String">
                                    Box Number</option>
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
                                <option value="Table:book~Field:level~Type:String">
                                    Level</option>
                                <option value="Table:book~Field:title~Type:String">
                                    Title</option>
                                <option value="Table:book~Field:word_count~Type:String">
                                    Word Count</option>
                                <option value="Table:book~Field:author~Type:String">
                                    Author</option>
                                <option value="Table:book~Field:keyword~Type:String">
                                    Keywords</option>
                                <option value="Table:book~Field:summary~Type:String">
                                    Summary</option>
                                    Publisher</option>
                                <option value="Table:book~Field:color~Type:String">
                                    Color</option>
                                <option value="Table:book~Field:copy_count~Type:String">
                                    Number of Copies</option>
                                <option value="Table:book~Field:box~Type:String">
                                    Box Number</option>
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
                            <input name="Select3" type="checkbox" value="Table:book~Field:word_count~Order:3" checked="">Word Count<br/>
                            <input name="Select4" type="checkbox" value="Table:book~Field:author~Order:4" checked="">Author<br/>
                            <input name="Select5" type="checkbox" value="Table:book~Field:keyword~Order:5">Keywords<br/>
                            <input name="Select6" type="checkbox" value="Table:book~Field:id~Order:6">ID<br/>
                        </div><div style="float:left;margin-right:10em;">
                            <input name="Select8" type="checkbox" value="Table:book~Field:color~Order:8" checked="">Color<br/>
                            <input name="Select9" type="checkbox" value="Table:book~Field:copy_count~Order:9" checked="">Number of Copies<br/>
                            <input name="Select1" type="checkbox" value="Table:book~Field:level~Order:9.5" checked="">Level<sup></sup><br/>
                            <input name="Select10" type="checkbox" value="Table:book~Field:box~Order:10" checked="">Box Number<br/>
                            <sup>*</sup>ID is necessary if you wish to edit the books that match this query.
                        </div><br clear="all"/>
                        <br/><hr/><br/>
                        Sort by <select name="Sort1">
                            <option value="" selected="true"/>
                            <option value="Table:book~Field:level~Order:1">Level</option>
                            <option value="Table:book~Field:title~Order:1">Title</option>
                            <option value="Table:book~Field:word_count~Order:1">Word Count</option>
                            <option value="Table:book~Field:author~Order:1">Author</option>
                            <option value="Table:book~Field:keyword~Order:1">Keywords</option>
                            <option value="Table:book~Field:summary~Order:1">Summary</option>
                            <option value="Table:book~Field:color~Order:1">Color</option>
                            <option value="Table:book~Field:copy_count~Order:1">Number of Copies</option>
                            <option value="Table:book~Field:box~Order:1">Box Number</option>
                        </select> <input name="Sort1" type="checkbox" value="OrderType:DESC">Desc
                        then by <select name="Sort2">
                            <option value="" selected="true"/>
                            <option value="Table:book~Field:level~Order:2">Level</option>
                            <option value="Table:book~Field:title~Order:2">Title</option>
                            <option value="Table:book~Field:word_count~Order:2">Word Count</option>
                            <option value="Table:book~Field:author~Order:2">Author</option>
                            <option value="Table:book~Field:keyword~Order:2">Keywords</option>
                            <option value="Table:book~Field:summary~Order:2">Summary</option>
                            <option value="Table:book~Field:color~Order:2">Color</option>
                            <option value="Table:book~Field:copy_count~Order:2">Number of Copies</option>
                            <option value="Table:book~Field:box~Order:2">Box Number</option>
                        </select> <input name="Sort2" type="checkbox" value="OrderType:DESC">Desc
                        then by <select name="Sort3">
                            <option value="" selected="true"/>
                            <option value="Table:book~Field:level~Order:3">Level</option>
                            <option value="Table:book~Field:title~Order:3">Title</option>
                            <option value="Table:book~Field:word_count~Order:3">Word Count</option>
                            <option value="Table:book~Field:author~Order:3">Author</option>
                            <option value="Table:book~Field:keyword~Order:3">Keywords</option>
                            <option value="Table:book~Field:summary~Order:3">Summary</option>
                            <option value="Table:book~Field:color~Order:3">Color</option>
                            <option value="Table:book~Field:copy_count~Order:3">Number of Copies</option>
                            <option value="Table:book~Field:box~Order:3">Box Number</option>
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
