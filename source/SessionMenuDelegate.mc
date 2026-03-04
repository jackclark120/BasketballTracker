import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class SessionMenuDelegate extends WatchUi.Menu2InputDelegate 
{
    function initialize() 
    {
        Menu2InputDelegate.initialize();
    }

    function onMenuItem(item)
    {
        var app = Application.getApp();
        var session = "";

        if(item == :ft)
        {
            session = "Free Throw";
        }
        else if(item == :rbl)
        {
            session = "Right Baseline";
        }
        else if(item == :lbl)
        {
            session = "Left Baseline";
        }
        else if(item == :tk)
        {
            session = "Top of the Key";
        }
        else if(item == :rw)
        {
            session = "Right Wing";
        }
        else if (item == :lw)
        {
            session = "Left Wing";
        }
        else if (item == :rc)
        {
            session = "Right Corner";
        }
        else if(item == :lc)
        {
            session = "Left Corner";
        }

        app.startLap();
        app.setSession(session);
        WatchUi.popView(WatchUi.SLIDE_UP);
    }

}