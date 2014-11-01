// Raspberry Pi GPIO breakout board protection (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <../LIB/four_screw_holes.scad>
use <../LIB/rounded_corner_board.scad>

/////////////////////////////////////////////

module protection_board(board_height,
                        board_corner_radius,
                        screw_holes_radius,
                        screw_holes_spacing_x,
                        screw_holes_spacing_y) {

    board_width = screw_holes_spacing_x + 10;
    board_depth = screw_holes_spacing_y + 10;

    difference() {
        4_rounded_corners_board(board_width=board_width, board_depth=board_depth, board_height=board_height, board_corner_radius=board_corner_radius);
        #four_screw_holes(screw_holes_radius, screw_holes_spacing_x, screw_holes_spacing_y, board_height+1);
    }
}

/////////////////////////////////////////////

screw_holes_radius = 1.5;
screw_holes_spacing_x = 50;
screw_holes_spacing_y = 39;
board_corner_radius = 1.5;
board_height = 2;

translate([0, 0, board_height/2]) {
    protection_board(board_height=board_height,
                     board_corner_radius=board_corner_radius,
                     screw_holes_radius=screw_holes_radius,
                     screw_holes_spacing_x=screw_holes_spacing_x,
                     screw_holes_spacing_y=screw_holes_spacing_y);
}

