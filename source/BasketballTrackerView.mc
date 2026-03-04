import Toybox.Graphics;
import Toybox.WatchUi;

class BasketballTrackerView extends WatchUi.View 
{
    var Shots;
    var TotalShots;
    var Location;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void 
    {
        Shots = View.findDrawableById("Shots");
        TotalShots = View.findDrawableById("TotalShots");
        Location = View.findDrawableById("SessionTitle");
    }

    // Update the view
    function onUpdate(dc as Dc) as Void 
    {
        var app = Application.getApp();
        var currentMade = app.getSesShots();
        var currentTotal = app.getSesTotal();
        Shots.setText(currentMade.toString() + "/" + currentTotal.toString());

        var overallMade = app.getShots();
        var overallTotal = app.getTotal();
        TotalShots.setText(overallMade.toString() + "/" + overallTotal.toString());

        var displayTitle = app.getSession();
        Location.setText(displayTitle);
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
