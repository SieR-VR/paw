// palm_handle.scad
// Oval / rounded-rectangle lower palm handle placeholder.
// Represents the mass-core area housing battery, main MCU, IMU, and haptics.
// Cross-section is oval (rounded rectangle); body is extruded along Z (wrist direction).
// Units: millimeters.

include <controller_params.scad>

module palm_handle() {
    r = ph_corner_radius;

    color(palm_handle_color, 0.55)
        translate(ph_pos)
            // Outer hull over two oval cross-sections at either end of the handle.
            hull() {
                for (sz = [-1, 1])
                    translate([0, 0, sz * (ph_length / 2 - r)])
                        // Oval cross-section: hull of four spheres at rounded corners.
                        hull() {
                            for (sx = [-1, 1], sy = [-1, 1])
                                translate([sx * (ph_width  / 2 - r),
                                           sy * (ph_height / 2 - r), 0])
                                    sphere(r = r);
                        }
            }
}
