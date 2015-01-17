// Table corner guards

// Copyright (c) 2015 Jérémie DECOCK <jd.jdhp@gmail.com>

/////////////////////////////////////////////

radius = 30;
table_height = 24;

module table_corner_guards() {

    difference() {
        // sphere(radius);
        intersection() {
            sphere(radius);
            cylinder(r=radius,  h=3/4*2*radius, center=true);
        }
        table_corner();
        translate([radius, radius, 0]) rotate([0,0,45]) cube(radius*2, center=true);
    }
}

module table_corner() {
    table_width = radius + 10;
    table_depth = radius + 10;

    translate([table_width/2, table_depth/2, 0]) cube([table_width, table_depth, table_height], center=true);

    border_radius = table_height/2;
    translate([table_width/2, 0, 0]) rotate([0,90,0]) cylinder(r=border_radius,  h=table_width, center=true);
    translate([0, table_depth/2, 0]) rotate([90,0,0]) cylinder(r=border_radius,  h=table_depth, center=true);
    intersection() {
        translate([table_width/2-border_radius/2, 0, 0]) rotate([0,90,0]) cylinder(r=border_radius,  h=table_width+border_radius, center=true);
        translate([0, table_depth/2-border_radius/2, 0]) rotate([90,0,0]) cylinder(r=border_radius,  h=table_depth+border_radius, center=true);
    }
}

/////////////////////////////////////////////

rotate([-90,0,0]) rotate([0,0,45]) table_corner_guards();
