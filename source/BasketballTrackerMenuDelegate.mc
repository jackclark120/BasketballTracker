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
            WatchUi.popView(WatchUi.SLIDE_UP);
        }
        else if(id == :undoMake)
        {
            app.undoMake();
            WatchUi.popView(WatchUi.SLIDE_UP);
        }
        else if(id == :undoMiss)
        {
            app.undoMiss();
            WatchUi.popView(WatchUi.SLIDE_UP);
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
        
            // Instead of building a complex menu, just push your new View
            // We use a basic BehaviorDelegate so the user can exit the view
            WatchUi.pushView(
                new SessionDisplay(), 
                new WatchUi.BehaviorDelegate(), 
                WatchUi.SLIDE_UP
            );
        }

    }

}