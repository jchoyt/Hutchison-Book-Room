/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2009 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js 185 2009-02-09 21:51:12Z emartin24 $
 *
 */

$(document).ready(function () {
    $('#globalLink').click(function (e) {
        if($("#globalSearch").css("display") == "none")
            $("#globalSearch").css("display", "inherit");
        else
            $("#globalSearch").css("display", "none");
    });

    $('#shelfLink').click(function (e) {
        // if($("#addShelfLoc").css("display") == "none")
        //     $("#addShelfLoc").css("display", "inherit");
        // else
        //     $("#addShelfLoc").css("display", "none");
        $("#addShelfLoc").addClass("ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix")
        $("#addShelfLoc").dialog();
    });

    //TODO put in catch for ctrl+f
});
