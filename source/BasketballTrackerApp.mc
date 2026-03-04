import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class BasketballTrackerApp extends Application.AppBase {

    private var sessionTotal = 0;
    private var sessionMade = 0;
    private var totalShots = 0;
    private var madeShots = 0;
    private var SessionId = "Warm-Up";
    private var allSessions as Array<Dictionary> = [];

    function saveSession() as Void
    {
        var found = false;

        for(var i = 0; i < allSessions.size(); i++)
        {
            var session = allSessions[i] as Dictionary;
            if(session["name"] == SessionId)
            {
                session["made"] += sessionMade;
                session["total"] += sessionTotal;
                found = true;
                break;
            }
        }

        if(!found && sessionTotal != 0)
        {
            var session =
            {
                "name" => SessionId,
                "made" => sessionMade,
                "total" => sessionTotal
            };

            allSessions.add(session);
        }
    }

    function getAllSessions()
    {
        return allSessions;
    }

    function setSession(string)
    {
        SessionId = string;
    }

    function getSession()
    {
        return SessionId;
    }

    function undoMake()
    {
        if(sessionMade > 0)
        {
            sessionTotal --;
            totalShots --;
            madeShots--;
            sessionMade--;
        }
    }

    function undoMiss()
    {
        if(sessionTotal > 0)
        {
            sessionTotal--;
            totalShots--;
        }
    }

    function initialize() 
    {
        AppBase.initialize();
    }

    function getSesShots()
    {
        return sessionMade;
    }

    function getSesTotal()
    {
        return sessionTotal;
    }

    function getShots()
    {
        return madeShots;
    }

    function getTotal()
    {
        return totalShots;
    }

    function reset()
    {
        sessionMade = 0;
        sessionTotal = 0;
        madeShots = 0;
        totalShots = 0;
    }

    function shotMissed()
    {
        sessionTotal++;
        totalShots++;
        System.println("Total Made: " + madeShots + " out of " + totalShots);

        WatchUi.requestUpdate();
    }

    function incrementMadeShots() 
    {
        sessionMade++;
        sessionTotal++;
        madeShots++;
        totalShots++;
        System.println("Total Made: " + madeShots + " out of " + totalShots);
        
        // This forces the screen to refresh so you see the new number
        WatchUi.requestUpdate();
    }

    function startLap()
    {
        saveSession();

        sessionMade = 0;
        sessionTotal = 0;
        System.println("Reset session");

        WatchUi.requestUpdate();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void 
    {

    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new BasketballTrackerView(), new BasketballTrackerDelegate() ];
    }

}

function getApp() as BasketballTrackerApp {
    return Application.getApp() as BasketballTrackerApp;
}