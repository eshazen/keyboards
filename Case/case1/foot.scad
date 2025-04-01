mm = 25.4;
$fn = 128;
e = 0.1;

hole_dia = 0.160*mm;
outer_dia = 0.50*mm;
hole_dep = 0.125*mm;
foot_dep = 0.25*mm;

module foot() {
     difference() {
	  translate( [0, 0, hole_dep])
	       sphere( d=outer_dia);
	  translate( [0, 0, -e])
	       cylinder( d=hole_dia, h=hole_dep);
	  translate( [-outer_dia, -outer_dia, -10])
	       cube( [outer_dia*2, outer_dia*2, 10]);
     }
}

foot();
