// thumb_input_plane.scad
// Thumb-side input plane placeholder on the +X face of the palm handle.
// Contains a capacitive trigger pad, a smaller protected system button,
// and a guard ridge separating them to reduce accidental actuation.
// Units: millimeters.

include <controller_params.scad>

module thumb_input_plane() {
    translate(ti_pos) {
        // Base plane slab — thin in X, facing outward toward the thumb (+X).
        color(thumb_input_color, 0.50)
            cube([ti_plane_thickness, ti_plane_w, ti_plane_h], center = true);

        // Trigger pad — larger, occupies the fingertip-side (+Z) portion of the plane.
        trigger_z_off = ti_button_d / 2 + ti_gap / 2 + ti_trigger_h / 2;
        color("deepskyblue", 0.75)
            translate([ti_plane_thickness / 2 + ti_trigger_thickness / 2, 0, trigger_z_off])
                cube([ti_trigger_thickness, ti_trigger_w, ti_trigger_h], center = true);

        // System button — smaller, wrist-side (-Z) portion of the plane.
        // Cylinder axis along X so the button face is visible from +X.
        button_z_off = -(ti_trigger_h / 2 + ti_gap / 2 + ti_button_d / 2);
        color("orangered", 0.85)
            translate([ti_plane_thickness / 2, 0, button_z_off])
                rotate([0, 90, 0])
                    cylinder(d = ti_button_d, h = ti_button_h, center = true);

        // Guard / separation ridge between trigger pad and system button.
        // Provides a tactile break and visual indication of accidental-press protection.
        color("dimgray", 0.90)
            translate([ti_plane_thickness / 2 + ti_guard_offset, 0, 0])
                cube([ti_guard_width, ti_plane_w * ti_guard_span_frac, ti_guard_h], center = true);
    }
}
