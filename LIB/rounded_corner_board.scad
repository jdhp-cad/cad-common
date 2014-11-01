// Rounded board

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <round_corner_mask.scad>

/////////////////////////////////////////////

module 4_rounded_corners_board(board_width, board_depth, board_height, board_corner_radius) {
    difference() {
        cube([board_width, board_depth, board_height], center=true);
        #board_round_4_corner_mask(radius=board_corner_radius, width=board_width, depth=board_depth, height=board_height);
    }
}

module 2_rounded_corners_board(board_width, board_depth, board_height, board_corner_radius) {
    difference() {
        cube([board_width, board_depth, board_height], center=true);
        #board_round_2_corner_mask(radius=board_corner_radius, width=board_width, depth=board_depth, height=board_height);
    }
}

//4_rounded_corners_board(board_width=80, board_depth=40, board_height=3, board_corner_radius=3);
2_rounded_corners_board(board_width=80, board_depth=40, board_height=3, board_corner_radius=3);
