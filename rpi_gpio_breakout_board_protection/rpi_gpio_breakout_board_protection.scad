// Raspberry Pi GPIO breakout board protection (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

/////////////////////////////////////////////

module protection_board(size_x, size_y, size_z, board_corner_radius, screw_holes_radius, screw_holes_spacing_x, screw_holes_spacing_y) {
    difference() {
        cube([size_x, size_y, size_z], center=true);
        #four_screw_holes(screw_holes_radius, screw_holes_spacing_x, screw_holes_spacing_y, size_z+2);
        #board_round_4_corner_mask(radius=board_corner_radius, spacing_x=size_x-2*board_corner_radius, spacing_y=size_y-2*board_corner_radius, height=size_z+2);
    }
}

/////////////////////////////////////////////

module round_corner_mask(radius, spacing_x, spacing_y, height) {
	$fn=50;
	
    difference() {
        cube([2*radius+1, 2*radius+1, height], center=true);
        union() {
            cylinder(r=radius, h=height+2, center=true);
            translate([(radius+2)/2, 0, 0]) cube([radius+2, 2*radius+2, height+2], center=true);
            translate([0, (radius+2)/2, 0]) cube([2*radius+2, radius+2, height+2], center=true);
        }
    }
}

module board_round_4_corner_mask(radius, spacing_x, spacing_y, height) {
    translate([-spacing_x/2,  spacing_y/2, 0]) mirror([0,1,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([-spacing_x/2, -spacing_y/2, 0]) mirror([0,0,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([ spacing_x/2,  spacing_y/2, 0]) mirror([1,1,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([ spacing_x/2, -spacing_y/2, 0]) mirror([1,0,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
}

module four_screw_holes(radius, spacing_x, spacing_y, height) {
	$fn=50;
	
	for (i = [-1, 1]) {    
        for (j = [-1, 1]) {    
            translate([i*spacing_x/2, j*spacing_y/2, 0]) {        
                cylinder(r=radius, h=height, center=true);
            }
        }
	}
}

/////////////////////////////////////////////

assign(screw_holes_radius=1.5,
       screw_holes_spacing_x=50,
       screw_holes_spacing_y=39,
       board_corner_radius=1.5,
       board_height=2) {

    translate([0, 0, board_height/2]) {
        protection_board(size_x=screw_holes_spacing_x + 10,
                         size_y=screw_holes_spacing_y + 10,
                         size_z=board_height,
                         board_corner_radius=board_corner_radius,
                         screw_holes_radius=screw_holes_radius,
                         screw_holes_spacing_x=screw_holes_spacing_x,
                         screw_holes_spacing_y=screw_holes_spacing_y);
    }
}

