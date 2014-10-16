// A board for "electronique 2000" modules (Joustra)

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

/////////////////////////////////////////////

module board(feet_board_width,
             feet_board_spacing,
             feet_board_depth,
             holes_radius,
             holes_spacing,
             num_holes_x,
             num_holes_y,
             board_size_x,
             board_size_y,
             board_size_z,
             board_corner_radius) {


    difference() {
        // board
        cube([board_size_x, board_size_y, board_size_z], center=true);

        // holes
        translate([-board_size_x/2 - holes_radius, -board_size_y/2 - holes_radius, 0]) {        
            for(ix = [1:num_holes_x]) {    
                for(iy = [1:num_holes_y]) {    
                    translate([ix*(holes_spacing + holes_radius * 2), iy*(holes_spacing + holes_radius * 2), 0]) {        
                        #cylinder(r=holes_radius, h=board_size_z+2, center=true, $fn=50);
                    }
                }
            }
        }

        // round corners
        #board_round_4_corner_mask(radius=board_corner_radius, spacing_x=board_size_x-2*board_corner_radius, spacing_y=board_size_y-2*board_corner_radius, depth=board_size_z + 2);
    }

    // feet
    color([1,0,0]) {
        translate([0, 0, board_size_z/2 + feet_board_depth/2 - 0.1]) {        
            difference() {
                cube([board_size_x - feet_board_spacing, board_size_y - feet_board_spacing, feet_board_depth], center=true);
                cube([board_size_x - feet_board_spacing - feet_board_width*2, board_size_y - feet_board_spacing - feet_board_width*2, feet_board_depth+2], center=true);
            }
        }
    }
}

/////////////////////////////////////////////

module round_corner_mask(radius, spacing_x, spacing_y, depth) {
	$fn=50;
	
    difference() {
        cube([2*radius+1, 2*radius+1, depth], center=true);
        union() {
            cylinder(r=radius, h=depth+2, center=true);
            translate([(radius+2)/2, 0, 0]) cube([radius+2, 2*radius+2, depth+2], center=true);
            translate([0, (radius+2)/2, 0]) cube([2*radius+2, radius+2, depth+2], center=true);
        }
    }
}

module board_round_4_corner_mask(radius, spacing_x, spacing_y, depth) {
    translate([-spacing_x/2,  spacing_y/2, 0]) mirror([0,1,0]) round_corner_mask(radius, spacing_x, spacing_y, depth);
    translate([-spacing_x/2, -spacing_y/2, 0]) mirror([0,0,0]) round_corner_mask(radius, spacing_x, spacing_y, depth);
    translate([ spacing_x/2,  spacing_y/2, 0]) mirror([1,1,0]) round_corner_mask(radius, spacing_x, spacing_y, depth);
    translate([ spacing_x/2, -spacing_y/2, 0]) mirror([1,0,0]) round_corner_mask(radius, spacing_x, spacing_y, depth);
}

/////////////////////////////////////////////

assign(feet_board_width=2,
       feet_board_spacing=6,
       feet_board_depth=2,
       holes_radius=1.75,
       holes_spacing=17,
       num_holes_x=4,
       num_holes_y=4,
       board_size_z=4,
       board_corner_radius=4) {

    translate([0, 0, board_size_z/2]) {        
        board(feet_board_width=feet_board_width,
              feet_board_spacing=feet_board_spacing,
              feet_board_depth=feet_board_depth,
              holes_radius=holes_radius,
              holes_spacing=holes_spacing,
              num_holes_x=num_holes_x,
              num_holes_y=num_holes_y,
              board_size_x=num_holes_x * (holes_spacing + holes_radius * 2) + holes_spacing,
              board_size_y=num_holes_y * (holes_spacing + holes_radius * 2) + holes_spacing,
              board_size_z=board_size_z,
              board_corner_radius=board_corner_radius);
    }
}

