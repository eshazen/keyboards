# QMK for our keyboard

Following [instructions](https://johnmu.com/basic-qmk-keyboard/)

`qmk new-keyboard`

    Keyboard name:  eric_84_key

Told it our github info, using a dev-board pro-micro and no default layout.
The navigate to `keyboards/eric_84_key` and edit `keyboard.json` to as below
to set matrix pins etc.

Copied the working `keyboard.json` and `layout.c` to Git at `my_84/qmk/eric_84_key`
in this repo.  It was a pain.  The `matrix_pins` came from the schematic.
The `LAYOUT` section was created partly by the (now completely obsolete) https://qmk.fm/converter/
and hand-editing.

In `layout.c` started with a similar layout and hand-edited the changes.

Now it seems to work (tested just <ENTER> with a jumper key).

Build instructions:

    qmk compile -kb eric_84_key -km default
	qmk flash -kb eric_84_key -km default
	
Seems to recognize the Arduino Micro boot loader no problem.
When the programmed device is plugged in it is recognized
as a keyboard!
