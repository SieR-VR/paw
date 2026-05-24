// controller_params.scad
// Shared parameters for the paw controller OpenSCAD model.
// Units: millimeters unless otherwise noted.

$fn = 48;

// Debug toggles
show_hand_reference = true;
show_sensor_fov = true;
show_electronics = true;
show_center_of_mass = true;
show_debug_axes = true;

// Coordinate convention, right hand:
// +X: thumb side
// -X: pinky side
// +Y: back of hand / away from palm
// -Y: palm interior
// +Z: fingertip direction
// -Z: wrist direction

// Provisional hand reference dimensions
knuckle_width = 78;            // index to pinky outer span
finger_pitch = 19;             // rough center-to-center spacing
finger_radius = 7.5;           // simplified finger cylinder radius
finger_length_ref = 58;        // visible reference length
palm_width_ref = 82;
palm_depth_ref = 42;           // +Y/-Y thickness reference
palm_length_ref = 72;          // +Z/-Z reference

// Upper knuckle bridge placeholder dimensions
bridge_width = 86;
bridge_length = 58;
bridge_height = 24;
bridge_clearance_y = 13;       // lower bridge height above origin/finger reference
bridge_top_y = bridge_clearance_y + bridge_height;
bridge_wall = 1.6;
bridge_corner_radius = 5;
bridge_side_inset = 9;
bridge_front_rear_inset = 8;

// Sensor placeholder dimensions
sensor_hole_d = 4.0;
sensor_body_d = 5.5;
sensor_pcb_size = [7.0, 9.0, 0.8];
sensor_recess = 1.2;
sensor_fov_len = 36;
sensor_fov_angle = 60;         // debug visualization half-angle approximation
sensor_color = "red";
sensor_fov_color = "orange";
sensor_fov_alpha = 0.16;

// Electronics placeholders. Replace with real dimensions/masses.
battery_size = [36, 10, 28];
battery_pos = [0, -20, -2];
battery_mass_g = 18;

main_pcb_size = [38, 2, 42];
main_pcb_pos = [0, -8, -2];
main_pcb_mass_g = 9;

imu_size = [8, 2, 8];
imu_pos = [0, -2, 0];
imu_mass_g = 1;

wireless_size = [16, 2, 20];
wireless_pos = [18, -5, -12];
wireless_mass_g = 2;

haptic_size = [12, 12, 5];
haptic_pos = [0, -26, 16];
haptic_mass_g = 4;

// Rough upper bridge mass estimate until material/shell geometry is known.
bridge_mass_pos = [0, bridge_clearance_y + bridge_height * 0.45, 0];
bridge_mass_g = 14;

// Target center of mass near clenched fist center.
target_com = [0, -8, 0];

// Visualization colors
shell_color = "lightgray";
shell_alpha = 0.48;
hand_color = "wheat";
hand_alpha = 0.25;
electronics_alpha = 0.45;
