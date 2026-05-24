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

// ---------- NEW MODULE TOGGLES ----------
show_finger_retention = true;
show_palm_handle      = true;
show_thumb_input      = true;
show_snap_latch       = true;
show_pogo_interface   = true;

// ---------- FINGER RETENTION FRAME ----------
// One large rounded slot for the four non-thumb fingers.
// Frame lies in the X-Z plane; fingers (oriented along Y) pass through it.
fr_slot_width    = 82;      // inner slot X span (covers index-to-pinky + clearance)
fr_slot_height   = 22;      // inner slot Z height (finger thickness + clearance)
fr_wall          = 4.5;     // frame wall thickness all around
fr_corner_radius = 6;       // rounding radius on inner and outer edges
fr_frame_depth   = 10;      // frame thickness in Y direction
fr_pos           = [0, 5, 12]; // frame center position

// ---------- LOWER PALM HANDLE ----------
// Oval / rounded-rectangle cross-section extruded along Z (wrist direction).
ph_length        = 44;      // Z extent of handle
ph_width         = 32;      // X extent
ph_height        = 22;      // Y extent
ph_corner_radius = 9;       // rounding radius (gives oval / egg-section feel)
ph_pos           = [0, -16, -40]; // handle center position

// ---------- THUMB INPUT PLANE ----------
// Flat plane on the thumb-side (+X) end of the palm handle.
ti_pos             = [43, -16, -35]; // input plane face center
ti_plane_thickness = 2.5;            // base slab X thickness
ti_plane_w         = 22;             // Y width of input plane
ti_plane_h         = 18;             // Z height of input plane
ti_trigger_w       = 14;             // Y width of trigger pad
ti_trigger_h       = 10;             // Z height of trigger pad
ti_button_d        =  8;             // system button diameter
ti_gap             =  4;             // Z gap between trigger pad and button
ti_guard_h         =  1.5;           // guard / separation ridge height

// ---------- SNAP-LATCH PLACEHOLDER ----------
// Interface between detachable tracking module (bridge) and palm/fist core.
sl_body_size    = [10, 8, 6];  // latch body [X, Y, Z]
sl_hook_size    = [ 4, 5, 6];  // snap hook protrusion [X, Y, Z]
sl_boss_d       = 4.0;         // alignment boss/pin diameter
sl_boss_h       = 5.0;         // alignment boss protrusion height
sl_boss_spacing = 30;          // ±X spacing of alignment bosses
sl_rail_size    = [72, 3, 3];  // alignment rail [X, Y, Z]
sl_z_front      = 22;          // front latch Z position
sl_z_rear       = -22;         // rear latch Z position

// ---------- POGO-PIN INTERFACE ----------
// Electrical contact array between tracking module and palm/fist core.
// Pogo pins are for electrical connection only, not structural alignment.
pp_pin_count = 12;
pp_pitch     = 2.54;   // center-to-center pin pitch (mm)
pp_pin_d     = 1.5;    // pin/pad cylinder diameter
pp_pin_h     = 3.0;    // pin protrusion height
pp_pos       = [0, bridge_clearance_y - 1, -4]; // array center

// ---------- NEW VISUALIZATION COLORS ----------
finger_retention_color = "lightblue";
palm_handle_color      = "goldenrod";
thumb_input_color      = "dodgerblue";
snap_latch_color       = "tomato";
pogo_pin_color         = "gold";
