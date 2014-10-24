// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

/////////////////////////////////////////////

module four_screw_holes(radius, spacing_x, spacing_y, height) {
	for (i = [-1, 1]) {    
        for (j = [-1, 1]) {    
            translate([i*spacing_x/2, j*spacing_y/2, 0]) {        
                cylinder(r=radius, h=height, center=true, $fn=50);
            }
        }
	}
}
