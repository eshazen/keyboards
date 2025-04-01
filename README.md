# Keyboard project(s)

<img src="https://github.com/eshazen/keyboards/blob/main/photo_1.jpg width=600">
<p>

## Status

All done, working!  Used QMK for the firmware.  See `my_84/qmk/eric_84/key` for modified
`keyboard.json` and `keymaps/default/keymap.c`.  See [README.qmk](README.qmk).

To change layout, edit `~/qmk_firmware/keyboards/eric_84_key/keymaps/default/keymap.c`.
Then re-flash with:

    qmk flash -kb eric_84_key -km default

(This can be done "live" as long as you have access to the Arduino reset button).

In summary, created the layout in KLE, generated the plate and case
geometry in `swillkb.com`, and the PCB using the `kbplacer` plugin for
KiCAD.  Firmware generated using `qmk`.

## Tools:

* [KLE](https://www.keyboard-layout-editor.com)
* [Plate & Case Builder](http://builder.swillkb.com/) (from [github](https://github.com/vladantrhlik/Keyboard_case_generator?tab=readme-ov-file))
* [kbplacer plugin](https://github.com/adamws/kicad-kbplacer) for KiCAD

## References

* [PCB video](https://www.youtube.com/watch?v=u13yRbBiRYM&t=10s)
* [Case video](https://www.youtube.com/watch?v=NIIr19TdidY)
* [Building Keyboards with Lasers](https://kbd.news/Building-keyboards-with-lasers-2208.html)
* [Keyboard University](https://www.keyboard.university/)
* [Pro Micro up to 100 pins](https://golem.hu/guide/pro-micro/)

Also used 

## My 84 key

<ul>
    [{a:6},"Esc","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",{a:7},"PrtSc","Shell","Pause"],
    [{a:4},"~\n`","!\n1","@\n2","#\n3","$\n4","%\n5","^\n6","&\n7","*\n8","(\n9",")\n0","_\n-","+\n=",{a:6,w:2},"Backspace",{a:7},"Insert"],
    [{a:4,w:1.5},"Tab","Q","W","E","R","T","Y","U","I","O","P","{\n[","}\n]",{w:1.5},"|\n\\",{a:6},"Delete"],
    [{w:1.75},"Control",{a:4},"A","S","D","F","G","H","J","K","L",":\n;","\"\n'",{a:6,w:2.25},"Enter","Page Up"],
    [{w:2.25},"Shift",{a:4},"Z","X","C","V","B","N","M","<\n,",">\n.","?\n/",{a:6,w:1.75},"Shift",{a:7},"↑",{a:6},"Page Down"],
    [{a:7,w:1.25},"Home",{a:6,w:1.25},"Menu",{w:1.25},"Alt",{a:7,w:6.25},"",{a:6},"Alt","Fn",{a:7},"End","←","↓","→"]

Using [http://builder.swillkb.com/](http://builder.swillkb.com/).

``` text
    Switch type: MX
	Stab:  Cherry + Costar
	Case: Sandwich
	Holes 8, 4.5mm, 10mm
	Edge:  Top: 10, Left: 30, Right: 10, Bottom: 25
	Corners: 2mm
```
<br>DXFs in `...Case/case1`
<br>PCB in `...kb_test`

This was OK except that the opening in the 'top' was a little tight.
Enlarged the CAD file by .05" on all sides.

</ul>
