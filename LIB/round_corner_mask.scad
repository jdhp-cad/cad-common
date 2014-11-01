// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

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

module board_round_4_corner_mask(radius, width, depth, height) {
    spacing_x = width - 2 * radius;
    spacing_y = depth - 2 * radius;
    height = height + 1;

    translate([-spacing_x/2,  spacing_y/2, 0]) mirror([0,1,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([-spacing_x/2, -spacing_y/2, 0]) mirror([0,0,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([ spacing_x/2,  spacing_y/2, 0]) mirror([1,1,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([ spacing_x/2, -spacing_y/2, 0]) mirror([1,0,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
}

module board_round_2_corner_mask(radius, width, depth, height) {
    spacing_x = width - 2 * radius;
    spacing_y = depth - 2 * radius;
    height = height + 1;

    translate([ spacing_x/2,  spacing_y/2, 0]) mirror([1,1,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
    translate([ spacing_x/2, -spacing_y/2, 0]) mirror([1,0,0]) round_corner_mask(radius, spacing_x, spacing_y, height);
}

