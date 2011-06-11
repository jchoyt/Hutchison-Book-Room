<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <link rel='stylesheet' type='text/css' href='${css}/redmond/jquery-ui-1.7.2.custom.css' />
        <link rel='stylesheet' type='text/css' href='${css}/fullcalendar.css' />
        <script type="text/javascript" src="${js}/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="${js}/jquery-ui-1.7.2.custom.min.js"></script>
        <script type='text/javascript' src='${js}/ui.core.js'></script>
        <script type='text/javascript' src='${js}/ui.draggable.js'></script>
        <script type='text/javascript' src='${js}/ui.resizable.js'></script>
        <script type='text/javascript' src='${js}/fullcalendar.min.js'></script>
        <title>Hutchison Elementary School Food Delivery Schedule</title>

        <script type='text/javascript'>

            $(document).ready(function() {

                $('#calendar').fullCalendar({

                    theme: true,
                    firstDay: 1,
                    weekMode:'liquid',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },

                    // editable: true,

                    events: "hutch-month.jsp",

                    eventDrop: function(event, delta) {
                        alert(event.title + ' was moved ' + delta + ' days\n' +
                            '(should probably update your database)');
                    },

                    loading: function(bool) {
                        if (bool) $('#loading').show();
                        else $('#loading').hide();
                    }

                });

            });

        </script>
        <style type='text/css'>

            body {
                margin-top: 40px;
                text-align: center;
                font-size: 14px;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                }

            #loading {
                position: absolute;
                top: 5px;
                right: 5px;
                }

            #calendar {
                width: 900px;
                margin: 0 auto;
                }

        </style>
    </head>
    <body>
        <div id='loading' style='display:none'>loading...</div>
        <div id='calendar'></div>
        <div style="margin:auto;width:500px;padding:1em  ">
        </div>
        <a href="index.jsp">Home</a> | <a href="logout.jsp">Logout</a>
    </body>
</html>
