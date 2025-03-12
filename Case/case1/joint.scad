//
// create overlap joint
//
// joint( w, l, h, right, clear, tap)
//   create (one half of) an overlap joint with drilled holes
//
//   (w, l, h) are (x, y, z) size of entire joint
//   right=true specifies right size
//   (clear, tap) are hole diameters (thru hole from bottom on left side)
//
// (expects mm=25.4)

joint_e = 0.1;

joint_cs_dep = 0.1*mm;		/* countersink depth */
joint_cs_angle = 82;		/* countersink angle */

// make an "ell" for a joint
// size:  wid, leng, dep
// hole:  dia = diameter, outside=1 for start outside, pct = percent to drill
module joint_ell( wid, leng, dep, dia, outside, pct) {
     difference() {
	  cube( [wid, leng, dep]);
	  translate( [wid/2, -e, dep/2])
	       cube( [wid/2+joint_e, leng+2*e, dep/2+joint_e]);
	  // deal with the hole
	  if( outside) {
	       translate( [3*wid/4, leng/2, -e]) {
		    cylinder( d=dia, h = (((pct/2)+1)/100+joint_e)*dep);
		    // countersink
		    ang = 90-joint_cs_angle/2;
		    d_rad = joint_cs_dep/tan(ang);
		    cylinder( d1=dia+2*d_rad, d2=dia, h=joint_cs_dep);
	       }
	  } else {
	       translate( [3*wid/4, leng/2, (dep/2)*(((100-pct)+1)/100)-e])
		    cylinder( d=dia, h = dep/2+2*e);
	  }
     }
}

module joint_flip( wid, leng, dep, flip, dia, outside, pct) {
     if( flip ) {
	  joint_ell( wid, leng, dep, dia, flip, pct);
     } else {
	  translate( [wid, 0, dep])
	       rotate( [180, 0, 180])
	       joint_ell( wid, leng, dep, dia, flip, pct);
     }
}

module joint( w, l, h, right, clear, tap) {
     if( right) {
	  joint_flip(2*w/3, l, h, true, clear, 1, 100);
     } else {
	  joint_flip( 2*w/3, l, h, false, tap, 0, 75);
     }
}

