//{{{ on page ready
var myLayout; // init global vars
$(document).ready( function() {

    myLayout = $('body').layout({
        // RESIZE Accordion widget when panes resize
        // west__onresize:		function () { $("#accordion1").accordion("resize"); },
        //east__onresize:		function () { $("#accordion").accordion("resize"); },
        east:  {initClosed: false, slideTrigger_open: "click", size: 350 },
        west: { size: 320, resizable: false },
        north:  {initClosed: true }
    });

        // ACCORDION - in the East pane - in a 'content-div'
    $("#accordion").accordion({
        //fillSpace: true,
        active: 1,
        collapsible: true,
        autoHeight: false
    });

    $("#west-sections").addClass("ui-accordion ui-widget ui-helper-reset")
    .find("h6")
        .addClass("ui-accordion-header ui-helper-reset ui-state-default ui-corner-top ui-corner-bottom")
        .prepend('<span class="ui-icon ui-icon-triangle-1-e"/>')
        .click(function() {
            $(this).toggleClass("ui-accordion-header-active").toggleClass("ui-state-active")
                .toggleClass("ui-state-default").toggleClass("ui-corner-bottom")
            .find("> .ui-icon").toggleClass("ui-icon-triangle-1-e").toggleClass("ui-icon-triangle-1-s")
            .end().next().toggleClass("ui-accordion-content-active").toggle();
            return false;
        })
        .next().addClass("ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom").hide();


    $("#center-sections").addClass("ui-accordion ui-widget ui-helper-reset")
    .find("h6")
        .addClass("ui-accordion-header ui-helper-reset ui-state-default ui-corner-top ui-corner-bottom")
        .prepend('<span class="ui-icon ui-icon-triangle-1-e"/>')
        .click(function() {
            $(this).toggleClass("ui-accordion-header-active").toggleClass("ui-state-active")
                .toggleClass("ui-state-default").toggleClass("ui-corner-bottom")
            .find("> .ui-icon").toggleClass("ui-icon-triangle-1-e").toggleClass("ui-icon-triangle-1-s")
            .end().next().toggleClass("ui-accordion-content-active").toggle();
            return false;
        })
        .next().addClass("ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom").hide();

    $("#map").click();
    $("#occupants").click();
    $("#critters").click();
    $("#msgs-hdr").click();
    $("#basic").click();

    // assumption is on polling, we do $(document).trigger('POLL_COMPLETE', <json data>);
    $(document).bind('POLL_COMPLETE', function(e, data){ updateMessagePane(data); });
    $(document).bind('POLL_COMPLETE', function(e, data){ updateOccupantPane(data); });
    $(document).bind('POLL_COMPLETE', function(e, data){ updateInventory(data); });
    $(document).bind('POLL_COMPLETE', function(e, data){ updateAnnouncements(data); });
    $(document).bind('POLL_COMPLETE', function(e, data){ updateStats(data); });
    $(document).bind('POLL_COMPLETE', function(e, data){ updateStats2(data); });

    // setInterval( "poll()", 10000);

    //set popup menu
    $.pop();

}); //}}}

//{{{ GUI updates
function poll()
{
    $("#poll-indicator").show();
    $.getJSON("/poll", function(json){
        $(document).trigger('POLL_COMPLETE', json)
    });
    $("#poll-indicator").hide();
}


function updateMessagePane(data)
{
    if(data.msgs)
    {
        $("#msg-box").html(v2js_messages(data));
        $("#amessages").attr({ scrollTop: $("#amessages").attr("scrollHeight") });
    }
}

function updateOccupantPane(data)
{
    /* if(data.occs)
    {
        $('#occ-pane').html("");
        $.each(data.occs, function(i, item){
            $('#occ-pane').append( item.name );
        });
    } */
    if(data.occs)
    {
        $('#occ-pane').html( v2js_occupants(data) );
        $('#attacklist').html( v2js_attacklist(data) );
    }
    else
    {
        $('#occ-pane').html("");
        $('#attacklist').html("");
    }
}

function updateInventory(data)
{
    if(data.inv)
    {
        $("#inv-body").html( v2js_inventory(data) );
        $("#equiplist").html( v2js_equiplist(data) );
    }
    else
    {
        $("#inv-body").html( "" );
        $("#equiplist").html( "" );
    }
}

function updateAnnouncements(data)
{
    if(data.announce)
    {
        $('#announcements').html(v2js_announcements(data));
    }
    else
    {
        $('#announcements').html("");
    }
}

function updateStats(data)
{
    if(data.stats)
    {
        $('#stats-area').html(v2js_stats(data));
    }
}

function updateStats2(data)
{
    if(data.stats)
    {
        $('#stats-area2').html(v2js_stats2(data));
    }
}
//}}}

//{{{ Actions

function drop( itemid )
{
    var url = "drop.jsp?itemid=" + itemid;
    $.getJSON(url, function(json){
        //$(document).trigger('POLL_COMPLETE', json)
        $(document).trigger('POLL_COMPLETE', json)
    });
}

function eat( itemid )
{
    var url = "eat.jsp?itemid=" + itemid;
    $.getJSON(url, function(json){
        //$(document).trigger('POLL_COMPLETE', json)
        $(document).trigger('POLL_COMPLETE', json)
    });
}

function drink( itemid )
{
    var url = "drink.jsp?itemid=" + itemid;
    $.getJSON(url, function(json){
        //$(document).trigger('POLL_COMPLETE', json)
        $(document).trigger('POLL_COMPLETE', json)
    });
}

function dosearch( reps )
{
    var url = "search.jsp?count=" + reps;
    $.getJSON(url, function(json){
        // alert(json);
        //$(document).trigger('POLL_COMPLETE', json)
        $(document).trigger('POLL_COMPLETE', json)
    });
}

function attack( targetid )
{
    var url = "attack.jsp?target=" + targetid;
    $.getJSON(url, function(json){
        $(document).trigger('POLL_COMPLETE', json)
    });
}

//}}}

