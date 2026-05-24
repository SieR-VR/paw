// debug_visualization.scad
// Extra debug helpers for future model development.

include <controller_params.scad>

module bounding_box(size = [10,10,10], pos = [0,0,0], color_name = "gray", alpha = 0.15) {
    color(color_name, alpha)
        translate(pos)
            cube(size, center = true);
}

module bridge_envelope_debug() {
    bounding_box([bridge_width, bridge_height, bridge_length], [0, bridge_clearance_y + bridge_height / 2, 0], "gray", 0.12);
}

module target_com_cross(size = 12) {
    color("purple") {
        translate(target_com) cube([size, 1, 1], center = true);
        translate(target_com) cube([1, size, 1], center = true);
        translate(target_com) cube([1, 1, size], center = true);
    }
}
