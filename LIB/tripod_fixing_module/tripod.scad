// Raspicam for Pibow (model B)
// A raspicam support for the Pibow case (Pimoroni).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

// TRIPOD BASE //////////////////////////////

// Tripod fixation screw:
//     Diameter: 7 mm
module tripod_base(board_width,
                   board_depth,
                   board_height) {

    // Local const
    screw_radius = 7;
    screw_fn = 6;

    difference() {
        cube([board_width, board_depth, board_height], center=true);
        cylinder(r=screw_radius, h=board_height+1, center=true, $fn=screw_fn);
    }
}

/////////////////////////////////////////////

board_width = 25;    // x
board_depth = 25;    // y
board_height = 3;    // z

translate([0, 0, board_height/2]) {
    tripod_base(board_width  = board_width,
                board_depth  = board_depth,
                board_height = board_height);
}

