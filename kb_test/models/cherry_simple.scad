//
// Cherry MX keyswitch simple model
//
$fn = 32;
mm = 25.4;

mx_wid = 15.6;		/* max width above flange */
mx_hgt = 11.6;
mx_shaft_len = 3.6;
mx_shaft_dia = 5;
mx_cutout = 14;
mx_flange = 5.0;
mx_peg_len = 3.3;
mx_lg_peg = 4.0;		/* large peg */
mx_sm_peg = 1.5;		/* small peg */


module peg_at(x,y,dia) {
     translate( [x, y, -mx_peg_len])
	  cylinder( d=dia, h=mx_peg_len);
}

module mx() {
     /* body at cutout size */
     translate( [-mx_cutout/2, -mx_cutout/2, 0])
	  cube( [mx_cutout, mx_cutout, mx_hgt]);
     translate( [0, 0, mx_hgt])
	  cylinder( d=mx_shaft_dia, h=mx_shaft_len);
     /* flange above cutout */
     translate( [-mx_wid/2, -mx_wid/2, mx_flange])
	  cube( [mx_wid, mx_wid, 2]);
     /* pegs */
     peg_at( 0, 0, mx_lg_peg);
     peg_at( -0.15*mm, 0.1*mm, mx_sm_peg);
     peg_at( 0.1*mm, 0.2*mm, mx_sm_peg);
}

module mx_cap() {
     cap_w1 = 18.1;
     cap_w2 = 12.37;
     
}

mx();
