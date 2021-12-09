import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;

class cistercianView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    function drawCistercian(dc, x, y, value, fontSize) {
        // Prepare pen
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.setPenWidth(8);

        // Figure out sizing values
        var STAFF_HEIGHT = fontSize;
        var CELL_SIZE = (fontSize / 2) - 24;

        // Draw staff
        var staffTop = y - (STAFF_HEIGHT / 2);
        var staffBottom = staffTop + STAFF_HEIGHT;
        dc.drawLine(x, staffTop, x, staffBottom);

        // Error out if 4 characters were not passed
        if (value.length() != 4) {
            return;
        }

        // Get digits
        var bottomLeft = value.substring(0, 1).toNumberWithBase(36);
        var bottomRight = value.substring(1, 2).toNumberWithBase(36);
        var topLeft = value.substring(2, 3).toNumberWithBase(36);
        var topRight = value.substring(3, 4).toNumberWithBase(36);

        // Draw bottom left number
        if (bottomLeft == 1) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
        }
        else if (bottomLeft == 2) {
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
        }
        else if (bottomLeft == 3) {
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom);
        }
        else if (bottomLeft == 4) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom - CELL_SIZE);
        }
        else if (bottomLeft == 5) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom - CELL_SIZE);
        }
        else if (bottomLeft == 6) {
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
        }
        else if (bottomLeft == 7) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
        }
        else if (bottomLeft == 8) {
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
        }
        else if (bottomLeft == 9) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
        }
        else if (bottomLeft == 10) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
            dc.fillCircle(x - (CELL_SIZE / 2), staffBottom - (CELL_SIZE / 2), 4);
        }
        else if (bottomLeft == 11) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom - (CELL_SIZE / 2), x, staffBottom - (CELL_SIZE / 2));
        }
        else if (bottomLeft == 12) {
            dc.drawLine(x - CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffBottom - CELL_SIZE, x - CELL_SIZE, staffBottom);
            dc.drawLine(x - (CELL_SIZE / 2), staffBottom - CELL_SIZE, x - (CELL_SIZE / 2), staffBottom);
        }
        // Draw bottom right number
        if (bottomRight == 1) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
        }
        else if (bottomRight == 2) {
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
        }
        else if (bottomRight == 3) {
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom);
        }
        else if (bottomRight == 4) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom - CELL_SIZE);
        }
        else if (bottomRight == 5) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom - CELL_SIZE);
        }
        else if (bottomRight == 6) {
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
        }
        else if (bottomRight == 7) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
        }
        else if (bottomRight == 8) {
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
        }
        else if (bottomRight == 9) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
        }
        else if (bottomRight == 10) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
            dc.fillCircle(x + (CELL_SIZE / 2), staffBottom - (CELL_SIZE / 2), 4);
        }
        else if (bottomRight == 11) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom - (CELL_SIZE / 2), x, staffBottom - (CELL_SIZE / 2));
        }
        else if (bottomRight == 12) {
            dc.drawLine(x + CELL_SIZE, staffBottom, x, staffBottom);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x, staffBottom - CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffBottom - CELL_SIZE, x + CELL_SIZE, staffBottom);
            dc.drawLine(x + (CELL_SIZE / 2), staffBottom - CELL_SIZE, x + (CELL_SIZE / 2), staffBottom);
        }
        // Draw top left number
        if (topLeft == 1) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
        }
        else if (topLeft == 2) {
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
        }
        else if (topLeft == 3) {
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop);
        }
        else if (topLeft == 4) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop + CELL_SIZE);
        }
        else if (topLeft == 5) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop + CELL_SIZE);
        }
        else if (topLeft == 6) {
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
        }
        else if (topLeft == 7) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
        }
        else if (topLeft == 8) {
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
        }
        else if (topLeft == 9) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
        }
        else if (topLeft == 10) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
            dc.fillCircle(x - (CELL_SIZE / 2), staffTop + (CELL_SIZE / 2), 4);
        }
        else if (topLeft == 11) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop + (CELL_SIZE / 2), x, staffTop + (CELL_SIZE / 2));
        }
        else if (topLeft == 12) {
            dc.drawLine(x - CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x - CELL_SIZE, staffTop + CELL_SIZE, x - CELL_SIZE, staffTop);
            dc.drawLine(x - (CELL_SIZE / 2), staffTop + CELL_SIZE, x - (CELL_SIZE / 2), staffTop);
        }
        // Draw top right number
        if (topRight == 1) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
        }
        else if (topRight == 2) {
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
        }
        else if (topRight == 3) {
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop);
        }
        else if (topRight == 4) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop + CELL_SIZE);
        }
        else if (topRight == 5) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop + CELL_SIZE);
        }
        else if (topRight == 6) {
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
        }
        else if (topRight == 7) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
        }
        else if (topRight == 8) {
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
        }
        else if (topRight == 9) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
        }
        else if (topRight == 10) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
            dc.fillCircle(x + (CELL_SIZE / 2), staffTop + (CELL_SIZE / 2), 4);
        }
        else if (topRight == 11) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop + (CELL_SIZE / 2), x, staffTop + (CELL_SIZE / 2));
        }
        else if (topRight == 12) {
            dc.drawLine(x + CELL_SIZE, staffTop, x, staffTop);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x, staffTop + CELL_SIZE);
            dc.drawLine(x + CELL_SIZE, staffTop + CELL_SIZE, x + CELL_SIZE, staffTop);
            dc.drawLine(x + (CELL_SIZE / 2), staffTop + CELL_SIZE, x + (CELL_SIZE / 2), staffTop);
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Vivoactive 3 Constants
        var FONT_SIZE = 128;
        var SPACING = 96;

        // Swim 2 Constants
        //var FONT_SIZE = 116;
        //var SPACING = 88;

        // Get time
        var clockTime = System.getClockTime();

        // Get date
        var info = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        
        // Find center point
        var xCenter = dc.getWidth() / 2;
        var yCenter = dc.getHeight() / 2;

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        // Draw the date
        drawCistercian(dc, xCenter - (SPACING / 2), yCenter, Lang.format("$1$$2$$3$", [
            info.month.format("%x"),
            info.day_of_week.format("%x"),
            info.day.format("%02d")
        ]), FONT_SIZE);
        // Draw the time
        drawCistercian(dc, xCenter + (SPACING / 2), yCenter, Lang.format("$1$$2$", [
            clockTime.hour.format("%02d"),
            clockTime.min.format("%02d")
        ]), FONT_SIZE);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
