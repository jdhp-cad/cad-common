// Raspicam for Pibow (model B)
// A raspicam support for the Pibow case (Pimoroni).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>


// RASPICAM BACK ////////////////////////////

module raspicam_back(board_height) {

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

raspicam_back_width = 20;   // x
raspicam_back_depth = 30;   // y
raspicam_back_height = 2;   // z

// Check vars
if(raspicam_back_width < 16.5) echo("WARNING: board_width should be greater than or equal to 98");
if(raspicam_back_depth < 25)   echo("WARNING: board_depth should be greater than or equal to 65.5");

translate([0, 0, raspicam_back_height/2]) {
    difference() {
        cube([raspicam_back_width, raspicam_back_depth, raspicam_back_height], center=true);
        #raspicam_back(board_height=raspicam_back_height);
    }
}

