// sensor_layout_24.scad
// Provisional 24-sensor layout.
// Entry format: [id, position [x,y,z], rotation [rx,ry,rz], group]
// Sensor local +Y is treated as the optical normal.

include <controller_params.scad>

sensors = [
    // Top ridge: upward-facing and slightly spread.
    ["S00", [-35, 35, -18], [-8,  0, -18], "top"],
    ["S01", [-21, 38, -10], [-5,  0, -10], "top"],
    ["S02", [ -7, 40,  -2], [ 0,  0,  -4], "top"],
    ["S03", [  7, 40,   2], [ 0,  0,   4], "top"],
    ["S04", [ 21, 38,  10], [-5,  0,  10], "top"],
    ["S05", [ 35, 35,  18], [-8,  0,  18], "top"],

    // Front slope, fingertip direction.
    ["S06", [-30, 27,  30], [ 45, 0, -15], "front"],
    ["S07", [-10, 30,  33], [ 50, 0,  -5], "front"],
    ["S08", [ 10, 30,  33], [ 50, 0,   5], "front"],
    ["S09", [ 30, 27,  30], [ 45, 0,  15], "front"],

    // Rear slope, wrist direction.
    ["S10", [-30, 27, -30], [-45, 0, -15], "rear"],
    ["S11", [-10, 30, -33], [-50, 0,  -5], "rear"],
    ["S12", [ 10, 30, -33], [-50, 0,   5], "rear"],
    ["S13", [ 30, 27, -30], [-45, 0,  15], "rear"],

    // Thumb side (+X).
    ["S14", [ 45, 24, -18], [ 0, 0,  55], "thumb_side"],
    ["S15", [ 48, 26,   0], [ 0, 0,  65], "thumb_side"],
    ["S16", [ 45, 24,  18], [ 0, 0,  55], "thumb_side"],

    // Pinky side (-X).
    ["S17", [-45, 24, -18], [ 0, 0, -55], "pinky_side"],
    ["S18", [-48, 26,   0], [ 0, 0, -65], "pinky_side"],
    ["S19", [-45, 24,  18], [ 0, 0, -55], "pinky_side"],

    // Lower/front/rear auxiliary sensors.
    ["S20", [-24,  8,  26], [ 75, 0, -20], "lower_aux"],
    ["S21", [ 24,  8,  26], [ 75, 0,  20], "lower_aux"],
    ["S22", [-24,  8, -26], [-75, 0, -20], "lower_aux"],
    ["S23", [ 24,  8, -26], [-75, 0,  20], "lower_aux"]
];
