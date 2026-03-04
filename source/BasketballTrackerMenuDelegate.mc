import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BasketballTrackerMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) 
    {
        var id = item.getId();
        var app = Application.getApp();

        if (id == :exit) 
        {
            System.exit();
        } 
        else if (id == :reset) 
        {
            app.reset();
        }
        else if(id == :undoMake)
        {
            app.undoMake();
        }
        else if(id == :undoMiss)
        {
            app.undoMiss();
        }
        else if(id == :sessions)
        {
            var sessionMenu = new WatchUi.Menu();
            sessionMenu.addItem("Free Throw", :ft);
            sessionMenu.addItem("Right Baseline", :rbl);
            sessionMenu.addItem("Left Baseline", :lbl);
            sessionMenu.addItem("Top Key", :tk);
            sessionMenu.addItem("Right Wing", :rw);
            sessionMenu.addItem("Left Wing", :lw);
            sessionMenu.addItem("Right Corner", :rc);
            sessionMenu.addItem("Left Corner", :lc);

            WatchUi.pushView(sessionMenu, new SessionMenuDelegate(), WatchUi.SLIDE_LEFT);
        }
        else if (id == :stats)
        {
            app.saveSession();
            var sessions = app.getAllSessions();
            
            // Create a CustomMenu for scrolling
            var customMenu = new WatchUi.CustomMenu(60, Graphics.COLOR_WHITE, {
                :title => new WatchUi.Text({
                    :text => "History",
                    :color => Graphics.COLOR_YELLOW,
                    :justification => Graphics.TEXT_JUSTIFY_CENTER
                })
            });

            if (sessions.size() == 0) 
            {
                customMenu.addItem(new SessionItem(:none, "No Data", "0", "0"));
            } 
            else 
            {
                for (var i = 0; i < sessions.size(); i++) 
                {
                    var s = sessions[i];
                    // Add each session as a custom scrollable item
                    customMenu.addItem(new SessionItem(i, s["name"], s["made"], s["total"]));
                }
            }

            // Push the menu - it uses the same delegate logic as standard menus
            WatchUi.pushView(customMenu, new WatchUi.Menu2InputDelegate(), WatchUi.SLIDE_UP);
        }

    }

}