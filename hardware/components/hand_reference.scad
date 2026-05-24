// hand_reference.scad
// Simplified hand reference volumes for fit/clearance visualization.

include <controller_params.scad>

module finger_reference(x, label = "") {
    color(hand_color, hand_alpha)
        translate([x, 0, 12])
            rotate([90, 0, 0])
                cylinder(h = finger_length_ref, r = finger_radius, center = true);
}

module palm_reference() {
    color(hand_color, hand_alpha)
        translate([0, -18, -18])
            scale([palm_width_ref / 2, palm_depth_ref / 2, palm_length_ref / 2])
                sphere(r = 1);
}

module hand_reference() {
    palm_reference();

    // Four non-thumb fingers, centered around X=0.
    finger_reference(-1.5 * finger_pitch);
    finger_reference(-0.5 * finger_pitch);
    finger_reference( 0.5 * finger_pitch);
    finger_reference( 1.5 * finger_pitch);

    // Approximate fist center / target region marker.
    color("purple", 0.35)
        translate(target_com)
            sphere(d = 10);
}
