// snap_latch_placeholder.scad
// Placeholder geometry for the snap-latch detachable tracking module interface.
// Shows two snap-latch bodies (front and rear), a shared alignment rail, and two
// alignment boss/pin placeholders.  The latch is NOT the primary alignment feature;
// the rail and bosses handle repeatable positioning.
// This is a visual placeholder only — no mechanically functional latch geometry yet.
// Units: millimeters.

include <controller_params.scad>

// One latch body + snap hook at an arbitrary [x, y, z] position.
module snap_latch_body(pos) {
    translate(pos) {
        // Rectangular latch body sitting at the interface level.
        color(snap_latch_color, 0.65)
            cube(sl_body_size, center = true);

        // Snap hook protruding toward the palm core (-Y side of the interface).
        color(snap_latch_color, 0.85)
            translate([0, -(sl_body_size[1] / 2 + sl_hook_size[1] / 2), 0])
                cube(sl_hook_size, center = true);
    }
}

module snap_latch_placeholder() {
    y_iface = bridge_clearance_y;   // Y level of tracking-module / palm-core interface

    // Two latches: one at the front (+Z) and one at the rear (-Z) of the bridge.
    snap_latch_body([0, y_iface, sl_z_front]);
    snap_latch_body([0, y_iface, sl_z_rear]);

    // Alignment rail running along X at the interface level.
    // Primary repeatable-alignment feature; keeps rotational and lateral play low.
    color(snap_latch_color, 0.35)
        translate([0, y_iface, 0])
            cube(sl_rail_size, center = true);

    // Alignment boss / pin placeholders at ±X positions.
    // Secondary alignment; prevents rocking around the rail axis.
    for (sx = [-1, 1])
        color(snap_latch_color, 0.60)
            translate([sx * sl_boss_spacing, y_iface, 0])
                rotate([90, 0, 0])
                    cylinder(d = sl_boss_d, h = sl_boss_h, center = true);
}
