// coordinate_system.scad
// Shared coordinate helpers.

module coord_label(text_value, pos, size = 4) {
    translate(pos)
        linear_extrude(height = 0.2)
            text(text_value, size = size, halign = "center", valign = "center");
}

module debug_axes(axis_len = 50) {
    // X axis: red
    color("red") {
        cube([axis_len, 1, 1], center = false);
        translate([axis_len, 0, 0]) sphere(d = 3);
    }

    // Y axis: green
    color("green") {
        cube([1, axis_len, 1], center = false);
        translate([0, axis_len, 0]) sphere(d = 3);
    }

    // Z axis: blue
    color("blue") {
        cube([1, 1, axis_len], center = false);
        translate([0, 0, axis_len]) sphere(d = 3);
    }
}
