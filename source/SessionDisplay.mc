import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class SessionDisplay extends WatchUi.View
{
    function initialize()
    {
        View.initialize();
    }

    function onUpdate(dc) as Void 
    {
        // Fill background
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var app = Application.getApp();
        var sessions = app.getAllSessions();
        
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;

        var font = Graphics.FONT_TINY;
        var titleFont = Graphics.FONT_SMALL;
        var lineSpacing = dc.getFontHeight(font);

        var titleY = 30;
        dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, titleY, titleFont, "HISTORY", Graphics.TEXT_JUSTIFY_CENTER);
        
        var currentY = titleY + dc.getFontHeight(titleFont) + 5;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        if (sessions == null || sessions.size() == 0) 
        {
            dc.drawText(centerX, centerY, font, "No data yet", Graphics.TEXT_JUSTIFY_CENTER);
        } 
        else 
        {
            for (var i = 0; i < sessions.size(); i++) 
            {
                var s = sessions[i] as Dictionary;
                if(s != null) 
                {
                    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

                    var label = Lang.format("$1$: $2$/$3$", [s["name"], s["made"], s["total"]]);
                    dc.drawText(centerX, currentY, font, label, Graphics.TEXT_JUSTIFY_CENTER);
                }
                currentY += lineSpacing;
            }
        }
    }

}