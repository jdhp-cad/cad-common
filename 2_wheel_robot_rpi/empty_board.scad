// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <../LIB/four_screw_holes.scad>
use <../LIB/round_corner_mask.scad>
include <global_vars.scad>

/////////////////////////////////////////////

module empty_board() {
    difference() {
        cube([board_width, board_depth, board_height], center=true);
        #four_screw_holes(screw_holes_radius, screw_holes_spacing_x, screw_holes_spacing_y, board_height+1);
        #board_round_4_corner_mask(radius=board_corner_radius, width=board_width, depth=board_depth, height=board_height);
    }
}

