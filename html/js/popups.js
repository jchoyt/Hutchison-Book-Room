/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/o
 *
 * Copyright (c) 2009 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js 185 2009-02-09 21:51:12Z emartin24 $
 *
 */
function loadPopup( file )
{
    $('#popup').load( file , "test", function(){
        $("#newpopup").addClass("ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix")
        $("#newpopup").dialog();
    });

}
