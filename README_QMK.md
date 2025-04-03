# QMK for our keyboard

Following [instructions](https://johnmu.com/basic-qmk-keyboard/)

`qmk new-keyboard`

    Keyboard name:  eric_84_key

Told it our github info, using a dev-board pro-micro and no default layout.
The navigate to `keyboards/eric_84_key` and edit `keyboard.json` to as below
to set matrix pins etc.

Getting a working config was a pain.  The `matrix_pins` came from the schematic.
The `LAYOUT` section was created partly by the (now completely obsolete) https://qmk.fm/converter/
and hand-editing.

In `layout.c` started with a similar layout and hand-edited the changes.

Copied the working `keyboard.json` and `layout.c` to Git at `my_84/qmk/eric_84_key`
in this repo.  

Build instructions:

    qmk compile -kb eric_84_key -km default
	qmk flash -kb eric_84_key -km default
	
No problem reloading "live" keyboard as long as you have access to the reset button.

## Notes on on Xubuntu 24.04 update

(install gcc-avr, avr-libc, avrdude)

	$ sudo apt install pipx
    $ pipx install qmk
    $ sudo usermod -a -G dialout $USER

Then fix the link in `.local/bin` to `../share/pipx/venvs/qmk/bin/qmk`

