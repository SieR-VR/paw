// pogo_pin_interface.scad
// Pogo-pin / contact array placeholder between the tracking module and palm/fist core.
// Pin cylinders are arranged along X (thumb-to-pinky direction).
// Pogo pins are for ELECTRICAL CONNECTION ONLY — not structural alignment.
// Units: millimeters.

include <controller_params.scad>

module pogo_pin_interface() {
    total_span = (pp_pin_count - 1) * pp_pitch;

    translate(pp_pos)
        for (i = [0 : pp_pin_count - 1])
            color(pogo_pin_color, 0.85)
                translate([i * pp_pitch - total_span / 2, 0, 0])
                    cylinder(d = pp_pin_d, h = pp_pin_h, center = true);
}
