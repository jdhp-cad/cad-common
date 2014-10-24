// Raspicam for Pibow (model B)
// A raspicam support for the Pibow case (Pimoroni).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

// PIBOW BASE ///////////////////////////////

// Pibow for RPi model B: 
//     Dimensions (mm): 98 x 65.5 x 18
//
// RPi and pibow screws:
//     Diameter: 3 mm
module pibow_b_base(board_width,
                    board_depth,
                    board_height) {

    // Check vars
    if(board_width < 98)   echo("WARNING: board_width should be greater than or equal to 98");
    if(board_depth < 65.5) echo("WARNING: board_depth should be greater than or equal to 65.5");

    // Local const
    screw_radius = 1.5;
    screw_spacing_x = 89;
    screw_spacing_y = 56;

    difference() {
        cube([board_width, board_depth, board_height], center=true);

        #union() {
            // Four screw holes
            for (i = [-1, 1]) {    
                for (j = [-1, 1]) {    
                    translate([i*screw_spacing_x/2, j*screw_spacing_y/2, 0]) {        
                        cylinder(r=screw_radius, h=board_height+1, center=true, $fn=50);
                    }
                }
            }

            // RPi screw holes
            translate([-17.5, 9.5, 0]) cylinder(r=screw_radius, h=board_height+1, center=true, $fn=50);
            translate([37, -15, 0])    cylinder(r=screw_radius, h=board_height+1, center=true, $fn=50);
        }
    }
}

/////////////////////////////////////////////

board_width=98;      // x
board_depth=65.5;    // y
board_height=3;      // z

translate([0, 0, board_height/2]) {
    pibow_b_base(board_width  = board_width,
                 board_depth  = board_depth,
                 board_height = board_height);
}

