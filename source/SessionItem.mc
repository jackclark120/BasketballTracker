/*
import Toybox.WatchUi;
import Toybox.Graphics;

class SessionItem extends WatchUi.CustomMenuItem {
    private var _label;
    private var _stats;

    function initialize(id, name, made, total) 
    {
        CustomMenuItem.initialize(id, {});
        _label = name;
        _stats = made + " / " + total;
    }

    // This draws the individual row
    function draw(dc) 
    {
        dc.clear();
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, centerY - 10, Graphics.FONT_TINY, _label, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(centerX, centerY + 12, Graphics.FONT_XTINY, _stats, Graphics.TEXT_JUSTIFY_CENTER);
    }
}
*/