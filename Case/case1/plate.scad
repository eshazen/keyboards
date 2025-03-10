mm = 25.4;
$fn = 16;

hgt = 5.1;  // plate height

// plate dims from DXF
pwid = 344.8;
plen = 139.3;
pthk = 1.5;			/* thickness CHECKME */

hole_off = 5;			/* hole offset from edge */
hole_dx = 111.6;
hole_dia = 4.5;			/* 8-32 clearance hole */

// pcb dims from layout
pcb_wid = 323;
pcb_len = 117; 
pcb_thk = 1.6;

case_pcb_clear = 1;

// position of lower left switch WRT item LL corner
pcb_ll_x = 29.94;
pcb_ll_y = 11.57;
plate_ll_x = 41.91;
plate_ll_y = 24.52;

case_pcb_dx = plate_ll_x - pcb_ll_x;
case_pcb_dy = plate_ll_y - pcb_ll_y;

// case details
case_A = 8;			/* case extend beyond plate */
case_B = 1;			/* clearance around PCB */
case_D = 3;			/* base thickness */
case_E = 8;			/* PCB clearance */

case_wid = pwid + 2*case_A;
case_len = plen + 2*case_A;
case_hgt = case_D + case_E + pcb_thk + 5;

module case() {
     translate( [0, 0, -(case_E+case_D)]) {
	  difference() {
	       translate( [-case_A, -case_A, 0])
		    cube( [case_wid, case_len, case_hgt]);
	       translate( [case_pcb_dx-case_pcb_clear, case_pcb_dy-case_pcb_clear, case_D])
		    cube( [pcb_wid + 2*case_pcb_clear, pcb_len + 2*case_pcb_clear, 20]);
	       translate( [0, 0, case_D])
		    mtg_holes();

	  }
     }
}

module plate() {
     translate( [-38, plen+35, pcb_thk+5]) import("plate.stl",10);
}

module board() {
     translate( [-15.1, plen+35.1, 0]) import("kb_test_big.stl",10);
}

module hole_at(x,y) {
     translate( [x, y, 0])
	  cylinder( d=hole_dia, h=40);
}

module mtg_holes() {
     for( y=[hole_off, plen-hole_off]) {
	  hole_at( hole_off, y);
	  hole_at( hole_off+hole_dx, y);
	  hole_at( hole_off+2*hole_dx, y);
	  hole_at( pwid-hole_off, y);
     }
}

module render() {
     color("lightblue")
	  plate();
     color("brown") board();
     % case();
}

render();

