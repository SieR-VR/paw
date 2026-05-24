// electronics_placeholders.scad
// Simple component blocks for mass and packaging layout.

include <controller_params.scad>

module component_box(name, pos, size, color_name) {
    color(color_name, electronics_alpha)
        translate(pos)
            cube(size, center = true);
}

module battery_placeholder() {
    component_box("battery", battery_pos, battery_size, "blue");
}

module main_pcb_placeholder() {
    component_box("main_pcb", main_pcb_pos, main_pcb_size, "green");
}

module imu_placeholder() {
    component_box("imu", imu_pos, imu_size, "yellow");
}

module wireless_placeholder() {
    component_box("wireless", wireless_pos, wireless_size, "cyan");
}

module haptic_placeholder() {
    color("magenta", electronics_alpha)
        translate(haptic_pos)
            cylinder(h = haptic_size[2], d = haptic_size[0], center = true);
}

module electronics_placeholders() {
    battery_placeholder();
    main_pcb_placeholder();
    imu_placeholder();
    wireless_placeholder();
    haptic_placeholder();
}
