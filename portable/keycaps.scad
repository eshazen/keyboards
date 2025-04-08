include </home/hazen/work/KeyV2/includes.scad>
 
legends = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];


// // use slop if not using a 0.2mm nozzle!
// bar_support() rounded_cherry() row_profile("mt3") tined_stem_support() {
//     key(true);
// }

 
for (x = [0:1:3]) {
  for (y = [0:1:3]) {
    bar_support() rounded_cherry(0.45) tined_stem_support() translate_u(x,y) legend(legends[y*4+x])   dsa_row() {
      // swap the debug()s to render     opposite part
//      debug()  
	 key(true);
//      debug() dished() {
//        legends($inset_legend_depth);
//      }
    }
  }
}

