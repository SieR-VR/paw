// finger_retention.scad
// Rounded four-finger slot / retention frame placeholder.
// One large rounded slot for the index, middle, ring, and pinky fingers.
// The frame lies in the X-Z plane; fingers (oriented along Y) pass through it.
// Units: millimeters.

include <controller_params.scad>

// Rounded-rectangle frame in the X-Z plane, extruded along Y.
// Outer shape minus inner slot opening.
module finger_retention_frame() {
    outer_w = fr_slot_width  + fr_wall * 2;
    outer_h = fr_slot_height + fr_wall * 2;
    r = fr_corner_radius;
    d = fr_frame_depth;

    difference() {
        // Outer rounded box: hull of cylinders along Y at four corners.
        hull() {
            for (sx = [-1, 1], sz = [-1, 1])
                translate([sx * (outer_w / 2 - r), 0, sz * (outer_h / 2 - r)])
                    rotate([90, 0, 0])
                        cylinder(r = r, h = d, center = true);
        }
        // Inner slot opening: slightly deeper than frame so the cut is clean.
        hull() {
            for (sx = [-1, 1], sz = [-1, 1])
                translate([sx * (fr_slot_width / 2 - r), 0, sz * (fr_slot_height / 2 - r)])
                    rotate([90, 0, 0])
                        cylinder(r = r, h = d + fr_cut_clearance, center = true);
        }
    }
}

module finger_retention() {
    color(finger_retention_color, 0.55)
        translate(fr_pos)
            finger_retention_frame();
}
