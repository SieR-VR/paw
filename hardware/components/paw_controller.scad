// paw_controller.scad
// Main OpenSCAD assembly for the paw knuckle controller debug model.
// Units: millimeters.

include <controller_params.scad>
include <coordinate_system.scad>
include <hand_reference.scad>
include <knuckle_bridge.scad>
include <sensor_layout_24.scad>
include <sensor_mount.scad>
include <electronics_placeholders.scad>
include <center_of_mass.scad>
include <debug_visualization.scad>
include <finger_retention.scad>
include <palm_handle.scad>
include <thumb_input_plane.scad>
include <snap_latch_placeholder.scad>
include <pogo_pin_interface.scad>

if (show_debug_axes) {
    debug_axes(60);
}

if (show_hand_reference) {
    hand_reference();
}

// Main lightweight upper shell placeholder.
color(shell_color, shell_alpha)
    knuckle_bridge();

// Show provisional optical sensor positions and approximate FOV cones.
for (i = [0 : len(sensors) - 1]) {
    sensor_mount(sensors[i], show_sensor_fov);
}

if (show_electronics) {
    electronics_placeholders();
}

if (show_center_of_mass) {
    center_of_mass_marker();
    target_center_of_mass_marker();
}

if (show_finger_retention) {
    finger_retention();
}

if (show_palm_handle) {
    palm_handle();
}

if (show_thumb_input) {
    thumb_input_plane();
}

if (show_snap_latch) {
    snap_latch_placeholder();
}

if (show_pogo_interface) {
    pogo_pin_interface();
}
