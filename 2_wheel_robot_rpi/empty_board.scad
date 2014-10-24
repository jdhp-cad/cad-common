// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <../LIB/four_screw_holes.scad>
use <../LIB/round_corner_mask.scad>

/////////////////////////////////////////////

module empty_board() {

    screw_holes_radius = 1.5;
    screw_holes_spacing_x = 150;
    screw_holes_spacing_y = 70;
    board_height = 3;
    board_corner_radius = 2;
    board_width = screw_holes_spacing_x + 10;
    board_depth = screw_holes_spacing_y + 10;

    difference() {
        cube([board_width, board_depth, board_height], center=true);
        #four_screw_holes(screw_holes_radius, screw_holes_spacing_x, screw_holes_spacing_y, board_height+1);
        #board_round_4_corner_mask(radius=board_corner_radius, width=board_width, depth=board_depth, height=board_height);
    }
}

