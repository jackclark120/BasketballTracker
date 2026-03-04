import Toybox.Lang;
import Toybox.WatchUi;

class BasketballTrackerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean 
    {
        var menu = new WatchUi.Menu2({:title=>"Options"});
        menu.addItem(new WatchUi.MenuItem("Exit", null, :exit, null));
        menu.addItem(new WatchUi.MenuItem("Specific Session", null, :sessions, null));
        menu.addItem(new WatchUi.MenuItem("UndoMake", null, :undoMake, null));
        menu.addItem(new WatchUi.MenuItem("UndoMiss", null, :undoMiss, null));
        menu.addItem(new WatchUi.MenuItem("Display Stats", null, :stats, null));
        menu.addItem(new WatchUi.MenuItem("Reset Stats", null, :reset, null));
        
        
        WatchUi.pushView(menu, new BasketballTrackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() 
    {
        var app = Application.getApp();

        app.incrementMadeShots();

        return true;
    }

    function onBack()
    {
        var app = Application.getApp();

        app.shotMissed();

        return true;
    }

    function onNextPage() as Boolean 
    {
        var app = Application.getApp();

        app.startLap();

        return true;
    }

}