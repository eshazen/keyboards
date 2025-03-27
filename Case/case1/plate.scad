//
// 84 key keyboard case
//

mm = 25.4;
$fn = 32;
e = 0.1;

include <joint.scad>

hgt = 5.1;  // plate height

// set to 0 for normal size
//shrink_x = 270;
//shrink_y = 100;
shrink_x = 0;
shrink_y = 0;

// plate dims from DXF
pwid = 344.8-shrink_x;
plen = 139.3-shrink_y;
pthk = 1.5;			/* thickness CHECKME */

hole_off = 5;			/* hole offset from edge */
hole_dx = 111.6;
hole_dia = 4.5;			/* 8-32 clearance hole */

// holes for #6 screws to join case halves
clear = 0.16*mm;
tap = 0.125*mm;

// pcb dims from layout
pcb_wid = 323-shrink_x;
pcb_len = 117-shrink_y; 
pcb_thk = 1.6;

case_pcb_clear = 1;

// cutout for USB cable
cutout_left = 16;
cutout_size = 14;

// position of lower left switch WRT item LL corner
pcb_ll_x = 29.94;
pcb_ll_y = 11.57;
plate_ll_x = 41.91;
plate_ll_y = 24.52;

case_pcb_dx = plate_ll_x - pcb_ll_x;
case_pcb_dy = plate_ll_y - pcb_ll_y;


// case details
case_A = 2.5;			/* case extend beyond plate */
case_B = 1;			/* clearance around PCB */
case_D = 3;			/* base thickness */
case_E = 8;			/* PCB clearance */

// overall case size
case_wid = pwid + 2*case_A;
case_len = plen + 2*case_A;
case_hgt = case_D + case_E + pcb_thk + 5;

// top and bottom case margins for joints
case_bot_marg = case_pcb_dy-case_pcb_clear+case_A;
case_top_marg = case_len-(pcb_len+2*case_pcb_clear)-case_bot_marg;

echo("Top Marg: ", case_top_marg);

module case() {
     translate( [case_A, case_A, 0]) {
	  difference() {
	       translate( [-case_A, -case_A, 0])
		    cube( [case_wid, case_len, case_hgt]);
	       translate( [case_pcb_dx-case_pcb_clear, case_pcb_dy-case_pcb_clear, case_D])
		    cube( [pcb_wid + 2*case_pcb_clear, pcb_len + 2*case_pcb_clear, 20]);
	       translate( [0, 0, case_D])
		    mtg_holes();
	       translate( [cutout_left-case_A, case_len-case_top_marg-e-case_A, case_D+1])
		    cube( [20, 20, 20]);
	  }
     }
}

// draw real plate or fake plate if shrinking
module plate() {
     if( shrink_x == 0) {
	  translate( [case_A-38, case_A+plen+35, pcb_thk+5+(case_E+case_D)])
	       import("plate.stl",10);
     } else {
	  translate( [case_A, case_A, pcb_thk+5+(case_E+case_D)]) 
	  cube( [pwid, plen, pthk]);
     }
}

module board() {
     if( shrink_x == 0) {
	  translate( [case_A-15.1, case_A+plen+35.1, case_E+case_D])
	       import("kb_test_big.stl",10);
     } else {
	  translate( [case_A+case_pcb_dx, case_A+case_pcb_dy, case_E+case_D])
	  cube( [pcb_wid, pcb_len, pcb_thk]);
     }
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
     color("lightblue") plate();
     color("brown") board();
     % case();
}

// test joint
//  color("blue") joint( w, l, h, false, clear, tap);
//  color("red")  joint( w, l, h, true, clear, tap);

module case_split( right) {
     difference() {
	  case();
	  if( right) {
	       translate( [-e, -e, -e])
		    cube( [case_wid/2+2*e, case_len+2*e, case_hgt+2*e]);
	  } else {
	       translate( [case_wid/2, -e, -e])
		    cube( [case_wid/2+2*e, case_len+2*e, case_hgt+2*e]);
	  }
     }
}

joint_wid = 3*mm;

module case_right_joint() {
     difference() {
	  case_split( true);
	  translate( [case_wid/2-(joint_wid/6), -e, -e])
	       cube( [joint_wid*2/3, case_bot_marg+2*e, case_hgt+2*e]);
	  translate( [case_wid/2-(joint_wid/6), case_len-case_top_marg-e, -e])
	       cube( [joint_wid*2/3, case_top_marg+2*e, case_hgt+2*e]);
     }
     translate( [case_wid/2-(joint_wid/6), 0, 0])
	  joint( joint_wid, case_bot_marg+e, case_hgt, false, clear, tap);
     translate( [case_wid/2-(joint_wid/6), case_len-case_top_marg-e, 0])
	  joint( joint_wid, case_top_marg, case_hgt, false, clear, tap);
}

module case_left_joint() {
     difference() {
	  case_split( false);
	  translate( [case_wid/2-joint_wid/2, -e, -e])
	       cube( [joint_wid*2/3, case_bot_marg+2*e, case_hgt+2*e]);
	  translate( [case_wid/2-joint_wid/2, case_len-case_top_marg-e, -e])
	       cube( [joint_wid*2/3, case_top_marg+2*e, case_hgt+2*e]);
     }
      translate( [case_wid/2-joint_wid/2, 0, 0])
 	  joint( joint_wid, case_bot_marg+e, case_hgt, true, clear, tap);
      translate( [case_wid/2-joint_wid/2, case_len-case_top_marg-e, 0])
 	  joint( joint_wid, case_top_marg, case_hgt, true, clear, tap);
}

//render();

//case_right_joint();

case_left_joint();
