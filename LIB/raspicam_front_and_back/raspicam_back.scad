// Raspicam for Pibow (model B)
// A raspicam support for the Pibow case (Pimoroni).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>


// RASPICAM BACK ////////////////////////////

module raspicam_back() {

    // Local const
    screw_radius = 1.5;
    screw_spacing_x = 12.5;
    screw_spacing_y = 21;

    // Four screw holes
    for (i = [-1, 1]) {    
        for (j = [-1, 1]) {    
            translate([i*screw_spacing_x/2, j*screw_spacing_y/2, 0]) {        
                cylinder(r=screw_radius, h=board_height+1, center=true, $fn=50);
            }
        }
    }

}

// TEST /////////////////////////////////////

board_width=20;   // x
board_depth=30;   // y
board_height=2;   // z

// Check vars
if(board_width < 16.5) echo("WARNING: board_width should be greater than or equal to 98");
if(board_depth < 25)   echo("WARNING: board_depth should be greater than or equal to 65.5");

translate([0, raspicam_back_depth/2 + 5, raspicam_back_height/2]) {
    difference() {
        cube([board_width, board_depth, board_height], center=true);
        #raspicam_back();
    }
}

