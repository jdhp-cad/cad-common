// Mini bread board sfe

mini_bread_board_sfe_width = 47;
mini_bread_board_sfe_depth = 35;
mini_bread_board_sfe_height = 10;

module mini_bread_board_sfe() {
    cube([mini_bread_board_sfe_width, mini_bread_board_sfe_depth, mini_bread_board_sfe_height], center=true);
}


// Micro metal DC gearmotor Pololu

micro_gearmotor_pololu_width = 26;
micro_gearmotor_pololu_depth = 12;
micro_gearmotor_pololu_height = 10;

module micro_metal_dc_gearmotor_pololu() {
    cube([micro_gearmotor_pololu_width, micro_gearmotor_pololu_depth, micro_gearmotor_pololu_height], center=true);
}


// Wheel 6mm pololu

wheel_6_pololu_radius = 30;
wheel_6_pololu_depth = 8;

module wheel_pololu() {
    cylinder(r=wheel_6_pololu_radius, h=wheel_6_pololu_depth, center=true, $fn=50);
}


// Battery holder 3xAA Selectronic

battery_holder_3xAA_selectronic_width = 58;
battery_holder_3xAA_selectronic_depth = 48;
battery_holder_3xAA_selectronic_height = 17;

module battery_holder_3xAA_selectronic() {
    cube([battery_holder_3xAA_selectronic_width, battery_holder_3xAA_selectronic_depth, battery_holder_3xAA_selectronic_height], center=true);
}


// Pibow (model b)

pibow_b_width = 98;
pibow_b_depth = 65.5;
pibow_b_height = 18;

module pibow_model_b() {
    cube([pibow_b_width, pibow_b_depth, pibow_b_height], center=true);
}


// Ball Caster Metal 3/8" Pololu

ball_caster_38_pololu_radius = 9.525/2;

module ball_caster_pololu() {
    sphere(r=ball_caster_38_pololu_radius, $fn=50);
}

